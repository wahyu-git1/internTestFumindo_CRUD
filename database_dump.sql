--
-- PostgreSQL database dump
--

\restrict 3bOaqnsh4qJZHRCZSzv5LAUYAyOj6aItdsZWmKX3Eys1EEIPTcdfWElDt4rptQH

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-21 12:09:47

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
-- TOC entry 853 (class 1247 OID 16390)
-- Name: asset_category_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.asset_category_enum AS ENUM (
    'Consumable',
    'Non-Consumable'
);


ALTER TYPE public.asset_category_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    asset_id integer NOT NULL,
    asset_name character varying NOT NULL,
    stock_quantity integer NOT NULL,
    category public.asset_category_enum DEFAULT 'Consumable'::public.asset_category_enum NOT NULL
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16395)
-- Name: asset_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asset_asset_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 219
-- Name: asset_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_asset_id_seq OWNED BY public.asset.asset_id;


--
-- TOC entry 4859 (class 2604 OID 16399)
-- Name: asset asset_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset ALTER COLUMN asset_id SET DEFAULT nextval('public.asset_asset_id_seq'::regclass);


--
-- TOC entry 5011 (class 0 OID 16396)
-- Dependencies: 220
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset (asset_id, asset_name, stock_quantity, category) FROM stdin;
4	kursi	112	Consumable
6	Pipa	15	Consumable
7	meja	39	Consumable
8	PC 	5	Consumable
9	printer	4	Non-Consumable
\.


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 219
-- Name: asset_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_asset_id_seq', 9, true);


--
-- TOC entry 4862 (class 2606 OID 16408)
-- Name: asset PK_2a48e81afa7729ed31c2c7b18ed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT "PK_2a48e81afa7729ed31c2c7b18ed" PRIMARY KEY (asset_id);


-- Completed on 2026-01-21 12:09:47

--
-- PostgreSQL database dump complete
--

\unrestrict 3bOaqnsh4qJZHRCZSzv5LAUYAyOj6aItdsZWmKX3Eys1EEIPTcdfWElDt4rptQH

