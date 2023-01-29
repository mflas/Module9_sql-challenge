--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-29 20:54:49

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
-- TOC entry 214 (class 1259 OID 16720)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(10) NOT NULL,
    dept_name character varying(50)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16728)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    dept_emp_id bigint NOT NULL,
    emp_no bigint NOT NULL,
    dept_no character varying(10) NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16727)
-- Name: dept_emp_dept_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dept_emp_dept_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dept_emp_dept_emp_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 215
-- Name: dept_emp_dept_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dept_emp_dept_emp_id_seq OWNED BY public.dept_emp.dept_emp_id;


--
-- TOC entry 223 (class 1259 OID 16842)
-- Name: dept_empl_v; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dept_empl_v AS
 SELECT dept_emp.dept_emp_id,
    dept_emp.emp_no,
    dept_emp.dept_no,
    departments.dept_name
   FROM (public.dept_emp
     JOIN public.departments ON (((dept_emp.dept_no)::text = (departments.dept_no)::text)));


ALTER TABLE public.dept_empl_v OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16735)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_manager_id integer NOT NULL,
    dept_no character varying(10) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16734)
-- Name: dept_manager_dept_manager_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dept_manager_dept_manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dept_manager_dept_manager_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 217
-- Name: dept_manager_dept_manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dept_manager_dept_manager_id_seq OWNED BY public.dept_manager.dept_manager_id;


--
-- TOC entry 219 (class 1259 OID 16741)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no bigint NOT NULL,
    emp_title_id character varying(10),
    birth_date date,
    first_name character varying(50),
    last_name character varying(50),
    sex character varying(3),
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16836)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    salary_id integer NOT NULL,
    emp_no integer NOT NULL,
    salary money NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16835)
-- Name: salaries_salary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salaries_salary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salaries_salary_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 221
-- Name: salaries_salary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salaries_salary_id_seq OWNED BY public.salaries.salary_id;


--
-- TOC entry 220 (class 1259 OID 16749)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(10) NOT NULL,
    title character varying(50) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3199 (class 2604 OID 16818)
-- Name: dept_emp dept_emp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp ALTER COLUMN dept_emp_id SET DEFAULT nextval('public.dept_emp_dept_emp_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16738)
-- Name: dept_manager dept_manager_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager ALTER COLUMN dept_manager_id SET DEFAULT nextval('public.dept_manager_dept_manager_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16839)
-- Name: salaries salary_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries ALTER COLUMN salary_id SET DEFAULT nextval('public.salaries_salary_id_seq'::regclass);


--
-- TOC entry 3203 (class 2606 OID 16726)
-- Name: departments pk_departments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT pk_departments PRIMARY KEY (dept_no);


--
-- TOC entry 3205 (class 2606 OID 16820)
-- Name: dept_emp pk_dept_emp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT pk_dept_emp PRIMARY KEY (dept_emp_id);


--
-- TOC entry 3207 (class 2606 OID 16740)
-- Name: dept_manager pk_dept_manager; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT pk_dept_manager PRIMARY KEY (dept_manager_id);


--
-- TOC entry 3209 (class 2606 OID 16789)
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (emp_no);


--
-- TOC entry 3213 (class 2606 OID 16841)
-- Name: salaries pk_salaries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT pk_salaries PRIMARY KEY (salary_id);


--
-- TOC entry 3211 (class 2606 OID 16753)
-- Name: titles pk_titles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT pk_titles PRIMARY KEY (title_id);


--
-- TOC entry 3214 (class 2606 OID 16759)
-- Name: dept_emp fk_dept_emp_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3215 (class 2606 OID 16809)
-- Name: dept_emp fk_dept_emp_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3216 (class 2606 OID 16764)
-- Name: dept_manager fk_dept_manager_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3217 (class 2606 OID 16795)
-- Name: dept_manager fk_dept_manager_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3218 (class 2606 OID 16774)
-- Name: employees fk_employees_emp_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);


-- Completed on 2023-01-29 20:54:49

--
-- PostgreSQL database dump complete
--

