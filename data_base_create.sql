--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-03-22 15:40:46

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 240 (class 1259 OID 16665)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    user_password character varying(50) NOT NULL,
    user_email character varying(250) NOT NULL,
    user_phone character varying(50),
    user_photo character varying(1000)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16670)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 241
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3292 (class 2604 OID 16671)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3446 (class 0 OID 16665)
-- Dependencies: 240
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, user_password, user_email, user_phone, user_photo) FROM stdin;
1	AngelJadan	Angel2019	ajadanc@est.ups.edu.ec	0990537351	https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.businessinsider.com%2Fbest-cities-in-the-world-ranked-time-out-index-2019-3&psig=AOvVaw1txtMKJ2c6KdsmPHNaW95w&ust=1648063898367000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNDwx8662vYCFQAAAAAdAAAAABAD
2	Prueba1	123	prueba1@gmail.com	099	https://www.google.com/url?sa=i&url=https%3A%2F%2Fpngtree.com%2Fso%2Fflat-avatars&psig=AOvVaw0TOfjj_6T0Jo_5iwf9tHnj&ust=1648065921328000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLiP1pPC2vYCFQAAAAAdAAAAABAD
\.


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 241
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- TOC entry 3294 (class 2606 OID 16673)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3296 (class 2606 OID 16683)
-- Name: users users_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_un UNIQUE (user_name);


-- Completed on 2022-03-22 15:40:47

--
-- PostgreSQL database dump complete
--

