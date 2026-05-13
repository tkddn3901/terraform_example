--
-- PostgreSQL database cluster dump
--

\restrict JDoHr9VdqfVbIftyRIY86JPruP7qwTOH7yibz8lMDv33iEW9HiJCh3XWvgX0QTt

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:03JT8GIVw5Qc7dEoUYm8+w==$nAmnHF4lWKRgHfs5jD46r6fZotk1xdlL9oLJRB5Gpcg=:idv1+UzNywOawOSq4xDkgJsL5Nn4xArGo95sDlNzmwc=';
CREATE ROLE scott;
ALTER ROLE scott WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:cpNL/meDw4xvte54+7+wHw==$gO7IWd56nEeOUYeV5zKeJWH6aT6KIQTIvtjciY4+/S8=:SsiARWU6voVjSp0tqEald58Ib1dKGBv79No1f6gmITA=';
CREATE ROLE viper;
ALTER ROLE viper WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:t63rHtBDOgDQb68KocX5kw==$vEWy6GRlQd3geudYgQ1UZon40tEy7BPa+D2yphfD/pk=:kHe2GXBJAESmCWPiFsEPRP+AqEPJuO0aWL8AqA6yAQk=';

--
-- User Configurations
--








\unrestrict JDoHr9VdqfVbIftyRIY86JPruP7qwTOH7yibz8lMDv33iEW9HiJCh3XWvgX0QTt

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict h9breAVHn6kDxzYnQKwuYjrvFfbF5A1XcHd4pbRI11f7vrKHrRYLopaGwNL5afm

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict h9breAVHn6kDxzYnQKwuYjrvFfbF5A1XcHd4pbRI11f7vrKHrRYLopaGwNL5afm

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict WXhmwWovpZff5ZdfKQAuQ6f5M0qetz7jfczrEsXzkgsZg4N2rxxmJRlZvdfaRza

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict WXhmwWovpZff5ZdfKQAuQ6f5M0qetz7jfczrEsXzkgsZg4N2rxxmJRlZvdfaRza

--
-- Database "scott_db" dump
--

--
-- PostgreSQL database dump
--

\restrict x7g1MvyF9j3OKrwtJcmocSExh4HcnlbPO02lcs5ajrLWNf5pcWJOHg5nE6WBkG2

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: scott_db; Type: DATABASE; Schema: -; Owner: scott
--

CREATE DATABASE scott_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE scott_db OWNER TO scott;

\unrestrict x7g1MvyF9j3OKrwtJcmocSExh4HcnlbPO02lcs5ajrLWNf5pcWJOHg5nE6WBkG2
\connect scott_db
\restrict x7g1MvyF9j3OKrwtJcmocSExh4HcnlbPO02lcs5ajrLWNf5pcWJOHg5nE6WBkG2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dept; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.dept (
    deptno integer NOT NULL,
    dname character varying(14),
    loc character varying(13)
);


ALTER TABLE public.dept OWNER TO scott;

--
-- Name: emp; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.emp (
    empno integer NOT NULL,
    ename character varying(10),
    job character varying(9),
    mgr integer,
    hiredate date,
    sal numeric(7,2),
    comm numeric(7,2),
    deptno integer
);


ALTER TABLE public.emp OWNER TO scott;

--
-- Name: member; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.member (
    num integer NOT NULL,
    name text NOT NULL,
    addr text
);


ALTER TABLE public.member OWNER TO scott;

--
-- Name: member_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.member_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_num_seq OWNER TO scott;

--
-- Name: member_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.member_num_seq OWNED BY public.member.num;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.notice (
    num integer NOT NULL,
    content text
);


ALTER TABLE public.notice OWNER TO scott;

--
-- Name: notice_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.notice_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_num_seq OWNER TO scott;

--
-- Name: notice_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.notice_num_seq OWNED BY public.notice.num;


--
-- Name: post; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.post (
    num integer NOT NULL,
    writer character varying(50) NOT NULL,
    title character varying(100),
    content text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post OWNER TO scott;

--
-- Name: post_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.post_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_num_seq OWNER TO scott;

--
-- Name: post_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.post_num_seq OWNED BY public.post.num;


--
-- Name: member num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.member ALTER COLUMN num SET DEFAULT nextval('public.member_num_seq'::regclass);


--
-- Name: notice num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.notice ALTER COLUMN num SET DEFAULT nextval('public.notice_num_seq'::regclass);


--
-- Name: post num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.post ALTER COLUMN num SET DEFAULT nextval('public.post_num_seq'::regclass);


--
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.dept (deptno, dname, loc) FROM stdin;
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
\.


--
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) FROM stdin;
7369	SMITH	CLERK	7902	1980-12-17	800.00	\N	20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600.00	300.00	30
7521	WARD	SALESMAN	7698	1981-02-22	1250.00	500.00	30
7566	JONES	MANAGER	7839	1981-04-02	2975.00	\N	20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250.00	1400.00	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850.00	\N	30
7782	CLARK	MANAGER	7839	1981-06-09	2450.00	\N	10
7788	SCOTT	ANALYST	7566	1987-07-13	3000.00	\N	20
7839	KING	PRESIDENT	\N	1981-11-17	5000.00	\N	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500.00	0.00	30
7876	ADAMS	CLERK	7788	1987-07-13	1100.00	\N	20
7900	JAMES	CLERK	7698	1981-12-03	950.00	\N	30
7902	FORD	ANALYST	7566	1981-12-03	3000.00	\N	20
7934	MILLER	CLERK	7782	1982-01-23	1300.00	\N	10
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.member (num, name, addr) FROM stdin;
2	zeus	hle
1	viper	hle
\.


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.notice (num, content) FROM stdin;
1	불금
2	즐거운 주말
3	월요일에 봐
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.post (num, writer, title, content, created_at) FROM stdin;
5	zeka	hle mid	super soldier	2026-04-20 16:32:16.942333
3	faker	mid	goat	2026-04-20 10:43:36.836313
2	zeus	top	god of thunder	2026-04-20 10:43:12.629071
1	viper	ad	i'm viper. god of ad.	2026-04-20 10:42:03.381829
6	peanut	jg	ex hle jg	2026-04-21 09:33:29.303653
7	bdd	kt mid	agoomon\r\nex kingzon	2026-04-21 10:49:17.919372
\.


--
-- Name: member_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.member_num_seq', 4, true);


--
-- Name: notice_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.notice_num_seq', 3, true);


--
-- Name: post_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.post_num_seq', 7, true);


--
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (deptno);


--
-- Name: emp emp_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empno);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (num);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (num);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (num);


--
-- Name: emp emp_deptno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_deptno_fkey FOREIGN KEY (deptno) REFERENCES public.dept(deptno);


--
-- PostgreSQL database dump complete
--

\unrestrict x7g1MvyF9j3OKrwtJcmocSExh4HcnlbPO02lcs5ajrLWNf5pcWJOHg5nE6WBkG2

--
-- Database "viper_db" dump
--

--
-- PostgreSQL database dump
--

\restrict s7IDa7sHaaMa6B0mUa3HNWI3IbiTJymxKuIY336qQGAOebzcaFXBap7wZw37LTM

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: viper_db; Type: DATABASE; Schema: -; Owner: viper
--

CREATE DATABASE viper_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE viper_db OWNER TO viper;

\unrestrict s7IDa7sHaaMa6B0mUa3HNWI3IbiTJymxKuIY336qQGAOebzcaFXBap7wZw37LTM
\connect viper_db
\restrict s7IDa7sHaaMa6B0mUa3HNWI3IbiTJymxKuIY336qQGAOebzcaFXBap7wZw37LTM

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: member; Type: TABLE; Schema: public; Owner: viper
--

CREATE TABLE public.member (
    num integer NOT NULL,
    name text NOT NULL,
    addr text
);


ALTER TABLE public.member OWNER TO viper;

--
-- Name: member_seq; Type: SEQUENCE; Schema: public; Owner: viper
--

CREATE SEQUENCE public.member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_seq OWNER TO viper;

--
-- Name: post; Type: TABLE; Schema: public; Owner: viper
--

CREATE TABLE public.post (
    num integer NOT NULL,
    writer text NOT NULL,
    title text NOT NULL,
    content text,
    created_at timestamp without time zone
);


ALTER TABLE public.post OWNER TO viper;

--
-- Name: post_seq; Type: SEQUENCE; Schema: public; Owner: viper
--

CREATE SEQUENCE public.post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_seq OWNER TO viper;

--
-- Name: test_seq; Type: SEQUENCE; Schema: public; Owner: viper
--

CREATE SEQUENCE public.test_seq
    START WITH 10
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_seq OWNER TO viper;

--
-- Name: todo; Type: TABLE; Schema: public; Owner: viper
--

CREATE TABLE public.todo (
    num integer NOT NULL,
    content character varying(20),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.todo OWNER TO viper;

--
-- Name: todo_num_seq; Type: SEQUENCE; Schema: public; Owner: viper
--

CREATE SEQUENCE public.todo_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todo_num_seq OWNER TO viper;

--
-- Name: todo_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: viper
--

ALTER SEQUENCE public.todo_num_seq OWNED BY public.todo.num;


--
-- Name: todo num; Type: DEFAULT; Schema: public; Owner: viper
--

ALTER TABLE ONLY public.todo ALTER COLUMN num SET DEFAULT nextval('public.todo_num_seq'::regclass);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: viper
--

COPY public.member (num, name, addr) FROM stdin;
1	viper	blg
2	zeus	hle
3	peanut	hle
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: viper
--

COPY public.post (num, writer, title, content, created_at) FROM stdin;
1	doran	top	hle top liner	2026-04-02 16:09:50.533134
2	peanut	jg	hle jg liner	2026-04-02 16:10:07.178214
3	zeka	mid	hle mid liner	2026-04-02 16:10:20.798305
4	viper	ad	hle ad liner	2026-04-02 16:10:36.274875
5	delight	sup	hle sup liner	2026-04-02 16:11:02.929364
\.


--
-- Data for Name: todo; Type: TABLE DATA; Schema: public; Owner: viper
--

COPY public.todo (num, content, created_at) FROM stdin;
1	python study	2026-04-02 17:06:34.335466
2	linux study	2026-04-02 17:07:17.454481
3	docker study	2026-04-02 17:07:24.719363
4	aws study	2026-04-02 17:08:16.234693
\.


--
-- Name: member_seq; Type: SEQUENCE SET; Schema: public; Owner: viper
--

SELECT pg_catalog.setval('public.member_seq', 3, true);


--
-- Name: post_seq; Type: SEQUENCE SET; Schema: public; Owner: viper
--

SELECT pg_catalog.setval('public.post_seq', 5, true);


--
-- Name: test_seq; Type: SEQUENCE SET; Schema: public; Owner: viper
--

SELECT pg_catalog.setval('public.test_seq', 30, true);


--
-- Name: todo_num_seq; Type: SEQUENCE SET; Schema: public; Owner: viper
--

SELECT pg_catalog.setval('public.todo_num_seq', 3, true);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: viper
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (num);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: viper
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (num);


--
-- Name: todo todo_pkey; Type: CONSTRAINT; Schema: public; Owner: viper
--

ALTER TABLE ONLY public.todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (num);


--
-- PostgreSQL database dump complete
--

\unrestrict s7IDa7sHaaMa6B0mUa3HNWI3IbiTJymxKuIY336qQGAOebzcaFXBap7wZw37LTM

--
-- PostgreSQL database cluster dump complete
--

