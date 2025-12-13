# -*- coding: utf-8 -*-
import os
import requests
import psycopg2
import logging
from datetime import datetime, date, timedelta
import hashlib
import json
from dotenv import load_dotenv

load_dotenv()

# --- Logging ---
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(os.getenv('LOG_PATH', '/home/kyaro/database/Pyscript/api_to_postgres.log')),
        logging.StreamHandler()
    ]
)

class TimetableProcessor:
    def __init__(self):
        self.db_config = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'VolptEDUDB'),
            'user': os.getenv('DB_USER', 'postgres'),
            'password': os.getenv('DB_PASSWORD', ''),
            'port': os.getenv('DB_PORT', '5432')
        }
        self.api_url = os.getenv('API_URL', 'https://api.volptbot.ru/tt')
        self.last_timestamp = None

    def get_db_connection(self):
        try:
            conn = psycopg2.connect(**self.db_config)
            return conn
        except Exception as e:
            logging.error(f"Database connection error: {e}")
            return None

    def fetch_data_from_api(self):
        try:
            response = requests.get(self.api_url, timeout=30)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException as e:
            logging.error(f"API request error: {e}")
            return None

    def get_last_timestamp(self):
        
        if self.last_timestamp is not None:
            return self.last_timestamp

        conn = self.get_db_connection()
        if not conn:
            return 0

        try:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT value FROM system_settings 
                WHERE key = 'last_timetable_timestamp'
            """)
            result = cursor.fetchone()
            if result:
                self.last_timestamp = int(result[0])
                logging.info(f"Loaded last timestamp from DB: {self.last_timestamp}")
            else:
                self.last_timestamp = 0
                logging.info("No previous timestamp found, using 0")
            return self.last_timestamp
        except Exception as e:
            logging.error(f"Error loading timestamp: {e}")
            return 0
        finally:
            conn.close()

    def save_last_timestamp(self, timestamp):
        
        conn = self.get_db_connection()
        if not conn:
            return False

        try:
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO system_settings (key, value) 
                VALUES ('last_timetable_timestamp', %s)
                ON CONFLICT (key) 
                DO UPDATE SET value = EXCLUDED.value, updated_at = CURRENT_TIMESTAMP
            """, (str(timestamp),))
            conn.commit()
            self.last_timestamp = timestamp
            logging.info(f"Saved new timestamp: {timestamp}")
            return True
        except Exception as e:
            logging.error(f"Error saving timestamp: {e}")
            return False
        finally:
            conn.close()

    def is_data_updated(self, api_data):
        
        if not api_data or 'time' not in api_data:
            logging.error("No timestamp in API data")
            return False

        current_timestamp = api_data['time']
        last_timestamp = self.get_last_timestamp()

        if current_timestamp == last_timestamp:
            logging.info(f"Data not updated (current: {current_timestamp}, last: {last_timestamp})")
            return False
        else:
            logging.info(f"Data updated! (current: {current_timestamp}, last: {last_timestamp})")
            return True

    def try_parse_date(self, date_str):
        """Parse format like 'Monday 25.11.24' or '25.11.24'"""
        try:
            # assume date is at the end
            date_part = date_str.strip().split()[-1]
            parts = date_part.split('.')
            if len(parts) == 3:
                d, m, y = parts
                if len(y) == 2:
                    y = "20" + y
                normalized = f"{d.zfill(2)}.{m.zfill(2)}.{y}"
                return datetime.strptime(normalized, '%d.%m.%Y').date()
            # try ISO format
            return datetime.fromisoformat(date_part).date()
        except Exception as e:
            logging.debug(f"Date parsing error for '{date_str}': {e}")
            return None

    def generate_login(self, full_name):
        parts = full_name.strip().split()
        if len(parts) >= 2:
            login = f"{parts[1][0].lower()}{parts[0].lower()}"
        else:
            login = hashlib.md5(full_name.encode('utf-8')).hexdigest()[:8]

        conn = self.get_db_connection()
        if conn:
            try:
                cur = conn.cursor()
                base = login
                counter = 1
                while True:
                    cur.execute('SELECT "Id" FROM "User" WHERE "Login" = %s', (login,))
                    if not cur.fetchone():
                        break
                    login = f"{base}{counter}"
                    counter += 1
                    if counter > 100:
                        login = hashlib.md5(full_name.encode('utf-8')).hexdigest()[:8]
                        break
            except Exception as e:
                logging.error(f"Login check error: {e}")
            finally:
                conn.close()
        return login

    def get_or_create_user(self, teacher_name):
        if not teacher_name:
            return None
        conn = self.get_db_connection()
        if not conn:
            return None
        try:
            cur = conn.cursor()
            cur.execute('SELECT "Id" FROM "User" WHERE "FullName" = %s', (teacher_name,))
            r = cur.fetchone()
            if r:
                return r[0]
            login = self.generate_login(teacher_name)
            
            cur.execute("""
                INSERT INTO "User" ("Login", "FullName", "RoleId", "PasswordHash")
                VALUES (%s, %s, 2, 'default_password_hash')
                RETURNING "Id"
            """, (login, teacher_name))
            user_id = cur.fetchone()[0]
            conn.commit()
            logging.info(f"Created teacher: {teacher_name} (ID: {user_id})")
            return user_id
        except Exception as e:
            logging.error(f"Error working with user {teacher_name}: {e}")
            conn.rollback()
            return None
        finally:
            conn.close()

    def get_or_create_group(self, group_name):
        if not group_name:
            return None
        conn = self.get_db_connection()
        if not conn:
            return None
        try:
            cur = conn.cursor()
            cur.execute('SELECT "Id" FROM "Group" WHERE "Name" = %s', (group_name,))
            r = cur.fetchone()
            if r:
                return r[0]
            cur.execute('INSERT INTO "Group" ("Name") VALUES (%s) RETURNING "Id"', (group_name,))
            gid = cur.fetchone()[0]
            conn.commit()
            logging.info(f"Created group: {group_name} (ID: {gid})")
            return gid
        except Exception as e:
            logging.error(f"Error working with group {group_name}: {e}")
            conn.rollback()
            return None
        finally:
            conn.close()

    def get_or_create_subject(self, subject_name):
        if not subject_name:
            return None
        conn = self.get_db_connection()
        if not conn:
            return None
        try:
            cur = conn.cursor()
            cur.execute('SELECT "Id" FROM "Subject" WHERE "Name" = %s', (subject_name,))
            r = cur.fetchone()
            if r:
                return r[0]
            cur.execute('INSERT INTO "Subject" ("Name") VALUES (%s) RETURNING "Id"', (subject_name,))
            sid = cur.fetchone()[0]
            conn.commit()
            logging.info(f"Created subject: {subject_name} (ID: {sid})")
            return sid
        except Exception as e:
            logging.error(f"Error working with subject {subject_name}: {e}")
            conn.rollback()
            return None
        finally:
            conn.close()

    def upsert_user_group_subject_relation(self, user_id, group_id, subject_id):
        """
        Create the user-group-subject relationship.
        If the relationship already exists, returns True without changes.
        """
        if not user_id or not group_id or not subject_id:
            logging.warning("Missing required parameters for upsert_user_group_subject_relation")
            return False
            
        conn = self.get_db_connection()
        if not conn:
            logging.error("Failed to establish database connection")
            return False
        
        try:
            cur = conn.cursor()
            
            # Check if the relationship already exists
            cur.execute('''
                SELECT 1 FROM "UserGroupSubject" 
                WHERE "UserId" = %s AND "GroupId" = %s AND "SubjectId" = %s
            ''', (user_id, group_id, subject_id))
            
            if not cur.fetchone():
                # If relationship doesn't exist - create it
                cur.execute('''
                    INSERT INTO "UserGroupSubject" ("UserId", "GroupId", "SubjectId")
                    VALUES (%s, %s, %s)
                    ON CONFLICT ("UserId", "GroupId", "SubjectId") DO NOTHING
                ''', (user_id, group_id, subject_id))
                conn.commit()
                logging.debug(f"Created new relation: user={user_id}, group={group_id}, subject={subject_id}")
                return True
            else:
                # Relationship already exists
                logging.debug(f"Relation already exists: user={user_id}, group={group_id}, subject={subject_id}")
                return True
                
        except Exception as e:
            logging.error(f"Error upserting user-group-subject relation: {e}")
            conn.rollback()
            return False
        finally:
            conn.close()

    def upsert_lesson(self, conn, date_obj, lesson_number, user_id, subject_id, group_id, classroom):
        try:
            cur = conn.cursor()
            cur.execute("""
                INSERT INTO "Lesson" ("Date", "Number", "UserId", "SubjectId", "GroupId", "Classroom")
                VALUES (%s, %s, %s, %s, %s, %s)
                ON CONFLICT ("GroupId", "Date", "Number")
                DO UPDATE SET
                    "UserId" = EXCLUDED."UserId",
                    "SubjectId" = EXCLUDED."SubjectId",
                    "Classroom" = EXCLUDED."Classroom";
            """, (date_obj, lesson_number, user_id, subject_id, group_id, classroom))

            self.upsert_user_group_subject_relation(user_id, group_id, subject_id)
            
            return True
        except Exception as e:
            logging.error(f"Error upserting lesson: {e}")
            return False

    def delete_absent_lessons_for_group_date(self, conn, group_id, date_obj, present_numbers):
        
        if not present_numbers:
            logging.info(f"API returned an empty lesson list for group {group_id} on {date_obj} skipping deletion (safer).")
            return 0
        try:
            cur = conn.cursor()
            # form tuple for SQL IN
            cur.execute(f"""
                DELETE FROM "Lesson"
                WHERE "GroupId" = %s AND "Date" = %s AND "Number" NOT IN %s
            """, (group_id, date_obj, tuple(present_numbers)))
            deleted = cur.rowcount
            return deleted
        except Exception as e:
            logging.error(f"Error deleting absent lessons: {e}")
            return 0

    def is_corpus_one(self, corpus_name):
        try:
            return int(corpus_name) == 1
        except Exception:
            return False

    def process_timetable_data(self, api_data):
        """
        Process API structure similar to original script:
        api_data['timetable'][corpus_name][day_key][group_name]['lessons'] -> list of lessons
        """
        if not api_data or 'timetable' not in api_data:
            logging.error("Invalid API data or missing 'timetable'")
            return False

        if not self.is_data_updated(api_data):
            logging.info("Data not updated, skipping processing")
            return True

        # Process only today and tomorrow
        today = date.today()
        tomorrow = today + timedelta(days=1)
        target_dates = {today, tomorrow}

        processed = 0
        errors = 0

        timetable = api_data.get('timetable', {})

        # Single DB connection for all days (commit at the end)
        conn = self.get_db_connection()
        if not conn:
            return False

        try:
            for corpus_name, corpus_data in timetable.items():
                if not self.is_corpus_one(corpus_name):
                    logging.debug(f"Skipping building: {corpus_name}")
                    continue

                if not corpus_data:
                    continue

                for day_key, day_data in corpus_data.items():
                    if not day_data:
                        continue

                    date_obj = self.try_parse_date(day_key)
                    if not date_obj:
                        logging.warning(f"Failed to parse date: {day_key}")
                        continue

                    if date_obj not in target_dates:
                        logging.debug(f"Skipping date out of range: {date_obj}")
                        continue

                    logging.info(f"Processing building {corpus_name} for date {date_obj}")

                    # Process groups
                    for group_name, group_data in day_data.items():
                        if not group_data:
                            continue
                        lessons = group_data.get('lessons') or []
                        if not lessons:
                            logging.debug(f"No lessons for group {group_name} on {date_obj}")
                            continue

                        # get or create group
                        group_id = self.get_or_create_group(group_name)
                        if not group_id:
                            errors += 1
                            continue

                        present_numbers = []

                        for lesson_data in lessons:
                            if not lesson_data:
                                continue

                            teacher_name = lesson_data.get('teacher') or lesson_data.get('teacher_name') or ''
                            subject_name = lesson_data.get('title') or lesson_data.get('subject') or ''
                            lesson_number_str = lesson_data.get('number') or lesson_data.get('lesson_number')
                            classroom = lesson_data.get('aud') or lesson_data.get('room') or lesson_data.get('classroom') or ''

                            if not teacher_name:
                                logging.debug("Skipping lesson without teacher")
                                continue
                            if not subject_name:
                                logging.debug("Skipping lesson without subject")
                                continue
                            if not lesson_number_str:
                                logging.debug("Skipping lesson without number")
                                continue

                            try:
                                lesson_number = int(lesson_number_str)
                            except Exception:
                                logging.warning(f"Invalid lesson number: {lesson_number_str}")
                                errors += 1
                                continue

                            user_id = self.get_or_create_user(teacher_name)
                            if not user_id:
                                errors += 1
                                continue

                            subject_id = self.get_or_create_subject(subject_name)
                            if not subject_id:
                                errors += 1
                                continue

                            ok = self.upsert_lesson(conn, date_obj, lesson_number, user_id, subject_id, group_id, classroom)
                            if ok:
                                processed += 1
                                present_numbers.append(lesson_number)
                            else:
                                errors += 1

                        # After insert/update delete absent lessons (only for this group+date).
                        # Delete only if API returned non-empty present_numbers (safer)
                        self.delete_absent_lessons_for_group_date(conn, group_id, date_obj, present_numbers)

            conn.commit()
            
            if processed > 0 or errors == 0:
                self.save_last_timestamp(api_data['time'])
                logging.info(f"Processing finished. Created/updated: {processed}, errors: {errors}")
            else:
                logging.error(f"Processing finished with errors. Created/updated: {processed}, errors: {errors}")
                
            return True
        except Exception as e:
            logging.error(f"Processing error: {e}")
            conn.rollback()
            return False
        finally:
            conn.close()

    def run(self):
        logging.info("Starting timetable sync...")
            
        api_data = self.fetch_data_from_api()
        if not api_data:
            logging.error("Failed to fetch API data")
            return False
        return self.process_timetable_data(api_data)


def main():
    processor = TimetableProcessor()
    success = processor.run()
    if success:
        logging.info("Timetable sync completed successfully")
    else:
        logging.error("Timetable sync finished with errors")


if __name__ == "__main__":
    main()