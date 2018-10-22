--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1)
-- Dumped by pg_dump version 10.3 (Ubuntu 10.3-1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: scavengerescape; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scavengerescape (
    id integer NOT NULL,
    date date,
    hour time without time zone,
    name character varying(512) NOT NULL,
    rate json,
    room integer,
    team_size character varying(64),
    created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.scavengerescape OWNER TO postgres;

--
-- Name: scavengerescape_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scavengerescape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scavengerescape_id_seq OWNER TO postgres;

--
-- Name: scavengerescape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scavengerescape_id_seq OWNED BY public.scavengerescape.id;


--
-- Name: scavengerescape id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scavengerescape ALTER COLUMN id SET DEFAULT nextval('public.scavengerescape_id_seq'::regclass);


--
-- Data for Name: scavengerescape; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scavengerescape (id, date, hour, name, rate, room, team_size, created_at, deleted_at, updated_at) FROM stdin;
134	2018-05-12	17:30:00	Gangsta's Cage	"booked"	3	Booked	2018-05-11 09:19:34.493	\N	2018-05-11 09:19:42.174
103	2018-05-11	17:00:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:25.033	\N	2018-05-11 09:19:42.845
109	2018-05-11	19:00:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:25.041	\N	2018-05-11 09:19:42.853
113	2018-05-11	16:30:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:25.063	\N	2018-05-11 09:19:42.892
119	2018-05-12	15:00:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:34.439	\N	2018-05-11 09:19:42.112
124	2018-05-12	12:30:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:34.445	\N	2018-05-11 09:19:42.119
129	2018-05-12	20:00:00	Torture Chamber	"booked"	2	Booked	2018-05-11 09:19:34.487	\N	2018-05-11 09:19:42.164
118	2018-05-12	13:30:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:34.438	\N	2018-05-11 09:19:42.109
126	2018-05-12	15:30:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:34.448	\N	2018-05-11 09:19:42.122
132	2018-05-12	14:30:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:34.491	\N	2018-05-11 09:19:42.171
137	2018-05-12	22:00:00	Gangsta's Cage	"booked"	3	Booked	2018-05-11 09:19:34.529	\N	2018-05-11 09:19:42.216
104	2018-05-11	18:30:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:25.034	\N	2018-05-11 09:19:42.846
108	2018-05-11	17:30:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:25.04	\N	2018-05-11 09:19:42.851
114	2018-05-11	18:00:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:25.064	\N	2018-05-11 09:19:42.893
120	2018-05-12	16:30:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:34.44	\N	2018-05-11 09:19:42.114
123	2018-05-12	21:00:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:34.444	\N	2018-05-11 09:19:42.118
128	2018-05-12	18:30:00	Torture Chamber	"booked"	2	Booked	2018-05-11 09:19:34.486	\N	2018-05-11 09:19:42.163
133	2018-05-12	16:00:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:34.492	\N	2018-05-11 09:19:42.173
105	2018-05-11	20:00:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:25.036	\N	2018-05-11 09:19:42.847
112	2018-05-11	15:00:00	Gangsta's Cage	"booked"	3	Booked	2018-05-11 09:19:25.062	\N	2018-05-11 09:19:42.89
116	2018-05-11	21:00:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:25.066	\N	2018-05-11 09:19:42.895
121	2018-05-12	19:30:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:34.441	\N	2018-05-11 09:19:42.117
125	2018-05-12	14:00:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:34.446	\N	2018-05-11 09:19:42.121
130	2018-05-12	21:30:00	Torture Chamber	"booked"	2	Booked	2018-05-11 09:19:34.488	\N	2018-05-11 09:19:42.168
136	2018-05-12	20:30:00	Gangsta's Cage	"booked"	3	Booked	2018-05-11 09:19:34.494	\N	2018-05-11 09:19:42.177
106	2018-05-11	21:30:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:25.037	\N	2018-05-11 09:19:42.848
111	2018-05-11	22:00:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:25.042	\N	2018-05-11 09:19:42.856
115	2018-05-11	19:30:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:25.065	\N	2018-05-11 09:19:42.894
117	2018-05-12	12:00:00	Egyptian Adventure	{"player_number":"2","price":"60.00"}	1	60.00	2018-05-11 09:19:34.437	\N	2018-05-11 09:19:42.107
122	2018-05-12	18:00:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:34.443	\N	2018-05-11 09:19:42.115
127	2018-05-12	17:00:00	Torture Chamber	"booked"	2	Booked	2018-05-11 09:19:34.485	\N	2018-05-11 09:19:42.161
131	2018-05-12	13:00:00	Gangsta's Cage	{"player_number":"2","price":"60.00"}	3	60.00	2018-05-11 09:19:34.489	\N	2018-05-11 09:19:42.17
135	2018-05-12	19:00:00	Gangsta's Cage	"booked"	3	Booked	2018-05-11 09:19:34.493	\N	2018-05-11 09:19:42.175
102	2018-05-11	15:30:00	Egyptian Adventure	"booked"	1	Booked	2018-05-11 09:19:25.031	\N	2018-05-11 09:19:42.842
107	2018-05-11	16:00:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:25.038	\N	2018-05-11 09:19:42.85
110	2018-05-11	20:30:00	Torture Chamber	{"player_number":"2","price":"60.00"}	2	60.00	2018-05-11 09:19:25.041	\N	2018-05-11 09:19:42.854
\.


--
-- Name: scavengerescape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scavengerescape_id_seq', 137, true);


--
-- Name: scavengerescape scavengerescape_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scavengerescape
    ADD CONSTRAINT scavengerescape_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

