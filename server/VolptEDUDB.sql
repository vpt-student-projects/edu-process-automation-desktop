--
-- PostgreSQL database dump
--

\restrict nDsfNmeLkPvskW5Ieus9BZIkBsXHTNyk3zYzl7LaPzODsjDWaNgEBKqgowVrGhL

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-14 00:14:29

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
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16389)
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
-- TOC entry 216 (class 1259 OID 16392)
-- Name: AttendanceType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AttendanceType" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."AttendanceType" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16397)
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
-- TOC entry 218 (class 1259 OID 16398)
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
-- TOC entry 219 (class 1259 OID 16401)
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
-- TOC entry 220 (class 1259 OID 16402)
-- Name: Group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Group" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."Group" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16407)
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
-- TOC entry 222 (class 1259 OID 16408)
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
-- TOC entry 223 (class 1259 OID 16413)
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
-- TOC entry 224 (class 1259 OID 16414)
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "Id" integer NOT NULL,
    "Name" character varying(30) NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16417)
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    "Id" integer NOT NULL,
    "FullName" character varying NOT NULL,
    "GroupId" integer NOT NULL
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16422)
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
-- TOC entry 227 (class 1259 OID 16425)
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
-- TOC entry 228 (class 1259 OID 16426)
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
-- TOC entry 229 (class 1259 OID 16427)
-- Name: Subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subject" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Total_hours" integer
);


ALTER TABLE public."Subject" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16432)
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
-- TOC entry 231 (class 1259 OID 16433)
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
-- TOC entry 232 (class 1259 OID 16438)
-- Name: TopicType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TopicType" (
    "Id" integer NOT NULL,
    "Name" character varying NOT NULL
);


ALTER TABLE public."TopicType" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16443)
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
-- TOC entry 234 (class 1259 OID 16444)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Login" character varying NOT NULL,
    "PasswordHash" character varying,
    "FullName" character varying NOT NULL,
    "RoleId" integer NOT NULL,
    "RefreshTokenHash" character varying,
    "TokenExpiresAt" timestamp without time zone
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 24757)
-- Name: UserGroupSubject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserGroupSubject" (
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "SubjectId" integer NOT NULL
);


ALTER TABLE public."UserGroupSubject" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16449)
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
-- TOC entry 236 (class 1259 OID 16549)
-- Name: system_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_settings (
    key character varying(100) NOT NULL,
    value text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.system_settings OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3500 (class 0 OID 16392)
-- Dependencies: 216
-- Data for Name: AttendanceType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (5, 'от');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (4, 'ув');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (3, 'уш');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (2, 'оп');
INSERT INTO public."AttendanceType" ("Id", "Name") VALUES (1, 'нб');


--
-- TOC entry 3502 (class 0 OID 16398)
-- Dependencies: 218
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3504 (class 0 OID 16402)
-- Dependencies: 220
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (1, '4-22 ИСП-8');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (2, '1-25 АСУ-6 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (3, '1-25 Б-104');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (4, '2-24 АСУ-4 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (5, '5-21 ЭПУ-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (6, '1-25 РПИ-5');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (7, '1-25 ЭВТ-76');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (8, '2-24 Б-101');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (9, '1-25 ОПИ-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (10, '1-25 ПМП-61 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (11, '3-23 Б-99');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (12, '4-22 ЭВТ-73');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (13, '4-22 ЭПУ-4');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (14, '3-23 ЭПУ-5');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (15, '3-23 ПМП-59');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (16, '3-23 ИСП-9');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (17, '1-25 ТПН-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (18, '3-23 ЭМЭ-85,87');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (19, '2-24 ТПО-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (20, '1-25 АДТ-4 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (21, '3-23 ОСП-8(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (22, '2-24 ССА-6');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (23, '4-22 ССА-4');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (24, '1-25 ИСП-10');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (25, '2-24 ОСП-10 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (26, '3-23 РЗА-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (27, '4-22 ЭКО-26');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (28, '1-25 АСУ-5 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (29, '2-24 ЭМО-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (30, '3-23 АДТ-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (31, '1-25 РПИ-4');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (32, '1-25 ИКС-8');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (33, '5-21 ИКС-4');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (34, '1-25 ССА-7 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (35, '2-24 ЭСА-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (36, '4-22 ХТО-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (37, '2-24 ЭМО-2 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (38, '1-25 ЭМО-5 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (39, '1-25 ТЭС-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (40, '2-24 АДТ-3 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (41, '2-24 ЭКБ-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (42, '2-24 ТЭС-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (43, '2-24 ПМП-60 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (44, '3-23 АСУ-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (45, '2-24 ТПН-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (46, '1-25 ТПО-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (47, '3-23 ССА-5');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (48, '1-25 ЭСА-2 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (49, '2-24 ЭВТ-75');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (50, '2-24 ИКС-7');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (51, '3-23 ЭС-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (52, '3-23 ЭВТ-74');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (53, '4-22 АДТ-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (54, '2-24 РПИ-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (55, '3-23 ЭКБ-1,2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (56, '4-22 ИКС-5');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (57, '1-25 ЭМО-4 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (58, '1-25 ЭМО-3 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (59, '3-23 ЭКБ-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (60, '2-24 ПКД-9  Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (61, '4-22 ТПИ-1 Технология парикмахерского искусства');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (62, '2-24 ПКД-8 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (63, '1-25 КМТ-2 Конструирование, моделирование и технологияя изготовления изделий легкой промышленности (по видам)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (64, '4-22 ПКД-1 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (65, '3-23 ПКД-5 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (66, '2-24 ПКД-7 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (67, '2-24 ТК-3, ТК-4 Технологии индустрии красоты');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (68, '2-24 КМТ-1 Конструирование, моделирование и технология изготовления изделий легкой промышленности (по отраслям)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (69, '1-25 ПКД-10 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (70, '4-22 ПКД-2 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (71, '3-23 ПКД-4 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (72, '2-24 РКЛ-1 Реклама');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (73, '4-22 ПКД-3 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (74, '1-25 ПКД-11 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (75, '3-23 ПКД-6 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (76, '1-25 ПКД-12 Поварское и кондитерское дело');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (77, '2-24 ТИГ-1 Туризм и гостеприимство');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (78, '1-25 РКЛ-2 Реклама');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (79, '1-25 ТИГ-2 Туризм и гостеприимство');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (80, '1-25 ТК-5 Технологии индустрии красоты');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (81, '1-25 ЭБП-2 эксплуатация беспилотных авиационных систем');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (82, '3-23 ТК-1, 2 Технологии индустрии красоты');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (83, '1-25 ЭБП-2 Эксплуатация беспилотных авиационных систем');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (84, '1-25 МЭС-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (85, '2-24 ТОА-10');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (86, '2-24 СЭ-9');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (87, '1-24 ОРП-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (88, '2-24 МЭС-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (89, '2-24 ЭБП-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (90, '2-24 ТОА-11');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (91, '1-25 РАТ-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (92, '1-25 РАТ-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (93, '1-25 СЭ-11');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (94, '1-25 РЗ-9');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (95, '1-25 ШТ-4');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (96, '2-24 МСР-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (97, '3-23 ТОА-7');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (98, '1-25 ЭМД-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (99, '3-23 ТОА-8');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (100, '1-25 СЭ-10');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (101, '2-24 ЭМД-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (102, '3-23 СЭ-7/8');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (103, '1-25 РЗ-8');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (104, '1-25 ОРП-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (105, '1-25 ШТ-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (106, '1-25 ШВ-7');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (107, '4-22 ТОА-5');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (108, '2-24 ОРП-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (109, '1-25 СП-2 (п) ');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (110, '1-25 ТМ-17 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (111, '1-25 МПЧ-2 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (112, '3-23 СП-7');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (113, '2-24 МПД-2 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (114, '2-24 ОМП-1');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (115, '3-23 МРО-5(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (116, '1-25 МПД-4 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (117, '1-25 ОМП-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (118, '1-25 ОМП-3');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (119, '3-23 ОМД-7(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (120, '2-24 МОЭ-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (121, '2-24 МПД-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (122, '2-24 СРМ-17');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (123, '1-25 МОЭ-3 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (124, '2-24 ТМ-16 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (125, '4-22 СП-6');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (126, '1-25 СП-3 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (127, '1-25 ТМ-18 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (128, '2-24 МПЧ-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (129, '3-23 ТМ-11(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (130, '2-24 СП-1 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (131, '3-23 МЧМ-2(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (132, '1-25 МПД-3 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (133, '1-25 МОЭ-2 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (134, '2-24 ТМ-15 (п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (135, '3-23 ТМ-12(п)');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (136, '3-23 ИКС-6');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (137, '3-23 ЭМЭ-85');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (138, '4-22 ЭМЭ-83');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (139, '3-23 ХТО-2');
INSERT INTO public."Group" ("Id", "Name") OVERRIDING SYSTEM VALUE VALUES (140, '4-22 АСУ-2');


--
-- TOC entry 3506 (class 0 OID 16408)
-- Dependencies: 222
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (910, '2025-11-27', 1, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (911, '2025-11-27', 2, 4, 2, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (912, '2025-11-27', 3, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (946, '2025-11-27', 1, 25, 22, 14, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (947, '2025-11-27', 2, 25, 22, 14, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1003, '2025-11-27', 4, 3, 16, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1004, '2025-11-27', 2, 8, 49, 29, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1005, '2025-11-27', 3, 9, 7, 29, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1031, '2025-11-27', 1, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1032, '2025-11-27', 2, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1033, '2025-11-27', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1034, '2025-11-27', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1035, '2025-11-27', 3, 49, 60, 37, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1036, '2025-11-27', 4, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1037, '2025-11-27', 5, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1038, '2025-11-27', 1, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1039, '2025-11-27', 2, 12, 11, 38, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1040, '2025-11-27', 3, 56, 15, 38, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1041, '2025-11-27', 4, 49, 61, 38, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1042, '2025-11-27', 1, 13, 12, 39, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1043, '2025-11-27', 2, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1044, '2025-11-27', 3, 50, 35, 39, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1045, '2025-11-27', 4, 12, 11, 39, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1046, '2025-11-27', 2, 10, 9, 40, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1047, '2025-11-27', 3, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1048, '2025-11-27', 4, 58, 15, 40, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1049, '2025-11-27', 5, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1050, '2025-11-27', 1, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1051, '2025-11-27', 2, 41, 64, 41, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1052, '2025-11-27', 3, 22, 65, 41, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1053, '2025-11-27', 3, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1054, '2025-11-27', 4, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1055, '2025-11-27', 5, 59, 67, 1, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1056, '2025-11-27', 1, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1057, '2025-11-27', 2, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1058, '2025-11-27', 3, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1059, '2025-11-27', 1, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1060, '2025-11-27', 2, 19, 69, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1061, '2025-11-27', 3, 19, 69, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1062, '2025-11-27', 4, 37, 38, 43, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1063, '2025-11-27', 1, 62, 70, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1064, '2025-11-27', 2, 62, 70, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1065, '2025-11-27', 3, 62, 71, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1066, '2025-11-27', 4, 62, 72, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1067, '2025-11-27', 2, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1068, '2025-11-27', 3, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1069, '2025-11-27', 4, 33, 30, 45, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1070, '2025-11-27', 5, 4, 73, 45, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1071, '2025-11-27', 1, 33, 43, 46, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1072, '2025-11-27', 2, 14, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1073, '2025-11-27', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1074, '2025-11-27', 4, 14, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1075, '2025-11-27', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1076, '2025-11-27', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1077, '2025-11-27', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1078, '2025-11-27', 4, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1079, '2025-11-27', 1, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1080, '2025-11-27', 2, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1081, '2025-11-27', 3, 64, 5, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1082, '2025-11-27', 4, 50, 35, 48, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1083, '2025-11-27', 1, 65, 75, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1084, '2025-11-27', 2, 65, 75, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1085, '2025-11-27', 3, 25, 76, 49, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1086, '2025-11-27', 4, 25, 76, 49, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1087, '2025-11-27', 2, 43, 77, 50, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1088, '2025-11-27', 3, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1089, '2025-11-27', 4, 55, 3, 50, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1090, '2025-11-27', 5, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1091, '2025-11-27', 2, 66, 79, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1092, '2025-11-27', 3, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1093, '2025-11-27', 4, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1094, '2025-11-27', 5, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1095, '2025-11-27', 3, 28, 82, 52, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1096, '2025-11-27', 4, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1097, '2025-11-27', 5, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1098, '2025-11-27', 6, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1099, '2025-11-27', 1, 68, 83, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1100, '2025-11-27', 2, 68, 83, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1101, '2025-11-27', 3, 68, 84, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1102, '2025-11-27', 1, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1103, '2025-11-27', 2, 45, 85, 54, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1104, '2025-11-27', 1, 27, 7, 55, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1105, '2025-11-27', 2, 61, 8, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1106, '2025-11-27', 3, 61, 86, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1107, '2025-11-27', 1, 69, 87, 56, NULL, 'УП маст.', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1108, '2025-11-27', 2, 69, 87, 56, NULL, 'УП маст.', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1109, '2025-11-27', 3, 69, 87, 56, NULL, 'УП маст.', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1110, '2025-11-27', 4, 69, 87, 56, NULL, 'УП маст.', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1111, '2025-11-28', 1, 70, 12, 2, NULL, '3.7ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1112, '2025-11-28', 2, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1113, '2025-11-28', 3, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1114, '2025-11-28', 1, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1115, '2025-11-28', 2, 71, 53, 3, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1116, '2025-11-28', 3, 27, 35, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1117, '2025-11-28', 4, 3, 16, 3, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1118, '2025-11-28', 1, 72, 38, 4, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1213, '2025-11-28', 5, 38, 57, 35, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1284, '2025-11-28', 3, 40, 38, 55, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1286, '2025-11-28', 1, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1287, '2025-11-28', 2, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1006, '2025-11-27', 4, 10, 9, 29, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1007, '2025-11-27', 5, 47, 50, 29, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1008, '2025-11-27', 1, 48, 52, 30, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1010, '2025-11-27', 2, 48, 52, 30, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1012, '2025-11-27', 3, 24, 53, 30, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1013, '2025-11-27', 4, 24, 53, 30, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1014, '2025-11-27', 1, 49, 54, 31, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1015, '2025-11-27', 2, 49, 54, 31, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1016, '2025-11-27', 3, 20, 13, 31, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1017, '2025-11-27', 4, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1018, '2025-11-27', 1, 20, 43, 32, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1019, '2025-11-27', 2, 50, 35, 32, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1020, '2025-11-27', 3, 51, 15, 32, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1021, '2025-11-27', 4, 15, 13, 32, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1022, '2025-11-27', 5, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1023, '2025-11-27', 6, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1024, '2025-11-27', 7, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1025, '2025-11-27', 1, 14, 3, 34, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1026, '2025-11-27', 2, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1027, '2025-11-27', 3, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1028, '2025-11-27', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1029, '2025-11-27', 2, 53, 38, 35, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1030, '2025-11-27', 3, 38, 57, 35, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1119, '2025-11-28', 2, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1120, '2025-11-28', 6, 23, 88, 5, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1121, '2025-11-28', 1, 14, 3, 6, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1122, '2025-11-28', 2, 20, 13, 6, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1123, '2025-11-28', 3, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1124, '2025-11-28', 4, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1125, '2025-11-28', 1, 74, 89, 7, NULL, '307 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1126, '2025-11-28', 2, 15, 13, 7, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1127, '2025-11-28', 2, 75, 90, 8, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1128, '2025-11-28', 3, 72, 38, 8, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1129, '2025-11-28', 4, 75, 90, 8, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1130, '2025-11-28', 5, 6, 2, 8, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1131, '2025-11-28', 2, 7, 5, 9, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1132, '2025-11-28', 3, 13, 12, 9, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1133, '2025-11-28', 4, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1134, '2025-11-28', 2, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1135, '2025-11-28', 3, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1136, '2025-11-28', 4, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1137, '2025-11-28', 1, 27, 7, 11, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1138, '2025-11-28', 2, 17, 91, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1139, '2025-11-28', 3, 22, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1140, '2025-11-28', 4, 22, 92, 11, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1141, '2025-11-28', 2, 28, 93, 12, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1142, '2025-11-28', 3, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1143, '2025-11-28', 4, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1154, '2025-11-28', 3, 33, 97, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1155, '2025-11-28', 1, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1156, '2025-11-28', 2, 42, 98, 16, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1157, '2025-11-28', 1, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1158, '2025-11-28', 2, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1159, '2025-11-28', 3, 14, 3, 17, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1160, '2025-11-28', 4, 77, 99, 17, NULL, '226 / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1161, '2025-11-28', 1, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1201, '2025-11-28', 2, 3, 5, 32, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1202, '2025-11-28', 3, 15, 13, 32, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1214, '2025-11-28', 6, 38, 57, 35, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1215, '2025-11-28', 2, 82, 53, 36, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1216, '2025-11-28', 3, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1217, '2025-11-28', 4, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1218, '2025-11-28', 1, 49, 60, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1219, '2025-11-28', 2, 49, 60, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1220, '2025-11-28', 3, 17, 105, 37, NULL, '301', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1221, '2025-11-28', 4, 17, 105, 37, NULL, '301', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1222, '2025-11-28', 1, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21323, '2025-12-04', 3, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21336, '2025-12-04', 1, 12, 11, 7, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21411, '2025-12-04', 4, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21412, '2025-12-04', 5, 12, 11, 31, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21413, '2025-12-04', 1, 20, 235, 32, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21414, '2025-12-04', 2, 50, 35, 32, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29996, '2025-12-06', 1, 15, 13, 35, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29997, '2025-12-06', 2, 15, 13, 35, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29998, '2025-12-06', 3, 6, 2, 7, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29999, '2025-12-06', 4, 6, 2, 7, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29995, '2025-12-06', 2, 8, 235, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21415, '2025-12-04', 3, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21416, '2025-12-04', 4, 15, 13, 32, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21417, '2025-12-04', 5, 20, 6, 32, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21418, '2025-12-04', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21419, '2025-12-04', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21420, '2025-12-04', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21421, '2025-12-04', 4, 91, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21422, '2025-12-04', 5, 11, 10, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21423, '2025-12-04', 6, 17, 264, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21424, '2025-12-04', 7, 17, 296, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21425, '2025-12-04', 1, 14, 3, 34, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21426, '2025-12-04', 2, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21427, '2025-12-04', 3, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21428, '2025-12-04', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21429, '2025-12-04', 1, 27, 7, 35, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21430, '2025-12-04', 2, 10, 9, 35, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21431, '2025-12-04', 3, 27, 7, 35, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46351, '2025-12-11', 4, 14, 3, 6, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46352, '2025-12-11', 1, 198, 34, 7, NULL, 'УП мастерские ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46353, '2025-12-11', 2, 16, 12, 7, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46354, '2025-12-11', 3, 15, 13, 7, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46355, '2025-12-11', 1, 75, 336, 8, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46356, '2025-12-11', 1, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46357, '2025-12-11', 2, 20, 13, 9, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55065, '2025-12-13', 2, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (948, '2025-11-27', 3, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (949, '2025-11-27', 4, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (950, '2025-11-27', 1, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (951, '2025-11-27', 2, 26, 25, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (952, '2025-11-27', 3, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (953, '2025-11-27', 4, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (954, '2025-11-27', 1, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (955, '2025-11-27', 2, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (956, '2025-11-27', 2, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (957, '2025-11-27', 3, 29, 27, 17, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (958, '2025-11-27', 4, 7, 5, 17, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (959, '2025-11-27', 5, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (960, '2025-11-27', 2, 30, 15, 18, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (961, '2025-11-27', 3, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (962, '2025-11-27', 4, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (963, '2025-11-27', 1, 32, 29, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (964, '2025-11-27', 2, 33, 30, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (965, '2025-11-27', 3, 34, 31, 19, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (966, '2025-11-27', 4, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (967, '2025-11-27', 5, 32, 33, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (968, '2025-11-27', 1, 35, 34, 20, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (969, '2025-11-27', 2, 27, 35, 20, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (970, '2025-11-27', 3, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (971, '2025-11-27', 4, 4, 36, 20, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (972, '2025-11-27', 2, 36, 37, 21, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (973, '2025-11-27', 3, 36, 37, 21, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (974, '2025-11-27', 4, 13, 31, 21, NULL, '3.4ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (975, '2025-11-27', 5, 37, 38, 21, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (976, '2025-11-27', 1, 16, 31, 22, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (977, '2025-11-27', 2, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (978, '2025-11-27', 3, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (979, '2025-11-27', 4, 38, 40, 22, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (980, '2025-11-27', 1, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (981, '2025-11-27', 2, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (982, '2025-11-27', 3, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (983, '2025-11-27', 4, 40, 38, 23, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (984, '2025-11-27', 2, 15, 13, 24, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (985, '2025-11-27', 3, 33, 43, 24, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (986, '2025-11-27', 4, 35, 34, 24, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (987, '2025-11-27', 5, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (988, '2025-11-27', 1, 42, 4, 25, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (989, '2025-11-27', 2, 42, 4, 25, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (990, '2025-11-27', 3, 43, 44, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (991, '2025-11-27', 4, 43, 44, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (992, '2025-11-27', 1, 44, 45, 26, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (993, '2025-11-27', 2, 44, 45, 26, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (994, '2025-11-27', 3, 44, 45, 26, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (995, '2025-11-27', 4, 44, 45, 26, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (998, '2025-11-27', 5, 45, 47, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (999, '2025-11-27', 6, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1000, '2025-11-27', 1, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11760, '2025-12-02', 1, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11761, '2025-12-02', 2, 35, 34, 2, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11762, '2025-12-02', 3, 84, 43, 2, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11763, '2025-12-02', 1, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11764, '2025-12-02', 2, 14, 3, 3, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11765, '2025-12-02', 3, 27, 35, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11766, '2025-12-02', 4, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11767, '2025-12-02', 1, 9, 194, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11768, '2025-12-02', 2, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11769, '2025-12-02', 3, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11770, '2025-12-02', 4, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11771, '2025-12-02', 1, 7, 5, 6, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11772, '2025-12-02', 2, 13, 12, 6, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11792, '2025-12-02', 2, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21321, '2025-12-04', 1, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21322, '2025-12-04', 2, 35, 34, 2, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1144, '2025-11-28', 5, 23, 19, 12, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1145, '2025-11-28', 4, 53, 38, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1146, '2025-11-28', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1147, '2025-11-28', 6, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1148, '2025-11-28', 7, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1149, '2025-11-28', 1, 59, 95, 14, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1150, '2025-11-28', 2, 40, 38, 14, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1151, '2025-11-28', 3, 23, 96, 14, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1152, '2025-11-28', 1, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1153, '2025-11-28', 2, 26, 25, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1203, '2025-11-28', 4, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1204, '2025-11-28', 5, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1205, '2025-11-28', 6, 40, 38, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1206, '2025-11-28', 7, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1207, '2025-11-28', 1, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1208, '2025-11-28', 2, 33, 43, 34, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1209, '2025-11-28', 3, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1210, '2025-11-28', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1211, '2025-11-28', 3, 79, 73, 35, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1212, '2025-11-28', 4, 47, 107, 35, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1223, '2025-11-28', 2, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1224, '2025-11-28', 3, 29, 27, 57, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1225, '2025-11-28', 4, 84, 43, 57, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1226, '2025-11-28', 1, 35, 34, 38, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1227, '2025-11-28', 2, 16, 12, 38, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1228, '2025-11-28', 3, 64, 16, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1282, '2025-11-28', 4, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1283, '2025-11-28', 2, 90, 122, 55, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1285, '2025-11-28', 4, 38, 123, 55, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30041, '2025-12-06', 2, 216, 308, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30042, '2025-12-06', 3, 216, 308, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26447, '2025-12-05', 5, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46416, '2025-12-11', 1, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16648, '2025-12-03', 5, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16649, '2025-12-03', 2, 43, 276, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16650, '2025-12-03', 3, 15, 13, 4, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21491, '2025-12-04', 4, 16, 31, 49, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42150, '2025-12-10', 1, 208, 21, 44, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42151, '2025-12-10', 2, 37, 38, 44, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (913, '2025-11-27', 4, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (914, '2025-11-27', 1, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (915, '2025-11-27', 2, 7, 5, 3, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (916, '2025-11-27', 3, 8, 6, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1299, '2025-11-27', 4, 8, 6, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (918, '2025-11-27', 1, 9, 7, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (919, '2025-11-27', 2, 9, 8, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (920, '2025-11-27', 3, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (921, '2025-11-27', 6, 11, 10, 5, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (922, '2025-11-27', 7, 11, 10, 5, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (923, '2025-11-27', 1, 12, 11, 6, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (924, '2025-11-27', 2, 13, 12, 6, NULL, '3.4ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (925, '2025-11-27', 3, 14, 3, 6, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (926, '2025-11-27', 1, 15, 13, 7, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (927, '2025-11-27', 2, 16, 12, 7, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (928, '2025-11-27', 3, 15, 13, 7, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (929, '2025-11-27', 1, 17, 4, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (930, '2025-11-27', 2, 18, 14, 8, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (931, '2025-11-27', 1, 19, 6, 9, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (932, '2025-11-27', 2, 20, 13, 9, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (933, '2025-11-27', 3, 12, 11, 9, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (934, '2025-11-27', 4, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (935, '2025-11-27', 1, 7, 5, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (936, '2025-11-27', 2, 21, 15, 10, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (937, '2025-11-27', 3, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (938, '2025-11-27', 1, 22, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (939, '2025-11-27', 2, 22, 18, 11, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (940, '2025-11-27', 1, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (941, '2025-11-27', 2, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (942, '2025-11-27', 4, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (943, '2025-11-27', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (944, '2025-11-27', 6, 24, 21, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (945, '2025-11-27', 7, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4529, '2025-11-29', 1, 84, 6, 2, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4530, '2025-11-29', 2, 84, 6, 2, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4531, '2025-11-29', 1, 92, 125, 4, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4532, '2025-11-29', 2, 92, 125, 4, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4533, '2025-11-29', 3, 92, 125, 4, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4534, '2025-11-29', 1, 45, 126, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4535, '2025-11-29', 2, 45, 127, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4536, '2025-11-29', 3, 45, 122, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4537, '2025-11-29', 1, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4538, '2025-11-29', 2, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4539, '2025-11-29', 1, 11, 10, 5, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4540, '2025-11-29', 2, 23, 88, 5, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4541, '2025-11-29', 3, 23, 88, 5, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4542, '2025-11-29', 4, 93, 128, 5, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4543, '2025-11-29', 3, 32, 29, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4544, '2025-11-29', 4, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4545, '2025-11-29', 5, 32, 33, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4546, '2025-11-29', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1288, '2025-11-28', 3, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1289, '2025-11-28', 4, 79, 36, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11773, '2025-12-02', 3, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11774, '2025-12-02', 1, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11775, '2025-12-02', 2, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11776, '2025-12-02', 3, 15, 13, 7, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11777, '2025-12-02', 1, 17, 95, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11778, '2025-12-02', 2, 86, 79, 8, NULL, 'УП маст', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11779, '2025-12-02', 3, 17, 234, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11780, '2025-12-02', 4, 200, 254, 8, NULL, '204 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11781, '2025-12-02', 2, 7, 16, 9, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11782, '2025-12-02', 3, 13, 12, 9, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11783, '2025-12-02', 4, 209, 43, 9, NULL, 'каб.006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11784, '2025-12-02', 5, 12, 11, 9, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11785, '2025-12-02', 1, 12, 11, 10, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11786, '2025-12-02', 2, 27, 35, 10, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11787, '2025-12-02', 3, 204, 12, 10, NULL, '208 / 208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11788, '2025-12-02', 1, 22, 92, 11, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11789, '2025-12-02', 2, 75, 255, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11790, '2025-12-02', 3, 75, 255, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11791, '2025-12-02', 1, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1001, '2025-11-27', 2, 35, 34, 28, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1002, '2025-11-27', 3, 3, 5, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4547, '2025-11-29', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4548, '2025-11-29', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4549, '2025-11-29', 1, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4550, '2025-11-29', 2, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4551, '2025-11-29', 2, 27, 35, 57, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4552, '2025-11-29', 3, 79, 2, 57, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4553, '2025-11-29', 4, 79, 36, 57, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4554, '2025-11-29', 1, 89, 129, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4555, '2025-11-29', 2, 89, 129, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4556, '2025-11-29', 3, 89, 129, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4557, '2025-11-29', 4, 89, 121, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4558, '2025-11-29', 1, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4559, '2025-11-29', 2, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4560, '2025-11-29', 1, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4561, '2025-11-29', 2, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4562, '2025-11-29', 1, 17, 130, 12, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16651, '2025-12-03', 4, 43, 277, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21335, '2025-12-04', 4, 8, 6, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16652, '2025-12-03', 1, 20, 13, 6, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16653, '2025-12-03', 2, 8, 43, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16654, '2025-12-03', 3, 14, 3, 6, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16655, '2025-12-03', 4, 13, 12, 6, NULL, '3.4ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16656, '2025-12-03', 1, 7, 16, 7, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16657, '2025-12-03', 2, 7, 5, 7, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16673, '2025-12-03', 2, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16674, '2025-12-03', 1, 32, 280, 15, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16675, '2025-12-03', 2, 32, 280, 15, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16676, '2025-12-03', 3, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30000, '2025-12-06', 1, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42046, '2025-12-10', 4, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4575, '2025-11-29', 1, 52, 56, 33, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4576, '2025-11-29', 2, 52, 56, 33, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4577, '2025-11-29', 1, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4578, '2025-11-29', 2, 62, 132, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4579, '2025-11-29', 3, 62, 132, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4580, '2025-11-29', 4, 62, 72, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11794, '2025-12-02', 4, 28, 93, 12, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11795, '2025-12-02', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11796, '2025-12-02', 6, 23, 128, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11797, '2025-12-02', 7, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11798, '2025-12-02', 3, 9, 7, 14, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11799, '2025-12-02', 4, 93, 22, 14, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11800, '2025-12-02', 5, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11801, '2025-12-02', 6, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11802, '2025-12-02', 1, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11803, '2025-12-02', 2, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11804, '2025-12-02', 3, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11805, '2025-12-02', 1, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11806, '2025-12-02', 2, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11807, '2025-12-02', 3, 28, 256, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11808, '2025-12-02', 2, 8, 257, 137, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11809, '2025-12-02', 3, 31, 28, 137, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11810, '2025-12-02', 4, 66, 79, 137, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11811, '2025-12-02', 5, 66, 79, 137, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11812, '2025-12-02', 6, 66, 258, 137, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11813, '2025-12-02', 4, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11814, '2025-12-02', 5, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11815, '2025-12-02', 1, 45, 248, 19, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11816, '2025-12-02', 2, 93, 64, 19, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11817, '2025-12-02', 3, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11818, '2025-12-02', 4, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11819, '2025-12-02', 5, 45, 259, 19, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (12209, '2025-12-02', 1, 210, 3, 20, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11820, '2025-12-02', 2, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11821, '2025-12-02', 3, 7, 16, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11822, '2025-12-02', 4, 7, 5, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11824, '2025-12-02', 1, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11825, '2025-12-02', 2, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11826, '2025-12-02', 3, 62, 240, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11827, '2025-12-02', 4, 62, 240, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11828, '2025-12-02', 3, 4, 246, 22, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11829, '2025-12-02', 4, 41, 117, 22, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11830, '2025-12-02', 5, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11831, '2025-12-02', 2, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11832, '2025-12-02', 3, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11833, '2025-12-02', 4, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11834, '2025-12-02', 5, 11, 262, 23, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11835, '2025-12-02', 2, 21, 15, 24, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11836, '2025-12-02', 3, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4563, '2025-11-29', 2, 17, 130, 12, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4564, '2025-11-29', 1, 93, 4, 40, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4565, '2025-11-29', 2, 93, 4, 40, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4566, '2025-11-29', 4, 38, 51, 40, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4567, '2025-11-29', 5, 38, 51, 40, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4568, '2025-11-29', 1, 23, 20, 13, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (996, '2025-11-27', 3, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (997, '2025-11-27', 4, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4569, '2025-11-29', 2, 11, 10, 13, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4570, '2025-11-29', 3, 93, 131, 13, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4571, '2025-11-29', 1, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4572, '2025-11-29', 2, 79, 36, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4573, '2025-11-29', 3, 27, 35, 58, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (4574, '2025-11-29', 4, 27, 35, 58, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11837, '2025-12-02', 4, 15, 13, 24, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11838, '2025-12-02', 5, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11839, '2025-12-02', 1, 79, 2, 25, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21355, '2025-12-04', 6, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34308, '2025-12-08', 1, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30029, '2025-12-06', 4, 43, 307, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30030, '2025-12-06', 3, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30031, '2025-12-06', 4, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30032, '2025-12-06', 1, 89, 121, 53, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21356, '2025-12-04', 7, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21357, '2025-12-04', 2, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21358, '2025-12-04', 3, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21359, '2025-12-04', 4, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21360, '2025-12-04', 5, 24, 21, 14, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21361, '2025-12-04', 2, 26, 291, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21362, '2025-12-04', 3, 33, 292, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21363, '2025-12-04', 4, 32, 293, 15, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21364, '2025-12-04', 2, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21365, '2025-12-04', 3, 29, 27, 17, NULL, 'читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21366, '2025-12-04', 4, 7, 5, 17, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21367, '2025-12-04', 5, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21368, '2025-12-04', 3, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21369, '2025-12-04', 4, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30033, '2025-12-06', 2, 89, 121, 53, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30047, '2025-12-06', 1, 17, 264, 33, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21492, '2025-12-04', 1, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21493, '2025-12-04', 2, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30048, '2025-12-06', 2, 17, 283, 33, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26366, '2025-12-05', 1, 70, 12, 2, NULL, '3.7ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26367, '2025-12-05', 2, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26368, '2025-12-05', 3, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21508, '2025-12-04', 3, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21509, '2025-12-04', 4, 82, 21, 54, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21512, '2025-12-04', 3, 61, 86, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46375, '2025-12-11', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46376, '2025-12-11', 5, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46377, '2025-12-11', 6, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46378, '2025-12-11', 1, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46379, '2025-12-11', 2, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46380, '2025-12-11', 3, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46381, '2025-12-11', 4, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11840, '2025-12-02', 2, 15, 13, 25, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11841, '2025-12-02', 3, 205, 242, 25, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11842, '2025-12-02', 2, 67, 263, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11843, '2025-12-02', 3, 53, 38, 26, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11844, '2025-12-02', 4, 53, 38, 26, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11845, '2025-12-02', 4, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11846, '2025-12-02', 5, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1162, '2025-11-28', 2, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1163, '2025-11-28', 3, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1164, '2025-11-28', 4, 31, 28, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1165, '2025-11-28', 1, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1166, '2025-11-28', 2, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1167, '2025-11-28', 3, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1168, '2025-11-28', 4, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1169, '2025-11-28', 1, 62, 100, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1170, '2025-11-28', 2, 62, 100, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1171, '2025-11-28', 1, 78, 15, 22, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1172, '2025-11-28', 2, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1173, '2025-11-28', 1, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1174, '2025-11-28', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1175, '2025-11-28', 4, 64, 5, 24, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1176, '2025-11-28', 5, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1177, '2025-11-28', 1, 79, 2, 25, NULL, '32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1178, '2025-11-28', 2, 9, 103, 25, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1179, '2025-11-28', 3, 43, 44, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1180, '2025-11-28', 4, 9, 103, 25, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1181, '2025-11-28', 1, 53, 38, 26, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1182, '2025-11-28', 2, 53, 38, 26, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1183, '2025-11-28', 1, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1184, '2025-11-28', 2, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1185, '2025-11-28', 3, 45, 47, 27, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1186, '2025-11-28', 4, 45, 47, 27, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1187, '2025-11-28', 1, 3, 16, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1188, '2025-11-28', 2, 4, 2, 28, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1189, '2025-11-28', 3, 80, 89, 28, NULL, '328 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1190, '2025-11-28', 1, 81, 60, 29, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1191, '2025-11-28', 2, 81, 60, 29, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1192, '2025-11-28', 3, 17, 105, 29, NULL, '301', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1193, '2025-11-28', 4, 17, 105, 29, NULL, '301', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1194, '2025-11-28', 3, 10, 106, 30, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1195, '2025-11-28', 4, 24, 53, 30, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1196, '2025-11-28', 5, 24, 53, 30, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1197, '2025-11-28', 1, 6, 2, 31, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1198, '2025-11-28', 2, 14, 3, 31, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1199, '2025-11-28', 3, 20, 13, 31, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1200, '2025-11-28', 1, 4, 2, 32, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1290, '2025-11-28', 1, 91, 124, 56, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1291, '2025-11-28', 2, 91, 124, 56, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30001, '2025-12-06', 2, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30002, '2025-12-06', 1, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30003, '2025-12-06', 2, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30004, '2025-12-06', 3, 215, 301, 39, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30005, '2025-12-06', 1, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30027, '2025-12-06', 2, 43, 306, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30028, '2025-12-06', 3, 43, 307, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34413, '2025-12-08', 2, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34414, '2025-12-08', 3, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21432, '2025-12-04', 4, 53, 38, 35, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21433, '2025-12-04', 1, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21434, '2025-12-04', 2, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21435, '2025-12-04', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21436, '2025-12-04', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21437, '2025-12-04', 1, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8789, '2025-12-01', 4, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21438, '2025-12-04', 2, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21439, '2025-12-04', 3, 9, 7, 37, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21440, '2025-12-04', 4, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21441, '2025-12-04', 1, 55, 3, 57, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21442, '2025-12-04', 2, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21443, '2025-12-04', 3, 51, 15, 57, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21444, '2025-12-04', 1, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21445, '2025-12-04', 2, 12, 11, 38, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21446, '2025-12-04', 3, 56, 15, 38, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21447, '2025-12-04', 4, 64, 5, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21448, '2025-12-04', 1, 13, 12, 39, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21449, '2025-12-04', 2, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21450, '2025-12-04', 3, 12, 11, 39, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21451, '2025-12-04', 4, 29, 51, 39, NULL, '226', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21452, '2025-12-04', 1, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21453, '2025-12-04', 2, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21454, '2025-12-04', 3, 15, 13, 40, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21455, '2025-12-04', 4, 58, 15, 40, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21456, '2025-12-04', 4, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21457, '2025-12-04', 5, 4, 73, 41, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21488, '2025-12-04', 1, 214, 297, 49, NULL, '3.14вц/ 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21489, '2025-12-04', 2, 65, 75, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21490, '2025-12-04', 3, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34415, '2025-12-08', 4, 3, 16, 46, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21495, '2025-12-04', 4, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21513, '2025-12-04', 4, 27, 7, 55, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21514, '2025-12-04', 1, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26369, '2025-12-05', 4, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26370, '2025-12-05', 1, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26437, '2025-12-05', 1, 11, 262, 27, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26441, '2025-12-05', 1, 4, 2, 28, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26442, '2025-12-05', 2, 3, 16, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26448, '2025-12-05', 3, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34416, '2025-12-08', 1, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34417, '2025-12-08', 2, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34418, '2025-12-08', 1, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34419, '2025-12-08', 2, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46382, '2025-12-11', 1, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46383, '2025-12-11', 2, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46384, '2025-12-11', 3, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46385, '2025-12-11', 2, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11874, '2025-12-02', 3, 50, 35, 34, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11875, '2025-12-02', 4, 3, 5, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11876, '2025-12-02', 1, 15, 13, 35, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11877, '2025-12-02', 2, 83, 64, 35, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1229, '2025-11-28', 4, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1230, '2025-11-28', 2, 64, 5, 39, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1231, '2025-11-28', 3, 61, 13, 39, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1232, '2025-11-28', 3, 9, 103, 40, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1233, '2025-11-28', 4, 15, 13, 40, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1234, '2025-11-28', 3, 78, 15, 41, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1235, '2025-11-28', 4, 4, 73, 41, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1236, '2025-11-28', 5, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1237, '2025-11-28', 1, 24, 21, 1, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1238, '2025-11-28', 2, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1239, '2025-11-28', 3, 59, 109, 1, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1240, '2025-11-28', 4, 2, 110, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1241, '2025-11-28', 2, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1242, '2025-11-28', 3, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1243, '2025-11-28', 4, 72, 38, 42, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1244, '2025-11-28', 5, 47, 107, 42, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1245, '2025-11-28', 1, 82, 21, 43, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1246, '2025-11-28', 2, 19, 69, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1247, '2025-11-28', 3, 12, 111, 43, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1248, '2025-11-28', 4, 12, 111, 43, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1249, '2025-11-28', 3, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1250, '2025-11-28', 4, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1251, '2025-11-28', 5, 62, 72, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1252, '2025-11-28', 1, 85, 69, 45, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1253, '2025-11-28', 2, 85, 69, 45, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1254, '2025-11-28', 3, 22, 65, 45, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1255, '2025-11-28', 4, 82, 53, 45, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1256, '2025-11-28', 2, 86, 27, 46, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1257, '2025-11-28', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1258, '2025-11-28', 4, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1259, '2025-11-28', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1260, '2025-11-28', 4, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1261, '2025-11-28', 3, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1262, '2025-11-28', 4, 87, 113, 48, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1263, '2025-11-28', 5, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11878, '2025-12-02', 3, 10, 9, 35, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11879, '2025-12-02', 2, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1264, '2025-11-28', 2, 88, 115, 49, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1266, '2025-11-28', 3, 16, 116, 49, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1267, '2025-11-28', 4, 78, 15, 49, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1268, '2025-11-28', 5, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1269, '2025-11-28', 1, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1270, '2025-11-28', 2, 58, 15, 50, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11880, '2025-12-02', 3, 8, 266, 36, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11881, '2025-12-02', 4, 40, 38, 36, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11882, '2025-12-02', 1, 56, 15, 37, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11883, '2025-12-02', 2, 16, 31, 37, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11884, '2025-12-02', 3, 83, 243, 37, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11885, '2025-12-02', 4, 47, 50, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11886, '2025-12-02', 1, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1271, '2025-11-28', 3, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1272, '2025-11-28', 3, 53, 38, 51, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1273, '2025-11-28', 4, 53, 38, 51, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1274, '2025-11-28', 1, 63, 119, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1275, '2025-11-28', 2, 63, 120, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1276, '2025-11-28', 3, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1277, '2025-11-28', 5, 89, 121, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1278, '2025-11-28', 6, 89, 121, 53, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1279, '2025-11-28', 1, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1280, '2025-11-28', 2, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (1281, '2025-11-28', 3, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11887, '2025-12-02', 2, 64, 5, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11888, '2025-12-02', 3, 55, 3, 57, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11889, '2025-12-02', 4, 35, 34, 57, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11890, '2025-12-02', 1, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11891, '2025-12-02', 2, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11892, '2025-12-02', 3, 79, 36, 38, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11893, '2025-12-02', 4, 84, 43, 38, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11894, '2025-12-02', 1, 61, 13, 39, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11895, '2025-12-02', 2, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11896, '2025-12-02', 3, 35, 34, 39, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11897, '2025-12-02', 4, 64, 16, 39, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11898, '2025-12-02', 1, 207, 267, 40, NULL, '317 / 120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11899, '2025-12-02', 2, 9, 103, 40, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11900, '2025-12-02', 3, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11901, '2025-12-02', 4, 43, 268, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11902, '2025-12-02', 1, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34304, '2025-12-08', 6, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34305, '2025-12-08', 1, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55073, '2025-12-13', 4, 93, 131, 13, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46387, '2025-12-11', 4, 7, 5, 17, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21458, '2025-12-04', 3, 24, 21, 1, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21459, '2025-12-04', 4, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21479, '2025-12-04', 4, 73, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21480, '2025-12-04', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21481, '2025-12-04', 4, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21482, '2025-12-04', 5, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21483, '2025-12-04', 6, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21484, '2025-12-04', 2, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21485, '2025-12-04', 3, 64, 5, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21486, '2025-12-04', 4, 50, 35, 48, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21487, '2025-12-04', 5, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21494, '2025-12-04', 3, 43, 290, 50, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46388, '2025-12-11', 5, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46479, '2025-12-11', 2, 27, 7, 59, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21510, '2025-12-04', 1, 61, 8, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21511, '2025-12-04', 2, 45, 122, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21515, '2025-12-04', 2, 51, 15, 58, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21516, '2025-12-04', 3, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11903, '2025-12-02', 2, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11904, '2025-12-02', 3, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11905, '2025-12-02', 4, 13, 31, 41, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11906, '2025-12-02', 2, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11907, '2025-12-02', 3, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11908, '2025-12-02', 4, 2, 110, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11909, '2025-12-02', 5, 59, 109, 1, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11910, '2025-12-02', 2, 6, 2, 42, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11911, '2025-12-02', 3, 208, 21, 42, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11912, '2025-12-02', 4, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11913, '2025-12-02', 5, 47, 107, 42, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11914, '2025-12-02', 1, 67, 269, 43, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11948, '2025-12-02', 5, 16, 116, 52, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11949, '2025-12-02', 1, 68, 83, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11950, '2025-12-02', 2, 68, 84, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11951, '2025-12-02', 3, 68, 84, 53, NULL, 'Кванториум', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11953, '2025-12-02', 1, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11954, '2025-12-02', 2, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11955, '2025-12-02', 3, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11956, '2025-12-02', 4, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11957, '2025-12-02', 1, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11958, '2025-12-02', 2, 84, 43, 58, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11959, '2025-12-02', 3, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11960, '2025-12-02', 4, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21385, '2025-12-04', 1, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21386, '2025-12-04', 2, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21387, '2025-12-04', 3, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21388, '2025-12-04', 4, 40, 38, 23, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21389, '2025-12-04', 4, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21390, '2025-12-04', 5, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21391, '2025-12-04', 6, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21392, '2025-12-04', 1, 15, 13, 25, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21393, '2025-12-04', 2, 43, 44, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21394, '2025-12-04', 3, 42, 4, 25, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21395, '2025-12-04', 4, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21396, '2025-12-04', 1, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21397, '2025-12-04', 2, 11, 262, 27, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21398, '2025-12-04', 3, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21399, '2025-12-04', 4, 11, 262, 27, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21400, '2025-12-04', 1, 5, 3, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21401, '2025-12-04', 2, 4, 2, 28, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30034, '2025-12-06', 3, 89, 121, 53, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30035, '2025-12-06', 4, 89, 121, 53, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30036, '2025-12-06', 1, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30037, '2025-12-06', 2, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30038, '2025-12-06', 1, 45, 126, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30039, '2025-12-06', 2, 45, 127, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21501, '2025-12-04', 2, 63, 120, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8790, '2025-12-01', 4, 93, 131, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8803, '2025-12-01', 4, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8804, '2025-12-01', 2, 84, 6, 17, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8805, '2025-12-01', 3, 84, 43, 17, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8806, '2025-12-01', 4, 12, 11, 17, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8807, '2025-12-01', 5, 84, 235, 17, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8808, '2025-12-01', 1, 11, 238, 18, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8809, '2025-12-01', 2, 199, 239, 18, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8810, '2025-12-01', 3, 16, 116, 18, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8811, '2025-12-01', 2, 45, 69, 19, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8820, '2025-12-01', 3, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8821, '2025-12-01', 4, 4, 73, 22, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8822, '2025-12-01', 1, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8823, '2025-12-01', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8824, '2025-12-01', 3, 59, 109, 23, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8825, '2025-12-01', 4, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8826, '2025-12-01', 1, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8833, '2025-12-01', 1, 44, 45, 26, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8834, '2025-12-01', 2, 44, 45, 26, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8835, '2025-12-01', 3, 44, 45, 26, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8836, '2025-12-01', 4, 44, 45, 26, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8837, '2025-12-01', 3, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8838, '2025-12-01', 4, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8844, '2025-12-01', 4, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8845, '2025-12-01', 1, 8, 49, 29, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8846, '2025-12-01', 2, 9, 7, 29, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30040, '2025-12-06', 1, 216, 308, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21502, '2025-12-04', 3, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16641, '2025-12-03', 1, 4, 36, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16642, '2025-12-03', 2, 4, 2, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16643, '2025-12-03', 3, 50, 35, 2, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16644, '2025-12-03', 4, 3, 5, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16645, '2025-12-03', 2, 75, 36, 3, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16646, '2025-12-03', 3, 71, 53, 3, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16647, '2025-12-03', 4, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21503, '2025-12-04', 4, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21504, '2025-12-04', 1, 89, 129, 53, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21505, '2025-12-04', 2, 89, 129, 53, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21506, '2025-12-04', 1, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21507, '2025-12-04', 2, 52, 272, 54, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21517, '2025-12-04', 4, 12, 11, 58, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30043, '2025-12-06', 1, 6, 2, 31, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30044, '2025-12-06', 2, 6, 2, 31, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30045, '2025-12-06', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30046, '2025-12-06', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46396, '2025-12-11', 4, 27, 35, 20, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26443, '2025-12-05', 3, 84, 43, 28, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26444, '2025-12-05', 2, 47, 268, 29, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26445, '2025-12-05', 3, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26446, '2025-12-05', 4, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46397, '2025-12-11', 5, 224, 339, 20, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46398, '2025-12-11', 3, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46399, '2025-12-11', 4, 57, 340, 22, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46400, '2025-12-11', 5, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46401, '2025-12-11', 1, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46402, '2025-12-11', 2, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11915, '2025-12-02', 2, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11916, '2025-12-02', 3, 93, 4, 43, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11917, '2025-12-02', 4, 33, 270, 43, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11918, '2025-12-02', 1, 27, 7, 59, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11919, '2025-12-02', 2, 90, 122, 59, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11920, '2025-12-02', 3, 90, 122, 59, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11921, '2025-12-02', 4, 45, 122, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11922, '2025-12-02', 1, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11923, '2025-12-02', 2, 60, 68, 45, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11924, '2025-12-02', 3, 60, 68, 45, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11926, '2025-12-02', 2, 211, 274, 46, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11927, '2025-12-02', 3, 212, 275, 46, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (12316, '2025-12-02', 4, 210, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (12317, '2025-12-02', 5, 210, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11928, '2025-12-02', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11929, '2025-12-02', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11930, '2025-12-02', 2, 79, 2, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11931, '2025-12-02', 3, 12, 11, 48, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11932, '2025-12-02', 4, 16, 12, 48, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11933, '2025-12-02', 5, 56, 15, 48, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11934, '2025-12-02', 3, 200, 271, 49, NULL, '204 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11935, '2025-12-02', 4, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11936, '2025-12-02', 5, 4, 73, 49, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11937, '2025-12-02', 1, 65, 75, 50, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11938, '2025-12-02', 2, 65, 75, 50, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11939, '2025-12-02', 3, 47, 118, 50, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11940, '2025-12-02', 4, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11941, '2025-12-02', 1, 11, 238, 51, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11942, '2025-12-02', 2, 11, 238, 51, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11943, '2025-12-02', 3, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11944, '2025-12-02', 4, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11945, '2025-12-02', 2, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11946, '2025-12-02', 3, 63, 120, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11947, '2025-12-02', 4, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26373, '2025-12-05', 4, 27, 35, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26450, '2025-12-05', 5, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26451, '2025-12-05', 6, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26452, '2025-12-05', 2, 8, 43, 31, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11952, '2025-12-02', 4, 89, 121, 53, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26453, '2025-12-05', 3, 20, 13, 31, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8752, '2025-12-01', 1, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8753, '2025-12-01', 2, 12, 11, 2, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8754, '2025-12-01', 3, 50, 35, 2, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8755, '2025-12-01', 1, 7, 5, 3, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8756, '2025-12-01', 2, 198, 34, 3, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8757, '2025-12-01', 3, 8, 273, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8758, '2025-12-01', 4, 8, 6, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8759, '2025-12-01', 1, 4, 73, 4, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8760, '2025-12-01', 2, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8761, '2025-12-01', 3, 15, 13, 4, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8762, '2025-12-01', 1, 86, 27, 6, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8763, '2025-12-01', 2, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8764, '2025-12-01', 3, 20, 13, 6, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8765, '2025-12-01', 4, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8766, '2025-12-01', 2, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8767, '2025-12-01', 3, 198, 34, 7, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8768, '2025-12-01', 4, 55, 3, 7, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8769, '2025-12-01', 5, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8770, '2025-12-01', 1, 17, 4, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8771, '2025-12-01', 2, 17, 233, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8772, '2025-12-01', 3, 17, 95, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8773, '2025-12-01', 4, 17, 234, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8774, '2025-12-01', 1, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8775, '2025-12-01', 2, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8776, '2025-12-01', 3, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8777, '2025-12-01', 1, 33, 6, 10, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8778, '2025-12-01', 2, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8779, '2025-12-01', 3, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8780, '2025-12-01', 4, 33, 43, 10, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8781, '2025-12-01', 5, 33, 235, 10, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8782, '2025-12-01', 1, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8783, '2025-12-01', 2, 27, 7, 11, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8784, '2025-12-01', 3, 22, 92, 11, NULL, '317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8785, '2025-12-01', 4, 22, 92, 11, NULL, '317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8786, '2025-12-01', 1, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8787, '2025-12-01', 2, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8788, '2025-12-01', 3, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8847, '2025-12-01', 3, 83, 243, 29, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8848, '2025-12-01', 4, 47, 50, 29, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21460, '2025-12-04', 5, 59, 67, 1, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21461, '2025-12-04', 6, 40, 38, 1, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21462, '2025-12-04', 2, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21463, '2025-12-04', 3, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21464, '2025-12-04', 1, 19, 248, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21465, '2025-12-04', 2, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21466, '2025-12-04', 3, 60, 68, 43, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21467, '2025-12-04', 4, 19, 259, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21468, '2025-12-04', 1, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21469, '2025-12-04', 2, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21471, '2025-12-04', 4, 62, 71, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21472, '2025-12-04', 1, 4, 73, 45, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21473, '2025-12-04', 2, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21474, '2025-12-04', 3, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21475, '2025-12-04', 4, 33, 30, 45, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21476, '2025-12-04', 1, 33, 6, 46, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21477, '2025-12-04', 2, 14, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21478, '2025-12-04', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46404, '2025-12-11', 4, 40, 38, 23, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46405, '2025-12-11', 1, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46406, '2025-12-11', 2, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46407, '2025-12-11', 3, 33, 43, 24, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46408, '2025-12-11', 4, 35, 34, 24, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46409, '2025-12-11', 4, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46505, '2025-12-11', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8791, '2025-12-01', 5, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8792, '2025-12-01', 6, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8793, '2025-12-01', 7, 23, 128, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8794, '2025-12-01', 1, 93, 22, 14, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8795, '2025-12-01', 2, 59, 95, 14, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8796, '2025-12-01', 3, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8797, '2025-12-01', 1, 26, 25, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8798, '2025-12-01', 2, 26, 24, 15, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8799, '2025-12-01', 3, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8800, '2025-12-01', 4, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8801, '2025-12-01', 2, 72, 38, 16, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8802, '2025-12-01', 3, 28, 26, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8812, '2025-12-01', 3, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8813, '2025-12-01', 4, 30, 15, 19, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8814, '2025-12-01', 5, 4, 73, 19, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8815, '2025-12-01', 1, 35, 34, 20, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8816, '2025-12-01', 2, 7, 16, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8817, '2025-12-01', 3, 51, 15, 20, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8818, '2025-12-01', 1, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8819, '2025-12-01', 2, 41, 117, 22, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8827, '2025-12-01', 2, 35, 34, 24, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8828, '2025-12-01', 3, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8829, '2025-12-01', 4, 34, 12, 24, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8830, '2025-12-01', 1, 62, 240, 25, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8831, '2025-12-01', 2, 62, 240, 25, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8832, '2025-12-01', 3, 62, 240, 25, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8839, '2025-12-01', 5, 40, 38, 27, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8840, '2025-12-01', 6, 45, 241, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8841, '2025-12-01', 1, 53, 242, 28, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8842, '2025-12-01', 2, 12, 11, 28, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8843, '2025-12-01', 3, 71, 53, 28, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8849, '2025-12-01', 1, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8850, '2025-12-01', 2, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8851, '2025-12-01', 1, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8852, '2025-12-01', 2, 3, 16, 31, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8853, '2025-12-01', 3, 14, 3, 31, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8854, '2025-12-01', 3, 35, 34, 32, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8855, '2025-12-01', 4, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8856, '2025-12-01', 5, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8857, '2025-12-01', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8858, '2025-12-01', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8859, '2025-12-01', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8860, '2025-12-01', 5, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8861, '2025-12-01', 6, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8862, '2025-12-01', 7, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8863, '2025-12-01', 4, 15, 13, 35, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8864, '2025-12-01', 5, 79, 73, 35, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8865, '2025-12-01', 1, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8866, '2025-12-01', 2, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8911, '2025-12-01', 1, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8912, '2025-12-01', 2, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8913, '2025-12-01', 3, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8914, '2025-12-01', 1, 202, 250, 49, NULL, '213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8915, '2025-12-01', 2, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8916, '2025-12-01', 3, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8917, '2025-12-01', 4, 202, 251, 49, NULL, '213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8918, '2025-12-01', 1, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8919, '2025-12-01', 2, 13, 31, 50, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8920, '2025-12-01', 3, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8921, '2025-12-01', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8922, '2025-12-01', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8923, '2025-12-01', 3, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8924, '2025-12-01', 4, 203, 252, 51, NULL, '009', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8925, '2025-12-01', 4, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8926, '2025-12-01', 5, 63, 119, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8927, '2025-12-01', 6, 63, 119, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8928, '2025-12-01', 2, 53, 38, 53, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8929, '2025-12-01', 3, 53, 38, 53, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8930, '2025-12-01', 4, 89, 129, 53, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8931, '2025-12-01', 5, 89, 129, 53, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8932, '2025-12-01', 1, 45, 85, 54, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8933, '2025-12-01', 2, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8934, '2025-12-01', 3, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8935, '2025-12-01', 4, 45, 126, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8936, '2025-12-01', 5, 45, 127, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8937, '2025-12-01', 1, 16, 12, 58, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8938, '2025-12-01', 2, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21470, '2025-12-04', 3, 62, 71, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8939, '2025-12-01', 3, 12, 11, 58, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16658, '2025-12-03', 3, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16659, '2025-12-03', 3, 200, 254, 8, NULL, '204 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16660, '2025-12-03', 4, 17, 278, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16661, '2025-12-03', 5, 6, 2, 8, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16662, '2025-12-03', 3, 20, 13, 9, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16663, '2025-12-03', 4, 14, 3, 9, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16664, '2025-12-03', 1, 12, 36, 10, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16665, '2025-12-03', 2, 204, 12, 10, NULL, '208 / 208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16666, '2025-12-03', 2, 17, 279, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16667, '2025-12-03', 3, 17, 91, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16668, '2025-12-03', 4, 40, 38, 11, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16669, '2025-12-03', 5, 12, 111, 11, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16670, '2025-12-03', 4, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16671, '2025-12-03', 5, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16672, '2025-12-03', 1, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21496, '2025-12-04', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21497, '2025-12-04', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21498, '2025-12-04', 3, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21499, '2025-12-04', 4, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21500, '2025-12-04', 1, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26427, '2025-12-05', 1, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26428, '2025-12-05', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26429, '2025-12-05', 3, 33, 43, 24, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26430, '2025-12-05', 4, 64, 5, 24, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26431, '2025-12-05', 5, 64, 5, 24, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26435, '2025-12-05', 5, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26436, '2025-12-05', 6, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8867, '2025-12-01', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8868, '2025-12-01', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8869, '2025-12-01', 2, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8870, '2025-12-01', 3, 10, 9, 37, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8871, '2025-12-01', 4, 10, 9, 37, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8872, '2025-12-01', 1, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8873, '2025-12-01', 2, 16, 12, 57, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8874, '2025-12-01', 3, 12, 11, 57, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8875, '2025-12-01', 2, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8876, '2025-12-01', 3, 64, 5, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8877, '2025-12-01', 1, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8878, '2025-12-01', 2, 64, 5, 39, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8879, '2025-12-01', 3, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8880, '2025-12-01', 4, 84, 43, 39, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8881, '2025-12-01', 1, 200, 34, 40, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8882, '2025-12-01', 2, 15, 13, 40, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8883, '2025-12-01', 3, 4, 246, 40, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8884, '2025-12-01', 1, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8885, '2025-12-01', 2, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8886, '2025-12-01', 3, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8887, '2025-12-01', 4, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8888, '2025-12-01', 1, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8889, '2025-12-01', 2, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8890, '2025-12-01', 3, 2, 110, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8891, '2025-12-01', 4, 2, 110, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8892, '2025-12-01', 1, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8893, '2025-12-01', 2, 48, 123, 42, NULL, '317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8894, '2025-12-01', 3, 47, 107, 42, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8895, '2025-12-01', 4, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11793, '2025-12-02', 3, 23, 19, 12, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11847, '2025-12-02', 1, 35, 34, 28, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11848, '2025-12-02', 2, 50, 35, 28, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11849, '2025-12-02', 3, 5, 3, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11850, '2025-12-02', 4, 4, 36, 28, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11851, '2025-12-02', 1, 16, 31, 29, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11852, '2025-12-02', 2, 56, 15, 29, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11853, '2025-12-02', 3, 61, 13, 29, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11854, '2025-12-02', 4, 79, 73, 29, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11855, '2025-12-02', 4, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11856, '2025-12-02', 5, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11857, '2025-12-02', 6, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11858, '2025-12-02', 1, 206, 99, 31, NULL, ' УП/ 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11859, '2025-12-02', 2, 12, 11, 31, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11860, '2025-12-02', 3, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11861, '2025-12-02', 4, 6, 2, 31, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11862, '2025-12-02', 1, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11863, '2025-12-02', 2, 4, 2, 32, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11864, '2025-12-02', 3, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11865, '2025-12-02', 4, 12, 11, 32, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11866, '2025-12-02', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11867, '2025-12-02', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11868, '2025-12-02', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11869, '2025-12-02', 4, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11870, '2025-12-02', 5, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11871, '2025-12-02', 6, 17, 264, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11872, '2025-12-02', 1, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (11873, '2025-12-02', 2, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8896, '2025-12-01', 1, 6, 2, 43, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8897, '2025-12-01', 2, 201, 247, 43, NULL, '006 / 324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8898, '2025-12-01', 3, 19, 248, 43, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8899, '2025-12-01', 4, 62, 70, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8900, '2025-12-01', 5, 62, 70, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8901, '2025-12-01', 6, 62, 70, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8902, '2025-12-01', 2, 8, 249, 45, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8903, '2025-12-01', 3, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8904, '2025-12-01', 4, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8905, '2025-12-01', 1, 3, 16, 46, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8906, '2025-12-01', 2, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8907, '2025-12-01', 3, 33, 43, 46, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8908, '2025-12-01', 4, 12, 11, 46, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8909, '2025-12-01', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (8910, '2025-12-01', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16677, '2025-12-03', 4, 33, 97, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16678, '2025-12-03', 1, 72, 38, 16, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16752, '2025-12-03', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16753, '2025-12-03', 1, 17, 105, 37, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16754, '2025-12-03', 2, 83, 243, 37, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16755, '2025-12-03', 3, 10, 9, 37, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16756, '2025-12-03', 4, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16757, '2025-12-03', 2, 55, 3, 57, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16758, '2025-12-03', 3, 79, 2, 57, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16759, '2025-12-03', 4, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16760, '2025-12-03', 5, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16761, '2025-12-03', 1, 35, 34, 38, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16762, '2025-12-03', 2, 64, 16, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16763, '2025-12-03', 3, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16764, '2025-12-03', 4, 27, 35, 38, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16765, '2025-12-03', 2, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29989, '2025-12-06', 1, 92, 125, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29990, '2025-12-06', 2, 92, 125, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29991, '2025-12-06', 2, 215, 301, 34, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29992, '2025-12-06', 3, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29993, '2025-12-06', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (29994, '2025-12-06', 1, 8, 235, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26449, '2025-12-05', 4, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46419, '2025-12-11', 4, 3, 5, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46420, '2025-12-11', 4, 54, 58, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46421, '2025-12-11', 5, 54, 58, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46422, '2025-12-11', 1, 56, 15, 29, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46423, '2025-12-11', 2, 79, 73, 29, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46424, '2025-12-11', 3, 10, 9, 29, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46425, '2025-12-11', 4, 10, 9, 29, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16679, '2025-12-03', 2, 72, 38, 16, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16680, '2025-12-03', 1, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16681, '2025-12-03', 2, 14, 3, 17, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16682, '2025-12-03', 3, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16683, '2025-12-03', 2, 199, 239, 18, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16684, '2025-12-03', 3, 199, 239, 18, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16685, '2025-12-03', 4, 199, 239, 18, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16686, '2025-12-03', 5, 30, 15, 18, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16687, '2025-12-03', 2, 33, 281, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16696, '2025-12-03', 3, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16697, '2025-12-03', 1, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16698, '2025-12-03', 2, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16699, '2025-12-03', 3, 78, 15, 22, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16700, '2025-12-03', 4, 41, 117, 22, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16701, '2025-12-03', 2, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16702, '2025-12-03', 3, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16703, '2025-12-03', 4, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16704, '2025-12-03', 5, 208, 21, 23, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16705, '2025-12-03', 1, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30013, '2025-12-06', 2, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30014, '2025-12-06', 1, 32, 32, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30015, '2025-12-06', 2, 32, 32, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30016, '2025-12-06', 3, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30017, '2025-12-06', 4, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30018, '2025-12-06', 3, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30019, '2025-12-06', 4, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30020, '2025-12-06', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16706, '2025-12-03', 2, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16707, '2025-12-03', 3, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16708, '2025-12-03', 4, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16709, '2025-12-03', 1, 48, 27, 25, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16710, '2025-12-03', 2, 15, 13, 25, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16711, '2025-12-03', 1, 44, 45, 26, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16712, '2025-12-03', 2, 44, 45, 26, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16713, '2025-12-03', 3, 8, 257, 26, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16714, '2025-12-03', 3, 45, 241, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16715, '2025-12-03', 4, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16716, '2025-12-03', 5, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16717, '2025-12-03', 6, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16718, '2025-12-03', 1, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16719, '2025-12-03', 2, 5, 3, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16720, '2025-12-03', 3, 3, 16, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16721, '2025-12-03', 1, 17, 105, 29, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16722, '2025-12-03', 2, 10, 9, 29, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16723, '2025-12-03', 3, 83, 243, 29, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16724, '2025-12-03', 4, 61, 13, 29, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16725, '2025-12-03', 5, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16726, '2025-12-03', 6, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16727, '2025-12-03', 1, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16740, '2025-12-03', 7, 17, 283, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16741, '2025-12-03', 1, 16, 12, 34, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16742, '2025-12-03', 2, 50, 35, 34, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16743, '2025-12-03', 3, 12, 11, 34, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16744, '2025-12-03', 4, 86, 51, 34, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16745, '2025-12-03', 1, 83, 64, 35, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16746, '2025-12-03', 2, 16, 31, 35, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16747, '2025-12-03', 3, 16, 31, 35, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16748, '2025-12-03', 4, 15, 13, 35, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30021, '2025-12-06', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30022, '2025-12-06', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16749, '2025-12-03', 1, 8, 284, 36, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16750, '2025-12-03', 2, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16751, '2025-12-03', 3, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30023, '2025-12-06', 4, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30024, '2025-12-06', 1, 36, 305, 21, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30025, '2025-12-06', 2, 36, 37, 21, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30026, '2025-12-06', 1, 43, 306, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30006, '2025-12-06', 2, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30007, '2025-12-06', 1, 93, 131, 13, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30008, '2025-12-06', 2, 93, 131, 13, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30009, '2025-12-06', 3, 23, 20, 13, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30010, '2025-12-06', 1, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30011, '2025-12-06', 2, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (30012, '2025-12-06', 1, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34393, '2025-12-08', 2, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34394, '2025-12-08', 3, 45, 63, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34395, '2025-12-08', 4, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34396, '2025-12-08', 1, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34397, '2025-12-08', 2, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34398, '2025-12-08', 3, 11, 262, 1, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34399, '2025-12-08', 1, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34400, '2025-12-08', 2, 47, 107, 42, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34427, '2025-12-08', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46428, '2025-12-11', 5, 12, 11, 31, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46429, '2025-12-11', 1, 20, 43, 32, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46430, '2025-12-11', 2, 50, 35, 32, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46431, '2025-12-11', 3, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46432, '2025-12-11', 4, 15, 13, 32, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46433, '2025-12-11', 4, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46434, '2025-12-11', 5, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46435, '2025-12-11', 6, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46436, '2025-12-11', 4, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46437, '2025-12-11', 5, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55059, '2025-12-13', 2, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55060, '2025-12-13', 1, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55061, '2025-12-13', 2, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55062, '2025-12-13', 3, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55063, '2025-12-13', 4, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55064, '2025-12-13', 1, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34306, '2025-12-08', 2, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34307, '2025-12-08', 3, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34309, '2025-12-08', 2, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34310, '2025-12-08', 3, 84, 43, 17, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26371, '2025-12-05', 2, 71, 53, 3, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26372, '2025-12-05', 3, 3, 16, 3, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26407, '2025-12-05', 2, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26408, '2025-12-05', 3, 40, 38, 14, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26409, '2025-12-05', 1, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26410, '2025-12-05', 2, 27, 7, 15, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26411, '2025-12-05', 1, 31, 299, 137, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26412, '2025-12-05', 2, 31, 28, 137, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26413, '2025-12-05', 3, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26414, '2025-12-05', 4, 31, 239, 137, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26415, '2025-12-05', 5, 11, 300, 137, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26416, '2025-12-05', 1, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26417, '2025-12-05', 2, 14, 3, 17, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26418, '2025-12-05', 3, 29, 27, 17, NULL, 'читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26419, '2025-12-05', 4, 34, 12, 17, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26420, '2025-12-05', 3, 32, 32, 19, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26421, '2025-12-05', 1, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26422, '2025-12-05', 2, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26423, '2025-12-05', 3, 14, 3, 20, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26424, '2025-12-05', 4, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26425, '2025-12-05', 1, 41, 117, 22, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21324, '2025-12-04', 4, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21325, '2025-12-04', 2, 7, 5, 3, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21326, '2025-12-04', 3, 75, 36, 3, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21327, '2025-12-04', 4, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21328, '2025-12-04', 1, 9, 7, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21329, '2025-12-04', 2, 9, 8, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21330, '2025-12-04', 3, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21331, '2025-12-04', 4, 9, 194, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21332, '2025-12-04', 1, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21333, '2025-12-04', 2, 13, 12, 6, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21334, '2025-12-04', 3, 8, 6, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21337, '2025-12-04', 2, 16, 12, 7, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21338, '2025-12-04', 3, 198, 34, 7, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21339, '2025-12-04', 4, 198, 34, 7, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21340, '2025-12-04', 1, 17, 4, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21341, '2025-12-04', 2, 86, 79, 8, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21342, '2025-12-04', 1, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21343, '2025-12-04', 2, 20, 13, 9, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21344, '2025-12-04', 3, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21345, '2025-12-04', 1, 7, 5, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21346, '2025-12-04', 2, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21347, '2025-12-04', 3, 6, 2, 10, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21348, '2025-12-04', 1, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21349, '2025-12-04', 2, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21350, '2025-12-04', 4, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21351, '2025-12-04', 5, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21352, '2025-12-04', 6, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21353, '2025-12-04', 4, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21354, '2025-12-04', 5, 24, 21, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21370, '2025-12-04', 5, 11, 238, 18, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21371, '2025-12-04', 1, 93, 64, 19, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21372, '2025-12-04', 2, 33, 30, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21373, '2025-12-04', 3, 34, 31, 19, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21374, '2025-12-04', 4, 93, 64, 19, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21375, '2025-12-04', 1, 35, 34, 20, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21376, '2025-12-04', 2, 27, 35, 20, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21377, '2025-12-04', 3, 7, 16, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21378, '2025-12-04', 4, 4, 36, 20, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21379, '2025-12-04', 2, 36, 37, 21, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21380, '2025-12-04', 3, 36, 37, 21, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21381, '2025-12-04', 4, 37, 38, 21, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21382, '2025-12-04', 5, 37, 38, 21, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21383, '2025-12-04', 1, 16, 31, 22, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21384, '2025-12-04', 2, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21402, '2025-12-04', 3, 3, 5, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21403, '2025-12-04', 4, 18, 61, 28, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21404, '2025-12-04', 4, 83, 243, 29, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21405, '2025-12-04', 5, 56, 15, 29, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21406, '2025-12-04', 3, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21407, '2025-12-04', 4, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21408, '2025-12-04', 5, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21409, '2025-12-04', 6, 57, 244, 30, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (21410, '2025-12-04', 3, 20, 13, 31, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26426, '2025-12-05', 2, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26432, '2025-12-05', 1, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26433, '2025-12-05', 2, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26434, '2025-12-05', 4, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26438, '2025-12-05', 2, 11, 262, 27, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26439, '2025-12-05', 3, 61, 104, 27, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26440, '2025-12-05', 4, 61, 104, 27, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34311, '2025-12-08', 4, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34312, '2025-12-08', 5, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34313, '2025-12-08', 1, 4, 73, 19, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34314, '2025-12-08', 2, 45, 69, 19, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34315, '2025-12-08', 3, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34316, '2025-12-08', 4, 30, 15, 19, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34317, '2025-12-08', 1, 12, 11, 20, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34318, '2025-12-08', 2, 20, 43, 20, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34319, '2025-12-08', 3, 20, 43, 20, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46447, '2025-12-11', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46448, '2025-12-11', 5, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46449, '2025-12-11', 1, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46450, '2025-12-11', 2, 17, 303, 138, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37622, '2025-12-09', 2, 222, 103, 40, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37623, '2025-12-09', 3, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37624, '2025-12-09', 4, 43, 107, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37626, '2025-12-09', 4, 45, 328, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16766, '2025-12-03', 3, 61, 13, 39, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16767, '2025-12-03', 4, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16768, '2025-12-03', 5, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16769, '2025-12-03', 1, 43, 107, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16770, '2025-12-03', 2, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16771, '2025-12-03', 3, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16778, '2025-12-03', 2, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16779, '2025-12-03', 3, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16780, '2025-12-03', 4, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16781, '2025-12-03', 5, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16782, '2025-12-03', 1, 47, 107, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16783, '2025-12-03', 2, 12, 111, 42, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16784, '2025-12-03', 3, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16785, '2025-12-03', 1, 33, 280, 43, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16786, '2025-12-03', 2, 60, 68, 43, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16787, '2025-12-03', 3, 32, 32, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16808, '2025-12-03', 4, 4, 73, 49, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16809, '2025-12-03', 2, 47, 118, 50, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16810, '2025-12-03', 3, 43, 290, 50, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16811, '2025-12-03', 4, 65, 75, 50, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16812, '2025-12-03', 5, 4, 73, 50, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16813, '2025-12-03', 1, 82, 21, 51, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16814, '2025-12-03', 2, 11, 238, 51, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16815, '2025-12-03', 3, 8, 257, 51, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16816, '2025-12-03', 4, 16, 31, 52, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16817, '2025-12-03', 5, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16818, '2025-12-03', 6, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16819, '2025-12-03', 4, 89, 129, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16820, '2025-12-03', 5, 89, 129, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16821, '2025-12-03', 6, 89, 129, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16822, '2025-12-03', 7, 89, 129, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16823, '2025-12-03', 4, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16824, '2025-12-03', 5, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16825, '2025-12-03', 5, 61, 49, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16826, '2025-12-03', 6, 61, 86, 55, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16827, '2025-12-03', 1, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16828, '2025-12-03', 2, 27, 35, 58, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16829, '2025-12-03', 3, 35, 34, 58, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16830, '2025-12-03', 4, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51816, '2025-12-12', 3, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51817, '2025-12-12', 4, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26404, '2025-12-05', 6, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26405, '2025-12-05', 7, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26406, '2025-12-05', 1, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42052, '2025-12-10', 4, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46456, '2025-12-11', 2, 51, 15, 57, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46457, '2025-12-11', 3, 35, 34, 57, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46458, '2025-12-11', 1, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46459, '2025-12-11', 2, 12, 11, 38, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26454, '2025-12-05', 1, 3, 5, 32, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26455, '2025-12-05', 2, 15, 13, 32, NULL, '3.9вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26456, '2025-12-05', 3, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26457, '2025-12-05', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26458, '2025-12-05', 4, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26459, '2025-12-05', 5, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26460, '2025-12-05', 2, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26461, '2025-12-05', 3, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26462, '2025-12-05', 4, 40, 38, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26463, '2025-12-05', 5, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26464, '2025-12-05', 1, 33, 43, 34, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26465, '2025-12-05', 2, 86, 51, 34, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26466, '2025-12-05', 3, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26467, '2025-12-05', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26468, '2025-12-05', 5, 215, 301, 34, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26469, '2025-12-05', 2, 53, 38, 35, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26470, '2025-12-05', 3, 53, 38, 35, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26471, '2025-12-05', 4, 47, 50, 35, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26472, '2025-12-05', 5, 47, 50, 35, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26473, '2025-12-05', 1, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26474, '2025-12-05', 2, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26475, '2025-12-05', 3, 82, 53, 36, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26476, '2025-12-05', 1, 24, 21, 138, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26477, '2025-12-05', 2, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26478, '2025-12-05', 3, 17, 303, 138, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26479, '2025-12-05', 4, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26480, '2025-12-05', 2, 79, 73, 37, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26481, '2025-12-05', 3, 49, 60, 37, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26482, '2025-12-05', 4, 49, 60, 37, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46460, '2025-12-11', 3, 49, 61, 38, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46461, '2025-12-11', 4, 49, 61, 38, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46462, '2025-12-11', 1, 13, 12, 39, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46463, '2025-12-11', 2, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46464, '2025-12-11', 3, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46465, '2025-12-11', 4, 12, 11, 39, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46466, '2025-12-11', 1, 202, 342, 40, NULL, '213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46467, '2025-12-11', 1, 45, 249, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46468, '2025-12-11', 2, 41, 64, 41, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46469, '2025-12-11', 2, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46470, '2025-12-11', 3, 24, 21, 1, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46471, '2025-12-11', 4, 59, 67, 1, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42149, '2025-12-10', 4, 12, 111, 43, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42152, '2025-12-10', 1, 61, 49, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55058, '2025-12-13', 1, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55066, '2025-12-13', 1, 4, 73, 54, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55067, '2025-12-13', 2, 4, 73, 54, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55068, '2025-12-13', 1, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55069, '2025-12-13', 2, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55070, '2025-12-13', 3, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55071, '2025-12-13', 1, 43, 107, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55072, '2025-12-13', 2, 43, 107, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34327, '2025-12-08', 3, 59, 109, 23, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34324, '2025-12-08', 4, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34325, '2025-12-08', 1, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55050, '2025-12-13', 1, 79, 2, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55051, '2025-12-13', 2, 79, 2, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55052, '2025-12-13', 3, 43, 307, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55053, '2025-12-13', 4, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55054, '2025-12-13', 5, 43, 306, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16688, '2025-12-03', 3, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16689, '2025-12-03', 4, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16690, '2025-12-03', 5, 33, 282, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16691, '2025-12-03', 1, 14, 3, 20, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16692, '2025-12-03', 2, 20, 43, 20, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16693, '2025-12-03', 3, 7, 16, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16694, '2025-12-03', 1, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16695, '2025-12-03', 2, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16728, '2025-12-03', 2, 3, 5, 31, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16729, '2025-12-03', 3, 86, 27, 31, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16730, '2025-12-03', 4, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16731, '2025-12-03', 1, 3, 16, 32, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16732, '2025-12-03', 2, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16733, '2025-12-03', 3, 4, 2, 32, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16734, '2025-12-03', 4, 35, 34, 32, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16735, '2025-12-03', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16736, '2025-12-03', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16737, '2025-12-03', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16738, '2025-12-03', 5, 11, 10, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16739, '2025-12-03', 6, 17, 283, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16772, '2025-12-03', 4, 204, 31, 40, NULL, '208 / 208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16773, '2025-12-03', 1, 45, 285, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16774, '2025-12-03', 2, 45, 285, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16775, '2025-12-03', 3, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16776, '2025-12-03', 4, 45, 286, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16777, '2025-12-03', 5, 45, 286, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16788, '2025-12-03', 4, 12, 111, 43, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16789, '2025-12-03', 1, 59, 288, 44, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16790, '2025-12-03', 2, 37, 38, 44, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16791, '2025-12-03', 2, 40, 38, 45, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16792, '2025-12-03', 3, 33, 30, 45, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16793, '2025-12-03', 4, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16794, '2025-12-03', 5, 82, 21, 45, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16795, '2025-12-03', 1, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16796, '2025-12-03', 2, 13, 12, 46, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16797, '2025-12-03', 3, 13, 12, 46, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16798, '2025-12-03', 1, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16799, '2025-12-03', 2, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16800, '2025-12-03', 3, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16801, '2025-12-03', 4, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16802, '2025-12-03', 1, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16803, '2025-12-03', 2, 35, 34, 48, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16804, '2025-12-03', 3, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16805, '2025-12-03', 1, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16806, '2025-12-03', 2, 200, 289, 49, NULL, '204 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (16807, '2025-12-03', 3, 65, 75, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34326, '2025-12-08', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26374, '2025-12-05', 1, 72, 38, 4, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26375, '2025-12-05', 2, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26376, '2025-12-05', 3, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26377, '2025-12-05', 1, 20, 13, 6, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26378, '2025-12-05', 2, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26379, '2025-12-05', 3, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26380, '2025-12-05', 4, 20, 43, 7, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26381, '2025-12-05', 5, 20, 43, 7, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26382, '2025-12-05', 1, 86, 79, 8, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26383, '2025-12-05', 2, 75, 90, 8, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26384, '2025-12-05', 3, 72, 38, 8, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26385, '2025-12-05', 4, 75, 298, 8, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26386, '2025-12-05', 1, 7, 16, 9, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26387, '2025-12-05', 2, 7, 5, 9, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26388, '2025-12-05', 3, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26389, '2025-12-05', 4, 20, 13, 9, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26390, '2025-12-05', 1, 6, 2, 10, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26391, '2025-12-05', 2, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26392, '2025-12-05', 3, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26393, '2025-12-05', 4, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26394, '2025-12-05', 1, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26395, '2025-12-05', 2, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26396, '2025-12-05', 3, 75, 255, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26397, '2025-12-05', 4, 17, 91, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26398, '2025-12-05', 1, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26399, '2025-12-05', 2, 76, 94, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26400, '2025-12-05', 3, 63, 120, 12, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26401, '2025-12-05', 4, 63, 120, 12, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26402, '2025-12-05', 4, 53, 38, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26403, '2025-12-05', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46480, '2025-12-11', 3, 61, 86, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46481, '2025-12-11', 4, 61, 8, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46482, '2025-12-11', 5, 61, 8, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46483, '2025-12-11', 1, 33, 30, 45, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46484, '2025-12-11', 2, 32, 14, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46485, '2025-12-11', 3, 32, 14, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46486, '2025-12-11', 4, 4, 73, 45, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46487, '2025-12-11', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46488, '2025-12-11', 4, 226, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46489, '2025-12-11', 5, 14, 3, 46, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46490, '2025-12-11', 1, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46491, '2025-12-11', 2, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46492, '2025-12-11', 3, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46493, '2025-12-11', 4, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42092, '2025-12-10', 5, 12, 11, 31, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42093, '2025-12-10', 1, 3, 16, 32, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42094, '2025-12-10', 2, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34355, '2025-12-08', 4, 20, 43, 32, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34356, '2025-12-08', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34357, '2025-12-08', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34358, '2025-12-08', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34359, '2025-12-08', 4, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46497, '2025-12-11', 3, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46498, '2025-12-11', 4, 16, 31, 49, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46499, '2025-12-11', 5, 202, 344, 49, NULL, '213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46500, '2025-12-11', 2, 43, 345, 50, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42095, '2025-12-10', 3, 35, 34, 32, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42096, '2025-12-10', 4, 4, 2, 32, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42097, '2025-12-10', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42098, '2025-12-10', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34360, '2025-12-08', 5, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34389, '2025-12-08', 1, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34390, '2025-12-08', 2, 15, 13, 40, NULL, '3.15вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34391, '2025-12-08', 3, 58, 15, 40, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34392, '2025-12-08', 1, 45, 318, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34401, '2025-12-08', 3, 47, 107, 42, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34402, '2025-12-08', 4, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26494, '2025-12-05', 3, 15, 13, 40, NULL, '3.9вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26495, '2025-12-05', 4, 15, 13, 40, NULL, '3.9вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26496, '2025-12-05', 1, 46, 108, 41, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26497, '2025-12-05', 3, 78, 15, 41, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26498, '2025-12-05', 4, 4, 73, 41, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26499, '2025-12-05', 5, 4, 73, 41, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26500, '2025-12-05', 1, 93, 304, 1, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26501, '2025-12-05', 2, 93, 304, 1, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26502, '2025-12-05', 1, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26503, '2025-12-05', 2, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26504, '2025-12-05', 3, 47, 107, 42, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26505, '2025-12-05', 4, 72, 38, 42, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26506, '2025-12-05', 2, 82, 21, 43, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26507, '2025-12-05', 3, 60, 68, 43, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26508, '2025-12-05', 4, 61, 13, 43, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26509, '2025-12-05', 1, 62, 72, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26510, '2025-12-05', 2, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26511, '2025-12-05', 3, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26512, '2025-12-05', 4, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26513, '2025-12-05', 1, 45, 127, 59, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26514, '2025-12-05', 2, 45, 122, 59, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26515, '2025-12-05', 4, 24, 21, 59, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26516, '2025-12-05', 5, 24, 21, 59, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26517, '2025-12-05', 1, 85, 69, 45, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26518, '2025-12-05', 2, 85, 69, 45, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26519, '2025-12-05', 3, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26520, '2025-12-05', 4, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26521, '2025-12-05', 2, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26522, '2025-12-05', 3, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26523, '2025-12-05', 4, 73, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26524, '2025-12-05', 5, 73, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26525, '2025-12-05', 5, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26526, '2025-12-05', 6, 63, 74, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26527, '2025-12-05', 1, 84, 43, 48, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26528, '2025-12-05', 2, 35, 34, 48, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34403, '2025-12-08', 1, 6, 2, 43, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34404, '2025-12-08', 2, 219, 319, 43, NULL, '324 / 006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34405, '2025-12-08', 3, 201, 247, 43, NULL, '006 / 324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34406, '2025-12-08', 5, 208, 53, 44, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34407, '2025-12-08', 6, 208, 53, 44, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34408, '2025-12-08', 4, 45, 126, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34409, '2025-12-08', 5, 45, 127, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34410, '2025-12-08', 2, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42099, '2025-12-10', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26483, '2025-12-05', 5, 49, 60, 37, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26484, '2025-12-05', 1, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26485, '2025-12-05', 2, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26486, '2025-12-05', 3, 8, 61, 57, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26487, '2025-12-05', 4, 84, 43, 57, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26488, '2025-12-05', 1, 64, 16, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26489, '2025-12-05', 2, 16, 12, 38, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26490, '2025-12-05', 3, 64, 16, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26491, '2025-12-05', 4, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26492, '2025-12-05', 1, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26493, '2025-12-05', 2, 9, 103, 40, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42100, '2025-12-10', 5, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42101, '2025-12-10', 6, 11, 10, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42102, '2025-12-10', 7, 17, 283, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55055, '2025-12-13', 1, 200, 289, 49, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34411, '2025-12-08', 3, 32, 32, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34412, '2025-12-08', 4, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34420, '2025-12-08', 3, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34421, '2025-12-08', 2, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34422, '2025-12-08', 3, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34423, '2025-12-08', 1, 47, 118, 50, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34354, '2025-12-08', 3, 35, 34, 32, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37481, '2025-12-09', 1, 84, 43, 2, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37491, '2025-12-09', 4, 10, 323, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37530, '2025-12-09', 3, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37531, '2025-12-09', 4, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37532, '2025-12-09', 1, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37533, '2025-12-09', 2, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37534, '2025-12-09', 3, 30, 15, 137, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37535, '2025-12-09', 2, 7, 16, 17, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37536, '2025-12-09', 3, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37537, '2025-12-09', 4, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37538, '2025-12-09', 5, 34, 12, 17, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37555, '2025-12-09', 2, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37562, '2025-12-09', 1, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37563, '2025-12-09', 2, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37570, '2025-12-09', 1, 223, 331, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37575, '2025-12-09', 1, 13, 12, 31, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37577, '2025-12-09', 3, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37578, '2025-12-09', 4, 6, 2, 31, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37579, '2025-12-09', 1, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37580, '2025-12-09', 2, 15, 13, 32, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37581, '2025-12-09', 3, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26529, '2025-12-05', 3, 79, 2, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26530, '2025-12-05', 3, 4, 246, 49, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26531, '2025-12-05', 4, 78, 15, 49, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26532, '2025-12-05', 5, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26533, '2025-12-05', 1, 47, 118, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26534, '2025-12-05', 2, 72, 38, 50, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26535, '2025-12-05', 3, 43, 290, 50, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26536, '2025-12-05', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26537, '2025-12-05', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34320, '2025-12-08', 1, 57, 312, 21, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26538, '2025-12-05', 1, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26539, '2025-12-05', 2, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26540, '2025-12-05', 3, 16, 31, 52, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26541, '2025-12-05', 4, 89, 121, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26542, '2025-12-05', 5, 89, 121, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26543, '2025-12-05', 6, 89, 121, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26544, '2025-12-05', 7, 89, 121, 53, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26545, '2025-12-05', 1, 82, 53, 54, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26546, '2025-12-05', 2, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26547, '2025-12-05', 1, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26548, '2025-12-05', 2, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26549, '2025-12-05', 3, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (26550, '2025-12-05', 4, 35, 34, 58, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34321, '2025-12-08', 2, 57, 312, 21, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34322, '2025-12-08', 2, 43, 101, 22, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34323, '2025-12-08', 3, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34328, '2025-12-08', 1, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34329, '2025-12-08', 2, 35, 34, 24, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34330, '2025-12-08', 3, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34331, '2025-12-08', 4, 34, 12, 24, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34332, '2025-12-08', 3, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34333, '2025-12-08', 4, 42, 4, 25, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34369, '2025-12-08', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34370, '2025-12-08', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34371, '2025-12-08', 1, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34372, '2025-12-08', 2, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34373, '2025-12-08', 3, 199, 317, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34374, '2025-12-08', 4, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34375, '2025-12-08', 3, 10, 9, 37, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34376, '2025-12-08', 4, 10, 9, 37, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34377, '2025-12-08', 5, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34378, '2025-12-08', 1, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34379, '2025-12-08', 2, 84, 43, 57, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34380, '2025-12-08', 3, 12, 11, 57, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34381, '2025-12-08', 1, 84, 235, 38, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34382, '2025-12-08', 2, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34383, '2025-12-08', 3, 56, 15, 38, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34384, '2025-12-08', 4, 84, 6, 38, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34385, '2025-12-08', 1, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34386, '2025-12-08', 2, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34387, '2025-12-08', 3, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34388, '2025-12-08', 4, 79, 2, 39, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34424, '2025-12-08', 2, 13, 321, 50, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34425, '2025-12-08', 3, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34426, '2025-12-08', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34428, '2025-12-08', 3, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34429, '2025-12-08', 2, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34430, '2025-12-08', 3, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34431, '2025-12-08', 4, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34432, '2025-12-08', 5, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34433, '2025-12-08', 3, 82, 53, 54, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34434, '2025-12-08', 4, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34435, '2025-12-08', 1, 16, 12, 58, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34436, '2025-12-08', 2, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34437, '2025-12-08', 3, 12, 11, 58, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55057, '2025-12-13', 3, 200, 289, 49, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55056, '2025-12-13', 2, 200, 289, 49, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42001, '2025-12-10', 2, 4, 2, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42002, '2025-12-10', 3, 50, 35, 2, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42003, '2025-12-10', 4, 3, 5, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42004, '2025-12-10', 5, 4, 36, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42005, '2025-12-10', 2, 75, 36, 3, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42006, '2025-12-10', 3, 12, 11, 3, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42007, '2025-12-10', 4, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42008, '2025-12-10', 5, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46509, '2025-12-11', 2, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46510, '2025-12-11', 3, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46511, '2025-12-11', 4, 17, 39, 52, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46512, '2025-12-11', 1, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46513, '2025-12-11', 2, 45, 85, 54, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46514, '2025-12-11', 3, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46515, '2025-12-11', 4, 82, 21, 54, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46516, '2025-12-11', 1, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46517, '2025-12-11', 2, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46518, '2025-12-11', 3, 51, 15, 58, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46519, '2025-12-11', 4, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42103, '2025-12-10', 2, 50, 35, 34, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37582, '2025-12-09', 4, 4, 2, 32, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37588, '2025-12-09', 6, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37595, '2025-12-09', 2, 83, 64, 35, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37596, '2025-12-09', 3, 10, 9, 35, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37597, '2025-12-09', 4, 47, 50, 35, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37598, '2025-12-09', 5, 47, 50, 35, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37599, '2025-12-09', 3, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42154, '2025-12-10', 1, 32, 334, 45, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58205, '2025-12-15', 1, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58206, '2025-12-15', 2, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58207, '2025-12-15', 1, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58208, '2025-12-15', 2, 229, 34, 3, NULL, '204/УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58209, '2025-12-15', 3, 230, 89, 3, NULL, '311/УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58210, '2025-12-15', 4, 8, 6, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58211, '2025-12-15', 1, 43, 276, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58212, '2025-12-15', 2, 43, 276, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58213, '2025-12-15', 3, 15, 13, 4, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58214, '2025-12-15', 4, 43, 277, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58215, '2025-12-15', 5, 43, 277, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58216, '2025-12-15', 4, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58217, '2025-12-15', 5, 5, 4, 6, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58218, '2025-12-15', 2, 16, 12, 7, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58219, '2025-12-15', 3, 16, 12, 7, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58220, '2025-12-15', 4, 55, 3, 7, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58221, '2025-12-15', 5, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58222, '2025-12-15', 1, 17, 4, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58223, '2025-12-15', 2, 17, 95, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42010, '2025-12-10', 2, 20, 13, 6, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42011, '2025-12-10', 3, 8, 43, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42013, '2025-12-10', 5, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42014, '2025-12-10', 1, 7, 5, 7, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34259, '2025-12-08', 1, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34260, '2025-12-08', 2, 12, 11, 2, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34261, '2025-12-08', 3, 4, 2, 2, NULL, '3.8вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34262, '2025-12-08', 1, 217, 147, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34263, '2025-12-08', 2, 198, 34, 3, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34264, '2025-12-08', 3, 8, 43, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34265, '2025-12-08', 4, 8, 273, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34266, '2025-12-08', 1, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34267, '2025-12-08', 2, 10, 9, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34268, '2025-12-08', 3, 15, 13, 4, NULL, '3.15вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34269, '2025-12-08', 4, 4, 246, 4, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34270, '2025-12-08', 1, 86, 27, 6, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34271, '2025-12-08', 2, 8, 43, 6, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34272, '2025-12-08', 3, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34273, '2025-12-08', 4, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34274, '2025-12-08', 2, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34275, '2025-12-08', 3, 198, 34, 7, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34276, '2025-12-08', 4, 55, 3, 7, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34277, '2025-12-08', 5, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34278, '2025-12-08', 1, 17, 4, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34279, '2025-12-08', 2, 17, 233, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34280, '2025-12-08', 3, 17, 95, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34281, '2025-12-08', 4, 17, 234, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34282, '2025-12-08', 1, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34283, '2025-12-08', 2, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34284, '2025-12-08', 3, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34285, '2025-12-08', 1, 33, 43, 10, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34286, '2025-12-08', 2, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34287, '2025-12-08', 3, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42015, '2025-12-10', 2, 7, 5, 7, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42145, '2025-12-10', 4, 72, 38, 42, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37539, '2025-12-09', 1, 33, 281, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37540, '2025-12-09', 2, 93, 64, 19, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37541, '2025-12-09', 3, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37542, '2025-12-09', 4, 18, 14, 19, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37543, '2025-12-09', 1, 14, 3, 20, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37544, '2025-12-09', 2, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37545, '2025-12-09', 3, 7, 16, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37546, '2025-12-09', 4, 7, 5, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37547, '2025-12-09', 1, 62, 240, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37548, '2025-12-09', 2, 62, 260, 21, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37549, '2025-12-09', 1, 220, 325, 22, NULL, '120 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37550, '2025-12-09', 2, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37551, '2025-12-09', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37552, '2025-12-09', 3, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37553, '2025-12-09', 4, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37554, '2025-12-09', 5, 11, 262, 23, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37608, '2025-12-09', 3, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37609, '2025-12-09', 4, 83, 243, 37, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37610, '2025-12-09', 1, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37611, '2025-12-09', 2, 64, 5, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37612, '2025-12-09', 3, 55, 3, 57, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37613, '2025-12-09', 4, 35, 34, 57, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37614, '2025-12-09', 1, 79, 36, 38, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37615, '2025-12-09', 2, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37616, '2025-12-09', 3, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37617, '2025-12-09', 4, 84, 43, 38, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34288, '2025-12-08', 1, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34289, '2025-12-08', 2, 27, 7, 11, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34290, '2025-12-08', 3, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34291, '2025-12-08', 4, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34292, '2025-12-08', 4, 76, 309, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34293, '2025-12-08', 5, 76, 309, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34294, '2025-12-08', 6, 76, 309, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34295, '2025-12-08', 4, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34296, '2025-12-08', 5, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34297, '2025-12-08', 6, 23, 128, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34298, '2025-12-08', 7, 93, 131, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34299, '2025-12-08', 1, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34300, '2025-12-08', 2, 59, 95, 14, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34301, '2025-12-08', 3, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34302, '2025-12-08', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34303, '2025-12-08', 5, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37618, '2025-12-09', 1, 61, 13, 39, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42146, '2025-12-10', 1, 33, 280, 43, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42147, '2025-12-10', 2, 60, 68, 43, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42148, '2025-12-10', 3, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42153, '2025-12-10', 2, 61, 86, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58224, '2025-12-15', 3, 231, 352, 8, NULL, '222 / 222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58225, '2025-12-15', 1, 93, 4, 9, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58226, '2025-12-15', 2, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58227, '2025-12-15', 3, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58228, '2025-12-15', 2, 93, 4, 10, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58229, '2025-12-15', 3, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58230, '2025-12-15', 4, 12, 11, 10, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58231, '2025-12-15', 1, 27, 7, 11, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58232, '2025-12-15', 2, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58233, '2025-12-15', 3, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58234, '2025-12-15', 4, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42057, '2025-12-10', 4, 36, 335, 21, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42058, '2025-12-10', 5, 37, 38, 21, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42059, '2025-12-10', 3, 57, 333, 22, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42060, '2025-12-10', 4, 65, 75, 22, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42061, '2025-12-10', 5, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42062, '2025-12-10', 6, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42063, '2025-12-10', 1, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42064, '2025-12-10', 2, 39, 261, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42065, '2025-12-10', 3, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51757, '2025-12-12', 1, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51758, '2025-12-12', 2, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51772, '2025-12-12', 1, 33, 43, 34, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51773, '2025-12-12', 2, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51774, '2025-12-12', 3, 63, 54, 34, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34334, '2025-12-08', 5, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34335, '2025-12-08', 4, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34336, '2025-12-08', 5, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34337, '2025-12-08', 6, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34338, '2025-12-08', 3, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34339, '2025-12-08', 4, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34340, '2025-12-08', 5, 40, 38, 27, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34341, '2025-12-08', 6, 45, 241, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34342, '2025-12-08', 1, 218, 314, 28, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51775, '2025-12-12', 4, 3, 16, 34, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51776, '2025-12-12', 1, 47, 50, 35, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51777, '2025-12-12', 2, 10, 9, 35, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42066, '2025-12-10', 4, 59, 109, 23, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42067, '2025-12-10', 1, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42068, '2025-12-10', 2, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42069, '2025-12-10', 3, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42070, '2025-12-10', 4, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42071, '2025-12-10', 3, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42072, '2025-12-10', 4, 43, 44, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37482, '2025-12-09', 2, 35, 34, 2, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37483, '2025-12-09', 3, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37484, '2025-12-09', 1, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37485, '2025-12-09', 2, 14, 3, 3, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34343, '2025-12-08', 2, 12, 11, 28, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34344, '2025-12-08', 3, 71, 53, 28, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34345, '2025-12-08', 4, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34346, '2025-12-08', 5, 53, 315, 28, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34347, '2025-12-08', 1, 8, 49, 29, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34348, '2025-12-08', 2, 9, 7, 29, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34349, '2025-12-08', 3, 83, 243, 29, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34350, '2025-12-08', 4, 47, 268, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34351, '2025-12-08', 1, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34352, '2025-12-08', 2, 14, 3, 31, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34353, '2025-12-08', 3, 3, 16, 31, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34361, '2025-12-08', 6, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34362, '2025-12-08', 1, 12, 11, 34, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34363, '2025-12-08', 2, 16, 12, 34, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34364, '2025-12-08', 3, 16, 31, 35, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34365, '2025-12-08', 4, 53, 38, 35, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34366, '2025-12-08', 5, 15, 13, 35, NULL, '3.15вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34367, '2025-12-08', 1, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (34368, '2025-12-08', 2, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37486, '2025-12-09', 3, 27, 35, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37487, '2025-12-09', 4, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37488, '2025-12-09', 1, 9, 194, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37489, '2025-12-09', 2, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37490, '2025-12-09', 3, 72, 38, 4, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37492, '2025-12-09', 1, 7, 5, 6, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37493, '2025-12-09', 2, 13, 12, 6, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37494, '2025-12-09', 3, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37495, '2025-12-09', 1, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37496, '2025-12-09', 2, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37497, '2025-12-09', 3, 15, 13, 7, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37498, '2025-12-09', 4, 55, 3, 7, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37499, '2025-12-09', 1, 17, 233, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37500, '2025-12-09', 2, 86, 79, 8, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37501, '2025-12-09', 3, 17, 234, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37502, '2025-12-09', 4, 72, 38, 8, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37503, '2025-12-09', 1, 12, 11, 9, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37504, '2025-12-09', 2, 12, 11, 9, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37505, '2025-12-09', 3, 13, 12, 9, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37506, '2025-12-09', 4, 14, 3, 9, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37507, '2025-12-09', 1, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37508, '2025-12-09', 2, 27, 35, 10, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37509, '2025-12-09', 3, 12, 36, 10, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37510, '2025-12-09', 4, 73, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37511, '2025-12-09', 1, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37512, '2025-12-09', 2, 75, 255, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37513, '2025-12-09', 3, 75, 255, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37514, '2025-12-09', 1, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37515, '2025-12-09', 2, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37516, '2025-12-09', 3, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37517, '2025-12-09', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42073, '2025-12-10', 5, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42074, '2025-12-10', 3, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42075, '2025-12-10', 4, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51778, '2025-12-12', 3, 10, 9, 35, NULL, 'актовый зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51779, '2025-12-12', 4, 47, 268, 35, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51780, '2025-12-12', 5, 47, 268, 35, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51781, '2025-12-12', 2, 82, 53, 36, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51782, '2025-12-12', 3, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58235, '2025-12-15', 4, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58236, '2025-12-15', 5, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58237, '2025-12-15', 6, 23, 128, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58255, '2025-12-15', 1, 4, 73, 19, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58256, '2025-12-15', 2, 18, 14, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58257, '2025-12-15', 3, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58258, '2025-12-15', 4, 30, 15, 19, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58259, '2025-12-15', 1, 29, 27, 20, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58260, '2025-12-15', 2, 12, 11, 20, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58261, '2025-12-15', 3, 51, 15, 20, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58262, '2025-12-15', 4, 41, 355, 22, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58263, '2025-12-15', 1, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58264, '2025-12-15', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58265, '2025-12-15', 3, 59, 109, 23, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58266, '2025-12-15', 4, 11, 262, 23, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58267, '2025-12-15', 1, 14, 3, 24, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58268, '2025-12-15', 2, 29, 27, 24, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58269, '2025-12-15', 3, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58270, '2025-12-15', 4, 34, 12, 24, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58271, '2025-12-15', 3, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58272, '2025-12-15', 4, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58273, '2025-12-15', 5, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58274, '2025-12-15', 6, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58275, '2025-12-15', 1, 40, 38, 27, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58276, '2025-12-15', 2, 45, 241, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58277, '2025-12-15', 3, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58278, '2025-12-15', 4, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58279, '2025-12-15', 1, 3, 343, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58280, '2025-12-15', 2, 54, 265, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58281, '2025-12-15', 3, 54, 265, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58282, '2025-12-15', 4, 57, 58, 139, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58283, '2025-12-15', 5, 57, 58, 139, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58284, '2025-12-15', 2, 9, 7, 29, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58285, '2025-12-15', 3, 56, 15, 29, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58286, '2025-12-15', 4, 47, 356, 29, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58287, '2025-12-15', 1, 42, 357, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51801, '2025-12-12', 2, 84, 43, 39, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51802, '2025-12-12', 3, 64, 5, 39, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46391, '2025-12-11', 3, 34, 31, 19, NULL, '3.4ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46392, '2025-12-11', 4, 93, 64, 19, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46393, '2025-12-11', 1, 29, 338, 20, NULL, '226', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46394, '2025-12-11', 2, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46395, '2025-12-11', 3, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46403, '2025-12-11', 3, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46410, '2025-12-11', 5, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46411, '2025-12-11', 6, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42009, '2025-12-10', 2, 10, 332, 4, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42012, '2025-12-10', 4, 73, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42016, '2025-12-10', 3, 5, 4, 7, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42017, '2025-12-10', 4, 17, 278, 8, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42018, '2025-12-10', 5, 6, 2, 8, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42019, '2025-12-10', 1, 73, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42020, '2025-12-10', 2, 19, 43, 9, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42021, '2025-12-10', 3, 20, 13, 9, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46417, '2025-12-11', 2, 29, 27, 28, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46418, '2025-12-11', 3, 3, 5, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46426, '2025-12-11', 3, 20, 13, 31, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46427, '2025-12-11', 4, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46438, '2025-12-11', 6, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46439, '2025-12-11', 7, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46440, '2025-12-11', 1, 14, 3, 34, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46441, '2025-12-11', 2, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46442, '2025-12-11', 3, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46443, '2025-12-11', 4, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46444, '2025-12-11', 2, 31, 341, 35, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46445, '2025-12-11', 2, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46446, '2025-12-11', 3, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46451, '2025-12-11', 2, 8, 49, 37, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46452, '2025-12-11', 3, 9, 7, 37, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46453, '2025-12-11', 4, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46454, '2025-12-11', 5, 20, 13, 37, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37576, '2025-12-09', 2, 8, 43, 31, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46455, '2025-12-11', 1, 79, 2, 57, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46472, '2025-12-11', 5, 40, 38, 1, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46473, '2025-12-11', 4, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46474, '2025-12-11', 5, 47, 107, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46475, '2025-12-11', 1, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46476, '2025-12-11', 2, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46477, '2025-12-11', 1, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46478, '2025-12-11', 2, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46494, '2025-12-11', 3, 64, 343, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46495, '2025-12-11', 1, 57, 333, 49, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51803, '2025-12-12', 1, 43, 107, 40, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58238, '2025-12-15', 7, 93, 131, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58239, '2025-12-15', 2, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58240, '2025-12-15', 3, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58241, '2025-12-15', 1, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46496, '2025-12-11', 2, 57, 333, 49, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46501, '2025-12-11', 3, 42, 78, 50, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46502, '2025-12-11', 4, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46503, '2025-12-11', 5, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46504, '2025-12-11', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46506, '2025-12-11', 3, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46507, '2025-12-11', 4, 66, 79, 51, NULL, '207', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46508, '2025-12-11', 1, 208, 346, 52, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58242, '2025-12-15', 2, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58243, '2025-12-15', 3, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58244, '2025-12-15', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58245, '2025-12-15', 1, 28, 353, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58246, '2025-12-15', 2, 28, 353, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58247, '2025-12-15', 3, 28, 353, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58248, '2025-12-15', 4, 28, 353, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58249, '2025-12-15', 1, 12, 11, 17, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58250, '2025-12-15', 2, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58251, '2025-12-15', 3, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58252, '2025-12-15', 1, 31, 354, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58253, '2025-12-15', 2, 31, 354, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58254, '2025-12-15', 3, 31, 354, 18, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58288, '2025-12-15', 2, 14, 3, 32, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58289, '2025-12-15', 3, 29, 27, 32, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58290, '2025-12-15', 4, 42, 4, 32, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58291, '2025-12-15', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58292, '2025-12-15', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58293, '2025-12-15', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58294, '2025-12-15', 4, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58295, '2025-12-15', 5, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58309, '2025-12-15', 2, 79, 73, 37, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58310, '2025-12-15', 3, 9, 7, 37, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58311, '2025-12-15', 4, 9, 7, 37, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58312, '2025-12-15', 2, 84, 358, 57, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51690, '2025-12-12', 4, 20, 6, 7, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51692, '2025-12-12', 4, 72, 38, 8, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51693, '2025-12-12', 5, 6, 2, 8, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51694, '2025-12-12', 6, 6, 347, 8, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51695, '2025-12-12', 1, 93, 4, 9, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51696, '2025-12-12', 2, 7, 5, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51697, '2025-12-12', 3, 13, 12, 9, NULL, '204 / 204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58296, '2025-12-15', 6, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58297, '2025-12-15', 7, 52, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58298, '2025-12-15', 1, 63, 54, 34, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58299, '2025-12-15', 2, 12, 11, 34, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58300, '2025-12-15', 2, 10, 332, 35, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58301, '2025-12-15', 1, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58302, '2025-12-15', 2, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58303, '2025-12-15', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58304, '2025-12-15', 4, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58305, '2025-12-15', 2, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58313, '2025-12-15', 3, 12, 11, 57, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58314, '2025-12-15', 4, 232, 359, 57, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58315, '2025-12-15', 1, 79, 2, 38, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37674, '2025-12-09', 2, 84, 43, 58, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37675, '2025-12-09', 3, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58316, '2025-12-15', 2, 83, 4, 38, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58317, '2025-12-15', 1, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58318, '2025-12-15', 2, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58319, '2025-12-15', 3, 5, 3, 39, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58320, '2025-12-15', 4, 84, 6, 39, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58321, '2025-12-15', 1, 233, 34, 40, NULL, '204 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58322, '2025-12-15', 2, 15, 13, 40, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58306, '2025-12-15', 3, 199, 317, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58307, '2025-12-15', 4, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58308, '2025-12-15', 5, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58323, '2025-12-15', 1, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46336, '2025-12-11', 1, 3, 16, 2, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46337, '2025-12-11', 2, 4, 2, 2, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46338, '2025-12-11', 3, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46339, '2025-12-11', 4, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46340, '2025-12-11', 1, 12, 11, 3, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46341, '2025-12-11', 2, 7, 5, 3, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46342, '2025-12-11', 3, 8, 43, 3, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46343, '2025-12-11', 4, 6, 2, 3, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46344, '2025-12-11', 1, 9, 7, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46345, '2025-12-11', 2, 9, 8, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46346, '2025-12-11', 3, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46347, '2025-12-11', 4, 43, 276, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46348, '2025-12-11', 1, 225, 4, 6, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46349, '2025-12-11', 2, 86, 27, 6, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46350, '2025-12-11', 3, 12, 11, 6, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46358, '2025-12-11', 3, 226, 4, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46359, '2025-12-11', 1, 7, 5, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46360, '2025-12-11', 2, 226, 4, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46361, '2025-12-11', 3, 7, 16, 10, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46362, '2025-12-11', 1, 17, 279, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46363, '2025-12-11', 2, 40, 38, 11, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46364, '2025-12-11', 1, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37619, '2025-12-09', 2, 79, 2, 39, NULL, '32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37620, '2025-12-09', 3, 35, 34, 39, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37621, '2025-12-09', 4, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37996, '2025-12-09', 1, 15, 13, 40, NULL, '304', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37627, '2025-12-09', 2, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37628, '2025-12-09', 3, 11, 262, 1, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37629, '2025-12-09', 4, 2, 110, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37630, '2025-12-09', 5, 59, 109, 1, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37631, '2025-12-09', 1, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37632, '2025-12-09', 2, 6, 2, 42, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37633, '2025-12-09', 3, 208, 21, 42, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37634, '2025-12-09', 1, 93, 4, 43, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37635, '2025-12-09', 2, 32, 32, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37636, '2025-12-09', 3, 67, 269, 43, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37637, '2025-12-09', 4, 32, 329, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37638, '2025-12-09', 3, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37639, '2025-12-09', 4, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37640, '2025-12-09', 5, 62, 112, 44, NULL, 'Корпус 4', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37641, '2025-12-09', 1, 27, 7, 59, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37642, '2025-12-09', 2, 61, 49, 59, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37643, '2025-12-09', 3, 24, 21, 59, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37644, '2025-12-09', 1, 60, 68, 45, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37645, '2025-12-09', 2, 60, 68, 45, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37646, '2025-12-09', 3, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37647, '2025-12-09', 4, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37666, '2025-12-09', 1, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37667, '2025-12-09', 2, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37668, '2025-12-09', 3, 63, 120, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37669, '2025-12-09', 4, 63, 253, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37670, '2025-12-09', 1, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37671, '2025-12-09', 2, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37672, '2025-12-09', 3, 37, 38, 54, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37673, '2025-12-09', 1, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46365, '2025-12-11', 2, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46366, '2025-12-11', 3, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46367, '2025-12-11', 4, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46368, '2025-12-11', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46369, '2025-12-11', 6, 24, 21, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46370, '2025-12-11', 7, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46371, '2025-12-11', 2, 59, 337, 14, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46372, '2025-12-11', 3, 40, 38, 14, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46373, '2025-12-11', 4, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46374, '2025-12-11', 5, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46386, '2025-12-11', 3, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46389, '2025-12-11', 1, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46390, '2025-12-11', 2, 33, 30, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58324, '2025-12-15', 2, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58325, '2025-12-15', 3, 45, 249, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58326, '2025-12-15', 4, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58327, '2025-12-15', 1, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58328, '2025-12-15', 2, 2, 66, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58329, '2025-12-15', 1, 9, 194, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58330, '2025-12-15', 2, 48, 123, 42, NULL, '317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58331, '2025-12-15', 3, 47, 107, 42, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51709, '2025-12-12', 6, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51710, '2025-12-12', 4, 53, 38, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58356, '2025-12-15', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58357, '2025-12-15', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58332, '2025-12-15', 4, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58333, '2025-12-15', 1, 32, 334, 43, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58334, '2025-12-15', 1, 11, 262, 140, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58335, '2025-12-15', 2, 40, 38, 140, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58336, '2025-12-15', 3, 11, 262, 140, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58337, '2025-12-15', 4, 234, 230, 140, NULL, '207', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58338, '2025-12-15', 4, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58339, '2025-12-15', 5, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58340, '2025-12-15', 1, 12, 11, 46, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58358, '2025-12-15', 3, 82, 21, 51, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58359, '2025-12-15', 4, 53, 38, 51, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58360, '2025-12-15', 3, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37556, '2025-12-09', 3, 41, 4, 24, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37557, '2025-12-09', 4, 12, 11, 24, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37558, '2025-12-09', 5, 6, 2, 24, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37559, '2025-12-09', 3, 43, 276, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37560, '2025-12-09', 4, 42, 4, 25, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37561, '2025-12-09', 5, 43, 277, 25, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37564, '2025-12-09', 4, 208, 53, 27, NULL, '3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37565, '2025-12-09', 5, 61, 104, 27, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37566, '2025-12-09', 1, 35, 34, 28, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37567, '2025-12-09', 2, 4, 2, 28, NULL, '3.8вц', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37568, '2025-12-09', 3, 5, 3, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37571, '2025-12-09', 1, 16, 116, 29, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37572, '2025-12-09', 2, 56, 15, 29, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37573, '2025-12-09', 3, 61, 13, 29, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37574, '2025-12-09', 4, 61, 13, 29, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37583, '2025-12-09', 4, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37584, '2025-12-09', 5, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37585, '2025-12-09', 6, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37586, '2025-12-09', 4, 221, 55, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37587, '2025-12-09', 5, 17, 264, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37589, '2025-12-09', 7, 24, 21, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37590, '2025-12-09', 2, 3, 16, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37591, '2025-12-09', 3, 50, 35, 34, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37592, '2025-12-09', 4, 3, 5, 34, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58361, '2025-12-15', 4, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58362, '2025-12-15', 5, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58363, '2025-12-15', 6, 38, 40, 52, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58364, '2025-12-15', 1, 45, 85, 54, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58365, '2025-12-15', 2, 82, 53, 54, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58366, '2025-12-15', 3, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58367, '2025-12-15', 4, 45, 126, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58368, '2025-12-15', 5, 45, 127, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51698, '2025-12-12', 4, 7, 16, 9, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37593, '2025-12-09', 5, 41, 4, 34, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37594, '2025-12-09', 1, 47, 268, 35, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37600, '2025-12-09', 4, 8, 284, 36, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37601, '2025-12-09', 5, 40, 38, 36, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51699, '2025-12-12', 1, 7, 16, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51700, '2025-12-12', 2, 93, 4, 10, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51701, '2025-12-12', 3, 7, 16, 10, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51702, '2025-12-12', 4, 6, 2, 10, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51703, '2025-12-12', 1, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51704, '2025-12-12', 2, 27, 7, 11, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51705, '2025-12-12', 3, 75, 17, 11, NULL, '206', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51706, '2025-12-12', 4, 17, 91, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51707, '2025-12-12', 4, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51708, '2025-12-12', 5, 76, 324, 12, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58341, '2025-12-15', 2, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58342, '2025-12-15', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58343, '2025-12-15', 4, 3, 5, 46, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58344, '2025-12-15', 4, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37602, '2025-12-09', 2, 31, 316, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37603, '2025-12-09', 3, 199, 302, 138, NULL, '008', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37604, '2025-12-09', 4, 31, 327, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37605, '2025-12-09', 5, 17, 303, 138, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37606, '2025-12-09', 1, 56, 15, 37, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37607, '2025-12-09', 2, 16, 116, 37, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37648, '2025-12-09', 1, 3, 5, 46, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37649, '2025-12-09', 2, 73, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37650, '2025-12-09', 3, 4, 2, 46, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37651, '2025-12-09', 1, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37652, '2025-12-09', 2, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37653, '2025-12-09', 3, 84, 43, 48, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37654, '2025-12-09', 4, 79, 36, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37655, '2025-12-09', 5, 79, 2, 48, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37656, '2025-12-09', 4, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37657, '2025-12-09', 5, 65, 330, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37658, '2025-12-09', 1, 55, 3, 50, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37659, '2025-12-09', 2, 65, 75, 50, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37660, '2025-12-09', 3, 47, 118, 50, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37661, '2025-12-09', 4, 65, 75, 50, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37662, '2025-12-09', 2, 11, 238, 51, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37663, '2025-12-09', 3, 66, 79, 51, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37664, '2025-12-09', 4, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37665, '2025-12-09', 5, 67, 80, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58345, '2025-12-15', 5, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58346, '2025-12-15', 6, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58347, '2025-12-15', 1, 64, 5, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58348, '2025-12-15', 2, 64, 5, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58349, '2025-12-15', 3, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58350, '2025-12-15', 1, 57, 333, 49, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58351, '2025-12-15', 2, 57, 340, 49, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58352, '2025-12-15', 3, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58353, '2025-12-15', 1, 47, 118, 50, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58354, '2025-12-15', 2, 47, 118, 50, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58355, '2025-12-15', 3, 57, 333, 50, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58369, '2025-12-15', 1, 84, 6, 58, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58370, '2025-12-15', 2, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (58371, '2025-12-15', 3, 84, 235, 58, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51747, '2025-12-12', 2, 11, 262, 27, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51748, '2025-12-12', 3, 45, 47, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51749, '2025-12-12', 4, 45, 47, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51750, '2025-12-12', 1, 3, 16, 28, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51751, '2025-12-12', 2, 4, 2, 28, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51752, '2025-12-12', 3, 84, 6, 28, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51753, '2025-12-12', 1, 54, 265, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51754, '2025-12-12', 2, 54, 265, 139, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37518, '2025-12-09', 6, 23, 128, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37519, '2025-12-09', 7, 23, 88, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37520, '2025-12-09', 3, 9, 7, 14, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37521, '2025-12-09', 4, 24, 21, 14, NULL, '3.14ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37522, '2025-12-09', 5, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37523, '2025-12-09', 6, 63, 237, 14, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37524, '2025-12-09', 2, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37525, '2025-12-09', 3, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37526, '2025-12-09', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37527, '2025-12-09', 5, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37528, '2025-12-09', 1, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (37529, '2025-12-09', 2, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42104, '2025-12-10', 3, 16, 12, 34, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42105, '2025-12-10', 4, 86, 51, 34, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42106, '2025-12-10', 5, 86, 51, 34, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42107, '2025-12-10', 1, 83, 64, 35, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42108, '2025-12-10', 2, 15, 13, 35, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42109, '2025-12-10', 3, 15, 13, 35, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42110, '2025-12-10', 4, 47, 268, 35, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42111, '2025-12-10', 1, 19, 265, 36, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42112, '2025-12-10', 2, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42113, '2025-12-10', 3, 26, 59, 36, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42114, '2025-12-10', 4, 8, 284, 36, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42115, '2025-12-10', 1, 31, 327, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42116, '2025-12-10', 2, 31, 327, 138, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42117, '2025-12-10', 3, 40, 38, 138, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42118, '2025-12-10', 1, 17, 105, 37, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42119, '2025-12-10', 2, 83, 243, 37, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42120, '2025-12-10', 1, 27, 35, 57, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42121, '2025-12-10', 2, 55, 3, 57, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42122, '2025-12-10', 3, 64, 16, 57, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42123, '2025-12-10', 4, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42124, '2025-12-10', 1, 29, 27, 38, NULL, '226', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42125, '2025-12-10', 2, 64, 16, 38, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42126, '2025-12-10', 3, 27, 35, 38, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42127, '2025-12-10', 4, 55, 3, 38, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42128, '2025-12-10', 3, 41, 4, 39, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42129, '2025-12-10', 4, 84, 43, 39, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42130, '2025-12-10', 5, 80, 89, 39, NULL, '328 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42131, '2025-12-10', 1, 57, 62, 40, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42132, '2025-12-10', 2, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42133, '2025-12-10', 3, 93, 4, 40, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42134, '2025-12-10', 1, 45, 285, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42135, '2025-12-10', 2, 45, 285, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42136, '2025-12-10', 3, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51711, '2025-12-12', 5, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51712, '2025-12-12', 6, 11, 10, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51713, '2025-12-12', 7, 23, 20, 13, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51714, '2025-12-12', 1, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51715, '2025-12-12', 2, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51716, '2025-12-12', 2, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51717, '2025-12-12', 3, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46412, '2025-12-11', 3, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46413, '2025-12-11', 4, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46414, '2025-12-11', 5, 45, 47, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (46415, '2025-12-11', 6, 45, 47, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51718, '2025-12-12', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51745, '2025-12-12', 6, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51746, '2025-12-12', 1, 11, 262, 27, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42137, '2025-12-10', 4, 45, 286, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42138, '2025-12-10', 5, 45, 286, 41, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42139, '2025-12-10', 3, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42140, '2025-12-10', 4, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42141, '2025-12-10', 5, 213, 287, 1, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42142, '2025-12-10', 1, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42143, '2025-12-10', 2, 12, 111, 42, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42144, '2025-12-10', 3, 47, 107, 42, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51688, '2025-12-12', 2, 198, 34, 7, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51689, '2025-12-12', 3, 198, 34, 7, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51691, '2025-12-12', 3, 200, 254, 8, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51672, '2025-12-12', 1, 70, 12, 2, NULL, '213 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51673, '2025-12-12', 2, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51674, '2025-12-12', 3, 5, 4, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51675, '2025-12-12', 4, 5, 3, 2, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51676, '2025-12-12', 1, 5, 4, 3, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51677, '2025-12-12', 2, 71, 53, 3, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51678, '2025-12-12', 3, 3, 16, 3, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51679, '2025-12-12', 4, 27, 35, 3, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51680, '2025-12-12', 2, 43, 277, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51681, '2025-12-12', 3, 9, 8, 4, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51682, '2025-12-12', 4, 43, 44, 4, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51683, '2025-12-12', 1, 6, 2, 6, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51684, '2025-12-12', 2, 20, 13, 6, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51685, '2025-12-12', 3, 5, 4, 6, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51686, '2025-12-12', 4, 14, 3, 6, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51687, '2025-12-12', 1, 20, 235, 7, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42022, '2025-12-10', 4, 6, 2, 9, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42023, '2025-12-10', 1, 12, 36, 10, NULL, '3.9ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42024, '2025-12-10', 2, 204, 12, 10, NULL, '208 / 208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42025, '2025-12-10', 3, 6, 2, 10, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42026, '2025-12-10', 4, 14, 3, 10, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42027, '2025-12-10', 1, 59, 236, 11, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42028, '2025-12-10', 2, 17, 279, 11, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42029, '2025-12-10', 3, 71, 21, 11, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42030, '2025-12-10', 4, 40, 38, 11, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42031, '2025-12-10', 4, 76, 324, 12, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42032, '2025-12-10', 5, 76, 324, 12, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42033, '2025-12-10', 6, 76, 324, 12, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42034, '2025-12-10', 1, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42035, '2025-12-10', 2, 23, 96, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42036, '2025-12-10', 3, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42037, '2025-12-10', 4, 23, 23, 14, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42038, '2025-12-10', 3, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42039, '2025-12-10', 4, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42040, '2025-12-10', 5, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42041, '2025-12-10', 6, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42042, '2025-12-10', 1, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42043, '2025-12-10', 2, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42044, '2025-12-10', 2, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42045, '2025-12-10', 3, 199, 239, 137, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42047, '2025-12-10', 1, 14, 3, 17, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42048, '2025-12-10', 2, 6, 2, 17, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42049, '2025-12-10', 3, 73, 4, 17, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42050, '2025-12-10', 2, 33, 282, 19, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42051, '2025-12-10', 3, 60, 68, 19, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42053, '2025-12-10', 1, 20, 43, 20, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42054, '2025-12-10', 2, 14, 3, 20, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42055, '2025-12-10', 3, 7, 5, 20, NULL, '3.15ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42076, '2025-12-10', 5, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42077, '2025-12-10', 6, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42078, '2025-12-10', 3, 45, 241, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42079, '2025-12-10', 4, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42080, '2025-12-10', 5, 46, 48, 27, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42081, '2025-12-10', 6, 45, 46, 27, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42082, '2025-12-10', 1, 5, 4, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42083, '2025-12-10', 2, 5, 3, 28, NULL, '201', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42084, '2025-12-10', 3, 3, 16, 28, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42085, '2025-12-10', 1, 17, 105, 29, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42086, '2025-12-10', 2, 16, 31, 29, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42087, '2025-12-10', 3, 83, 243, 29, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42088, '2025-12-10', 4, 61, 13, 29, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42089, '2025-12-10', 2, 3, 5, 31, NULL, '3.2ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42090, '2025-12-10', 3, 86, 27, 31, NULL, 'УП', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42091, '2025-12-10', 4, 42, 4, 31, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42155, '2025-12-10', 2, 73, 4, 46, NULL, '302', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42156, '2025-12-10', 3, 13, 12, 46, NULL, '3.7ВЦ / 3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42157, '2025-12-10', 4, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42158, '2025-12-10', 1, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42159, '2025-12-10', 2, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42160, '2025-12-10', 3, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42161, '2025-12-10', 1, 55, 3, 48, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42162, '2025-12-10', 2, 35, 34, 48, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42163, '2025-12-10', 3, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42164, '2025-12-10', 4, 64, 16, 48, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42165, '2025-12-10', 1, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42166, '2025-12-10', 2, 65, 75, 49, NULL, '326 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42167, '2025-12-10', 3, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42168, '2025-12-10', 4, 78, 15, 49, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42169, '2025-12-10', 1, 4, 246, 50, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42170, '2025-12-10', 2, 47, 118, 50, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42171, '2025-12-10', 3, 58, 15, 50, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42172, '2025-12-10', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42173, '2025-12-10', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42174, '2025-12-10', 3, 11, 300, 51, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42175, '2025-12-10', 4, 82, 21, 51, NULL, '3.4ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42176, '2025-12-10', 3, 37, 38, 52, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42177, '2025-12-10', 4, 16, 31, 52, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42178, '2025-12-10', 5, 16, 31, 52, NULL, '3.14ВЦ / 3.21ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42179, '2025-12-10', 1, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42180, '2025-12-10', 2, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42181, '2025-12-10', 3, 4, 73, 54, NULL, '3.8ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42182, '2025-12-10', 1, 64, 16, 58, NULL, '3.5ВЦ', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42183, '2025-12-10', 2, 27, 35, 58, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42184, '2025-12-10', 3, 55, 3, 58, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (42185, '2025-12-10', 4, 35, 34, 58, NULL, '226 / 122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51739, '2025-12-12', 1, 39, 42, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51740, '2025-12-12', 2, 39, 102, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51741, '2025-12-12', 3, 39, 41, 23, NULL, '215', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51742, '2025-12-12', 4, 64, 5, 24, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51743, '2025-12-12', 5, 64, 5, 24, NULL, '006', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51744, '2025-12-12', 5, 67, 313, 26, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51719, '2025-12-12', 5, 33, 310, 15, NULL, '324', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51720, '2025-12-12', 1, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51721, '2025-12-12', 2, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51722, '2025-12-12', 3, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51723, '2025-12-12', 4, 28, 311, 16, NULL, '220', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51724, '2025-12-12', 1, 27, 35, 17, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51725, '2025-12-12', 2, 42, 4, 17, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51726, '2025-12-12', 3, 14, 3, 17, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51727, '2025-12-12', 4, 34, 12, 17, NULL, '204 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51728, '2025-12-12', 1, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51729, '2025-12-12', 2, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51730, '2025-12-12', 3, 32, 32, 19, NULL, '312', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51731, '2025-12-12', 4, 18, 14, 19, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51732, '2025-12-12', 1, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51733, '2025-12-12', 2, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51734, '2025-12-12', 3, 6, 2, 20, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51735, '2025-12-12', 4, 42, 4, 20, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51736, '2025-12-12', 4, 36, 305, 21, NULL, '208', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51737, '2025-12-12', 1, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51738, '2025-12-12', 2, 17, 39, 22, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55079, '2025-12-13', 4, 4, 73, 41, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55080, '2025-12-13', 4, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55081, '2025-12-13', 5, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55082, '2025-12-13', 6, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55083, '2025-12-13', 1, 52, 55, 33, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55084, '2025-12-13', 2, 52, 55, 33, NULL, 'УП мастерские', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51845, '2025-12-12', 4, 53, 38, 51, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51846, '2025-12-12', 1, 63, 350, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51847, '2025-12-12', 2, 63, 120, 52, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51848, '2025-12-12', 3, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51849, '2025-12-12', 4, 23, 322, 52, NULL, '106', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51850, '2025-12-12', 1, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51851, '2025-12-12', 2, 57, 68, 54, NULL, '326', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51852, '2025-12-12', 3, 43, 107, 54, NULL, '120', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51853, '2025-12-12', 1, 45, 126, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51854, '2025-12-12', 2, 45, 126, 55, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51855, '2025-12-12', 3, 40, 38, 55, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51856, '2025-12-12', 4, 40, 38, 55, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51857, '2025-12-12', 2, 64, 16, 58, NULL, 'актовый зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51858, '2025-12-12', 3, 83, 4, 58, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51859, '2025-12-12', 4, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51860, '2025-12-12', 5, 79, 2, 58, NULL, '  32ац', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55074, '2025-12-13', 5, 93, 131, 13, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55075, '2025-12-13', 6, 93, 131, 13, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55076, '2025-12-13', 1, 6, 2, 31, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55077, '2025-12-13', 2, 6, 2, 31, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55078, '2025-12-13', 3, 4, 73, 41, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51786, '2025-12-12', 3, 24, 21, 138, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51787, '2025-12-12', 4, 48, 123, 138, NULL, '317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51788, '2025-12-12', 3, 49, 60, 37, NULL, 'актовый зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51800, '2025-12-12', 1, 227, 349, 39, NULL, '226 / 328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51804, '2025-12-12', 2, 9, 103, 40, NULL, '117', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51805, '2025-12-12', 3, 15, 13, 40, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51806, '2025-12-12', 1, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51807, '2025-12-12', 2, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51808, '2025-12-12', 3, 46, 108, 41, NULL, '314', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51809, '2025-12-12', 4, 228, 351, 41, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51810, '2025-12-12', 1, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51811, '2025-12-12', 2, 2, 1, 1, NULL, '216', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51812, '2025-12-12', 3, 59, 109, 1, NULL, '115', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51813, '2025-12-12', 4, 24, 21, 1, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51814, '2025-12-12', 1, 41, 4, 42, NULL, '310', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51815, '2025-12-12', 2, 60, 68, 42, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51818, '2025-12-12', 1, 60, 68, 43, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55034, '2025-12-13', 1, 92, 125, 4, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55035, '2025-12-13', 2, 92, 125, 4, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55036, '2025-12-13', 1, 45, 126, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55037, '2025-12-13', 2, 45, 127, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55038, '2025-12-13', 3, 45, 122, 59, NULL, '303', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55039, '2025-12-13', 1, 215, 301, 34, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55040, '2025-12-13', 2, 215, 301, 34, NULL, '122', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55041, '2025-12-13', 1, 93, 4, 46, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51755, '2025-12-12', 3, 67, 348, 139, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51756, '2025-12-12', 4, 67, 348, 139, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51759, '2025-12-12', 3, 81, 60, 29, NULL, 'актовый зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51760, '2025-12-12', 4, 81, 60, 29, NULL, '308', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51761, '2025-12-12', 2, 14, 3, 31, NULL, '202', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51762, '2025-12-12', 3, 20, 13, 31, NULL, '108', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51763, '2025-12-12', 1, 15, 13, 32, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51764, '2025-12-12', 2, 3, 5, 32, NULL, '124', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51765, '2025-12-12', 3, 4, 2, 32, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51766, '2025-12-12', 4, 15, 13, 32, NULL, '321', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51767, '2025-12-12', 1, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51768, '2025-12-12', 2, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51769, '2025-12-12', 3, 76, 245, 136, NULL, '230', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51770, '2025-12-12', 5, 52, 56, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51771, '2025-12-12', 6, 40, 38, 33, NULL, 'null', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51783, '2025-12-12', 4, 54, 58, 36, NULL, '002', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51784, '2025-12-12', 1, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51785, '2025-12-12', 2, 199, 302, 138, NULL, '118', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51819, '2025-12-12', 2, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51820, '2025-12-12', 3, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51821, '2025-12-12', 4, 61, 13, 43, NULL, '307', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51822, '2025-12-12', 1, 82, 53, 45, NULL, '204', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51823, '2025-12-12', 2, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51824, '2025-12-12', 3, 93, 64, 45, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51825, '2025-12-12', 4, 60, 68, 45, NULL, '203', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51826, '2025-12-12', 3, 27, 35, 46, NULL, '306', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51827, '2025-12-12', 4, 4, 2, 46, NULL, '311', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51828, '2025-12-12', 5, 93, 4, 46, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51829, '2025-12-12', 4, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51830, '2025-12-12', 5, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51831, '2025-12-12', 6, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51832, '2025-12-12', 2, 42, 4, 48, NULL, 'актовый зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51833, '2025-12-12', 3, 42, 4, 48, NULL, '104', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51834, '2025-12-12', 4, 29, 27, 48, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51835, '2025-12-12', 5, 84, 43, 48, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51836, '2025-12-12', 1, 200, 295, 49, NULL, '317 / 317', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51837, '2025-12-12', 2, 16, 116, 49, NULL, '122 / 213', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51838, '2025-12-12', 3, 17, 117, 49, NULL, '222', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51839, '2025-12-12', 4, 93, 76, 49, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51840, '2025-12-12', 2, 47, 118, 50, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51841, '2025-12-12', 3, 47, 118, 50, NULL, '010', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51842, '2025-12-12', 1, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51843, '2025-12-12', 2, 67, 81, 51, NULL, '224', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51844, '2025-12-12', 3, 53, 38, 51, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55042, '2025-12-13', 2, 93, 4, 46, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55043, '2025-12-13', 3, 93, 4, 46, NULL, '103', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55044, '2025-12-13', 1, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55045, '2025-12-13', 2, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55046, '2025-12-13', 3, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55047, '2025-12-13', 4, 63, 320, 47, NULL, '217', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55048, '2025-12-13', 3, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (55049, '2025-12-13', 4, 6, 2, 7, NULL, '305', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51789, '2025-12-12', 4, 49, 60, 37, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51790, '2025-12-12', 5, 49, 60, 37, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51791, '2025-12-12', 6, 49, 60, 37, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51792, '2025-12-12', 1, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51793, '2025-12-12', 2, 83, 4, 57, NULL, '309', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51794, '2025-12-12', 3, 51, 15, 57, NULL, '1 корпус', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51795, '2025-12-12', 4, 84, 43, 57, NULL, '328', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51796, '2025-12-12', 1, 49, 61, 38, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51797, '2025-12-12', 2, 49, 61, 38, NULL, '015', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51798, '2025-12-12', 3, 29, 27, 38, NULL, 'Читальный зал', NULL);
INSERT INTO public."Lesson" ("Id", "Date", "Number", "UserId", "SubjectId", "GroupId", "TopicId", "Classroom", "Comment") OVERRIDING SYSTEM VALUE VALUES (51799, '2025-12-12', 4, 83, 4, 38, NULL, '309', NULL);


--
-- TOC entry 3508 (class 0 OID 16414)
-- Dependencies: 224
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Role" ("Id", "Name") VALUES (2, 'teacher');
INSERT INTO public."Role" ("Id", "Name") VALUES (1, 'admin');


--
-- TOC entry 3509 (class 0 OID 16417)
-- Dependencies: 225
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3510 (class 0 OID 16422)
-- Dependencies: 226
-- Data for Name: StudentTopic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3513 (class 0 OID 16427)
-- Dependencies: 229
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (1, 'МДК 04.01 Внедрение и поддержка компьютерных систем', 68);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (2, 'История', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (3, 'Физика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (4, 'Математика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (5, 'Литература', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (6, 'Химия (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (7, 'Безопасность жизнедеятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (8, 'Основы бережливого производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (9, 'Техническая механика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (10, 'Основы правовых знаний и социальная адаптация', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (11, 'Индивидуальный проект', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (12, 'Иностранный язык (1) / Иностранный язык (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (13, 'География', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (14, 'Экологические основы природопользования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (15, 'Физическая культура (1) / Физическая культура (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (16, 'Русский язык', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (17, 'Налоги и налогообложение', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (18, 'МДК 02.01 Практические основы бухгалтерского учета источников формирования активов организации', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (19, 'МДК 01.02 Проектирование цифровых устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (20, 'МДК 03.02 Основы проектирования электронных приборов и устройств на основе печатного монтажа', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (21, 'Иностранный язык в профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (22, 'МДК 01.02 Технология настройки и регулировки электронных приборов и устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (23, 'МДК 01.01  Технология сборки, монтажа и демонтажа электронных приборов и устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (24, 'МДК 02.01 Основы технологии переработки полимерных материалов и эластомеров', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (25, 'Технология пластических масс', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (26, 'МДК 13.01 Разработка программных решений для бизнеса', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (27, 'Информатика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (28, 'МДК 01.01 Электрические машины и аппараты', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (29, 'Органическая химия (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (30, 'Общая и неорганическая химия', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (31, 'Иностранный язык в профессиональной деятельности (1) /  (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (32, 'Органическая химия', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (33, 'Органическая химия (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (34, 'Информатика (1) / Информатика (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (35, 'Основы безопасности и защиты Родины', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (36, 'Обществознание', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (37, 'МДК 04.03 Теоретические основы обеспечения надежности систем автоматизации ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (38, 'Физическая культура', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (39, 'Дискретная математика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (40, 'Операционные системы и среды', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (41, 'МДК 02.03 Организация администрирования компьютерных систем', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (42, 'МДК 02.01 Администрирование сетевых операционных систем', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (43, 'Химия', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (44, 'Электротехника', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (45, 'МДК 03.01 Техническое обслуживание устройств релейной защиты, автоматики, средств измерений и систем сигнализаций', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (46, 'МДК 04.02 Экономика природопользования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (47, 'МДК.03.02 Очистные сооружения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (48, 'МДК 04.03 Экологическая экспертиза и экологический аудит', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (49, 'Охрана труда', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (50, 'Электротехника и электроника (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (51, 'Информатика (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (52, 'Информатика (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (53, 'Иностранный язык', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (54, 'Введение в специальность', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (55, 'МДК 05.01 Технические основы конвергенции логических интеллектуальных сетей и инфокоммуникационных технологий в информационно-коммуникационных сетях ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (56, 'МДК 02.02 Технология монтажа и обслуживания оптических систем передачи транспортных сетей', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (57, 'Прикладные компьютерные программы в профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (58, 'МДК 01.01 Основы технического обслуживания технологического оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (59, 'МДК 02.01 Управление технологическими процессами производства органических веществ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (60, 'МДК 04.01 Выполнение работ по профессии 18559 Слесарь - ремонтник', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (61, 'Производственная система предприятия и кодекс этики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (62, 'МДК 01.01 Методы создания и корректировки компьютерных моделей', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (63, 'Метеорология', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (64, 'Математические методы решения прикладных профессиональных задач', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (65, 'Основы финансовой грамотности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (66, 'МДК 02.02 Инструментальные средства разработки программного обеспечения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (67, 'Менеджмент в профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (68, 'Инженерная графика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (69, 'Физическая и коллоидная химия', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (70, 'МДК 03.01 Теоретические основы технического обслуживания и ремонта электронного оборудования и систем автоматического управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (71, 'МДК 02.02 Теоретические основы наладки, настройки оборудования и прикладного обеспечения автоматических систем', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (72, 'МДК 01.01 Теоретические основы разработки специализированных узлов и систем автоматического управления технологическими процессами', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (73, 'История России', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (74, 'УП 07.01 Учебная практика по сетевому и системному администрированию', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (75, 'Инженерная компьютерная графика (1) / Инженерная компьютерная графика (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (76, 'Основы электротехники и электронной техники', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (77, 'Теория электрических цепей (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (78, 'Математические методы решения типовых прикладных задач', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (79, 'Психология общения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (80, 'МДК 03.02 Аппаратура для ремонта и наладки устройств электроснабжения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (81, 'МДК 03.01 Ремонт и наладка устройств электроснабжения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (82, 'МДК 02.02 Программирование микроконтроллеров', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (83, 'МДК 03.01 Методы технического обслуживания и ремонта установок для аддитивного производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (84, 'МДК 02.03 Методы финишной обработки и контроля качеств готовых изделий', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (85, 'Геология', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (86, 'МДК 02.01 Организация и проведение производственного экологического контроля', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (87, 'УП 03.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (88, 'МДК 02.02 Техническое обслуживание, ремонт и оценка качества электронных приборов и устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (89, 'Химия (1) / Информатика (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (90, 'Основы бухгалтерского учета', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (91, 'МДК 04.02 Основы анализа бухгалтерской отчетности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (92, 'Аудит', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (93, 'Прикладное программирование в компьютерных системах и комплексах', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (94, 'МДК 05.01 Выполнение работ по рабочей профессии 14601 Монтажник оборудования связи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (95, 'Экономика организации', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (96, 'Цифровая схемотехника', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (97, 'МДК 05.01 Выполнение работ по профессии 13302 Лаборант по физико-механическим испытаниям ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (98, 'Теория вероятностей и математическая статистика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (99, 'Информатика (1) / Иностранный язык (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (100, 'МДК 02.02Теоретические основы правил монтажа и наладки оборудования автоматизированных систем с учетом специфики технологических процессов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (101, 'Основы электротехники', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (102, 'МДК 03.01 Эксплуатация объектов сетевой инфраструктуры', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (103, 'Метрология, стандартизация и сертификация', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (104, 'МДК 04.01 Информационное обеспечение природоохранной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (105, 'МДК 02.02 Разработка документации по эксплуатации электрического и электромеханического оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (106, 'Процессы формообразования в машиностроении', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (107, 'Электротехника и электроника', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (108, 'Почвоведение', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (109, 'Экономика отрасли', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (110, 'МДК 04.02 Обеспечение качества функционирования компьютерных систем', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (111, 'Основы философии', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (112, 'МДК 01.02 Технология монтажа и наладки электронного оборудования и систем автоматического управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (113, 'Производственная система ТМК и кодекс этики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (114, 'Информационные технологии (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (115, 'Информационные технологии (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (116, 'Иностранный язык в профессиональной деятельности (1) / (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (117, 'Элементы высшей математики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (118, 'Основы электронной и вычислительной техники', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (119, 'МДК 03.01Техническое обслуживание и ремонт компьютерных систем и комплексов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (120, ' МДК 02.01 Микропроцессорные системы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (121, 'МДК 02.01 Теоретические основы производства изделий с использованием аддитивных технологий', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (122, 'МДК 01.01 Организация и проведение экологического мониторинга окружающей среды', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (123, 'Информационные технологии в профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (124, 'УП 03.01Учебная практика по обеспечению информационной безопасности инфокоммуникационных сетей и систем связи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (125, 'МДК 01.01Технология монтажа и наладки электронного оборудования и систем автоматического управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (126, 'МДК 02.02 Очистные сооружения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (127, 'МДК 03.01 Организация учета и контроля обращения с отходами', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (128, 'МДК 03.01 Схемотехническое проектирование электронных приборов и устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (129, 'МДК 02.02 Эксплуатация установок для аддитивного производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (335, 'МДК 04.03', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (130, 'МДК 03.02Технологическое предпринимательство в области технического обслуживания и ремонта компьютерных систем и комплексов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (131, 'МДК 02.01 Основы диагностики и обнаружения отказов и дефектов электронных приборов и устройств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (132, 'МДК 02.01 Технология контроля и эксплуатации электронного оборудования и систем автоматического управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (133, 'МДК.08.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (134, 'МДК.07.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (135, 'МДК.01.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (136, 'Информационные технологии', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (137, 'Организация обслуживания', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (138, 'МДК.08.01 1 п/г', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (139, 'МДК.08.01 2 п/г', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (140, 'МДК.04.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (141, 'МДК.05.02', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (142, 'Русский язык и культура речи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (143, 'МДК.01.02', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (144, 'Оганизация обслуживания', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (145, 'МДК.06.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (146, 'Организация хранения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (147, 'ОБЗР', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (148, 'МДК.05.02 1,2 п/г', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (149, 'МДК.03.02', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (150, 'Микробиология', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (151, 'МДК.05.02 ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (152, 'МДК.05.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (153, 'МДК.01.04', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (154, 'МДК.07.01 1,2 п/г', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (155, 'МДК.08.01 ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (156, 'МДК.02.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (157, 'Правовые основы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (158, 'МДК.04.03', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (159, 'Иностранный язык (второй)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (160, 'Экологические основы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (161, 'Физкультура', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (162, 'Информатика ЕН', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (163, 'ИТ в проф. деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (164, 'Адаптивная физкультура', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (165, 'Основы строительного черчения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (166, 'МДК.01 Выполнение штукатурных работ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (167, 'Иностранный язык в проф.деят.', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (168, 'МДК.01.03 Техн. процессы техобсл. и ремонта а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (169, 'Основы инженерной графики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (170, 'МДК.01.01 Обеспечение ведения управления многоквартирным домом', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (171, 'БЖ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (172, 'МДК.04.01 Эксплуатация строит.объектов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (173, 'Биология', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (174, 'МДК.01.01 Устройство а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (175, 'Иностранный язык в проф.деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (176, 'МДК.01.01 Монтаж СТС и оборудования гражданских зданий', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (177, 'Информатика ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (178, 'Информатика 1,2 подгр', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (179, 'Культура и психология делового общения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (180, 'Социальная адаптация соц. правовых знаний', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (181, 'Основы материаловедения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (182, 'Прикладные компьютерные программы в проф. деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (183, 'МДК.05.01 Производство работ попроф.18560 Слесарь-сантехник', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (184, 'МДК.03.03 Тюнинг а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (185, 'ИТ в проф.деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (186, 'Основы гидравлики, теплотехники и аэродинамики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (187, 'МДК.04.01 Выполнение работ по проф.Слесарь по ремонту а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (188, 'МДК.01.02 Автомобильные эксплуатационные материалы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (189, 'МДК.04.01 Эксплуатация строительных объектов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (190, 'МДК.02.01 Организация тех.процессов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (191, '                              БЖ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (192, 'МДК.01.05 Техобсл. и ремонт электрооборуд.и электр.систем а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (193, 'Информатика ЕН 1,2 подгр', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (194, 'Материаловедение', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (195, 'МДК.05.01 Выполнение работ по проф.Сварщик ручной электродуговой сварки', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (196, 'МДК.05.01 Выполнение работ по рабочей профессии 27770 Экспедитор', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (197, 'МДК.05.01 Производство работ по проф.18560 Слесарь -сантехник', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (198, '1 час Экономика отрасли', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (199, 'МДК.03.02 Организация работ по модернизации а/тр. средств', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (200, 'Основы электротехники и электроники', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (201, 'Основы психологии проф.деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (202, 'Основы  почвоведения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (203, 'Адаптивная  физкультура', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (204, 'МДК.01 Выращивание цветочно-декор.культур', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (205, '                        География', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (206, 'МДК.05.01 выполнение работ по проф. Сварщик ручной дуговой сварки', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (207, 'МДК.01.02 Автомобильные эксплуатац.материалы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (208, 'МДК.02 Технология изготовления швейных изделий', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (209, 'МДК.04.02 Реконструкция строит.объектов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (210, 'МДК.01.06 Техобсл. и ремонт шасси а/м', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (211, 'МДК 02.02 Основы проектирования технологических процессов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (212, 'МДК 02.04 Оборудование цеха обработки металлов давлением', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (213, 'МДК 02.01 Эксплуатация кранов металлургического производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (214, 'МДК 03.01 Организация ремонтных, монтажных и наладочных работ по промышленному оборудованию', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (215, 'МДКд.07.01 Устройство, правила технической эксплуатации обслуживаемого оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (216, 'МДК 05.01 Экология металлургического производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (217, 'МДК.01.04 Обеспечение экологической и промышленной безопасности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (218, 'МДК 01.02 Менеджмент', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (219, 'МДК 02.02 Техника и технология ручной дуговой сварки (наплавки, резки) покрытым электродом', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (220, 'Процессы формообразования и инструменты', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (221, 'Учебная практика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (222, 'МДК 05.01 Организация и планирование деятельности структурного подразделения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (223, 'МДК 06.01 Освоение профессии рабочего, должностях служащего 18559 Слесарь-ремонтник', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (224, 'Компьютерная графика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (225, 'мдк 03.01 Формы и методы контроля качества металлов и сварных конструкций', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (226, 'Учебная практика (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (227, 'Учебная практика (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (228, 'Основы металлургического производства', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (229, 'Иностранный язык в профессиональной деятельности (1) / Иностранный язык в профессиональной деятельности (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (230, 'Менеджмент', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (231, 'МДК 03.01 Технологический процесс и технологическая документация по сборке узлов и изделий с применением систем автоматизированного проектирования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (232, 'МДК.02.02 Оборудование цеха производства черных металлов, наладка и контроль за его работой', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (233, 'Документационное обеспечение управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (234, 'Основы предпринимательской деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (235, 'Химия (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (236, 'Финансы, денежное обращение и кредит', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (237, ' Микропроцессорные системы', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (238, 'Правовые основы профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (239, 'МДК 01.03 Основы технической эксплуатации и обслуживания электрического и электромеханического оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (240, 'МДК 01.01 Теоретические основы разработки и моделирования элементов систем автоматизации с учетом специфики технологических процессов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (241, 'МДК 03.01 Управление твердыми отходами твердыми бытовыми отходами и радиоактивными отходами', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (242, 'Физическая культура (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (243, 'Прикладная математика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (244, 'УП 01.01. Учебная практика по созданию и корректировке компьютерной (цифровой) модели', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (245, 'УП 07.01Учебная практика компетенции по Информационные кабельные сети', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (246, 'История России  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (247, 'Физическая и коллоидная химия (1) / Основы физики и химии полимеров (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (248, 'Физическая и коллоидная химия (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (249, 'Аналитическая химия', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (250, 'Компьютерное моделирование (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (251, 'Инженерная графика (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (252, 'МДК 01.02  Электроснабжение электротехнологического оборудования сетей', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (253, 'Основы алгоритмизации и программирования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (254, 'Информационные технологии в профессиональной деятельности (1) /  (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (255, 'МДК 03.01 Организация расчетов с бюджетом и внебюджетными фондами', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (256, 'МДК 13.01 Разработка программных решений для бизнеса  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (257, 'Охрана труда  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (258, 'Психология общения  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (259, 'Физическая и коллоидная химия (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (260, 'МДК 04.01 Технология формирования систем автоматического управления типовых технологических процессов, средств измерений, несложных мехатронных устр', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (261, 'МДК 03.02 Безопасность компьютерных сетей', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (262, 'Правовое обеспечение профессиональной деятельности', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (263, 'МДК 01.01 Основы наладки и испытаний устройств релейной защиты, автоматики, средств измерения и систем сигнализации  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (264, 'МДК 04.02 Современные технологии управления структурными подразделениями предприятий сетей связи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (265, 'МДК 03.01 Обеспечение качества продукции', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (266, 'МДК 04.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (267, 'Информатика (1) / Электротехника и электроника (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (268, 'Электротехника и электроника (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (269, 'Основы автоматизации', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (270, 'Основы физики и химии полимеров (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (271, 'МДК 04.01 Выполнение работ по рабочей профессии 16199 Оператор электронно-вычислительных и вычислительных машин (1) / (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (272, 'МДК 01.01 Основы горного дела', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (273, 'Химия ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (333, 'Инженерная компьютерная графика (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (334, 'Органическая химия  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (274, 'Химия  (1)                                                                                                                                                         Сарбинтович М.М.', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (275, 'Литература                                                                                                                                                     Костина Светлана Ивановна	', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (276, 'Электротехника (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (277, 'Электротехника (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (278, 'Статистика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (279, 'МДК 02.02 Бухгалтерская технология проведения и оформления инвентаризации', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (280, 'Теоретические основы химической технологии', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (281, 'Общая и неорганическая химия (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (282, 'Общая и неорганическая химия (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (283, 'МДК 04.01 Планирование и организация работы структурных подразделений предприятий сетей связи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (284, 'МДК 04.01 Управление персоналом структурного подразделения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (285, 'Аналитическая химия (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (286, 'Аналитическая химия (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (287, 'МДК 02.01 Технология разработки программного обеспечения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (288, 'Основы экономики', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (289, 'МДК 04.01 Выполнение работ по рабочей профессии 16199 Оператор электронно-вычислительных и вычислительных машин (1) /  (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (290, 'Теория электрических цепей', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (291, 'Технология пластических масс   1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (292, 'МДК 05.01Выполнение работ по профессии 13302 Лаборант по физикомеханическим испытаниям', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (293, 'МДК 01.02 Основы обслуживания и эксплуатации технологического оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (294, 'УП 04.01Учебная практика по организации производственной деятельности персонала структурных подразделений, отвечающих за предоставление телематических', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (295, 'Информационные технологии (1) / Информационные технологии (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (296, 'МДК 04.01Учебная практика по организации производственной деятельности персонала структурных подразделений, отвечающих за предоставление телематически', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (297, 'иностранный язык (1) / Информационные технологии (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (298, 'Основы бухгалтерского учета  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (299, 'МДК 01.03 Основы технической эксплуатации и обслуживания электрического и электромеханического оборудования  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (300, 'Правовые основы профессиональной деятельности  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (301, 'Информатика (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (302, 'МДК 01.04 Электрическое и электромеханическое оборудование', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (303, 'МДК 03.01 Планирование и организация работы структурного подразделения', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (304, 'МДК 02.03 Математическое моделирование', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (305, 'МДК 02.01.Теоретические основы и принципы построения автоматизированных систем управления', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (306, 'Основы электротехники (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (307, 'Основы электротехники (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (308, 'УП 01.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (309, 'УП 05.01', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (310, 'УП 05.01 Учебная практика по выполнению работ по профессии 13302 Лаборант по физико-механическим испытаниям ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (311, 'УП 13.01 Учебная практика по программным решениям для бизнеса', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (312, 'МДК 01.02 Теоретические основы автоматизированного проектирования технических систем', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (313, 'УП 03.01 Учебная практика по техническому обслуживанию устройств релейной защиты, автоматики, средств измерений и систем сигнализаций', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (314, 'Физическая культура (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (315, 'Физическая культура (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (316, 'МДК 01.05 Техническое регулирование и контроль качества электрического и электромеханического оборудования', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (317, 'МДК 01.04 Электрическое и электромеханическое оборудование  КП', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (318, 'Метеорология  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (319, 'Основы физики и химии полимеров (1) / Физическая и коллоидная химия (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (320, 'ПП 07.01 Производственная практика по сетевому и системному администрированию', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (321, 'Иностранный язык в профессиональной деятельности (1) /(2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (322, 'МДК 01.03 Цифровая схемотехника', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (323, 'Техническая механика  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (324, 'УП 05.01 Учебная практика по выполнению работ по профессии 14601 Монтажник оборудования связи', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (325, 'Основы электротехники (1) / Инженерная компьютерная графика (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (326, 'МДК 03.01 Обеспечение качества продукции  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (327, 'МДК 01.02 Электроснабжение', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (328, 'Метеорология экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (329, 'Органическая химия  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (330, 'Инженерная графика (1) / Инженерная графика(2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (331, 'ПМ.05 экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (332, 'Техническая механика  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (336, 'Основы бухгалтерского учета  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (337, 'Экономика организации  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (338, 'Информатика(1)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (339, 'Информатика(2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (340, 'Инженерная компьютерная графика', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (341, 'Электробезопасность  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (342, 'Основы мехатроники  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (343, 'Русский язык  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (344, 'Инженерная компьютерная графика (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (345, 'Теория электрических цепей (1) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (346, 'Иностранный язык (2) ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (347, 'История   1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (348, 'Основы автоматизации технологических процессов', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (349, 'Информатика (1) / Химия (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (350, 'Основы алгоритмизации и программирования  1 час', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (351, 'Физическая культура (1)/Физическая культура (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (352, 'Документационное обеспечение управления (1 час) / Экономика организации  (1 час)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (353, 'ПП 13.01 Производственная практика по программным решениям для бизнеса', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (354, 'УП 01.01 Учебная практика по организации технического обслуживания и ремонта электрического и электромеханического оборудования ', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (355, 'Элементы высшей математики  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (356, 'Электротехника и электроника  (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (357, 'Математика  экзамен', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (358, 'Химия (2)', NULL);
INSERT INTO public."Subject" ("Id", "Name", "Total_hours") OVERRIDING SYSTEM VALUE VALUES (359, 'Информатика (1)', NULL);


--
-- TOC entry 3515 (class 0 OID 16433)
-- Dependencies: 231
-- Data for Name: Topic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3516 (class 0 OID 16438)
-- Dependencies: 232
-- Data for Name: TopicType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TopicType" ("Id", "Name") VALUES (3, 'ПЗ');
INSERT INTO public."TopicType" ("Id", "Name") VALUES (2, 'ЛР');
INSERT INTO public."TopicType" ("Id", "Name") VALUES (1, 'ЛЕК');


--
-- TOC entry 3518 (class 0 OID 16444)
-- Dependencies: 234
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (2, 'Alexey3000@gmail.com', NULL, 'Дмитриев Алексей Андреевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (3, 'скостина', 'default_password_hash', 'Костина Светлана Ивановна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (4, 'лполякова', 'default_password_hash', 'Полякова Лариса Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (5, 'лпавлова', 'default_password_hash', 'Павлова Людмила Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (6, 'порин', 'default_password_hash', 'Орин Павел Дмитриевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (7, 'иматвеева', 'default_password_hash', 'Матвеева Ирина Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (8, 'лильина', 'default_password_hash', 'Ильина Лариса Вячеславовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (9, 'агусев', 'default_password_hash', 'Гусев Алексей Викторович ', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (10, 'едокучаева', 'default_password_hash', 'Докучаева Елена Юрьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (11, 'эшаповалова', 'default_password_hash', 'Шаповалова Эльвира Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (12, 'сананьев', 'default_password_hash', 'Ананьев Сергей Алексеевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (13, 'юрепникова', 'default_password_hash', 'Репникова Юлия Сергеевна/Репникова Юлия Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (14, 'езвонарева', 'default_password_hash', 'Звонарева Евгения Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (15, 'някубовская', 'default_password_hash', 'Якубовская Надежда Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (16, 'нустич', 'default_password_hash', 'Устич Наталья Алексеевна/Федотова Мария Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (17, 'стараканова', 'default_password_hash', 'Тараканова Светлана Вячеславовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (18, 'езубкова', 'default_password_hash', 'Зубкова Елена Григорьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (19, 'акузнецова', 'default_password_hash', 'Кузнецова Анастасия Дюлавна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (20, 'есаликова', 'default_password_hash', 'Саликова Елена Валерьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (21, 'иволодина', 'default_password_hash', 'Володина Ирина Викторовна/Козырева Елена Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (22, 'вкобликова', 'default_password_hash', 'Кобликова Валентина Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (23, 'нсливнова', 'default_password_hash', 'Сливнова Наталья Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (24, 'нустич1', 'default_password_hash', 'Устич Наталья Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (25, 'дарсентьев', 'default_password_hash', 'Арсентьев Дмитрий Викторович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (26, 'осуркова', 'default_password_hash', 'Суркова Ольга Викторовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (27, 'стакташева', 'default_password_hash', 'Такташева Светлана Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (28, 'дбельчич', 'default_password_hash', 'Бельчич Дмитрий Сергеевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (29, 'вэкова', 'default_password_hash', 'Экова Виктория Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (30, 'гжракова', 'default_password_hash', 'Жракова Галина Михайловна/Савельева Анжелика Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (31, 'сфедосеев', 'default_password_hash', 'Федосеев Сергей Александрович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (32, 'пстепаненко', 'default_password_hash', 'Степаненко Полина Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (33, 'мсарбинтович', 'default_password_hash', 'Сарбинтович Марина Марьяновна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (34, 'юрепникова1', 'default_password_hash', 'Репникова Юлия Сергеевна/Федотова Мария Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (35, 'вэкова1', 'default_password_hash', 'Экова Виктория Александровна/Бредихина Наталья Витальевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (36, 'екуневич', 'default_password_hash', 'Куневич Елена Петровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (37, 'иволодина1', 'default_password_hash', 'Володина Ирина Викторовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (38, 'апопова', 'default_password_hash', 'Попова Анастасия Геннадьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (39, 'вморозов', 'default_password_hash', 'Морозов Валерий Валерьевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (40, 'гжракова1', 'default_password_hash', 'Жракова Галина Михайловна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (41, 'екошелева', 'default_password_hash', 'Кошелева Елена Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (42, 'екурлович', 'default_password_hash', 'Курлович Елена Павловна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (43, 'нфролова', 'default_password_hash', 'Фролова Наталья Юрьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (44, 'анерезов', 'default_password_hash', 'Нерезов Андрей Сергеевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (45, 'нпогорелова', 'default_password_hash', 'Погорелова Наталья Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (46, 'нзахарова', 'default_password_hash', 'Захарова Наталия Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (47, 'нутишева', 'default_password_hash', 'Утишева Наталья Вячеславовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (48, 'икаменских', 'default_password_hash', 'Каменских Инна Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (49, 'вевсеев', 'default_password_hash', 'Евсеев Виталий Николаевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (50, 'икавешникова', 'default_password_hash', 'Кавешникова Ирина Михайловна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (51, 'екозырева', 'default_password_hash', 'Козырева Елена Владимировна/Володина Ирина Викторовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (52, 'асавельев', 'default_password_hash', 'Савельев Анатолий Игоревич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (53, 'онестеренко', 'default_password_hash', 'Нестеренко Олег Афанасьевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (54, 'ткалёнова', 'default_password_hash', 'Калёнова Татьяна Вениаминовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (55, 'пгаврилов', 'default_password_hash', 'Гаврилов Павел Федотович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (56, 'гжракова2', 'default_password_hash', 'Жракова Галина Михайловна/Нестеренко Олег Афанасьевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (57, 'нартюшенко', 'default_password_hash', 'Артюшенко Наталия Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (58, 'екозырева1', 'default_password_hash', 'Козырева Елена Владимировна/Савельева Анжелика Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (59, 'ишелекето', 'default_password_hash', 'Шелекето Ирина Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (60, 'юелфимова', 'default_password_hash', 'Елфимова Юлия Валерьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (61, 'оюрова', 'default_password_hash', 'Юрова Ольга Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (62, 'адолгин', 'default_password_hash', 'Долгин Александр Андреевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (63, 'слитвиненко', 'default_password_hash', 'Литвиненко Семён Иванович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (64, 'огусева', 'default_password_hash', 'Гусева Ольга Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (65, 'нартюшенко1', 'default_password_hash', 'Артюшенко Наталия Николаевна/Байдакова Наталья Васильевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (66, 'гщекотур', 'default_password_hash', 'Щекотур Галина Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (67, 'нмирошкина', 'default_password_hash', 'Мирошкина Наталья Валентиновна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (68, 'мбубнов', 'default_password_hash', 'Бубнов Максим Павлович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (69, 'клуконин', 'default_password_hash', 'Луконин К.Д.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (70, 'мфедотова', 'default_password_hash', 'Федотова Мария Александровна/Федотова Мария Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (71, 'ецыганкова', 'default_password_hash', 'Цыганкова Екатерина Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (72, 'екозырева2', 'default_password_hash', 'Козырева Елена Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (73, 'агребенникова', 'default_password_hash', 'Гребенникова Анна Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (74, 'есаликова1', 'default_password_hash', 'Саликова Елена Валерьевна/Попова Анастасия Геннадьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (75, 'ивдовина', 'default_password_hash', 'Вдовина Ирина Леонидовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (76, 'апавлов', 'default_password_hash', 'Павлов Анатолий Романович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (77, 'вэкова2', 'default_password_hash', 'Экова Виктория Александровна/Федотова Мария Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (78, 'иволодина2', 'default_password_hash', 'Володина Ирина Викторовна/Савельева Анжелика Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (79, 'асавинов', 'default_password_hash', 'Савинов Александр Владимирович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (80, 'мносарева', 'default_password_hash', 'Носарева Мария Викторовна/Бредихина Наталья Витальевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (81, 'кматочкин', 'default_password_hash', 'Маточкин Константин Юрьевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (82, 'юрепникова2', 'default_password_hash', 'Репникова Юлия Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (83, 'отюменцева', 'default_password_hash', 'Тюменцева Ольга Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (84, 'мносарева1', 'default_password_hash', 'Носарева Мария Викторовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (85, 'лстарцева', 'default_password_hash', 'Старцева Людмила Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (86, 'юмаслова', 'default_password_hash', 'Маслова Юлия Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (87, 'оорлова', 'default_password_hash', 'Орлова Олеся Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (88, 'икаменских1', 'default_password_hash', 'Каменских Инна Николаевна/', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (89, 'сблагинин', 'default_password_hash', 'Благинин Сергей Иванович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (90, 'амурадова', 'default_password_hash', 'Мурадова Анна Петровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (91, 'клуконин1', 'default_password_hash', 'Луконин Кирилл Дмитриевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (92, 'дюдалович', 'default_password_hash', 'Юдалович Дмитрий Михайлович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (93, 'гсаакова', 'default_password_hash', 'Саакова Гаянэ Григорьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (94, 'ючибисова', 'default_password_hash', 'Чибисова Ю.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (95, 'абурлакова', 'default_password_hash', 'Бурлакова А.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (96, 'оабрамова', 'default_password_hash', 'Абрамова О.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (97, 'саксенова', 'default_password_hash', 'Аксенова С.И.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (98, 'нпанова', 'default_password_hash', 'Панова Н.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (99, 'одевушкина', 'default_password_hash', 'Девушкина О.Д.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (100, 'гмеркулова', 'default_password_hash', 'Меркулова Г.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (101, 'лбоброва', 'default_password_hash', 'Боброва Л.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (102, 'нвяткина', 'default_password_hash', 'Вяткина Н.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (103, 'спавлович', 'default_password_hash', 'Павлович С.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (104, 'нбратик', 'default_password_hash', 'Братик Н.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (105, 'одевушкина1', 'default_password_hash', 'Девушкина О.Д., Жукова Т.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (106, 'нпалагина', 'default_password_hash', 'Палагина Н.П.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (107, 'нкарасева', 'default_password_hash', 'Карасева Н.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (108, 'вдонскова', 'default_password_hash', 'Донскова В.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (109, 'юсергачева', 'default_password_hash', 'Сергачева Ю.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (110, 'тжукова', 'default_password_hash', 'Жукова Т.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (111, 'нпанова1', 'default_password_hash', 'Панова Н.В., Корчагина Н.А., ', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (112, 'нвласова', 'default_password_hash', 'Власова Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (113, 'нвяткина1', 'default_password_hash', 'Вяткина Н.Н., Аринченков Г.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (114, 'юснргачева', 'default_password_hash', 'Снргачева Ю.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (115, 'оабрамова1', 'default_password_hash', 'Абрамова О.В., Заводун Н.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (116, 'сгерасимова', 'default_password_hash', 'Герасимова С.П.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (117, 'мгрицаева', 'default_password_hash', 'Грицаева М.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (118, 'нпанова2', 'default_password_hash', 'Панова Н.В., ', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (119, 'тушакова', 'default_password_hash', 'Ушакова Т.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (120, 'нпанова3', 'default_password_hash', 'Панова Н.В., Корчагина Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (121, 'абурлакова1', 'default_password_hash', 'Бурлакова А.С., Заводун Н.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (122, 'нкарасева1', 'default_password_hash', 'Карасева Н.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (123, 'лбоброва1', 'default_password_hash', 'Боброва  Л.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (124, 'ебоброва', 'default_password_hash', 'Боброва Е.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (125, 'ебелецкая', 'default_password_hash', 'Белецкая Е.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (126, 'гзайцева', 'default_password_hash', 'Зайцева Г.И.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (127, 'лстарцева1', 'default_password_hash', 'Старцева Л.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (128, 'емаликова', 'default_password_hash', 'Маликова Е.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (129, 'кчернощёкова', 'default_password_hash', 'Чернощёкова К.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (130, 'лсуслова', 'default_password_hash', 'Суслова Л.А.Юрьева Е.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (131, 'епопова', 'default_password_hash', 'Попова Е.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (132, 'вмалякин', 'default_password_hash', 'Малякин В.А.Абдуллаева А.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (133, 'аконовская', 'default_password_hash', 'Коновская А.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (134, 'нудалова', 'default_password_hash', 'Удалова Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (135, 'ткорнюшина', 'default_password_hash', 'Корнюшина Т.П.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (136, 'мбредихин', 'default_password_hash', 'Бредихин М.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (137, 'еюрьева', 'default_password_hash', 'Юрьева Е.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (138, 'адостовалова', 'default_password_hash', 'Достовалова А.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (139, 'кведенина', 'default_password_hash', 'Веденина К.А.Бусловская Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (140, 'пденисов', 'default_password_hash', 'Денисов П.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (141, 'лсидоренко', 'default_password_hash', 'Сидоренко Л.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (142, 'сгрушевская', 'default_password_hash', 'Грушевская С.Ю.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (143, 'вшкарупа', 'default_password_hash', 'Шкарупа В.Н. Ларина М.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (144, 'нкалинченко', 'default_password_hash', 'Калинченко Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (145, 'сзахаров', 'default_password_hash', 'Захаров С.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (146, 'есаликова2', 'default_password_hash', 'Саликова Е.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (147, 'амакаров', 'default_password_hash', '      Макаров А.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (148, 'идолинина', 'default_password_hash', 'Долинина И.И.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (149, 'ткорнюшина1', 'default_password_hash', 'Корнюшина Т.П.Абдуллаева А.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (150, 'нбусловская', 'default_password_hash', 'Бусловская Н.А.Веденина К.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (151, 'гвострокрылова', 'default_password_hash', 'Вострокрылова Г.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (152, 'имаксимова', 'default_password_hash', 'Максимова И.Л.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (153, 'амакаров1', 'default_password_hash', 'Макаров А.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (154, 'взверева', 'default_password_hash', 'Зверева В.С.Абдуллаева А.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (155, 'рзавьялова', 'default_password_hash', 'Завьялова Р.Г.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (156, 'амакаров2', 'default_password_hash', 'Макаров А.В', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (157, 'взверева1', 'default_password_hash', 'Зверева В.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (158, 'лсуслова1', 'default_password_hash', 'Суслова Л.А.        Юрьева Е.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (159, 'ткорнюшина2', 'default_password_hash', 'Корнюшина Т.П.Чернощёкова К.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (160, 'ргоршкова', 'default_password_hash', 'Горшкова Р.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (161, 'мпищугина', 'default_password_hash', 'Пищугина М.М.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (162, 'нмурзагалиева', 'default_password_hash', 'Мурзагалиева Н.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (163, 'гщекотур1', 'default_password_hash', 'Щекотур Г.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (164, 'вчернецкая', 'default_password_hash', 'Чернецкая В.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (165, 'вшкарупа1', 'default_password_hash', 'Шкарупа В.Н.Ларина М.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (166, 'аабдуллаева', 'default_password_hash', 'Абдуллаева А.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (167, 'гвострокрылова1', 'default_password_hash', 'Вострокрылова Г.А', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (168, 'еголованова', 'default_password_hash', 'Голованова Елена Геннадьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (169, 'вколожвари', 'default_password_hash', 'Коложвари Василина Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (170, 'стюрина', 'default_password_hash', 'Тюрина Светлана Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (171, 'естепанова', 'default_password_hash', 'Степанова Екатерина Петровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (172, 'вязепова', 'default_password_hash', 'Язепова Вероника Вячеславовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (173, 'абексбаева', 'default_password_hash', 'Бексбаева Асель Бекбулатовна/Чеботарев Борис Николаевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (174, 'ссехно', 'default_password_hash', 'Сехно Сергей Владимирович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (175, 'окитаева', 'default_password_hash', 'Китаева Ольга Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (176, 'мушакова', 'default_password_hash', 'Ушакова Мария Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (177, 'наксенова', 'default_password_hash', 'Аксенова Наталья Ильинична', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (178, 'юхохлова', 'default_password_hash', 'Хохлова Юлия Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (179, 'алопатин', 'default_password_hash', 'Лопатин Андрей Николаевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (180, 'ипозднышева', 'default_password_hash', 'Позднышева Ирина Владимировна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (181, 'тломакина', 'default_password_hash', 'Ломакина Татьяна Юрьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (182, 'мманцова', 'default_password_hash', 'Манцова Марина Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (183, 'мчукамбаева', 'default_password_hash', 'Чукамбаева Мария Альбертовна/Родина Елена Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (184, 'есавенкова', 'default_password_hash', 'Савенкова Елена Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (185, 'акулиш', 'default_password_hash', 'Кулиш Анжелика Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (186, 'абексбаева1', 'default_password_hash', 'Бексбаева Асель Бекбулатовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (187, 'впищугин', 'default_password_hash', 'Пищугин Владислав Сергеевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (188, 'осайгина', 'default_password_hash', 'Сайгина Ольга Григорьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (189, 'обратусь', 'default_password_hash', 'Братусь Олег Викторович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (190, 'нчелапко', 'default_password_hash', 'Челапко Нина Михайловна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (191, 'тартемова', 'default_password_hash', 'Артемова Татьяна Тимофеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (192, 'акоробкин', 'default_password_hash', 'Коробкин Алексей Юрьевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (193, 'бчеботарев', 'default_password_hash', 'Чеботарев Борис Николаевич/Симакова Карина Андреевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (194, 'тюшкова', 'default_password_hash', 'Юшкова Татьяна Анатольевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (195, 'абексбаева2', 'default_password_hash', 'Бексбаева Асель Бекбулатовна/Симакова Карина Андреевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (196, 'нлужных', 'default_password_hash', 'Лужных Наталия Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (197, 'изаяшников', 'default_password_hash', 'Заяшников Иван Николаевич', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (198, 'юмаслова1', 'default_password_hash', 'Маслова Юлия Борисовна/Маслова Юлия Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (199, 'тфатеева', 'default_password_hash', 'Фатеева Татьяна Афанасьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (200, 'икаменских2', 'default_password_hash', 'Каменских Инна Николаевна/Каменских Инна Николаевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (201, 'акузнецова1', 'default_password_hash', 'Кузнецова Анастасия Дюлавна/Сарбинтович Марина Марьяновна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (202, 'нбайдакова', 'default_password_hash', 'Байдакова Наталья Васильевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (203, 'нкем', 'default_password_hash', 'Кем Неля Ивановна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (204, 'ецыганкова1', 'default_password_hash', 'Цыганкова Екатерина Борисовна/Цыганкова Екатерина Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (205, 'асавельева', 'default_password_hash', 'Савельева Анжелика Алексеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (206, 'юмаслова2', 'default_password_hash', 'Маслова Юлия Борисовна/Репникова Юлия Сергеевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (207, 'икаменских3', 'default_password_hash', 'Каменских Инна Николаевна/Фролова Наталья Юрьевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (208, 'мфедотова1', 'default_password_hash', 'Федотова Мария Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (209, 'акузнецова2', 'default_password_hash', 'Кузнецова А.Д.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (210, 'езвонарева1', 'default_password_hash', 'Звонарева Е.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (211, 'f2fc9902', 'default_password_hash', '324', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (212, '072ba2a6', 'default_password_hash', '3.2вц', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (214, 'нустич2', 'default_password_hash', 'Устич Н.А./Байдакова Н.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (215, 'нбредихина', 'default_password_hash', 'Бредихина Наталья Витальевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (216, 'нартюшенко2', 'default_password_hash', 'Артюшенко Н.Н.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (234, 'ргоршкова1', 'default_password_hash', 'Горшкова Раиса Александровна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (1, 'Admin', '$2a$12$uonu3JBM0gDTOom.4xPyIOkPhB2SKYY7ziz9AcYU1q0vtkWGOc/kC', 'admin', 1, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (213, 'ддугин', '$2a$12$IkE4sCYFtP2QfujgEa3VxOwrFAnJDiSDIPOHZwoKX2rqbAuGoAjte', 'Дугин Денис Игоревич', 2, 'kQMqHRhiR+VXRnAdElza3jrToVSpHLzcVxn0KhoXPz0=', '2026-03-11 17:40:40.65443');
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (228, 'иволодина3', 'default_password_hash', 'Володина Ирина Викторовна/ Савельева А.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (229, 'апопова1', 'default_password_hash', 'Попова Анастасия Геннадьевна/Маслова Юлия Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (230, 'лильина1', 'default_password_hash', 'Ильина Лариса Вячеславовна/Маслова Юлия Борисовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (225, 'лпавлова1', 'default_password_hash', 'Павлова Л.А.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (217, 'стакташева1', 'default_password_hash', 'Такташева С.Б.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (218, 'гжракова3', 'default_password_hash', 'Жракова Галина Михайловна/', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (219, 'мсарбинтович1', 'default_password_hash', 'Сарбинтович Марина Марьяновна/Кузнецова Анастасия Дюлавна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (220, 'нфролова1', 'default_password_hash', 'Фролова Наталья Юрьевна/Байдакова Наталья Васильевна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (221, 'асавельев1', 'default_password_hash', 'Савельев А.И.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (222, 'агусев1', 'default_password_hash', 'Гусев Алексей Викторович', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (223, 'ткалёнова1', 'default_password_hash', 'Калёнова Татьяна Вениаминовна, Погорелова Н.С.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (224, 'нбредихина1', 'default_password_hash', 'Бредихина Н.В.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (226, 'гсаакова1', 'default_password_hash', 'Саакова Г.Г.', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (227, 'вэкова3', 'default_password_hash', 'Экова Виктория Александровна/Носарева Мария Викторовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (231, 'стараканова1', 'default_password_hash', 'Тараканова Светлана Вячеславовна/Тараканова Светлана Вячеславовна', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (232, 'вэкова4', 'default_password_hash', 'Экова В.А', 2, NULL, NULL);
INSERT INTO public."User" ("Id", "Login", "PasswordHash", "FullName", "RoleId", "RefreshTokenHash", "TokenExpiresAt") OVERRIDING SYSTEM VALUE VALUES (233, 'апопова2', 'default_password_hash', 'Попова Анастасия Геннадьевна/Каменских Инна Николаевна', 2, NULL, NULL);


--
-- TOC entry 3521 (class 0 OID 24757)
-- Dependencies: 237
-- Data for Name: UserGroupSubject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (5, 2, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (5, 2, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (6, 3, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (229, 3, 34);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (230, 3, 89);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (8, 3, 6);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (43, 4, 276);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (15, 4, 13);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (43, 4, 277);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (6, 6, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (5, 6, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (16, 7, 12);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (55, 7, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (6, 7, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (17, 8, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (17, 8, 95);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (231, 8, 352);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (93, 9, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (6, 9, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (93, 10, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (14, 10, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 10, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (27, 11, 7);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (59, 11, 236);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (75, 11, 17);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (23, 13, 88);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (23, 13, 128);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (93, 13, 131);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (63, 14, 237);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (33, 15, 310);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (28, 16, 353);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 17, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (27, 17, 35);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (31, 18, 354);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (4, 19, 73);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (18, 19, 14);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (60, 19, 68);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (30, 19, 15);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (29, 20, 27);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 20, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (51, 20, 15);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (41, 22, 355);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (39, 23, 102);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (59, 23, 109);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (11, 23, 262);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (14, 24, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (29, 24, 27);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (41, 24, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (34, 24, 12);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (67, 26, 313);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (40, 27, 38);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (45, 27, 241);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (46, 27, 48);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (61, 27, 104);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (3, 28, 343);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (54, 139, 265);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (57, 139, 58);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (9, 29, 7);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (56, 29, 15);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (47, 29, 356);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (42, 31, 357);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (14, 32, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (29, 32, 27);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (42, 32, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (76, 136, 245);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (52, 33, 56);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (52, 33, 55);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (63, 34, 54);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 34, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (10, 35, 332);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (54, 36, 58);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (19, 36, 265);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (26, 36, 59);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (199, 138, 302);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (199, 138, 317);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (31, 138, 316);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (79, 37, 73);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (9, 37, 7);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (84, 57, 358);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 57, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (232, 57, 359);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (79, 38, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (83, 38, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (41, 39, 4);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (5, 39, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (84, 39, 6);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (233, 40, 34);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (15, 40, 13);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (46, 41, 108);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (45, 41, 249);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (2, 1, 66);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (9, 42, 194);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (48, 42, 123);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (47, 42, 107);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (60, 42, 68);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (32, 43, 334);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (11, 140, 262);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (40, 140, 38);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (234, 140, 230);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (93, 45, 64);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (12, 46, 11);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (4, 46, 2);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (3, 46, 5);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (63, 47, 320);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (64, 48, 5);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (55, 48, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (57, 49, 333);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (57, 49, 340);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (93, 49, 76);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (47, 50, 118);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (57, 50, 333);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (67, 51, 81);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (82, 51, 21);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (53, 51, 38);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (38, 52, 40);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (45, 54, 85);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (82, 54, 53);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (43, 54, 107);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (45, 55, 126);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (45, 55, 127);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (84, 58, 6);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (55, 58, 3);
INSERT INTO public."UserGroupSubject" ("UserId", "GroupId", "SubjectId") VALUES (84, 58, 235);


--
-- TOC entry 3520 (class 0 OID 16549)
-- Dependencies: 236
-- Data for Name: system_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.system_settings (key, value, updated_at) VALUES ('last_timetable_timestamp', '1765645491', '2025-12-13 21:14:02.672665');


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 217
-- Name: Attendance_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Attendance_Id_seq"', 1, false);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 219
-- Name: Grade_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Grade_Id_seq"', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 221
-- Name: Group_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Group_Id_seq"', 140, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 223
-- Name: Lesson_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Lesson_Id_seq"', 58371, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 227
-- Name: StudentTopic_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StudentTopic_Id_seq"', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 228
-- Name: Student_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Student_Id_seq"', 1, false);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 230
-- Name: Subject_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subject_Id_seq"', 359, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 233
-- Name: Topic_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Topic_Id_seq"', 1, false);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 235
-- Name: User_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_Id_seq"', 234, true);


--
-- TOC entry 3311 (class 2606 OID 16451)
-- Name: AttendanceType AttendanceType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AttendanceType"
    ADD CONSTRAINT "AttendanceType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3309 (class 2606 OID 16453)
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3313 (class 2606 OID 16455)
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3315 (class 2606 OID 16457)
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3317 (class 2606 OID 16459)
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3321 (class 2606 OID 16461)
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3325 (class 2606 OID 16463)
-- Name: StudentTopic StudentTopic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "StudentTopic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3323 (class 2606 OID 16465)
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3327 (class 2606 OID 16467)
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3331 (class 2606 OID 16469)
-- Name: TopicType TopicType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TopicType"
    ADD CONSTRAINT "TopicType_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3329 (class 2606 OID 16471)
-- Name: Topic Topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "Topic_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3337 (class 2606 OID 24813)
-- Name: UserGroupSubject UserGroupSubjectUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserGroupSubject"
    ADD CONSTRAINT "UserGroupSubjectUnique" UNIQUE ("UserId", "GroupId", "SubjectId");


--
-- TOC entry 3333 (class 2606 OID 16473)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3335 (class 2606 OID 16556)
-- Name: system_settings system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (key);


--
-- TOC entry 3319 (class 2606 OID 16563)
-- Name: Lesson unique_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT unique_lesson UNIQUE ("Date", "GroupId", "Number");


--
-- TOC entry 3338 (class 2606 OID 16474)
-- Name: Attendance FK_Attendance_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3339 (class 2606 OID 16479)
-- Name: Attendance FK_Attendance_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3340 (class 2606 OID 16484)
-- Name: Attendance FK_Attendance_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "FK_Attendance_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."AttendanceType"("Id") NOT VALID;


--
-- TOC entry 3341 (class 2606 OID 16489)
-- Name: Grade FK_Grade_LessonId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_LessonId" FOREIGN KEY ("LessonId") REFERENCES public."Lesson"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3342 (class 2606 OID 16494)
-- Name: Grade FK_Grade_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "FK_Grade_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3343 (class 2606 OID 16499)
-- Name: Lesson FK_Lesson_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3344 (class 2606 OID 16504)
-- Name: Lesson FK_Lesson_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3345 (class 2606 OID 16509)
-- Name: Lesson FK_Lesson_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") NOT VALID;


--
-- TOC entry 3346 (class 2606 OID 16514)
-- Name: Lesson FK_Lesson_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "FK_Lesson_UserId" FOREIGN KEY ("UserId") REFERENCES public."User"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3348 (class 2606 OID 16519)
-- Name: StudentTopic FK_StudentTopic_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Student"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 16524)
-- Name: StudentTopic FK_StudentTopic_TopicId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentTopic"
    ADD CONSTRAINT "FK_StudentTopic_TopicId" FOREIGN KEY ("TopicId") REFERENCES public."Topic"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 16529)
-- Name: Student FK_Student_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "FK_Student_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3350 (class 2606 OID 16534)
-- Name: Topic FK_Topic_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") NOT VALID;


--
-- TOC entry 3351 (class 2606 OID 16539)
-- Name: Topic FK_Topic_TypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topic"
    ADD CONSTRAINT "FK_Topic_TypeId" FOREIGN KEY ("TypeId") REFERENCES public."TopicType"("Id") NOT VALID;


--
-- TOC entry 3352 (class 2606 OID 16544)
-- Name: User FK_User_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "FK_User_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Role"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3353 (class 2606 OID 24782)
-- Name: UserGroupSubject UserGroupSubject_GroupId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserGroupSubject"
    ADD CONSTRAINT "UserGroupSubject_GroupId" FOREIGN KEY ("GroupId") REFERENCES public."Group"("Id") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3354 (class 2606 OID 24814)
-- Name: UserGroupSubject UserGroupSubject_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserGroupSubject"
    ADD CONSTRAINT "UserGroupSubject_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Subject"("Id") NOT VALID;


--
-- TOC entry 3355 (class 2606 OID 24762)
-- Name: UserGroupSubject UserGroupSubject_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserGroupSubject"
    ADD CONSTRAINT "UserGroupSubject_UserId" FOREIGN KEY ("UserId") REFERENCES public."User"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-12-14 00:14:30

--
-- PostgreSQL database dump complete
--

\unrestrict nDsfNmeLkPvskW5Ieus9BZIkBsXHTNyk3zYzl7LaPzODsjDWaNgEBKqgowVrGhL

