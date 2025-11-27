--
-- PostgreSQL database dump
--

\restrict w7Cja76yk1I45SJ8AsPvqDgjzaxQpy4i10ptMchrujBdKLaZ8EFsc1nt2Jfen4y

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-26 22:56:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16455)
-- Name: Attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Attendance" (
    "Id" integer NOT NULL,
    "LessonId" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "TypeId" integer
);


ALTER TABLE public."Attendance" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16534)
-- Name: AttendanceType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AttendanceType" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."AttendanceType" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16587)
-- Name: Attendance_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Attendance" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Attendance_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16446)
-- Name: Grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Grade" (
    "Id" integer NOT NULL,
    "LessonId" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "Grade" integer NOT NULL
);


ALTER TABLE public."Grade" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16589)
-- Name: Grade_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Grade" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Grade_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16394)
-- Name: Group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Group" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."Group" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16586)
-- Name: Group_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Group" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Group_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16424)
-- Name: Lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lesson" (
    "Id" integer NOT NULL,
    "Date" date NOT NULL,
    "Number" integer NOT NULL,
    "UserId" integer NOT NULL,
    "SubjectId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "TopicId" integer,
    "Classroom" character varying,
    "Comment" character varying
);


ALTER TABLE public."Lesson" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16584)
-- Name: Lesson_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Lesson" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Lesson_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16387)
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "Id" integer NOT NULL,
    "Name" character varying(30) NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16436)
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    "Id" integer NOT NULL,
    "FullName" character varying NOT NULL,
    "GroupId" integer NOT NULL
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16566)
-- Name: StudentTopic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudentTopic" (
    "Id" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "TopicId" integer NOT NULL,
    "IsSubmitted" boolean
);


ALTER TABLE public."StudentTopic" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16590)
-- Name: StudentTopic_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."StudentTopic" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."StudentTopic_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16588)
-- Name: Student_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Student" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Student_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: Subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subject" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Total_hours" integer
);


ALTER TABLE public."Subject" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16591)
-- Name: Subject_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Subject" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Subject_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16510)
-- Name: Topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Topic" (
    "Id" integer NOT NULL,
    "Name" character varying,
    "TypeId" integer,
    "SubjectId" integer NOT NULL,
    "Homework" character varying
);


ALTER TABLE public."Topic" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16525)
-- Name: TopicType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TopicType" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."TopicType" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16592)
-- Name: Topic_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Topic" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Topic_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16412)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Login" character varying NOT NULL,
    "PasswordHash" character varying,
    "FullName" character varying NOT NULL,
    "RoleId" integer NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16585)
-- Name: User_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5000 (class 0 OID 16455)
-- Dependencies: 226
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5003 (class 0 OID 16534)
-- Dependencies: 229
-- Data for Name: AttendanceType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (5, 'от');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (4, 'ув');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (3, 'уш');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (2, 'оп');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (1, 'нб');


--
-- TOC entry 4999 (class 0 OID 16446)
-- Dependencies: 225
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4994 (class 0 OID 16394)
-- Dependencies: 220
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (1, '4-22 ИСП-8');


--
-- TOC entry 4997 (class 0 OID 16424)
-- Dependencies: 223
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (2, '2025-09-25', 4, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (3, '2025-09-26', 2, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4, '2025-09-26', 3, 2, 1, 1, NULL, '216', NULL);


--
-- TOC entry 4993 (class 0 OID 16387)
-- Dependencies: 219
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Role" ("Id", "Name") VALUES (2, 'teacher');
INSERT INTO public."Role" ("Id", "Name") VALUES (1, 'admin');


--
-- TOC entry 4998 (class 0 OID 16436)
-- Dependencies: 224
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5004 (class 0 OID 16566)
-- Dependencies: 230
-- Data for Name: StudentTopic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4995 (class 0 OID 16403)
-- Dependencies: 221
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (1, 'МДК 04.01 Внедрение и поддержка компьютерных систем', 68);


--
-- TOC entry 5001 (class 0 OID 16510)
-- Dependencies: 227
-- Data for Name: Topic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5002 (class 0 OID 16525)
-- Dependencies: 228
-- Data for Name: TopicType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TopicType" ("Id", "Name") VALUES (3, 'ПЗ');
INSERT INTO public."TopicType" ("Id", "Name") VALUES (2, 'ЛР');
INSERT INTO public."TopicType" ("Id", "Name") VALUES (1, 'ЛЕК');


--
-- TOC entry 4996 (class 0 OID 16412)
-- Dependencies: 222
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId") OVERRIDING SYSTEM VALUE VALUES (1, 'Admin', NULL, 'admin', 1);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId") OVERRIDING SYSTEM VALUE VALUES (2, 'Alexey3000@gmail.com', NULL, 'Дмитриев Алексей Андреевич', 2);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 234
-- Name: Attendance_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Attendance_Id_seq"', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 236
-- Name: Grade_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Grade_Id_seq"', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 233
-- Name: Group_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Group_Id_seq"', 1, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 231
-- Name: Lesson_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Lesson_Id_seq"', 4, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 237
-- Name: StudentTopic_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StudentTopic_Id_seq"', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 235
-- Name: Student_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Student_Id_seq"', 1, false);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 238
-- Name: Subject_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subject_Id_seq"', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 239
-- Name: Topic_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Topic_Id_seq"', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 232
-- Name: User_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_Id_seq"', 2, true);


--
-- TOC entry 4828 (class 2606 OID 16542)
-- Name: AttendanceType AttendanceType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AttendanceType"
    ADD CONSTRAINT "AttendanceType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4822 (class 2606 OID 16464)
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4820 (class 2606 OID 16454)
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4810 (class 2606 OID 16402)
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4816 (class 2606 OID 16435)
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4808 (class 2606 OID 16393)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4830 (class 2606 OID 16573)
-- Name: StudentTopic StudentTopic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "StudentTopic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4818 (class 2606 OID 16445)
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4812 (class 2606 OID 16411)
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4826 (class 2606 OID 16533)
-- Name: TopicType TopicType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TopicType"
    ADD CONSTRAINT "TopicType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4824 (class 2606 OID 16515)
-- Name: Topic Topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "Topic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4814 (class 2606 OID 16423)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4839 (class 2606 OID 16500)
-- Name: Attendance FK_Attendance_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4840 (class 2606 OID 16505)
-- Name: Attendance FK_Attendance_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4841 (class 2606 OID 16561)
-- Name: Attendance FK_Attendance_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."AttendanceType"("Id") NOT VALID;


--
-- TOC entry 4837 (class 2606 OID 16490)
-- Name: Grade FK_Grade_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4838 (class 2606 OID 16495)
-- Name: Grade FK_Grade_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4832 (class 2606 OID 16475)
-- Name: Lesson FK_Lesson_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 16470)
-- Name: Lesson FK_Lesson_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 16551)
-- Name: Lesson FK_Lesson_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") NOT VALID;


--
-- TOC entry 4835 (class 2606 OID 16465)
-- Name: Lesson FK_Lesson_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_UserId" FOREIGN KEY ("UserId") REFERENCES public."User"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4844 (class 2606 OID 16574)
-- Name: StudentTopic FK_StudentTopic_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4845 (class 2606 OID 16579)
-- Name: StudentTopic FK_StudentTopic_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16485)
-- Name: Student FK_Student_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "FK_Student_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4842 (class 2606 OID 16544)
-- Name: Topic FK_Topic_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") NOT VALID;


--
-- TOC entry 4843 (class 2606 OID 16556)
-- Name: Topic FK_Topic_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."TopicType"("Id") NOT VALID;


--
-- TOC entry 4831 (class 2606 OID 16480)
-- Name: User FK_User_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "FK_User_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Role"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-11-26 22:56:23

--
-- PostgreSQL database dump complete
--

\unrestrict w7Cja76yk1I45SJ8AsPvqDgjzaxQpy4i10ptMchrujBdKLaZ8EFsc1nt2Jfen4y

