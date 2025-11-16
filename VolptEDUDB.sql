--
-- PostgreSQL database dump
--

\restrict hc1cDaKgddJ2aXbQX9dOlMieOvp5VTWhOpcUSw4TYheCRH4q86SUiAQmthPBfaS

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-16 21:21:28

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
-- TOC entry 5001 (class 0 OID 0)
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
-- TOC entry 220 (class 1259 OID 16394)
-- Name: Group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Group" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."Group" OWNER TO postgres;

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
-- TOC entry 222 (class 1259 OID 16412)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Login" character varying NOT NULL,
    "PasswordHash" character varying NOT NULL,
    "FullName" character varying NOT NULL,
    "RoleId" integer NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 16455)
-- Dependencies: 226
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4994 (class 0 OID 16534)
-- Dependencies: 229
-- Data for Name: AttendanceType; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4990 (class 0 OID 16446)
-- Dependencies: 225
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 0 OID 16394)
-- Dependencies: 220
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4988 (class 0 OID 16424)
-- Dependencies: 223
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4984 (class 0 OID 16387)
-- Dependencies: 219
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Role" VALUES (2, 'teacher');
INSERT INTO public."Role" VALUES (1, 'admin');


--
-- TOC entry 4989 (class 0 OID 16436)
-- Dependencies: 224
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4995 (class 0 OID 16566)
-- Dependencies: 230
-- Data for Name: StudentTopic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4986 (class 0 OID 16403)
-- Dependencies: 221
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4992 (class 0 OID 16510)
-- Dependencies: 227
-- Data for Name: Topic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4993 (class 0 OID 16525)
-- Dependencies: 228
-- Data for Name: TopicType; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4987 (class 0 OID 16412)
-- Dependencies: 222
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4819 (class 2606 OID 16542)
-- Name: AttendanceType AttendanceType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AttendanceType"
    ADD CONSTRAINT "AttendanceType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4813 (class 2606 OID 16464)
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4811 (class 2606 OID 16454)
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4801 (class 2606 OID 16402)
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4807 (class 2606 OID 16435)
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4799 (class 2606 OID 16393)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4821 (class 2606 OID 16573)
-- Name: StudentTopic StudentTopic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "StudentTopic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4809 (class 2606 OID 16445)
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4803 (class 2606 OID 16411)
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4817 (class 2606 OID 16533)
-- Name: TopicType TopicType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TopicType"
    ADD CONSTRAINT "TopicType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4815 (class 2606 OID 16515)
-- Name: Topic Topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "Topic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4805 (class 2606 OID 16423)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4830 (class 2606 OID 16500)
-- Name: Attendance FK_Attendance_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4831 (class 2606 OID 16505)
-- Name: Attendance FK_Attendance_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4832 (class 2606 OID 16561)
-- Name: Attendance FK_Attendance_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."AttendanceType"("Id") NOT VALID;


--
-- TOC entry 4828 (class 2606 OID 16490)
-- Name: Grade FK_Grade_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4829 (class 2606 OID 16495)
-- Name: Grade FK_Grade_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4823 (class 2606 OID 16475)
-- Name: Lesson FK_Lesson_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4824 (class 2606 OID 16470)
-- Name: Lesson FK_Lesson_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4825 (class 2606 OID 16551)
-- Name: Lesson FK_Lesson_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") NOT VALID;


--
-- TOC entry 4826 (class 2606 OID 16465)
-- Name: Lesson FK_Lesson_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_UserId" FOREIGN KEY ("UserId") REFERENCES public."User"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4835 (class 2606 OID 16574)
-- Name: StudentTopic FK_StudentTopic_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16579)
-- Name: StudentTopic FK_StudentTopic_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4827 (class 2606 OID 16485)
-- Name: Student FK_Student_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "FK_Student_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 16544)
-- Name: Topic FK_Topic_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 16556)
-- Name: Topic FK_Topic_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."TopicType"("Id") NOT VALID;


--
-- TOC entry 4822 (class 2606 OID 16480)
-- Name: User FK_User_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "FK_User_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Role"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-11-16 21:21:28

--
-- PostgreSQL database dump complete
--

\unrestrict hc1cDaKgddJ2aXbQX9dOlMieOvp5VTWhOpcUSw4TYheCRH4q86SUiAQmthPBfaS

