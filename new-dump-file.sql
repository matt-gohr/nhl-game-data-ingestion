--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.21
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: coding_challenge; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA coding_challenge;


ALTER SCHEMA coding_challenge OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: game; Type: TABLE; Schema: coding_challenge; Owner: postgres
--

CREATE TABLE coding_challenge.game (
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    goals integer,
    hits integer,
    points integer DEFAULT 0,
    penalty_minutes integer,
    assists integer DEFAULT 0,
    id integer NOT NULL,
    is_final boolean DEFAULT false NOT NULL,
    game_identifier integer NOT NULL,
    start_date timestamp(6) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE coding_challenge.game OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: coding_challenge; Owner: postgres
--

CREATE SEQUENCE coding_challenge.game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coding_challenge.game_id_seq OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: coding_challenge; Owner: postgres
--

ALTER SEQUENCE coding_challenge.game_id_seq OWNED BY coding_challenge.game.id;


--
-- Name: player; Type: TABLE; Schema: coding_challenge; Owner: eletype
--

CREATE TABLE coding_challenge.player (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    "position" character varying(255),
    number character varying(255),
    player_identifier integer NOT NULL,
    team_id integer
);


ALTER TABLE coding_challenge.player OWNER TO eletype;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: coding_challenge; Owner: eletype
--

CREATE SEQUENCE coding_challenge.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coding_challenge.player_id_seq OWNER TO eletype;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: coding_challenge; Owner: eletype
--

ALTER SEQUENCE coding_challenge.player_id_seq OWNED BY coding_challenge.player.id;


--
-- Name: team; Type: TABLE; Schema: coding_challenge; Owner: eletype
--

CREATE TABLE coding_challenge.team (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    team_identifier integer NOT NULL
);


ALTER TABLE coding_challenge.team OWNER TO eletype;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: coding_challenge; Owner: eletype
--

CREATE SEQUENCE coding_challenge.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coding_challenge.team_id_seq OWNER TO eletype;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: coding_challenge; Owner: eletype
--

ALTER SEQUENCE coding_challenge.team_id_seq OWNED BY coding_challenge.team.id;


--
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    goals integer,
    hits integer,
    points integer DEFAULT 0,
    penalty_minutes integer,
    assists integer DEFAULT 0,
    id integer NOT NULL,
    is_final boolean DEFAULT false NOT NULL,
    game_identifier integer NOT NULL,
    start_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.game OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: eletype
--

CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    "position" character varying(255),
    number character varying(255),
    player_identifier integer NOT NULL,
    team_id integer
);


ALTER TABLE public.player OWNER TO eletype;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: eletype
--

CREATE SEQUENCE public.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO eletype;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eletype
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: eletype
--

CREATE TABLE public.team (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    team_identifier integer NOT NULL
);


ALTER TABLE public.team OWNER TO eletype;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: eletype
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO eletype;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eletype
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: game id; Type: DEFAULT; Schema: coding_challenge; Owner: postgres
--

ALTER TABLE ONLY coding_challenge.game ALTER COLUMN id SET DEFAULT nextval('coding_challenge.game_id_seq'::regclass);


--
-- Name: player id; Type: DEFAULT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.player ALTER COLUMN id SET DEFAULT nextval('coding_challenge.player_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.team ALTER COLUMN id SET DEFAULT nextval('coding_challenge.team_id_seq'::regclass);


--
-- Name: game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- Name: player id; Type: DEFAULT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: coding_challenge; Owner: postgres
--

COPY coding_challenge.game (player_id, team_id, goals, hits, points, penalty_minutes, assists, id, is_final, game_identifier, start_date) FROM stdin;
583	29	0	4	0	0	0	61	t	2022010069	2022-10-03 23:00:00
581	12	0	1	0	0	0	62	t	2022010069	2022-10-03 23:00:00
592	29	0	3	0	0	0	63	t	2022010069	2022-10-03 23:00:00
539	12	0	1	0	2	0	64	t	2022010069	2022-10-03 23:00:00
505	29	0	2	0	0	0	65	t	2022010069	2022-10-03 23:00:00
2322	12	0	1	0	2	0	66	t	2022010069	2022-10-03 23:00:00
502	12	0	7	0	0	1	67	t	2022010069	2022-10-03 23:00:00
491	12	1	3	0	0	1	68	t	2022010069	2022-10-03 23:00:00
536	29	1	2	0	0	0	69	t	2022010069	2022-10-03 23:00:00
587	29	0	2	0	0	1	70	t	2022010069	2022-10-03 23:00:00
599	29	0	1	0	4	0	71	t	2022010069	2022-10-03 23:00:00
600	12	1	0	0	0	2	72	t	2022010069	2022-10-03 23:00:00
543	12	0	1	0	0	2	73	t	2022010069	2022-10-03 23:00:00
495	29	0	1	0	0	0	74	t	2022010069	2022-10-03 23:00:00
500	29	0	3	0	2	0	75	t	2022010069	2022-10-03 23:00:00
606	12	0	1	0	0	2	76	t	2022010069	2022-10-03 23:00:00
509	12	1	1	0	0	1	77	t	2022010069	2022-10-03 23:00:00
503	12	1	0	0	0	1	78	t	2022010069	2022-10-03 23:00:00
506	29	0	1	0	0	0	79	t	2022010069	2022-10-03 23:00:00
526	12	0	3	0	4	0	80	t	2022010069	2022-10-03 23:00:00
2345	12	2	0	0	0	1	81	t	2022010069	2022-10-03 23:00:00
604	12	0	0	0	0	1	82	t	2022010069	2022-10-03 23:00:00
520	29	0	2	0	2	0	83	t	2022010069	2022-10-03 23:00:00
499	12	2	0	0	0	2	84	t	2022010069	2022-10-03 23:00:00
552	12	0	2	0	0	0	85	t	2022010069	2022-10-03 23:00:00
601	29	0	0	0	2	0	86	t	2022010069	2022-10-03 23:00:00
554	29	0	2	0	0	0	87	t	2022010069	2022-10-03 23:00:00
583	29	0	4	0	0	0	88	t	2022010069	2022-10-03 23:00:00
581	12	0	1	0	0	0	89	t	2022010069	2022-10-03 23:00:00
592	29	0	3	0	0	0	90	t	2022010069	2022-10-03 23:00:00
539	12	0	1	0	2	0	91	t	2022010069	2022-10-03 23:00:00
505	29	0	2	0	0	0	92	t	2022010069	2022-10-03 23:00:00
2322	12	0	1	0	2	0	93	t	2022010069	2022-10-03 23:00:00
502	12	0	7	0	0	1	94	t	2022010069	2022-10-03 23:00:00
491	12	1	3	0	0	1	95	t	2022010069	2022-10-03 23:00:00
536	29	1	2	0	0	0	96	t	2022010069	2022-10-03 23:00:00
587	29	0	2	0	0	1	97	t	2022010069	2022-10-03 23:00:00
599	29	0	1	0	4	0	98	t	2022010069	2022-10-03 23:00:00
600	12	1	0	0	0	2	99	t	2022010069	2022-10-03 23:00:00
543	12	0	1	0	0	2	100	t	2022010069	2022-10-03 23:00:00
495	29	0	1	0	0	0	101	t	2022010069	2022-10-03 23:00:00
500	29	0	3	0	2	0	102	t	2022010069	2022-10-03 23:00:00
606	12	0	1	0	0	2	103	t	2022010069	2022-10-03 23:00:00
509	12	1	1	0	0	1	104	t	2022010069	2022-10-03 23:00:00
503	12	1	0	0	0	1	105	t	2022010069	2022-10-03 23:00:00
506	29	0	1	0	0	0	106	t	2022010069	2022-10-03 23:00:00
526	12	0	3	0	4	0	107	t	2022010069	2022-10-03 23:00:00
2345	12	2	0	0	0	1	108	t	2022010069	2022-10-03 23:00:00
604	12	0	0	0	0	1	109	t	2022010069	2022-10-03 23:00:00
520	29	0	2	0	2	0	110	t	2022010069	2022-10-03 23:00:00
499	12	2	0	0	0	2	111	t	2022010069	2022-10-03 23:00:00
552	12	0	2	0	0	0	112	t	2022010069	2022-10-03 23:00:00
601	29	0	0	0	2	0	113	t	2022010069	2022-10-03 23:00:00
554	29	0	2	0	0	0	114	t	2022010069	2022-10-03 23:00:00
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: coding_challenge; Owner: eletype
--

COPY coding_challenge.player (id, name, age, "position", number, player_identifier, team_id) FROM stdin;
511	Aleksi Heimosalmi	19	Defenseman	\N	8482860	\N
514	Kirill Dolzhenkov	18	Right Wing	\N	8483434	\N
490	Joona Luoto	25	Left Wing	46	8481649	\N
515	Trey Fix-Wolansky	23	Right Wing	64	8480441	\N
518	Vasiliy Ponomarev	20	Center	\N	8482102	\N
521	James Malatesta	19	Left Wing	73	8482744	\N
522	Zion Nybeck	20	Left Wing	\N	8482483	\N
523	Sergei Mozyakin	41	Right Wing	\N	8470253	\N
525	Noel Gunler	20	Right Wing	\N	8482080	\N
527	Peter Quenneville	28	Center	75	8477334	\N
529	Teuvo Teravainen	28	Left Wing	86	8476882	\N
501	Robbie Stucker	24	Defenseman	78	8480294	\N
531	Lucas Mercuri	20	Center	\N	8482518	\N
532	Nikolai Makarov	19	Defenseman	\N	8482913	\N
533	Erik Gudbranson	30	Defenseman	44	8475790	\N
534	Jake Gardiner	32	Defenseman	51	8474581	\N
535	Nikita Guslistov	20	Center	\N	8482917	\N
536	Yegor Chinakhov	21	Right Wing	59	8482475	\N
537	Antti Raanta	33	Goalie	32	8477293	\N
539	Nick Blankenburg	24	Defenseman	77	8483565	\N
541	Liam Foudy	22	Center	19	8480853	\N
542	Robert Orr	19	Right Wing	45	8482755	\N
543	Seth Jarvis	20	Center	24	8482093	\N
546	David Jiricek	18	Defenseman	\N	8483460	\N
547	Alexandre Texier	23	Center	42	8480074	\N
549	Jordan Staal	34	Center	11	8473533	\N
550	Sebastian Aho	25	Center	20	8478427	\N
553	Samuel Huo	21	Center	\N	8483857	\N
554	Jake Bean	24	Defenseman	22	8479402	\N
555	Sergei Ivanov	18	Goalie	\N	8483738	\N
558	Martin Rysavy	19	Right Wing	\N	8482926	\N
559	Sean Kuraly	29	Center	7	8476374	\N
560	Ben Boyd	19	Left Wing	56	8482885	\N
561	Patrik Hamrla	19	Goalie	39	8482921	\N
562	Bryce Montgomery	19	Defenseman	58	8482888	\N
563	Blake Murray	21	Center	85	8481677	\N
564	Jacob Kucharski	23	Goalie	40	8481050	\N
566	Kent Johnson	19	Center	13	8482660	\N
567	Cade Webber	21	Defenseman	68	8481570	\N
569	Calvin de Haan	31	Defenseman	44	8475177	\N
570	Kirill Slepets	23	Right Wing	\N	8481724	\N
571	Domenick Fensore	21	Defenseman	89	8481562	\N
572	Nikita Quapp	19	Goalie	\N	8482895	\N
573	Adam Boqvist	22	Defenseman	27	8480871	\N
574	Marcus Bjork	24	Defenseman	\N	8483620	\N
576	Yegor Naumov	19	Goalie	\N	8482899	\N
577	Evan Vierling	20	Center	38	8482152	\N
578	Denton Mateychuk	18	Defenseman	\N	8483485	\N
579	Lane Pederson	25	Center	18	8478967	\N
581	Brett Pesce	27	Defenseman	22	8477488	\N
580	Jesper Fast	30	Right Wing	71	8475855	\N
582	Boone Jenner	29	Center	38	8476432	\N
583	Cole Sillinger	19	Center	34	8482705	\N
584	Jack Roslovic	25	Center	96	8478458	\N
585	Gleb Trikozov	18	Left Wing	\N	8483519	\N
586	Anttoni Honka	22	Defenseman	84	8481615	\N
587	Justin Danforth	29	Right Wing	17	8479941	\N
588	Ethan Bear	25	Defenseman	25	8478451	\N
589	Jalen Chatfield	26	Defenseman	64	8478970	\N
2428	Victor Rask	\N	Center	49	8476437	\N
478	Kevin Wall	22	Right Wing	62	8481756	\N
2299	Owen Sillinger	\N	Center	\N	8483538	\N
479	Frederik Andersen	33	Goalie	31	8475883	\N
481	Maxime Lajoie	24	Defenseman	42	8479320	\N
484	Malte Stromwall	28	Right Wing	\N	8479440	\N
486	Ronan Seeley	20	Defenseman	82	8482187	\N
487	Gustav Nyquist	33	Center	14	8474679	\N
488	Elvis Merzlikins	28	Goalie	90	8478007	\N
489	Johnny Gaudreau	29	Left Wing	13	8476346	\N
492	Jakub Voracek	33	Right Wing	93	8474161	\N
494	Vladislav Gavrikov	26	Defenseman	44	8478882	\N
495	Ole Julian Bjorgvik-Holm	20	Defenseman	94	8482453	\N
496	Massimo Rizzo	21	Center	\N	8481760	\N
497	Alexander Pashin	20	Right Wing	\N	8482212	\N
498	Andrei Svechnikov	22	Right Wing	37	8480830	\N
500	Carson Meyer	25	Right Wing	55	8480292	\N
499	Martin Necas	23	Center	88	8480039	\N
503	Brady Skjei	28	Defenseman	76	8476869	\N
505	Brendan Gaunce	28	Center	23	8476867	\N
506	Emil Bemstrom	23	Center	52	8480205	\N
507	James Fisher	18	Right Wing	\N	8483715	\N
508	Eric Hjorth	21	Defenseman	45	8481659	\N
509	Stefan Noesen	29	Right Wing	29	8476474	\N
510	Luca Del Bel Belluz	18	Center	\N	8483432	\N
512	Simon Forsmark	18	Defenseman	\N	8483674	\N
516	Ondrej Kase	26	Right Wing	25	8478131	\N
517	Jet Greaves	21	Goalie	\N	8482982	\N
519	Alexander Pelevin	18	Defenseman	\N	8483713	\N
520	Josh Dunne	23	Center	21	8482623	\N
526	Stelio Mattheos	23	Right Wing	49	8479989	\N
528	Ville Koivunen	19	Left Wing	\N	8482758	\N
530	Joel Nystrom	20	Defenseman	\N	8482911	\N
538	William Lagesson	26	Defenseman	84	8478021	\N
544	Jake Christiansen	23	Defenseman	32	8481161	\N
545	Daniil Tarasov	23	Goalie	40	8480193	\N
551	Dylan Coghlan	24	Defenseman	52	8479639	\N
513	Alexander Nikishin	21	Defenseman	\N	8482100	\N
540	Jordan Dumais	18	Right Wing	\N	8483688	\N
552	Jordan Martinook	30	Left Wing	48	8476921	\N
556	Andrew Peeke	24	Defenseman	2	8479369	\N
557	Dmitri Voronkov	22	Left Wing	\N	8481716	\N
568	Nolan Lalonde	18	Goalie	\N	8483869	\N
485	Samuel Knazko	20	Defenseman	\N	8482448	\N
2322	Griffin Mendel	\N	Defenseman	\N	8483560	\N
480	Max Pacioretty	33	Left Wing	67	8474157	\N
2345	Derek Stepan	\N	Center	18	8474613	\N
565	Tyler Angle	22	Center	39	8481690	\N
590	Patrik Puistola	21	Right Wing	32	8481574	\N
593	Scott Morrow	19	Defenseman	\N	8482666	\N
596	Cruz Lucius	18	Right Wing	\N	8483479	\N
599	Jamieson Rees	21	Center	81	8481579	\N
602	Tim Berni	22	Defenseman	75	8481072	\N
605	Gavin Bayreuther	28	Defenseman	5	8479945	\N
608	Zach Sawchenko	24	Goalie	36	8479313	\N
611	Kirill Marchenko	22	Right Wing	\N	8480893	\N
614	Corson Ceulemans	19	Defenseman	\N	8482678	\N
591	Justin Robidas	19	Center	46	8482785	\N
594	Tuukka Tieksola	21	Right Wing	\N	8481697	\N
597	Jakub Vondras	18	Goalie	\N	8483754	\N
600	Brent Burns	37	Defenseman	88	8470613	\N
603	Aidan Hreschuk	19	Defenseman	\N	8482680	\N
606	Ryan Dzingel	30	Center	14	8476288	\N
609	Cavan Fitzgerald	26	Defenseman	79	8478981	\N
612	Billy Sweezey	26	Defenseman	\N	8482399	\N
615	Stanislav Svozil	19	Defenseman	81	8482711	\N
477	Guillaume Richard	19	Defenseman	\N	8482692	\N
476	Mikael Pyyhtia	20	Left Wing	\N	8482451	\N
482	Dominik Bokk	22	Right Wing	36	8480827	\N
483	Vladimir Grudinin	18	Defenseman	\N	8483773	\N
491	Jesperi Kotkaniemi	22	Center	82	8480829	\N
493	Jack Drury	22	Center	72	8480835	\N
502	Mackenzie MacEachern	28	Left Wing	28	8476907	\N
504	Patrik Laine	24	Left Wing	29	8479339	\N
524	Joonas Korpisalo	28	Goalie	70	8476914	\N
548	Jackson Blake	19	Right Wing	\N	8482809	\N
575	Alexander Perevalov	18	Left Wing	\N	8483501	\N
592	Eric Robinson	27	Left Wing	50	8480762	\N
595	Ryan Suzuki	21	Center	61	8481576	\N
598	Pyotr Kochetkov	23	Goalie	52	8481611	\N
601	Paul Stastny	36	Center	25	8471669	\N
604	Jaccob Slavin	28	Defenseman	74	8476958	\N
607	Pavel Cajan	19	Goalie	\N	8483805	\N
610	Mathieu Olivier	25	Right Wing	\N	8479671	\N
613	Zach Werenski	25	Defenseman	8	8478460	\N
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: coding_challenge; Owner: eletype
--

COPY coding_challenge.team (id, name, team_identifier) FROM stdin;
9	Columbus Blue Jackets	29
8	Carolina Hurricanes	12
\.


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game (player_id, team_id, goals, hits, points, penalty_minutes, assists, id, is_final, game_identifier, start_date) FROM stdin;
583	29	0	4	0	0	0	61	t	2022010069	2022-10-03 23:00:00
581	12	0	1	0	0	0	62	t	2022010069	2022-10-03 23:00:00
592	29	0	3	0	0	0	63	t	2022010069	2022-10-03 23:00:00
539	12	0	1	0	2	0	64	t	2022010069	2022-10-03 23:00:00
505	29	0	2	0	0	0	65	t	2022010069	2022-10-03 23:00:00
2322	12	0	1	0	2	0	66	t	2022010069	2022-10-03 23:00:00
502	12	0	7	0	0	1	67	t	2022010069	2022-10-03 23:00:00
491	12	1	3	0	0	1	68	t	2022010069	2022-10-03 23:00:00
536	29	1	2	0	0	0	69	t	2022010069	2022-10-03 23:00:00
587	29	0	2	0	0	1	70	t	2022010069	2022-10-03 23:00:00
599	29	0	1	0	4	0	71	t	2022010069	2022-10-03 23:00:00
600	12	1	0	0	0	2	72	t	2022010069	2022-10-03 23:00:00
543	12	0	1	0	0	2	73	t	2022010069	2022-10-03 23:00:00
495	29	0	1	0	0	0	74	t	2022010069	2022-10-03 23:00:00
500	29	0	3	0	2	0	75	t	2022010069	2022-10-03 23:00:00
606	12	0	1	0	0	2	76	t	2022010069	2022-10-03 23:00:00
509	12	1	1	0	0	1	77	t	2022010069	2022-10-03 23:00:00
503	12	1	0	0	0	1	78	t	2022010069	2022-10-03 23:00:00
506	29	0	1	0	0	0	79	t	2022010069	2022-10-03 23:00:00
526	12	0	3	0	4	0	80	t	2022010069	2022-10-03 23:00:00
2345	12	2	0	0	0	1	81	t	2022010069	2022-10-03 23:00:00
604	12	0	0	0	0	1	82	t	2022010069	2022-10-03 23:00:00
520	29	0	2	0	2	0	83	t	2022010069	2022-10-03 23:00:00
499	12	2	0	0	0	2	84	t	2022010069	2022-10-03 23:00:00
552	12	0	2	0	0	0	85	t	2022010069	2022-10-03 23:00:00
601	29	0	0	0	2	0	86	t	2022010069	2022-10-03 23:00:00
554	29	0	2	0	0	0	87	t	2022010069	2022-10-03 23:00:00
583	29	0	4	0	0	0	88	t	2022010069	2022-10-03 23:00:00
581	12	0	1	0	0	0	89	t	2022010069	2022-10-03 23:00:00
592	29	0	3	0	0	0	90	t	2022010069	2022-10-03 23:00:00
539	12	0	1	0	2	0	91	t	2022010069	2022-10-03 23:00:00
505	29	0	2	0	0	0	92	t	2022010069	2022-10-03 23:00:00
2322	12	0	1	0	2	0	93	t	2022010069	2022-10-03 23:00:00
502	12	0	7	0	0	1	94	t	2022010069	2022-10-03 23:00:00
491	12	1	3	0	0	1	95	t	2022010069	2022-10-03 23:00:00
536	29	1	2	0	0	0	96	t	2022010069	2022-10-03 23:00:00
587	29	0	2	0	0	1	97	t	2022010069	2022-10-03 23:00:00
599	29	0	1	0	4	0	98	t	2022010069	2022-10-03 23:00:00
600	12	1	0	0	0	2	99	t	2022010069	2022-10-03 23:00:00
543	12	0	1	0	0	2	100	t	2022010069	2022-10-03 23:00:00
495	29	0	1	0	0	0	101	t	2022010069	2022-10-03 23:00:00
500	29	0	3	0	2	0	102	t	2022010069	2022-10-03 23:00:00
606	12	0	1	0	0	2	103	t	2022010069	2022-10-03 23:00:00
509	12	1	1	0	0	1	104	t	2022010069	2022-10-03 23:00:00
503	12	1	0	0	0	1	105	t	2022010069	2022-10-03 23:00:00
506	29	0	1	0	0	0	106	t	2022010069	2022-10-03 23:00:00
526	12	0	3	0	4	0	107	t	2022010069	2022-10-03 23:00:00
2345	12	2	0	0	0	1	108	t	2022010069	2022-10-03 23:00:00
604	12	0	0	0	0	1	109	t	2022010069	2022-10-03 23:00:00
520	29	0	2	0	2	0	110	t	2022010069	2022-10-03 23:00:00
499	12	2	0	0	0	2	111	t	2022010069	2022-10-03 23:00:00
552	12	0	2	0	0	0	112	t	2022010069	2022-10-03 23:00:00
601	29	0	0	0	2	0	113	t	2022010069	2022-10-03 23:00:00
554	29	0	2	0	0	0	114	t	2022010069	2022-10-03 23:00:00
3616	14	0	1	0	4	0	115	t	2022020003	2022-10-11 23:30:00
3593	14	0	1	0	0	0	116	t	2022020003	2022-10-11 23:30:00
3601	14	0	1	0	0	0	117	t	2022020003	2022-10-11 23:30:00
3598	3	0	4	0	0	0	118	t	2022020003	2022-10-11 23:30:00
3596	14	0	1	0	0	0	119	t	2022020003	2022-10-11 23:30:00
3633	3	0	3	0	0	1	120	t	2022020003	2022-10-11 23:30:00
3606	14	0	3	0	0	0	121	t	2022020003	2022-10-11 23:30:00
3600	3	0	3	0	0	0	122	t	2022020003	2022-10-11 23:30:00
3599	14	0	2	0	0	0	123	t	2022020003	2022-10-11 23:30:00
3603	3	0	2	0	0	1	124	t	2022020003	2022-10-11 23:30:00
3595	3	1	1	0	2	0	125	t	2022020003	2022-10-11 23:30:00
3635	3	0	1	0	2	0	126	t	2022020003	2022-10-11 23:30:00
3628	3	0	3	0	0	1	127	t	2022020003	2022-10-11 23:30:00
3618	3	0	2	0	0	1	128	t	2022020003	2022-10-11 23:30:00
3608	3	0	1	0	0	1	129	t	2022020003	2022-10-11 23:30:00
3615	3	0	1	0	0	0	130	t	2022020003	2022-10-11 23:30:00
3613	14	0	1	0	4	0	131	t	2022020003	2022-10-11 23:30:00
3627	14	1	1	0	0	0	132	t	2022020003	2022-10-11 23:30:00
3612	14	0	2	0	0	1	133	t	2022020003	2022-10-11 23:30:00
3617	14	0	2	0	2	0	134	t	2022020003	2022-10-11 23:30:00
3605	3	0	1	0	0	1	135	t	2022020003	2022-10-11 23:30:00
3619	3	2	0	0	0	0	136	t	2022020003	2022-10-11 23:30:00
3602	14	0	1	0	0	0	137	t	2022020003	2022-10-11 23:30:00
3610	14	0	2	0	0	0	138	t	2022020003	2022-10-11 23:30:00
3604	3	0	0	0	4	0	139	t	2022020003	2022-10-11 23:30:00
3597	14	0	0	0	0	1	140	t	2022020003	2022-10-11 23:30:00
3625	3	0	1	0	2	0	141	t	2022020003	2022-10-11 23:30:00
3634	14	0	1	0	0	0	142	t	2022020003	2022-10-11 23:30:00
3592	3	0	1	0	0	0	143	t	2022020003	2022-10-11 23:30:00
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: eletype
--

COPY public.player (id, name, age, "position", number, player_identifier, team_id) FROM stdin;
511	Aleksi Heimosalmi	19	Defenseman	\N	8482860	\N
514	Kirill Dolzhenkov	18	Right Wing	\N	8483434	\N
490	Joona Luoto	25	Left Wing	46	8481649	\N
515	Trey Fix-Wolansky	23	Right Wing	64	8480441	\N
518	Vasiliy Ponomarev	20	Center	\N	8482102	\N
521	James Malatesta	19	Left Wing	73	8482744	\N
522	Zion Nybeck	20	Left Wing	\N	8482483	\N
523	Sergei Mozyakin	41	Right Wing	\N	8470253	\N
525	Noel Gunler	20	Right Wing	\N	8482080	\N
527	Peter Quenneville	28	Center	75	8477334	\N
529	Teuvo Teravainen	28	Left Wing	86	8476882	\N
501	Robbie Stucker	24	Defenseman	78	8480294	\N
531	Lucas Mercuri	20	Center	\N	8482518	\N
532	Nikolai Makarov	19	Defenseman	\N	8482913	\N
533	Erik Gudbranson	30	Defenseman	44	8475790	\N
534	Jake Gardiner	32	Defenseman	51	8474581	\N
535	Nikita Guslistov	20	Center	\N	8482917	\N
536	Yegor Chinakhov	21	Right Wing	59	8482475	\N
537	Antti Raanta	33	Goalie	32	8477293	\N
539	Nick Blankenburg	24	Defenseman	77	8483565	\N
541	Liam Foudy	22	Center	19	8480853	\N
542	Robert Orr	19	Right Wing	45	8482755	\N
543	Seth Jarvis	20	Center	24	8482093	\N
546	David Jiricek	18	Defenseman	\N	8483460	\N
547	Alexandre Texier	23	Center	42	8480074	\N
549	Jordan Staal	34	Center	11	8473533	\N
550	Sebastian Aho	25	Center	20	8478427	\N
553	Samuel Huo	21	Center	\N	8483857	\N
554	Jake Bean	24	Defenseman	22	8479402	\N
555	Sergei Ivanov	18	Goalie	\N	8483738	\N
558	Martin Rysavy	19	Right Wing	\N	8482926	\N
559	Sean Kuraly	29	Center	7	8476374	\N
560	Ben Boyd	19	Left Wing	56	8482885	\N
561	Patrik Hamrla	19	Goalie	39	8482921	\N
562	Bryce Montgomery	19	Defenseman	58	8482888	\N
563	Blake Murray	21	Center	85	8481677	\N
564	Jacob Kucharski	23	Goalie	40	8481050	\N
566	Kent Johnson	19	Center	13	8482660	\N
567	Cade Webber	21	Defenseman	68	8481570	\N
569	Calvin de Haan	31	Defenseman	44	8475177	\N
570	Kirill Slepets	23	Right Wing	\N	8481724	\N
571	Domenick Fensore	21	Defenseman	89	8481562	\N
572	Nikita Quapp	19	Goalie	\N	8482895	\N
573	Adam Boqvist	22	Defenseman	27	8480871	\N
574	Marcus Bjork	24	Defenseman	\N	8483620	\N
576	Yegor Naumov	19	Goalie	\N	8482899	\N
577	Evan Vierling	20	Center	38	8482152	\N
578	Denton Mateychuk	18	Defenseman	\N	8483485	\N
579	Lane Pederson	25	Center	18	8478967	\N
581	Brett Pesce	27	Defenseman	22	8477488	\N
580	Jesper Fast	30	Right Wing	71	8475855	\N
582	Boone Jenner	29	Center	38	8476432	\N
583	Cole Sillinger	19	Center	34	8482705	\N
584	Jack Roslovic	25	Center	96	8478458	\N
585	Gleb Trikozov	18	Left Wing	\N	8483519	\N
586	Anttoni Honka	22	Defenseman	84	8481615	\N
587	Justin Danforth	29	Right Wing	17	8479941	\N
588	Ethan Bear	25	Defenseman	25	8478451	\N
589	Jalen Chatfield	26	Defenseman	64	8478970	\N
2428	Victor Rask	\N	Center	49	8476437	\N
3592	Braden Schneider	21	Defenseman	4	8482073	\N
3594	Haydn Fleury	26	Defenseman	7	8477938	\N
478	Kevin Wall	22	Right Wing	62	8481756	\N
2299	Owen Sillinger	\N	Center	\N	8483538	\N
479	Frederik Andersen	33	Goalie	31	8475883	\N
481	Maxime Lajoie	24	Defenseman	42	8479320	\N
484	Malte Stromwall	28	Right Wing	\N	8479440	\N
486	Ronan Seeley	20	Defenseman	82	8482187	\N
487	Gustav Nyquist	33	Center	14	8474679	\N
488	Elvis Merzlikins	28	Goalie	90	8478007	\N
489	Johnny Gaudreau	29	Left Wing	13	8476346	\N
492	Jakub Voracek	33	Right Wing	93	8474161	\N
494	Vladislav Gavrikov	26	Defenseman	44	8478882	\N
495	Ole Julian Bjorgvik-Holm	20	Defenseman	94	8482453	\N
496	Massimo Rizzo	21	Center	\N	8481760	\N
497	Alexander Pashin	20	Right Wing	\N	8482212	\N
498	Andrei Svechnikov	22	Right Wing	37	8480830	\N
500	Carson Meyer	25	Right Wing	55	8480292	\N
499	Martin Necas	23	Center	88	8480039	\N
503	Brady Skjei	28	Defenseman	76	8476869	\N
505	Brendan Gaunce	28	Center	23	8476867	\N
506	Emil Bemstrom	23	Center	52	8480205	\N
507	James Fisher	18	Right Wing	\N	8483715	\N
508	Eric Hjorth	21	Defenseman	45	8481659	\N
509	Stefan Noesen	29	Right Wing	29	8476474	\N
510	Luca Del Bel Belluz	18	Center	\N	8483432	\N
512	Simon Forsmark	18	Defenseman	\N	8483674	\N
516	Ondrej Kase	26	Right Wing	25	8478131	\N
517	Jet Greaves	21	Goalie	\N	8482982	\N
519	Alexander Pelevin	18	Defenseman	\N	8483713	\N
520	Josh Dunne	23	Center	21	8482623	\N
526	Stelio Mattheos	23	Right Wing	49	8479989	\N
528	Ville Koivunen	19	Left Wing	\N	8482758	\N
530	Joel Nystrom	20	Defenseman	\N	8482911	\N
538	William Lagesson	26	Defenseman	84	8478021	\N
544	Jake Christiansen	23	Defenseman	32	8481161	\N
545	Daniil Tarasov	23	Goalie	40	8480193	\N
551	Dylan Coghlan	24	Defenseman	52	8479639	\N
513	Alexander Nikishin	21	Defenseman	\N	8482100	\N
540	Jordan Dumais	18	Right Wing	\N	8483688	\N
552	Jordan Martinook	30	Left Wing	48	8476921	\N
556	Andrew Peeke	24	Defenseman	2	8479369	\N
557	Dmitri Voronkov	22	Left Wing	\N	8481716	\N
568	Nolan Lalonde	18	Goalie	\N	8483869	\N
3596	Corey Perry	37	Right Wing	10	8470621	\N
485	Samuel Knazko	20	Defenseman	\N	8482448	\N
2322	Griffin Mendel	\N	Defenseman	\N	8483560	\N
3599	Victor Hedman	31	Defenseman	77	8475167	\N
480	Max Pacioretty	33	Left Wing	67	8474157	\N
2345	Derek Stepan	\N	Center	18	8474613	\N
565	Tyler Angle	22	Center	39	8481690	\N
590	Patrik Puistola	21	Right Wing	32	8481574	\N
593	Scott Morrow	19	Defenseman	\N	8482666	\N
596	Cruz Lucius	18	Right Wing	\N	8483479	\N
599	Jamieson Rees	21	Center	81	8481579	\N
602	Tim Berni	22	Defenseman	75	8481072	\N
605	Gavin Bayreuther	28	Defenseman	5	8479945	\N
608	Zach Sawchenko	24	Goalie	36	8479313	\N
611	Kirill Marchenko	22	Right Wing	\N	8480893	\N
614	Corson Ceulemans	19	Defenseman	\N	8482678	\N
3593	Cole Koepke	24	Left Wing	45	8481043	\N
3595	Barclay Goodrow	29	Center	21	8476624	\N
3597	Nikita Kucherov	29	Right Wing	86	8476453	\N
3598	Alexis Lafrenière	21	Left Wing	13	8482109	\N
3601	Ross Colton	26	Center	79	8479525	\N
3605	Chris Kreider	31	Left Wing	20	8475184	\N
3609	Adam Fox	24	Defenseman	23	8479323	\N
3613	Kaapo Kakko	21	Right Wing	24	8481554	\N
3616	Nicholas Paul	27	Left Wing	20	8477426	\N
3619	Mika Zibanejad	29	Center	93	8476459	\N
3622	Andrei Vasilevskiy	28	Goalie	88	8476883	\N
3625	Pierre-Edouard Bellemare	37	Left Wing	41	8477930	\N
3628	Jacob Trouba	28	Defenseman	8	8476885	\N
3631	Libor Hajek	24	Defenseman	25	8479333	\N
3634	Vladislav Namestnikov	29	Center	90	8476480	\N
591	Justin Robidas	19	Center	46	8482785	\N
594	Tuukka Tieksola	21	Right Wing	\N	8481697	\N
597	Jakub Vondras	18	Goalie	\N	8483754	\N
600	Brent Burns	37	Defenseman	88	8470613	\N
603	Aidan Hreschuk	19	Defenseman	\N	8482680	\N
606	Ryan Dzingel	30	Center	14	8476288	\N
609	Cavan Fitzgerald	26	Defenseman	79	8478981	\N
612	Billy Sweezey	26	Defenseman	\N	8482399	\N
615	Stanislav Svozil	19	Defenseman	81	8482711	\N
3600	Ryan Reaves	35	Right Wing	75	8471817	\N
3603	Ryan Lindgren	24	Defenseman	55	8479324	\N
3607	Ian Cole	33	Defenseman	28	8474013	\N
3611	Dryden Hunt	26	Left Wing	29	8478211	\N
3614	Gabriel Fortier	22	Left Wing	82	8480863	\N
3617	Erik Cernak	25	Defenseman	81	8478416	\N
3620	Alex Killorn	33	Left Wing	17	8473986	\N
3623	Vitali Kravtsov	22	Right Wing	74	8480833	\N
3626	Vincent Trocheck	29	Center	16	8476389	\N
3629	Mikhail Sergachev	24	Defenseman	98	8479410	\N
3632	Zac Jones	21	Defenseman	6	8481708	\N
3635	Filip Chytil	23	Center	72	8480078	\N
477	Guillaume Richard	19	Defenseman	\N	8482692	\N
476	Mikael Pyyhtia	20	Left Wing	\N	8482451	\N
482	Dominik Bokk	22	Right Wing	36	8480827	\N
483	Vladimir Grudinin	18	Defenseman	\N	8483773	\N
491	Jesperi Kotkaniemi	22	Center	82	8480829	\N
493	Jack Drury	22	Center	72	8480835	\N
502	Mackenzie MacEachern	28	Left Wing	28	8476907	\N
504	Patrik Laine	24	Left Wing	29	8479339	\N
524	Joonas Korpisalo	28	Goalie	70	8476914	\N
548	Jackson Blake	19	Right Wing	\N	8482809	\N
575	Alexander Perevalov	18	Left Wing	\N	8483501	\N
592	Eric Robinson	27	Left Wing	50	8480762	\N
595	Ryan Suzuki	21	Center	61	8481576	\N
598	Pyotr Kochetkov	23	Goalie	52	8481611	\N
601	Paul Stastny	36	Center	25	8471669	\N
604	Jaccob Slavin	28	Defenseman	74	8476958	\N
607	Pavel Cajan	19	Goalie	\N	8483805	\N
610	Mathieu Olivier	25	Right Wing	\N	8479671	\N
613	Zach Werenski	25	Defenseman	8	8478460	\N
3602	Cal Foote	23	Defenseman	52	8479984	\N
3604	Brandon Hagel	24	Left Wing	38	8479542	\N
3606	Philippe Myers	25	Defenseman	5	8479026	\N
3608	Artemi Panarin	30	Left Wing	10	8478550	\N
3610	Pat Maroon	34	Left Wing	14	8474034	\N
3612	Brayden Point	26	Center	21	8478010	\N
3615	Jimmy Vesey	29	Left Wing	26	8476918	\N
3618	Ryan Carpenter	31	Center	22	8477846	\N
3621	Sammy Blais	26	Left Wing	91	8478104	\N
3624	Igor Shesterkin	26	Goalie	31	8478048	\N
3627	Steven Stamkos	32	Center	91	8474564	\N
3630	Pierre-Cedric Labrie	35	Left Wing	49	8474201	\N
3633	K'Andre Miller	22	Defenseman	79	8480817	\N
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: eletype
--

COPY public.team (id, name, team_identifier) FROM stdin;
9	Columbus Blue Jackets	29
8	Carolina Hurricanes	12
74	Tampa Bay Lightning	14
75	New York Rangers	3
\.


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: coding_challenge; Owner: postgres
--

SELECT pg_catalog.setval('coding_challenge.game_id_seq', 114, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: coding_challenge; Owner: eletype
--

SELECT pg_catalog.setval('coding_challenge.player_id_seq', 3591, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: coding_challenge; Owner: eletype
--

SELECT pg_catalog.setval('coding_challenge.team_id_seq', 73, true);


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_id_seq', 143, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eletype
--

SELECT pg_catalog.setval('public.player_id_seq', 3635, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eletype
--

SELECT pg_catalog.setval('public.team_id_seq', 75, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: coding_challenge; Owner: postgres
--

ALTER TABLE ONLY coding_challenge.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: player unique_external_id; Type: CONSTRAINT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.player
    ADD CONSTRAINT unique_external_id UNIQUE (player_identifier);


--
-- Name: team unique_team_external_id; Type: CONSTRAINT; Schema: coding_challenge; Owner: eletype
--

ALTER TABLE ONLY coding_challenge.team
    ADD CONSTRAINT unique_team_external_id UNIQUE (team_identifier);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: player unique_external_id; Type: CONSTRAINT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT unique_external_id UNIQUE (player_identifier);


--
-- Name: team unique_team_external_id; Type: CONSTRAINT; Schema: public; Owner: eletype
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT unique_team_external_id UNIQUE (team_identifier);


--
-- Name: game player_id; Type: FK CONSTRAINT; Schema: coding_challenge; Owner: postgres
--

ALTER TABLE ONLY coding_challenge.game
    ADD CONSTRAINT player_id FOREIGN KEY (player_id) REFERENCES coding_challenge.player(id);


--
-- Name: game player_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT player_id FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- PostgreSQL database dump complete
--

