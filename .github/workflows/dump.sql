--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenses (
    taxes real DEFAULT 0,
    insurance real DEFAULT 0,
    water real DEFAULT 0,
    sewer real DEFAULT 0,
    garbage real DEFAULT 0,
    electric real DEFAULT 0,
    gas real DEFAULT 0,
    hoa real DEFAULT 0,
    lot real DEFAULT 0,
    vacancy real DEFAULT 0,
    repairs real DEFAULT 0,
    capex real DEFAULT 0,
    management real DEFAULT 0,
    mortgage real DEFAULT 0,
    id integer NOT NULL
);


ALTER TABLE public.expenses OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: listing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listing (
    "mlsStatus" text,
    price integer,
    sqft integer,
    "pricePerSqFt" integer,
    "lotSize" integer,
    beds real,
    baths real,
    "fullBaths" real,
    "partialBaths" real,
    "streetLine" text,
    stories real,
    city text,
    state text,
    zip text,
    "soldDate" bigint,
    "propertyType" smallint,
    "yearBuilt" smallint,
    "timeZone" text,
    url text,
    location text,
    "propertyId" integer,
    "listingId" integer,
    latitude real,
    longitude real,
    "mlsId" text,
    hoa integer
);


ALTER TABLE public.listing OWNER TO postgres;

--
-- Name: searches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.searches (
    id integer NOT NULL,
    city text,
    state text,
    "expenseFk" integer,
    zip text,
    "user" integer,
    beds integer,
    "minBath" real,
    "maxBath" real
);


ALTER TABLE public.searches OWNER TO postgres;

--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.searches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.searches_id_seq OWNER TO postgres;

--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.searches_id_seq OWNED BY public.searches.id;


--
-- Name: stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats (
    "medianPrice" real,
    "modePrice" integer,
    "averagePrice" real,
    city text,
    state text,
    zip text,
    beds real,
    baths real,
    "averagePricePerSqFt" real,
    "modePricePerSqFt" integer,
    "medianPricePerSqFt" real,
    "averageSqFt" real,
    "modeSqFt" integer,
    "medianSqFt" real,
    "averageLotSize" real,
    "modeLotSize" integer,
    "medianLotSize" real,
    "averageBeds" real,
    "medianBeds" real,
    "modeBeds" integer,
    "averageBaths" real,
    "medianBaths" real,
    "modeBaths" integer,
    "averageHoa" real,
    "medianHoa" real,
    "modeHoa" integer,
    "averageYearBuilt" real,
    "medianYearBuilt" real,
    "modeYearBuilt" integer,
    "curDateUtc" date
);


ALTER TABLE public.stats OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: searches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.searches ALTER COLUMN id SET DEFAULT nextval('public.searches_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenses (taxes, insurance, water, sewer, garbage, electric, gas, hoa, lot, vacancy, repairs, capex, management, mortgage, id) FROM stdin;
100	100	100	100	100	100	100	100	100	100	100	100	100	100	2
100	100	100	100	100	100	100	100	100	100	100	100	100	100	3
100	100	100	100	100	100	100	100	100	100	100	100	100	100	4
100	100	100	100	100	100	100	100	100	100	100	100	100	100	6
100	100	100	100	100	100	100	100	100	100	100	100	100	100	7
100	100	100	100	100	100	100	100	100	100	100	100	100	100	8
100	100	100	100	100	100	100	100	100	100	100	100	100	100	9
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	10
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	11
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	12
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	13
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	14
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	15
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	16
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	17
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	18
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	19
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	20
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	21
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	22
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	23
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	24
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	25
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	26
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	27
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	28
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	29
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	30
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	31
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	32
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	33
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	34
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	63
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	35
100	100	100	100	100	100	100	100	100	100	100	100	100	100	72
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	36
100	100	100	100	100	100	100	100	100	100	100	100	100	100	64
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	37
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	77
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	38
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	65
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	39
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	73
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	40
100	100	100	100	100	100	100	100	100	100	100	100	100	100	66
100	100	100	100	100	100	100	100	100	100	100	100	100	100	41
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	42
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	83
100	100	100	100	100	100	100	100	100	100	100	100	100	100	43
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	44
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	67
100	100	100	100	100	100	100	100	100	100	100	100	100	100	45
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	46
100	100	100	100	100	100	100	100	100	100	100	100	100	100	74
100	100	100	100	100	100	100	100	100	100	100	100	100	100	47
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	48
100	100	100	100	100	100	100	100	100	100	100	100	100	100	68
100	100	100	100	100	100	100	100	100	100	100	100	100	100	49
100	100	100	100	100	100	100	100	100	100	100	100	100	100	50
100	100	100	100	100	100	100	100	100	100	100	100	100	100	51
100	100	100	100	100	100	100	100	100	100	100	100	100	100	52
100	100	100	100	100	100	100	100	100	100	100	100	100	100	53
100	100	100	100	100	100	100	100	100	100	100	100	100	100	54
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	55
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	81
100	100	100	100	100	100	100	100	100	100	100	100	100	100	56
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	69
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	57
100	100	100	100	100	100	100	100	100	100	100	100	100	100	78
100	100	100	100	100	100	100	100	100	100	100	100	100	100	58
100	100	100	100	100	100	100	100	100	100	100	100	100	100	70
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	59
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	79
100	100	100	100	100	100	100	100	100	100	100	100	100	100	60
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	75
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	61
100	100	100	100	100	100	100	100	100	100	100	100	100	100	80
100	100	100	100	100	100	100	100	100	100	100	100	100	100	62
105	50	36	0	26	116	0	12	0	82	80	80	100	1200	71
100	100	100	100	100	100	100	100	100	100	100	100	100	100	76
100	100	100	100	100	100	100	100	100	100	100	100	100	100	5
100	100	100	100	100	100	100	100	100	100	100	100	100	100	82
110	110	50	10	30	80	10	10	10	80	70	70	90	1100	1
100	100	100	100	100	100	100	100	100	100	100	100	100	100	84
\.


--
-- Data for Name: listing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listing ("mlsStatus", price, sqft, "pricePerSqFt", "lotSize", beds, baths, "fullBaths", "partialBaths", "streetLine", stories, city, state, zip, "soldDate", "propertyType", "yearBuilt", "timeZone", url, location, "propertyId", "listingId", latitude, longitude, "mlsId", hoa) FROM stdin;
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Coming Soon	270000	1720	157	9927	3	3	3	\N	2839 Jeffrey Ct	1	Arnold	MO	63010	\N	6	1978	US/Central	/MO/Arnold/2839-Jeffrey-Ct-63010/home/79988170	Highland House Manor Add	79988170	164249395	38.408794	-90.404625	22079175	\N
Active	27000	\N	\N	35719	\N	\N	\N	\N	1 Romaine Creek Rd Lot B	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Rock-Township/1-Romaine-Creek-Rd-63026/home/183571633	Joshua Xing	183571633	164245329	38.468903	-90.43697	22069316	\N
Active	230000	1620	142	11326	3	2.5	2	1	1738 Melody Ln	1.5	Arnold	MO	63010	\N	6	1967	US/Central	/MO/Arnold/1738-Melody-Ln-63010/home/79963147	Maxville Meadows	79963147	162829991	38.444836	-90.3941	22073927	\N
Active	249900	1416	176	8625	4	2.5	2	1	805 Country Glen Dr	1.5	Imperial	MO	63052	\N	6	1990	US/Central	/MO/Imperial/805-Country-Glen-Dr-63052/home/79996164	Country Cottage Estates	79996164	163975992	38.393818	-90.37033	22078543	19
Active	395000	2995	132	7405	4	2.5	2	1	1567 Oakglen Dr	1.5	Fenton	MO	63026	\N	6	1988	US/Central	/MO/Fenton/1567-Oakglen-Dr-63026/home/93604528	Villages Of Remington Oaks One	93604528	163875129	38.511066	-90.480354	22078133	63
Active	248900	1073	232	6098	3	3	3	\N	358 Green Jade Estates Dr	1.5	Fenton	MO	63026	\N	6	2003	US/Central	/MO/Fenton/358-Green-Jade-Estates-Dr-63026/home/79968390	Shangri La Estates 05	79968390	163882765	38.497395	-90.42392	22078414	\N
Active	1107720	\N	\N	2680682	0	\N	\N	\N	999 Diehl Rd	\N	Fenton	MO	63026	\N	7	\N	US/Central	/MO/Fenton/999-Diehl-Rd-63026/home/108362082	not applicable	108362082	163874461	38.473087	-90.469055	22078306	\N
Active	480625	2940	163	\N	4	2.5	2	1	704 Fox Creek Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/704-Fox-Creek-Dr-63026/home/183473037	Estates at Fox Creek	183473037	164133000	38.484417	-90.434875	22078682	\N
Active	449000	\N	\N	377447	\N	\N	\N	\N	801 Romaine Creek Rd	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Fenton/801-Romaine-Creek-Rd-63026/home/79973188	Fenton	79973188	163840513	38.468746	-90.44583	22078092	\N
Active	586000	3500	167	17860	4	3.5	3	1	1442 Hawkins Meadow Dr	2	Fenton	MO	63026	\N	6	2001	US/Central	/MO/Fenton/1442-Hawkins-Meadow-Dr-63026/home/93629266	Hawkins Meadow	93629266	163812313	38.503815	-90.48707	22077445	46
Active	339900	1878	181	13504	3	2	2	\N	270 Keystone Dr	1	Fenton	MO	63026	\N	6	1998	US/Central	/MO/Fenton/270-Keystone-Dr-63026/home/62756655	Winter Valley	62756655	163876453	38.489075	-90.429214	22078246	167
Active	359900	1532	235	9148	3	2	2	\N	2904 Sierra View Ct	1	Imperial	MO	63052	\N	6	2022	US/Central	/MO/IMPERIAL/2904-SIERRA-VIEW-CT-63052/home/177681223	Huntington Glenn	177681223	163798673	38.422844	-90.42481	22077136	\N
Active	232600	1209	192	8451	3	2	2	\N	206 Appletree Ct	1	Arnold	MO	63010	\N	6	1958	US/Central	/MO/Arnold/206-Appletree-Ct-63010/home/79974610	Creekwood Terrace	79974610	163785752	38.447815	-90.4118	22077695	\N
Active	249900	1444	173	15743	3	2	2	\N	2256 Grant Dr	1.5	Arnold	MO	63010	\N	6	1968	US/Central	/MO/Arnold/2256-Grant-63010/home/79967179	Glatt Park	79967179	163268041	38.426666	-90.39535	22075896	\N
Active	249900	1862	134	7841	5	2	2	\N	1383 Trails Dr	1.5	Fenton	MO	63026	\N	6	1979	US/Central	/MO/Fenton/1383-Trails-Dr-63026/home/62756997	San Luis Trails 04	62756997	163841037	38.498283	-90.501045	22078171	\N
Active	380000	2459	155	83313	4	2.5	2	1	6450 Hickory Hilltop Dr	2	Imperial	MO	63052	\N	6	1979	US/Central	/MO/Imperial/6450-Hickory-Hilltop-Rd-63052/home/79990848	Hickory Heights	79990848	163709773	38.369705	-90.48202	22077260	\N
Active	350000	1905	184	6970	4	2.5	2	1	2991 Sierra View Ct	2	Imperial	MO	63052	\N	6	2021	US/Central	/MO/Imperial/2991-Sierra-View-Ct-63052/home/176547096	Huntington Glen	176547096	163541390	38.422207	-90.427795	22073914	42
Active	294990	1352	218	6382	3	2	2	\N	4573 Annadale Ave - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4573-Annadale-Ave-Tbb-Unknown/home/183333281	Arlington Heights	183333281	163756242	38.416138	-90.431694	22077529	\N
Active	284990	1265	225	6843	3	1	1	\N	4600 Annadale Ave - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4600-Annadale-Ave-Tbb-Unknown/home/183333275	Arlington Heights	183333275	163756235	38.41533	-90.433556	22077414	\N
Active	237500	1100	216	\N	2	1.5	\N	3	3185 5 Oaks Dr	2	Arnold	MO	63010	\N	6	1993	US/Central	/MO/Arnold/3185-5-Oaks-Dr-63010/home/79988340	Five Oaks	79988340	163610782	38.410347	-90.414185	22077052	\N
Active	395000	1556	254	7405	3	2	2	\N	4546 Annandale	1	Imperial	MO	63052	\N	6	2022	US/Central	/MO/Imperial/4546-Annandale-Unknown/home/183311833	Arlington Hts	183311833	163723835	38.386772	-90.434784	22077273	\N
Active	229900	812	283	212573	3	1.5	1	1	1300 Wolf Hollow Rd	1.5	Imperial	MO	63052	\N	6	1950	US/Central	/MO/Imperial/1300-Wolf-Hollow-Rd-63052/home/79997613	Naes Ed	79997613	163433001	38.358063	-90.38596	22076736	\N
Active	125000	720	174	39204	1	1	1	\N	1898 Old Lemay Ferry Rd	1	Arnold	MO	63010	\N	6	1965	US/Central	/MO/Arnold/1898-Old-Lemay-Ferry-Rd-63010/home/79966638	n a	79966638	162769743	38.430763	-90.39255	22074723	\N
Active	393900	2784	141	\N	4	2.5	2	1	2 Sequoia at Fox Crk	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Rock-Township/2-Fox-Creek-Dr-63026/home/183181787	Estates at Fox Creek	183181787	163307544	38.48282	-90.432144	22076302	\N
Active	310000	2572	121	12632	3	3	2	2	3426 Green Forest Ct	1.5	Arnold	MO	63010	\N	6	2000	US/Central	/MO/Arnold/3426-Green-Forest-Ct-63010/home/79993836	Rockwood Forest	79993836	163061896	38.4094	-90.35713	22075678	10
Active	695000	2400	290	\N	0	\N	\N	\N	4700 Golden Vly	1.5	Unincorporated	MO	63052	\N	6	\N	US/Central	/MO/Antonia/4700-Golden-VLY-63052/home/183224243	Emerald Pointe	183224243	163424676	38.389553	-90.42194	22076732	\N
Active	290000	1494	194	10890	3	3	3	\N	1766 San Luis Rey Pkwy	1	Fenton	MO	63026	\N	6	1985	US/Central	/MO/Fenton/1766-San-Luis-Rey-Pkwy-63026/home/93596222	San Paulo Estates	93596222	163431721	38.51305	-90.48266	22076848	8
Active	300000	2016	149	9148	4	2.5	2	1	5220 Summer Cir	2	Imperial	MO	63052	\N	6	1995	US/Central	/MO/Imperial/5220-Summer-Cir-63052/home/79997258	Summerfield Parkside Estates 01	79997258	164212641	38.380074	-90.39844	22078720	17
Active	230000	1382	166	7680	4	1.5	1	1	872 Weedel Dr	1	Arnold	MO	63010	\N	6	1961	US/Central	/MO/Arnold/872-Weedel-Dr-63010/home/79964120	Highland Park South 1	79964120	164259263	38.44303	-90.36787	22079187	\N
Active	254900	1064	240	15429	3	3	3	\N	143 Mareda Ln	1	Arnold	MO	63010	\N	6	1969	US/Central	/MO/Arnold/143-Mareda-Ln-63010/home/79988147	Santa Rosa Estates	79988147	164258235	38.410896	-90.40356	22079254	17
Active	190000	960	198	7841	3	2	2	\N	1165 New Towne Rd	1.5	Arnold	MO	63010	\N	6	1987	US/Central	/MO/Arnold/1165-New-Towne-Rd-63010/home/62724380	New Towne 05	62724380	162140845	38.39358	-90.3672	22071743	\N
Active	341649	1728	198	\N	3	2.5	2	1	2810 Winding Valley Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2810-Winding-Valley-Dr-63026/home/183486590	Valley at Winding Bluffs	183486590	164147222	38.46932	-90.462616	22078820	\N
Active	384739	2081	185	\N	4	2.5	2	1	2840 Winding Valley Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2840-Winding-Valley-Dr-63026/home/183485230	Valley at Winding Bluffs	183485230	164146600	38.46957	-90.461876	22078805	\N
Active	315000	2598	121	9148	3	2.5	2	1	5446 Mystic Oaks Dr	2	Imperial	MO	63052	\N	6	2000	US/Central	/MO/Imperial/5446-Mystic-Oaks-Dr-63052/home/80025337	Oaks 03	80025337	162972986	38.390755	-90.37662	22068388	15
Active	349900	2053	170	16988	3	3	3	\N	1723 Smizer Mill Rd	1	Fenton	MO	63026	\N	6	1986	US/Central	/MO/Fenton/1723-Smizer-Mill-Rd-63026/home/93596888	Sancta Maria Estates 7	93596888	162781912	38.52252	-90.490906	22074752	17
Active	214900	1662	129	26136	3	2	2	\N	3577 Lebaron	1.5	Arnold	MO	63010	\N	6	1978	US/Central	/MO/Arnold/3577-Lebaron-Dr-63010/home/79975308	Seville Estates	79975308	163206685	38.433094	-90.42326	22074975	\N
Active	395000	3889	102	43560	3	2.5	2	1	35 Mount Carmel Ct	1	Fenton	MO	63026	\N	6	1987	US/Central	/MO/Fenton/35-Mt-Carmel-Ct-63026/home/93604621	Summit View 2	93604621	162891539	38.508617	-90.477776	22075361	13
Active	260000	1189	219	11652	3	2	2	\N	67 W Lakewood Dr	1	Fenton	MO	63026	\N	6	1962	US/Central	/MO/Fenton/67-W-Lakewood-Dr-63026/home/79969877	Fond Du Lac Un 02	79969877	162300117	38.4903	-90.47228	22072889	25
Active	210000	1679	125	43560	3	2	2	\N	444 Schneider Hill Ct	\N	Fenton	MO	63026	\N	4	1960	US/Central	/MO/Fenton/444-Schneider-Hill-Ct-63026/home/62718252	Sur 664	62718252	162276325	38.465523	-90.433105	22072569	\N
Active	292000	1885	155	9875	3	3.5	3	1	6018 3rd St	2	Imperial	MO	63052	\N	6	1993	US/Central	/MO/Imperial/6018-3rd-St-63052/home/79997959	Town Kimmswick	79997959	162267945	38.367252	-90.36439	22072175	\N
Active	360000	2480	145	8276	4	2.5	2	1	949 Konert Lake Dr	2	Fenton	MO	63026	\N	6	2015	US/Central	/MO/Fenton/949-Konert-Lake-Dr-63026/home/109850749	Konert Lake Estates	109850749	162406660	38.46092	-90.44613	22073353	41
Active	339900	1539	221	\N	3	2	2	\N	777 Creek View Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Rock-Township/777-Creek-View-Dr-63026/home/182738084	Valley at Winding Bluffs	182738084	162245552	38.47272	-90.465904	22072524	\N
Active	28000	\N	\N	9583	\N	\N	\N	\N	0 Old State Rd	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/Old-State-Rd-63052/home/182737357	Wuertenberg Terrace	182737357	162243257	38.361343	-90.37919	22072488	\N
Active	389900	1570	248	\N	3	2	2	\N	693 Fox Creek Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/693-Fox-Creek-Dr-63026/home/182736798	Estates at Fox Creek	182736798	162241551	38.484417	-90.434875	22072476	\N
Active	414900	2742	151	5227	5	3.5	3	1	90 San Marino Pkwy	2	Fenton	MO	63026	\N	6	2017	US/Central	/MO/Fenton/90-San-Marino-Pkwy-63026/home/109850942	San Marino 2	109850942	162198739	38.496655	-90.44268	22069481	25
Active	295000	3060	96	5227	8	4	4	\N	29 Crosswinds Dr	\N	Arnold	MO	63010	\N	4	1978	US/Central	/MO/Arnold/29-Crosswinds-Dr-63010/home/79963317	Mathies Prcl 1	79963317	162231303	38.442814	-90.39626	22072275	\N
Active	299900	3060	98	5227	8	4	4	\N	25 Crosswinds Dr	\N	Arnold	MO	63010	\N	4	1978	US/Central	/MO/Arnold/25-Crosswinds-Dr-63010/home/79963314	Mathies Twnhs	79963314	162231302	38.442688	-90.39652	22072244	\N
Active	399900	1908	210	8276	4	2.5	2	1	3105 Willow Point Dr	2	Imperial	MO	63052	\N	6	2019	US/Central	/MO/Imperial/3105-Willow-Point-Dr-63052/home/170449976	Huntington Glen	170449976	162228528	38.415257	-90.425606	22072080	42
Active	314900	2148	147	10019	3	2.5	2	1	1605 Trinity Cir	1.5	Arnold	MO	63010	\N	6	1995	US/Central	/MO/Arnold/1605-Trinity-Cir-63010/home/79966627	Cathedral Heights	79966627	162098088	38.43402	-90.38416	22071415	\N
Active	489900	3430	143	44431	4	3.5	3	1	5174 King St	2	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/5174-King-St-63052/home/79989873	Imperial Terrace 04	79989873	162191381	38.39203	-90.40791	22071887	25
Active	267900	1080	248	30492	3	2.5	2	1	1583 Robinhood Dr	1.5	Arnold	MO	63010	\N	6	1964	US/Central	/MO/Arnold/1583-Robinhood-Dr-63010/home/162790181	Sherwood Forest	162790181	161997028	38.44469	-90.400055	22070373	\N
Active	305000	1336	228	6534	3	2	2	\N	2657 Winding Valley Dr	1	Fenton	MO	63026	\N	6	2021	US/Central	/MO/Fenton/2657-Winding-Valley-Dr-63026/home/170449608	Valley at Winding Bluffs One	170449608	161974088	38.470497	-90.46438	22070226	42
Active	399900	2489	161	13068	4	3.5	3	1	4834 Tbb Sierra View Pl	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4834-Sierra-View-Pl-63010/home/177865900	The Ridge At Tuscan Valley	177865900	162062033	38.44974	-90.44185	22071146	\N
Active	362900	1680	216	13068	4	3.5	3	1	4830 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4830-Sierra-View-Pl-63010/home/177865869	The Ridge At Tuscan Valley	177865869	162061828	38.44974	-90.44185	22071145	\N
Active	409900	2400	171	13068	4	2.5	2	1	4789 Tbb Sierra View Pl	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4789-Sierra-View-Pl-63010/home/177865606	The Ridge At Tuscan Valley	177865606	162061441	38.44974	-90.44185	22071141	\N
Active	399900	2489	161	13068	4	2.5	2	1	4793 Tbb Sierra View Pl	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4793-Sierra-View-Pl-63010/home/177865583	The Ridge At Tuscan Valley	177865583	162061390	38.44974	-90.44185	22071139	\N
Active	384900	2250	171	13068	4	2.5	2	1	4797 Tbb Sierra View Pl	1.5	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4797-Sierra-View-Pl-63010/home/177865555	The Ridge At Tuscan Valley	177865555	162061330	38.44974	-90.44185	22071138	\N
Active	376900	2000	188	13068	4	2.5	2	1	4809 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4809-Sierra-View-Pl-63010/home/177865411	The Ridge At Tuscan Valley	177865411	162061229	38.44974	-90.44185	22071135	\N
Active	372900	1690	221	13068	4	2.5	2	1	4810 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4810-Sierra-View-Pl-63010/home/177865713	The Ridge At Tuscan Valley	177865713	162061102	38.44974	-90.44185	22071133	\N
Active	369900	1790	207	13068	4	2.5	2	1	4805 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4805-Sierra-View-Pl-63010/home/177865451	The Ridge At Tuscan Valley	177865451	162060924	38.44974	-90.44185	22071129	\N
Active	112500	\N	\N	70567	\N	\N	\N	\N	158 Long Oaks Dr	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/158-Long-Oaks-Dr-63052/home/173648854	Red Oaks Valley	173648854	157009881	38.372124	-90.47212	22060355	33
Active	449900	3200	141	9583	4	3.5	3	1	2422 Driftwood Ct	2	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/2422-Driftwood-Ct-63052/home/79955653	Seckman lakes estates	79955653	162844494	38.384624	-90.414116	22067612	42
Active	530000	3288	161	18731	3	2.5	2	1	1095 Hawkins Rd	1.5	Fenton	MO	63026	\N	6	2000	US/Central	/MO/Fenton/1095-Hawkins-Rd-63026/home/62736436	Hawkins Meadow Lts 45 & 46 Bdy Adj	62736436	162772301	38.503227	-90.48554	22072101	46
Active	329000	1553	212	7405	3	2	2	\N	316 Bridge Valley Dr	1	Imperial	MO	63052	\N	6	2019	US/Central	/MO/Imperial/316-Bridge-Valley-Dr-63052/home/144080427	Huntington Glen	144080427	162800277	38.419533	-90.42572	22073018	42
Active	490000	\N	\N	533610	0	\N	\N	\N	5099 Darrell Dr	\N	Imperial	MO	63052	\N	7	\N	US/Central	/MO/Imperial/5099-Darrell-Dr-63052/home/79995934	US SURV 2021	79995934	162611019	38.38561	-90.39776	22074344	\N
Active	233500	1537	152	13504	3	1.5	1	1	1785 Susan Dr	2	Arnold	MO	63010	\N	6	1994	US/Central	/MO/Arnold/1785-Susan-Dr-63010/home/79974706	Laura Lin 02	79974706	162458494	38.437134	-90.40799	22073492	\N
Active	309000	1740	178	8712	3	2	2	\N	633 Cedar Bay Dr	1	Imperial	MO	63052	\N	6	2017	US/Central	/MO/Imperial/633-Cedar-Bay-Dr-63052/home/144080367	Huntington Glen One	144080367	154560894	38.413277	-90.427635	22051344	42
Active	777000	\N	\N	1003187	0	\N	\N	\N	3399 Old State Rd. M	\N	Antonia	MO	63052	\N	7	\N	US/Central	/MO/Imperial/3399-Old-State-Road-M-63052/home/182456831	New Development	182456831	161771329	38.36432	-90.460304	22067103	\N
Active	229000	1760	130	8263	3	2	2	\N	1960 Redwood Dr	1.5	Arnold	MO	63010	\N	6	1968	US/Central	/MO/Arnold/1960-Redwood-Dr-63010/home/79963761	Arnold Terrace	79963761	161753341	38.447144	-90.37997	22067854	6
Active	469900	3502	134	145490	3	3	2	2	2067 Fenwick Pl	2	Arnold	MO	63010	\N	6	2002	US/Central	/MO/Arnold/2067-Fenwick-Pl-63010/home/62718092	Thornbrook Hill	62718092	155835658	38.44083	-90.41749	22053016	22
Active	439900	2940	150	\N	4	2.5	2	1	725 Fox Creek Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/725-Fox-Creek-Dr-63026/home/182310672	Estates at Fox Creek	182310672	161498035	38.484417	-90.434875	22066913	\N
Active	469900	2940	160	\N	4	2.5	2	1	758 Fox Creek Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/758-Fox-Creek-Dr-63026/home/182309898	Estates at Fox Creek	182309898	161496981	38.484417	-90.434875	22066891	\N
Active	284900	2100	136	23065	4	3	3	\N	6789 Ike Dr	1.5	Barnhart	MO	63012	\N	6	1964	US/Central	/MO/Barnhart/6789-Ike-Dr-63012/home/79998137	Barnhart Hills	79998137	161618220	38.348663	-90.3924	22067908	\N
Active	239890	1596	150	48352	3	2	2	\N	5 Corn Ln	1	Fenton	MO	63026	\N	6	1991	US/Central	/MO/Fenton/5-Corn-Ln-63026/home/79973076	Country Plantation	79973076	160600839	38.45789	-90.465034	22065241	\N
Pending	429900	2784	154	\N	4	2.5	2	1	741 Fox Creek Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/741-Fox-Creek-Dr-63026/home/182246257	Estates at Fox Creek	182246257	161263270	38.484417	-90.434875	22065886	\N
Active	419990	2214	190	6377	3	2	2	\N	4582 Annadale Ave - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4582-Annadale-Ave-Tbb-Unknown/home/179077507	Arlington Heights	179077507	160348572	38.41615	-90.43204	22065448	\N
Active	404990	2237	181	8586	3	2.5	2	1	248 Savannah Ridge Court - Tbb	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/248-Savannah-Ridge-Ct-63026/home/179077494	Kingston Hills	179077494	160346867	38.492695	-90.431404	22065447	\N
Active	383990	2237	172	5502	3	2.5	2	1	4603 Annadale Ave - Tbb	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4603-Annadale-Ave-Tbb-Unknown/home/179077497	Arlington Heights	179077497	160346183	38.416904	-90.43219	22065446	\N
Active	394990	1840	215	7958	3	2	2	\N	820 Kingston Hills Court - Tbb	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/820-Kingston-Hls-Ct-63026/home/179077484	Kingston Hills	179077484	160345802	38.493652	-90.4318	22065443	\N
Active	393990	1612	244	5502	3	2	2	\N	243 Savannah Ridge Court - Tbb	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/243-Savannah-Ridge-Ct-63026/home/179077493	Kingston Hills	179077493	160345219	38.492817	-90.43145	22065441	\N
Active	371990	1840	202	6608	3	2	2	\N	4545 Annadale Ave - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4545-Annadale-Ave-Tbb-Unknown/home/179077502	Arlington Heights	179077502	160339335	38.416138	-90.431694	22065435	\N
Active	369990	1612	230	6630	3	2	2	\N	4566 Annadale Ave - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/4566-Annadale-Ave-Tbb-Unknown/home/179077498	Arlington Heights	179077498	160318579	38.416836	-90.43217	22065406	\N
Active	378990	1556	244	8072	3	2	2	\N	804 Kingston Hills Court - Tbb	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/804-Kingston-Hls-Ct-63026/home/179077491	Kingston Hills	179077491	160317917	38.493652	-90.4318	22065404	\N
Active	375990	1480	254	7200	3	2	2	\N	833 Kingston Hills Court - Tbb	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/833-Kingston-Hls-Ct-63026/home/179077488	Kingston Hills	179077488	160314461	38.493652	-90.4318	22065400	\N
Active	352990	1556	227	5632	3	2	2	\N	1481 Arlington Heights Way - Tbb	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/1481-Arlington-Heights-Way-63052/home/173699382	Arlington Heights	173699382	160312535	38.41533	-90.433556	22065398	\N
Active	389900	2344	166	7841	4	3	3	\N	2141 Henley Woods Dr	1.5	Arnold	MO	63010	\N	6	2018	US/Central	/MO/Arnold/2141-Henley-Woods-Dr-63010/home/170449777	Henley Woods One	170449777	159953682	38.43163	-90.41208	22064677	31
Active	80900	\N	\N	43996	\N	\N	\N	\N	128 Long Oaks Dr	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/128-Long-Oaks-Dr-63052/home/173648881	Red Oaks	173648881	158161031	38.37396	-90.47156	22062548	\N
Active	414000	1944	213	12197	4	3.5	3	1	5078 Romaine Spring Dr	2	Fenton	MO	63026	\N	6	2003	US/Central	/MO/Fenton/5078-Romaine-Spring-Dr-63026/home/80026229	Bluffs/Romaine 01	80026229	157900984	38.46017	-90.45389	22063316	53
Active	1950000	\N	\N	784080	\N	\N	\N	\N	108 E Lark Dr	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Fenton/108-E-Lark-Dr-63026/home/79970990	Richarz	79970990	157870593	38.49603	-90.4885	22063093	\N
Active	673000	3537	190	18949	4	3.5	3	1	689 Summit Rd	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/689-Summit-Rd-63026/home/169057738	Summit Woods Estates	169057738	157642900	38.506413	-90.47438	22062480	\N
Active	90000	\N	\N	68825	\N	\N	\N	\N	143 Long Oaks Dr	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/143-Long-Oaks-Dr-63052/home/173648882	Red Oaks Vly	173648882	157570350	38.374214	-90.47334	22060659	\N
Active	144900	1152	126	36795	3	2	2	\N	4325 E Swaller Rd	1	Imperial	MO	63052	\N	6	1980	US/Central	/MO/Antonia/4325-E-Swaller-Rd-63052/home/79976740	Crestview	79976740	156937351	38.421158	-90.47318	22059427	\N
Active	359900	2081	173	\N	4	2.5	2	1	204 Stone View Ct	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/204-Stone-View-Ct-63026/home/181871639	Valley at Winding Bluffs	181871639	157219150	38.469135	-90.46333	22061794	\N
Active	314900	1728	182	\N	3	2.5	2	1	853 Valley Pine Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/853-Vly-Pne-Dr-63026/home/181741155	Valley at Winding Bluffs	181741155	157207386	38.46898	-90.462	22061700	\N
Active	329990	1480	223	8468	3	2	2	\N	1422 Arlington Heights Way	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Antonia/1422-Arlington-Heights-Way-63052/home/181781881	Arlington Heights	181781881	157081259	38.416847	-90.430786	22060569	\N
Active	362900	1680	216	13068	4	2.5	2	1	4801 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4801-Sierra-View-Pl-63010/home/177865526	The Ridge At Tuscan Valley	177865526	162060592	38.44974	-90.44185	22071117	\N
Active	375000	2296	163	9148	4	2.5	2	1	455 Autumn Peak Dr	2	Fenton	MO	63026	\N	6	1994	US/Central	/MO/Fenton/455-Autumn-Peak-Dr-63026/home/93603564	Summit Heights Phase Two	93603564	161734749	38.506844	-90.464005	22068363	17
Active	105000	1827	57	16553	3	2.5	2	1	9 Stonecliff Dr	1.5	Fenton	MO	63026	\N	6	1973	US/Central	/MO/Fenton/9-Stonecliff-Dr-63026/home/79969547	Stonecliff Estates	79969547	161354149	38.49121	-90.4511	22062348	17
Active	308900	1539	201	\N	3	2	2	\N	2 Aspen II at Winding Vly	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Rock-Township/2-Winding-Valley-Dr-63026/home/182474804	Valley at Winding Bluffs	182474804	161798536	38.472782	-90.46532	22068969	\N
Active	74900	1008	74	36590	2	1	1	\N	2313 Saline Rd	1	Fenton	MO	63026	\N	6	1959	US/Central	/MO/Fenton/2313-Saline-Rd-63026/home/79970236	Fenton	79970236	161792773	38.47644	-90.46828	22069014	\N
Active	209000	1056	198	12632	3	2	2	\N	1842 Whitehorne Pl	2	Imperial	MO	63052	\N	6	1978	US/Central	/MO/Imperial/1842-Whitehorne-Pl-63052/home/79995920	Shadows Plat 2	79995920	156576174	38.396572	-90.39608	22057660	\N
Active	69900	\N	\N	130680	\N	\N	\N	\N	4372 Iron Mountain Bluff Rd	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/4372-Iron-Mountain-Blf-63010/home/62777529	Wicks Station 03 Amd	62777529	156440784	38.39589	-90.35395	22056610	\N
Active	549900	2904	189	20038	4	3	3	\N	6120 Brookview Heights Dr	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/6120-Brookview-Heights-Dr-63052/home/144823524	Brookview Heights Ph 02	144823524	156164109	38.37745	-90.47166	22053285	\N
Active	95500	\N	\N	43560	\N	\N	\N	\N	23 Dry Fork Mdws	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial-Township/23-Dry-Fork-Rd-63052/home/181190707	Dry Fork Meadows	181190707	156180405	38.383488	-90.47161	22055350	40
Active	86900	\N	\N	\N	\N	\N	\N	\N	17 Dry Fork Mdws	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial-Township/17-Dry-Fork-Rd-63052/home/181190606	Dry Fork Meadwos	181190606	156179940	38.385002	-90.46908	22055345	40
Active	340000	1176	289	9148	4	3	3	\N	1264 Newport Landing Dr	1	Fenton	MO	63026	\N	6	1987	US/Central	/MO/Fenton/1264-Newport-Landing-Dr-63026/home/93605385	Newport Landing Lts 20 & 21 Bdy Adj	93605385	153691397	38.509705	-90.49771	22047081	27
Active	219900	1392	158	4931	3	2	2	\N	3936 Scott Robert Dr	1.5	Arnold	MO	63010	\N	6	1987	US/Central	/MO/Arnold/3936-Scott-Robert-Dr-63010/home/79988550	Terric Manor	79988550	156334328	38.405148	-90.401276	22056028	17
Active	1222110	\N	\N	5915012	0	\N	\N	\N	0 Stacy Lane (135.79+/- Acres)	\N	Fenton	MO	63026	\N	7	\N	US/Central	/MO/Rock-Township/Stacey-Ln-63026/home/181077371	Fenton	181077371	156007081	38.45837	-90.47635	22053920	\N
Active	414879	1842	225	5998	3	2.5	2	1	249 Dell View Dr	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/249-Dell-Vw-Dr-63010/home/176546933	Henley Woods	176546933	155968502	38.4306	-90.415436	22053894	31
Active	45000	\N	\N	14070	\N	\N	\N	\N	0 Persimmon Ln	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/Persimmon-LN-63010/home/180898220	Orchard Park	180898220	155072234	38.452885	-90.369705	22050523	\N
Active	385000	1594	242	10454	4	3	3	\N	1126 Big Sky Dr	1	Fenton	MO	63026	\N	6	1997	US/Central	/MO/Fenton/1126-Big-Sky-Dr-63026/home/62719222	Winter Valley 01	62719222	153846397	38.491615	-90.44015	22048555	25
Active	150000	\N	\N	42253	\N	\N	\N	\N	765 Lonedell Rd	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/765-Lonedell-Rd-63010/home/170448697	Orchard Park	170448697	154971526	38.45266	-90.37031	22050427	\N
Active	1300000	\N	\N	5004608	0	\N	\N	\N	1920 Romaine Creek Rd	\N	Fenton	MO	63026	\N	7	1954	US/Central	/MO/Fenton/1920-Romaine-Creek-Rd-63026/home/109469558	Fenton	109469558	154861015	38.456253	-90.472824	22050482	\N
Active	259900	1971	132	11082	4	2	2	\N	1844 Cottonwood Dr	1	Imperial	MO	63052	\N	6	1978	US/Central	/MO/Imperial/1844-Cottonwood-Dr-63052/home/79995057	Oakview Estates	79995057	153820973	38.402107	-90.39481	22048399	29
Active	224900	1110	203	\N	2	2	2	\N	2 Montauk at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Montauk-at-The-Timbers-Unknown/home/180732512	Commons at The Timbers	180732512	154203402	38.389164	-90.40509	22050334	\N
Active	214900	1020	211	\N	2	1	1	\N	2 Summerfield at The Timbers	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Summerfield-at-The-Timbers-Unknown/home/180732480	Commons at The Timbers	180732480	154202889	38.38872	-90.40773	22050338	\N
Active	239900	1405	171	\N	2	2	2	\N	2 Arlington at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Arlington-at-The-Timbers-Unknown/home/180732437	Commons at The Timbers	180732437	154202178	38.388794	-90.405106	22050311	\N
Active	259900	1150	226	\N	2	2	2	\N	2 Aspen at The Timbers	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Aspen-at-The-Timbers-Unknown/home/180732436	Manors at The Timbers	180732436	154202176	38.389538	-90.40546	22050306	\N
Active	288900	1539	188	\N	3	2	2	\N	2 Aspen II at The Timbers	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Aspen-II-at-The-Timbers-Unknown/home/180732391	Manors at The Timbers	180732391	154201014	38.38816	-90.4067	22050302	\N
Active	299900	1745	172	\N	3	2	2	\N	2 Maple at The Timbers	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Maple-at-The-Timbers-Unknown/home/180732390	Manors at The Timbers	180732390	154201006	38.388275	-90.40591	22050279	\N
Active	285900	1728	165	\N	3	2.5	2	1	2 Berwick at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Berwick-at-The-Timbers-Unknown/home/180732325	Manors at The Timbers	180732325	154199757	38.38791	-90.405785	22050275	\N
Active	318900	2548	125	\N	4	2.5	2	1	2 Ashford at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Ashford-at-The-Timbers-Unknown/home/180732323	Manors at The Timbers	180732323	154199745	38.39055	-90.40544	22050264	\N
Active	291900	1902	153	\N	4	2.5	2	1	2 Sterling at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Sterling-at-The-Timbers-Unknown/home/180732296	Manors at The Timbers	180732296	154199218	38.389446	-90.40605	22050273	\N
Active	302900	2081	146	\N	4	2.5	2	1	2 Royal II at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-Royal-II-at-The-Timbers-Unknown/home/180732253	Manors at The Timbers	180732253	154198486	38.38786	-90.407074	22050268	\N
Active	435000	2032	214	7405	3	2	2	\N	4883 Sierra View Pl	1	Imperial	MO	63052	\N	6	2020	US/Central	/MO/Imperial/4883-Sierra-View-Pl-63052/home/170450021	Huntington Glen 3	170450021	154011377	38.420578	-90.42662	22049959	\N
Active	40000	1656	24	19868	2	1	1	\N	3945 Old State Route 21	1	Imperial	MO	63052	\N	6	1956	US/Central	/MO/Antonia/3945-Old-Missouri-21-63052/home/79976297	Burbank Hills	79976297	154006089	38.42954	-90.46915	22049873	\N
Active	285000	1512	188	10075	3	3.5	3	1	3515 Saint Martin Dr	2	Arnold	MO	63010	\N	6	1989	US/Central	/MO/Arnold/3515-St-Martin-Dr-63010/home/79968075	St Johns Crossing 01	79968075	153965387	38.416447	-90.38021	22049228	\N
Active	76900	\N	\N	9148	\N	\N	\N	\N	0 Fox Creek Phs 1 Lot 69	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Rock-Township/Fox-Creek-Dr-63026/home/180682408	Fox Creek	180682408	153956945	38.48504	-90.43769	22049375	\N
Active	369900	2800	132	7405	4	2.5	2	1	5310 Wind Rose Dr	2	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/5310-Wind-Rose-Dr-63052/home/80024899	Windmill Summit	80024899	156925989	38.37868	-90.4079	22059380	10
Active	491366	2789	176	\N	5	2.5	2	1	221 Dell View Dr	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/221-Dell-Vw-Dr-63010/home/176546926	Henley Woods	176546926	156973516	38.430275	-90.41402	22060150	31
Active	135102	1419	95	46252	3	1	1	\N	4333 E Swaller Rd	1.5	Imperial	MO	63052	\N	6	1954	US/Central	/MO/Antonia/4333-E-Swaller-Rd-63052/home/79976738	Crestview	79976738	156940428	38.420788	-90.47366	22059803	\N
Active	519000	2118	245	12798	3	2	2	\N	2 Bblt Charles Thomas Lot 5	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Meramec-Township/2-Charles-Thomas-Ln-63026/home/178533221	Summit Ridge Estates	178533221	156925767	38.52184	-90.49073	22058351	25
Active	458900	4398	104	14810	4	2.5	2	1	5936 Old State Rd	1	Imperial	MO	63052	\N	6	1960	US/Central	/MO/Imperial/5936-Old-State-Rd-63052/home/144083025	White E J	144083025	156897573	38.370983	-90.37943	22059419	\N
Active	439682	1734	254	8059	3	2	2	\N	241 Dell View Ct	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/241-Dell-Vw-Dr-63010/home/176546930	Henley Woods	176546930	153475525	38.43055	-90.41502	22045410	31
Active	387422	1743	222	6621	3	2.5	2	1	3368 Vine Clad Hill Dr	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/3368-Vine-Clad-Hill-Dr-63010/home/180236317	Henley Woods	180236317	152940597	38.43018	-90.41612	22042364	31
Active	17500	\N	\N	5793	\N	\N	\N	\N	150 Flint Dr	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Fenton/150-Flint-Dr-63026/home/79973266	Arrow Head Hills	79973266	150951069	38.46871	-90.44959	22034565	\N
Active	205000	875	234	7579	3	1.5	1	1	1847 San Lucas	1	Fenton	MO	63026	\N	6	1971	US/Central	/MO/Fenton/1847-San-Lucas-Ln-63026/home/62697935	San Luis 4	62697935	148286563	38.512997	-90.48521	22024567	\N
Active	229000	1775	129	8276	3	2	2	\N	1760 Scenic Meadows Dr	1.5	Imperial	MO	63052	\N	6	1978	US/Central	/MO/Imperial/1760-Scenic-Meadows-Dr-63052/home/62717777	Scenic Mdws 3	62717777	152276448	38.39882	-90.40021	22039986	\N
Active	18000	\N	\N	43560	\N	\N	\N	\N	6111 Rebecca Ln	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/6111-Rebecca-Ln-63052/home/162720140	Windsor Valley	162720140	151243126	38.365185	-90.376144	22034466	\N
Active	499000	\N	\N	949608	\N	\N	\N	\N	1 Lot 1 Quiet Vlg	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/1-Quiet-Vlg-63010/home/146074459	Quiet Village	146074459	152571394	38.418175	-90.36018	22040974	\N
Active	204000	1008	202	18731	3	1.5	1	1	656 Rockwood	1	Arnold	MO	63010	\N	6	1966	US/Central	/MO/Arnold/656-Rockwood-Dr-63010/home/79993793	US Srvy 2020	79993793	149252440	38.408245	-90.35904	22026856	\N
Active	397500	1450	274	\N	2	2	2	\N	2905 Strawberry Ridge Dr	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/2905-Strawberry-Ridge-Dr-63010/home/173648160	Strawberry Ridge	173648160	149771349	38.4264	-90.40937	22029081	300
Active	379990	1612	236	6377	3	2	2	\N	1477 Arlington Heights Way	1	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/1477-Arlington-Heights-Way-63052/home/173699357	Arlington Heights	173699357	148927451	38.41538	-90.43337	22026015	\N
Active	9900	\N	\N	8002	\N	\N	\N	\N	3401 Henry Dr	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Antonia/3401-Henry-Dr-63052/home/178713843	Archview	178713843	146354283	38.444748	-90.46827	22016415	13
Active	239900	1148	209	82764	2	1	1	\N	95 Lucie Ln	1.5	Valley Park	MO	63088	\N	6	1917	US/Central	/MO/Valley-Park/95-Lucie-Ave-63088/home/93589050	Valley Park Hills	93589050	144791254	38.53326	-90.49916	22008630	\N
Active	33000	\N	\N	188615	\N	\N	\N	\N	45 Lot 45 And 46 Meramec Ests	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/45-Lot-45-And-46-Meramec-ESTS-Unknown/home/175167505	Meramec Estates	175167505	132168733	38.43782	-90.48651	21033511	\N
Active	186300	1201	155	10237	3	2	2	\N	2315 Esquline Dr	1	Fenton	MO	63026	\N	6	1965	US/Central	/MO/Fenton/2315-Esquline-Dr-63026/home/93588600	St Bernard Hills 3	93588600	143071894	38.53713	-90.48506	21087813	\N
Active	384900	2250	171	13068	3	2	2	\N	4817 Tbb Sierra View Pl	1.5	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4817-Sierra-View-Pl-63010/home/177865284	The Ridge At Tuscan Valley	177865284	136178593	38.44974	-90.44185	21017754	\N
Active	34900	\N	\N	68041	\N	\N	\N	\N	3710 Hill And Dale Dr	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Antonia/3710-Hill-and-Dale-Dr-63052/home/79976398	Hillandale	79976398	130533163	38.43348	-90.46548	21014087	21
Active	399900	2489	161	13068	4	2.5	2	1	4821 Tbb Sierra View Pl	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4821-Sierra-View-Pl-63010/home/177865285	The Ridge At Tuscan Valley	177865285	130278261	38.44974	-90.44185	21017755	\N
Active	1295750	\N	\N	3179880	0	\N	\N	\N	0 East Romain Creek Rd	\N	Fenton	MO	63052	\N	7	\N	US/Central	/MO/Fenton/0-East-Romain-Creek-RD-63052/home/177803299	Fenton	177803299	143613771	38.455353	-90.46301	22000238	\N
Active	409900	2400	171	13068	4	2.5	2	1	4829 Tbb Sierra View Pl	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/4829-Sierra-View-Pl-63010/home/177857688	The Ridge At Tuscan Valley	177857688	130207805	38.420353	-90.42514	21017758	\N
Active	1890000	\N	\N	5227200	0	\N	\N	\N	0 Singing Hill Dr	\N	Imperial	MO	63052	\N	7	\N	US/Central	/MO/Imperial-Township/Singing-Hills-Dr-63052/home/170460842	Imperial	170460842	115793258	38.401928	-90.4633	20005204	\N
Active	995000	\N	\N	1910542	0	\N	\N	\N	0 Old Lemay Ferry Rd	\N	Imperial	MO	63052	\N	7	\N	US/Central	/MO/Imperial/0-Old-Lemay-Ferry-RD-63052/home/178689258	Imperial	178689258	132670721	38.369778	-90.378456	21039962	\N
Active	259900	1907	136	5662	3	2.5	2	1	3270 5 Oaks Dr	\N	Arnold	MO	63010	\N	6	1995	US/Central	/MO/Arnold/3270-5-Oaks-Dr-63010/home/79988328	Arnold	79988328	158151451	38.40927	-90.412766	11480612	\N
Active	429900	2333	184	\N	4	2.5	2	1	Marlow	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Marlow/home/183639680	Henley Woods	183639680	163795728	38.431496	-90.41755	Plan-222127656	\N
Active	441900	2794	158	\N	4	2.5	2	1	Jensen	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Jensen/home/183639701	Henley Woods	183639701	163235530	38.431496	-90.41755	Plan-211893567	\N
Active	421900	2439	173	\N	3	2	2	\N	Cumberland	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Cumberland/home/183639319	Henley Woods	183639319	162864537	38.431496	-90.41755	Plan-211893566	\N
Active	411900	2258	182	\N	3	2.5	2	1	Yosemite	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Yosemite/home/183638544	Henley Woods	183638544	162841968	38.431496	-90.41755	Plan-211893565	\N
Active	389900	1983	197	\N	3	2	2	\N	Greenbriar	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Greenbriar/home/183638749	Henley Woods	183638749	162802342	38.431496	-90.41755	Plan-211893564	\N
Active	424900	2330	182	\N	4	2.5	2	1	Fairfax	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Fairfax/home/183639395	Henley Woods	183639395	162794487	38.431496	-90.41755	Plan-211893563	\N
Active	401900	1818	221	\N	3	2	2	\N	Hamilton	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Hamilton/home/183639436	Henley Woods	183639436	162783250	38.431496	-90.41755	Plan-211893562	\N
Active	397900	1730	230	\N	3	2	2	\N	DaVinci	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/DaVinci/home/183639439	Henley Woods	183639439	162773850	38.431496	-90.41755	Plan-211893561	\N
Active	364900	1419	257	\N	2	2	2	\N	Beacon	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Beacon/home/183639440	Henley Woods	183639440	162640483	38.431496	-90.41755	Plan-211893560	\N
Active	506520	\N	\N	415562	\N	\N	\N	\N	5001 Hilltop Ln	\N	Imperial	MO	63052	\N	8	\N	US/Central	/MO/Imperial/5001-Hilltop-Ln-63052/home/79995648	tbd	79995648	153690863	38.40091	-90.389824	22046535	\N
Active	254600	\N	\N	206910	\N	\N	\N	\N	3939 Sierra Pkwy	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/3939-Sierra-Pkwy-63010/home/162671386	Whitehall Comm Park	162671386	153690755	38.401268	-90.38719	22046523	\N
Active	265000	\N	\N	30492	\N	\N	\N	\N	920 Summerset Parc Ln	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Fenton/920-Summerset-Parc-Ln-63026/home/147859614	Summerset Parc	147859614	153900650	38.516014	-90.455246	22048739	63
Active	426486	1842	232	5998	3	2.5	2	1	3396 Vine Clad Hill Dr	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/3396-Vine-Clad-Hl-Dr-63010/home/176546903	Henley Woods	176546903	153479182	38.430893	-90.41663	22045370	31
Active	411820	1743	236	6621	3	2.5	2	1	245 Dell View Ct	2	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/245-Dell-Vw-Dr-63010/home/176546932	Henley Woods	176546932	153479869	38.43059	-90.41523	22045383	31
Active	347900	1237	281	\N	2	2	2	\N	Charlotte	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Charlotte/home/183639108	Henley Woods	183639108	162594237	38.431496	-90.41755	Plan-211893559	\N
Active	387900	1842	211	\N	3	2.5	2	1	Wesley	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Wesley/home/183639244	Henley Woods	183639244	162578716	38.431496	-90.41755	Plan-211893558	\N
Active	454900	3186	143	\N	4	2.5	2	1	Breckenridge	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Breckenridge/home/183639304	Henley Woods	183639304	162578715	38.431496	-90.41755	Plan-211965378	\N
Active	234900	1580	149	12197	4	2	2	\N	5833 Blackberry Dr	1.5	Imperial	MO	63052	\N	6	1987	US/Central	/MO/Imperial/5833-Blackberry-Dr-63052/home/80025251	Wood Lynn Terrace 04	80025251	164360948	38.376377	-90.384346	23000025	30
Active	372900	1740	214	\N	3	2.5	2	1	Danville	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/Henley-Woods/Danville/home/183639442	Henley Woods	183639442	162548133	38.431496	-90.41755	Plan-211893557	\N
Active	339000	2540	133	47916	3	3.5	3	1	4660 Dogwood Ln	2	Imperial	MO	63052	\N	6	1995	US/Central	/MO/Imperial/4660-Dogwood-Ln-63052/home/79975529	Black Oak Manor	79975529	164357406	38.416096	-90.42115	22079708	17
Active	109900	1008	109	21780	3	1.5	1	1	527 Blackberry Path	1	Arnold	MO	63010	\N	6	1970	US/Central	/MO/Arnold/527-Blackberry-Path-63010/home/79974626	Creekwood Acres 02	79974626	164266020	38.44471	-90.41277	22079349	21
Coming Soon	374900	1878	200	9583	3	2	2	\N	1451 Summerpoint Ln	1	Fenton	MO	63026	\N	6	1996	US/Central	/MO/Fenton/1451-Summerpoint-Ln-63026/home/93605126	Summer Chase Second Add Ph Three	93605126	164376631	38.510902	-90.505165	23000265	43
Active	349900	1862	188	5227	4	3.5	3	1	1704 Preston Centre Dr	1.5	Fenton	MO	63026	\N	6	2007	US/Central	/MO/Fenton/1704-Preston-Centre-Dr-63026/home/93326780	Preston Pointe	93326780	164376628	38.525894	-90.489	22079784	195
Coming Soon	195000	960	203	66211	3	1	1	\N	2684 Spring Forest Rd	1	Imperial	MO	63052	\N	6	1953	US/Central	/MO/Imperial/2684-Spring-Forest-Rd-63052/home/79988870	Blue Jay Ridge	79988870	164357280	38.404766	-90.415924	23000089	\N
Active	400000	2250	178	12197	4	2	2	\N	79 Forest Knoll Dr	1	Fenton	MO	63026	\N	6	2005	US/Central	/MO/Fenton/79-Forest-Knoll-Dr-63026/home/62702175	Forest Knoll	62702175	163828811	38.52081	-90.445854	22076290	\N
Active	309900	2438	127	8712	4	3	3	\N	2060 Windmill Summit Dr	1	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/2060-Windmill-Summit-Dr-63052/home/80024960	Windmill Summit	80024960	163276487	38.377197	-90.408745	22075349	10
Active	419900	2736	153	365468	3	3	3	\N	4200 Rock Creek Valley Rd	1	High Ridge	MO	63049	\N	6	1962	US/Central	/MO/High-Ridge/4200-Rock-Creek-Valley-Rd-63049/home/79977171	Gamber	79977171	162267888	38.415733	-90.50753	22072246	\N
Coming Soon	219900	900	244	8712	2	2	2	\N	2406 Lombard Ln	1.5	Imperial	MO	63052	\N	6	1992	US/Central	/MO/Imperial/2406-Lombard-Ln-63052/home/62705817	Frisco Hills 02	62705817	164365004	38.38931	-90.41475	23000186	21
Active	369900	1790	207	13068	4	2.5	2	1	4814 Tbb Sierra View Pl	1	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Windsor-Township/4814-Sierra-View-Pl-63010/home/177865743	The Ridge At Tuscan Valley	177865743	162060801	38.44974	-90.44185	22071125	\N
Active	200000	864	231	6098	3	1	1	\N	3173 Pinebrook Dr	1	Arnold	MO	63010	\N	6	1980	US/Central	/MO/Arnold/3173-Pinebrook-Dr-63010/home/79975838	Tamarack 02	79975838	156985594	38.417793	-90.40495	22060258	13
Active	236700	1378	172	\N	3	2.5	2	1	2 St. James at The Timbers	2	Imperial	MO	63052	\N	6	\N	US/Central	/MO/Imperial/2-St-James-at-The-Timbers-Unknown/home/180732513	Commons at The Timbers	180732513	154203416	38.38912	-90.40762	22050327	\N
Active	10995	\N	\N	3920	\N	\N	\N	\N	472 Shangrila Estates Lot 472 Dr	\N	Fenton	MO	63026	\N	8	\N	US/Central	/MO/Fenton/472-Shangri-La-Estates-Dr-63026/home/175650759	ShangriLa Estates II	175650759	153698924	38.497528	-90.431114	22047150	\N
Active	160000	960	167	11177	3	2	2	\N	2186 Ridge Dr	1	Arnold	MO	63010	\N	6	1966	US/Central	/MO/Arnold/2186-Ridge-Dr-63010/home/79966531	Hollingsworth	79966531	164737688	38.441383	-90.37487	23001040	\N
Active	269900	1820	148	12197	4	2	2	\N	1681 Lonedell Rd	\N	Arnold	MO	63010	\N	4	1969	US/Central	/MO/Arnold/1681-Lonedell-Rd-63010/home/79962834	Lakewood Acres	79962834	164727400	38.448193	-90.396545	23001082	\N
Coming Soon	325000	858	379	34412	4	3.5	3	1	2620 Seckman Rd	2	Imperial	MO	63052	\N	6	1990	US/Central	/MO/Imperial/2620-Seckman-Rd-63052/home/79989493	\N	79989493	164725397	38.395943	-90.42281	23001001	\N
Coming Soon	350000	2640	133	6098	4	3.5	3	1	442 Winter Bluff Dr. Dr	2	Fenton	MO	63026	\N	6	2002	US/Central	/MO/Fenton/442-Winter-Bluff-Dr-63026/home/62748279	Winter Bluff Estates	62748279	164700464	38.498474	-90.423965	23000874	33
Active	220000	1366	161	8960	3	1.5	1	1	3837 Red Bud Dr	1	Imperial	MO	63052	\N	6	1982	US/Central	/MO/Antonia/3837-Red-Bud-Dr-63052/home/79977458	Country Club Manor 03	79977458	164648363	38.428524	-90.48126	22079655	\N
Active	299000	1256	238	28314	4	2	2	\N	29 New Sugar Creek Rd	\N	Fenton	MO	63026	\N	4	1962	US/Central	/MO/Fenton/29-New-Sugar-Creek-Rd-63026/home/79962269	Everetts 3rd	79962269	164667303	38.498188	-90.49303	23000752	\N
Active	349900	3886	90	11761	4	3	2	2	1172 Oak Hollow Dr	2	Imperial	MO	63052	\N	6	2001	US/Central	/MO/Imperial/1172-Oak-Hollow-Dr-63052/home/80025238	Oaks 03	80025238	164330800	38.388687	-90.38015	22064434	15
Coming Soon	289900	1865	155	13630	3	2	2	\N	2219 Bentley Manor Dr	1	Fenton	MO	63026	\N	6	1968	US/Central	/MO/Fenton/2219-Bentley-Manor-Dr-63026/home/93587651	Bentley Manor 2	93587651	164567477	38.52975	-90.48803	23000365	\N
Active	475000	2200	216	431680	4	2	2	\N	5511 Glen Haven Rd	1	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/5511-Glen-Haven-Rd-63052/home/79989977	Glen Haven	79989977	164896066	38.3996	-90.45674	23001967	\N
Coming Soon	350000	2111	166	11326	3	2.5	2	1	1713 San Simeon Way	1.5	Fenton	MO	63026	\N	6	1985	US/Central	/MO/Fenton/1713-San-Simeon-Way-63026/home/93588019	San Simeon Estates Four Amd	93588019	164325612	38.528095	-90.4664	22079609	\N
Active	225000	1800	125	89734	4	2.5	2	1	19 Rainbow Trl	1.5	Arnold	MO	63010	\N	6	1976	US/Central	/MO/Arnold/19-Rainbow-Trl-63010/home/79973763	Enchanted Forest 05	79973763	164320424	38.443226	-90.46367	22069663	29
Active	250000	2550	98	13504	4	3	3	\N	1719 Westview Dr	1	Imperial	MO	63052	\N	6	1978	US/Central	/MO/Imperial/1719-Westview-Dr-63052/home/79995400	Scenic View Acres 04	79995400	164905052	38.399567	-90.39855	23001970	13
Active	200000	1085	184	13068	3	2	2	\N	3507 Bradford Farms Ct	1	Imperial	MO	63052	\N	6	2003	US/Central	/MO/Imperial/3507-Bradford-Farms-Ct-63052/home/79954480	Bradford Farms	79954480	164863481	38.3642	-90.46367	23001904	40
Active	489900	3446	142	9583	4	2.5	2	1	705 Winding Bluffs Dr	2	Fenton	MO	63026	\N	6	2019	US/Central	/MO/Fenton/705-Winding-Bluffs-Dr-63026/home/170449295	Winding Bluffs	170449295	164733747	38.478146	-90.452126	22078351	46
Coming Soon	210000	1450	145	31460	3	1	1	\N	2885 Harmony Hls	1.5	Arnold	MO	63010	\N	6	\N	US/Central	/MO/Arnold/2885-Harmony-Hills-Dr-63010/home/79975640	harmony hills manor145	79975640	164943768	38.424164	-90.41226	23001544	\N
Active	379900	4152	91	12197	3	3	2	2	1 Ridge Pl	2	Imperial	MO	63052	\N	6	2004	US/Central	/MO/Imperial/1-Ridge-Pl-63052/home/79955640	Parc/Kimmswick	79955640	164980173	38.37063	-90.36097	22079675	21
Coming Soon	225000	2016	112	14026	3	2	2	\N	3971 Thomas Dr	1	Imperial	MO	63052	\N	6	1965	US/Central	/MO/Antonia/3971-Thomas-Dr-63052/home/79976323	Blechas 03	79976323	165022733	38.437782	-90.46898	23002299	\N
Active	285000	2100	136	8276	3	2.5	2	1	6042 Churchill Ct	1	Imperial	MO	63052	\N	6	1994	US/Central	/MO/Imperial/6042-Churchill-Ct-63052/home/79997780	Wellington Place 06	79997780	164665482	38.36597	-90.37752	23000803	17
Active	274900	1934	142	15246	3	2	2	\N	80 W Lakewood Dr	1	Fenton	MO	63026	\N	6	1968	US/Central	/MO/Fenton/80-W-Lakewood-Dr-63026/home/79971575	Fond Du Lac 02	79971575	164511906	38.489887	-90.47425	22078684	\N
Active	445000	2971	150	11326	3	3	3	\N	2122 Meramec Ridge Ct	1	Fenton	MO	63026	\N	6	1996	US/Central	/MO/Fenton/2122-Meramec-Ridge-Ct-63026/home/93588997	Meramec Meadows	93588997	164641377	38.53509	-90.50633	23000692	11
Coming Soon	179900	1196	150	14810	4	2	2	\N	2023 Valmont Dr	1	Arnold	MO	63010	\N	6	1987	US/Central	/MO/Arnold/2023-Valmont-Dr-63010/home/79975227	Valmont	79975227	164633752	38.43068	-90.39999	22078394	\N
Active	460227	2784	165	\N	4	2.5	2	1	5029 Corisande Woods Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/5029-Corisande-Woods-Dr-63026/home/183611350	Estates at Fox Creek	183611350	164318492	38.483234	-90.431046	22079648	\N
Active	199900	1246	160	13809	3	2.5	2	1	117 Ron De Le Dr	1	Arnold	MO	63010	\N	6	1972	US/Central	/MO/Arnold/117-Ron-De-Le-Dr-63010/home/79995257	West Elm Place 02 Resub	79995257	164317213	38.40507	-90.40031	22079207	\N
Active	334900	1626	206	10454	3	2	2	\N	5144 Saddlebrook Pkwy	1	Imperial	MO	63052	\N	6	1997	US/Central	/MO/Imperial/5144-Saddlebrook-Pkwy-63052/home/79990012	Saddlebrook Estates	79990012	163818224	38.387215	-90.402084	22077619	21
Active	229900	1700	135	7937	3	2	2	\N	2308 Viminal Ct	1	Fenton	MO	63026	\N	6	1964	US/Central	/MO/Fenton/2308-Viminal-Ct-63026/home/93588603	St Bernard Hills 3	93588603	163703327	38.53721	-90.48561	22077236	\N
Active	695000	2400	290	\N	0	\N	\N	\N	4700 Golden Vly	1	Unincorporated	MO	63052	\N	6	\N	US/Central	/MO/Antonia/4700-Golden-VLY-63052/home/183224243	Emerald Pointe	183224243	163424840	38.389553	-90.42194	22076797	\N
Active	180000	1020	176	13504	2	1	1	\N	2159 Francis Dr	1	Arnold	MO	63010	\N	6	1947	US/Central	/MO/Arnold/2159-Francis-Dr-63010/home/79964274	Brissette Acres	79964274	162771905	38.444828	-90.37092	22074600	\N
Active	295000	3060	96	4792	8	4	4	\N	33 Crosswinds Dr	\N	Arnold	MO	63010	\N	4	1978	US/Central	/MO/Arnold/33-Crosswinds-Dr-63010/home/79963316	Mathies Twnhs	79963316	162231304	38.442898	-90.39601	22072324	\N
Active	382887	2081	184	\N	4	2.5	2	1	902 Valley Pine Dr	2	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/902-Vly-Pne-Dr-63026/home/181741127	Valley at Winding Bluffs	181741127	165065927	38.469105	-90.4606	23003325	\N
Coming Soon	170000	888	191	32670	3	1	1	\N	1648 W Highview Dr	1	Arnold	MO	63010	\N	6	1960	US/Central	/MO/Arnold/1648-W-Highview-63010/home/79974714	Hi View Lane	79974714	165082920	38.44043	-90.409225	23003394	\N
Coming Soon	220000	960	229	11208	3	2	2	\N	324 Stillbrook Estates Dr	1.5	Fenton	MO	63026	\N	6	1985	US/Central	/MO/Fenton/324-Stillbrook-Estates-Dr-63026/home/79968143	Shangri La Estates 04	79968143	165109259	38.496445	-90.423164	23003592	\N
Active	629000	4660	135	10454	4	4	3	2	2351 Tribute Dr	2	Arnold	MO	63010	\N	6	2003	US/Central	/MO/Arnold/2351-Tribute-Dr-63010/home/79956803	Strawberry Rdg 01	79956803	165132330	38.424934	-90.40372	23003552	600
Active	179900	1118	161	19005	3	2	1	2	2110 Devonshire Dr	1.5	Imperial	MO	63052	\N	6	1972	US/Central	/MO/Imperial/2110-Devonshire-Dr-63052/home/79991229	Windswept Estates	79991229	165176656	38.364544	-90.404915	23004097	21
Active	159000	888	179	21314	2	1	1	\N	1101 Stephenson Rd	1	Imperial	MO	63052	\N	6	1952	US/Central	/MO/Imperial/1101-Stephenson-Rd-63052/home/79997872	Stephensons Acres	79997872	165265870	38.349026	-90.3817	23004499	\N
Coming Soon	185000	1600	116	16553	5	2	2	\N	1573 W Highview Dr	1	Arnold	MO	63010	\N	6	1965	US/Central	/MO/Arnold/1573-W-Highview-Dr-63010/home/62763498	Delightful Spot	62763498	165335433	38.44141	-90.41092	23004117	\N
Active	259900	1748	149	10237	4	2	2	\N	3766 Cindy Ct	1	Arnold	MO	63010	\N	6	1977	US/Central	/MO/Arnold/3766-Cindy-Ct-63010/home/79988056	Highland House Manor	79988056	165358156	38.409298	-90.40223	23002848	\N
Coming Soon	185000	936	198	3920	3	1.5	1	1	2383 Virginia Ct	1	Arnold	MO	63010	\N	6	1961	US/Central	/MO/Arnold/2383-Virginia-Ct-63010/home/63657969	Virginia Court 2nd Add	63657969	165381832	38.436203	-90.36937	23000332	\N
Active	489900	3660	134	12632	4	3	2	2	414 Lincoln Terrace Ct	2	Fenton	MO	63026	\N	6	1994	US/Central	/MO/Fenton/414-Lincoln-Terrace-Ct-63026/home/93604129	Arlington Glen Ph One	93604129	165427815	38.50415	-90.46568	23002637	22
Coming Soon	275000	2234	123	104544	4	3	3	\N	199 Stillwater Woods Dr	1	Fenton	MO	63026	\N	6	1987	US/Central	/MO/Fenton/199-Stillwater-Woods-Dr-63026/home/79973061	Country Plantation Stillwater	79973061	166108602	38.4592	-90.46511	23008272	10
Coming Soon	175000	1700	103	17607	4	1	1	\N	1405 Laverne Dr	1	Arnold	MO	63010	\N	6	1956	US/Central	/MO/Arnold/1405-Laverne-Dr-63010/home/79967565	Kleinschmidts	79967565	167733195	38.417522	-90.37629	23010411	\N
Coming Soon	274900	1542	178	14375	3	2.5	2	1	5012 Galena Ct	2	Imperial	MO	63052	\N	6	1995	US/Central	/MO/Imperial/5012-Galena-Ct-63052/home/79988994	Bender Point	79988994	168194548	38.399307	-90.40201	23020779	17
Active	629000	2375	265	47045	4	2.5	2	1	1655 Valley Park Rd	1.5	Fenton	MO	63026	\N	6	1962	US/Central	/MO/Fenton/1655-Valley-Park-Rd-63026/home/93589023	Ward Acres	93589023	168209775	38.535294	-90.492805	23017948	\N
Coming Soon	365000	2030	180	7841	4	2.5	2	1	416 Timber Valley Trl	2	Fenton	MO	63026	\N	6	2018	US/Central	/MO/Fenton/416-Timber-Valley-Trl-63026/home/170449217	Manors at Winding Bluffs	170449217	168258886	38.480713	-90.44595	23017935	42
Active	550000	3932	140	9583	4	3	3	\N	2169 Avalon View Dr	1	Fenton	MO	63026	\N	6	2000	US/Central	/MO/Fenton/2169-Avalon-View-Dr-63026/home/62738983	Avalon Hills Four	62738983	168238825	38.52415	-90.50839	23021152	\N
Active	679900	2000	340	\N	0	\N	\N	\N	4700 Golden Vly	1	Unincorporated	MO	63052	\N	6	\N	US/Central	/MO/Antonia/4700-Golden-VLY-63052/home/183224243	Emerald Pointe	183224243	168367833	38.389553	-90.42194	23022000	\N
Coming Soon	365000	2600	140	23958	4	3.5	3	1	\N	2	Imperial	MO	63052	\N	6	1994	US/Central	/MO/Imperial/Undisclosed-address-63052/home/79990979	\N	79990979	168406013	38.373913	-90.463005	23018687	\N
Coming Soon	300000	2400	125	6534	3	3	3	\N	1030 Crabapple Dr	1	Arnold	MO	63010	\N	6	1995	US/Central	/MO/Arnold/1030-Crabapple-Dr-63010/home/79994979	Apple Valley Farm	79994979	168428868	38.40241	-90.37187	23022209	25
Coming Soon	289900	1920	151	10454	3	2.5	2	1	4211 Whitehall Dr	2	Arnold	MO	63010	\N	6	1996	US/Central	/MO/Arnold/4211-Whitehall-Dr-63010/home/79995710	Whitehall Estates	79995710	168437398	38.39927	-90.38832	23022407	13
Active	369900	1450	255	\N	3	2.5	2	1	2116 Oakglen St	2	Imperial	MO	63052	\N	6	2010	US/Central	/MO/Imperial/2116-Oakglen-St-63052/home/79960045	Seckman Glen	79960045	169108347	38.384205	-90.40506	23026803	25
Active	400000	1740	230	6500	3	2	2	\N	2726 Winding Valley Dr	1	Fenton	MO	63026	\N	6	2020	US/Central	/MO/Fenton/2726-Winding-Valley-Dr-63026/home/181741186	Valley at Winding Bluffs	181741186	169121120	38.469364	-90.46338	23027196	\N
Coming Soon	320000	1568	204	6534	3	2	2	\N	2182 Warwick Castle Dr	1	Imperial	MO	63052	\N	6	2012	US/Central	/MO/Imperial/2182-Warwick-Castle-Dr-63052/home/160805199	Castle Heights Ph 01	160805199	169161023	38.36572	-90.40981	23008998	25
Coming Soon	335000	1684	199	9583	3	2.5	2	1	627 Summer Top Cir	1	Fenton	MO	63026	\N	6	1996	US/Central	/MO/Fenton/627-Summer-Top-Cir-63026/home/93603988	Summit Oaks	93603988	169190349	38.50869	-90.45421	23027794	\N
Active	393000	1583	248	7405	3	2	2	\N	1179 Timber Creek Ln	1	Imperial	MO	63052	\N	6	2018	US/Central	/MO/Imperial/1179-Timber-Creek-Ln-63052/home/144080423	Huntington Glen 2	144080423	169234004	38.418606	-90.425735	23027981	500
Active	249000	1628	153	12632	3	2	2	\N	11 Toni Trails Ct	1.5	Fenton	MO	63026	\N	6	1988	US/Central	/MO/Fenton/11-Toni-Trl-63026/home/79969906	La Rocco Estates	79969906	168454737	38.492355	-90.473366	23021542	\N
Coming Soon	229900	1314	175	10019	2	2	2	\N	2475 Waterfront Dr	1.5	Imperial	MO	63052	\N	6	2001	US/Central	/MO/Imperial/2475-Waterfront-Dr-63052/home/62742141	Valley Oaks East	62742141	168714521	38.388412	-90.41243	23023330	23
Coming Soon	765000	4550	168	13939	4	3	3	\N	1015 Uthoff Farm Ct	1	Fenton	MO	63026	\N	6	2011	US/Central	/MO/Fenton/1015-Uthoff-Farm-Ct-63026/home/93328886	The Estates Of Uthoff Valley	93328886	168753261	38.53403	-90.464645	23021719	46
Coming Soon	190000	1025	185	4792	2	1.5	1	1	855 Caleb Xing	1	Fenton	MO	63026	\N	3	2007	US/Central	/MO/Fenton/855-Caleb-Xing-63026/home/79954403	Joshua Crossing	79954403	168794651	38.46744	-90.43674	23024716	200
Coming Soon	314900	2792	113	21344	4	3	3	\N	2953 Sun Ridge Pl	1	Imperial	MO	63052	\N	6	1988	US/Central	/MO/Imperial/2953-Sun-Ridge-Pl-63052/home/79989647	Forest Ridge Rev	79989647	168848598	38.407734	-90.43141	23024505	21
Active	220000	1392	158	9662	3	2.5	2	1	3833 Red Bud Dr	1	Imperial	MO	63052	\N	6	1981	US/Central	/MO/Imperial/3833-Red-Bud-Dr-63052/home/79977461	Country Club Manor	79977461	168901667	38.428528	-90.481	23024936	\N
Active	280000	2245	125	3049	3	3.5	3	1	491 Summit Tree Ct	2	Fenton	MO	63026	\N	3	2001	US/Central	/MO/Fenton/491-Summit-Tree-Ct-63026/home/93629194	Summit Ridge	93629194	168898150	38.512726	-90.452705	23025501	150
Coming Soon	299000	1712	175	6970	3	2.5	2	1	927 Grape Arbor Dr	2	Arnold	MO	63010	\N	6	1996	US/Central	/MO/Arnold/927-Grape-Arbor-Dr-63010/home/79994955	Apple Valley Farms Ph 02	79994955	168950435	38.403435	-90.37209	23025005	21
Coming Soon	300000	2344	128	10019	4	2.5	2	1	2021 Saint Christopher Way	2	Arnold	MO	63010	\N	6	1993	US/Central	/MO/Arnold/2021-Saint-Christopher-Way-63010/home/79967906	St Johns Crossing 02	79967906	168982720	38.417664	-90.38376	23026229	\N
Active	24995	\N	\N	78844	\N	\N	\N	\N	0 Lots 14, 15 And 16 Oakview Est	\N	Arnold	MO	63010	\N	8	\N	US/Central	/MO/Arnold/Lots-14-15-And-16-Oakview-EST-63010/home/185384212	Oakview Ests	185384212	169010951	38.408363	-90.390144	23026537	\N
Coming Soon	525000	2778	189	16901	4	3	3	\N	1210 Horan Dr	1	Fenton	MO	63026	\N	6	2017	US/Central	/MO/Fenton/1210-Horan-Dr-63026/home/113844943	Bent Tree Trails 2	113844943	169047913	38.537857	-90.468094	23025716	\N
Coming Soon	250000	1250	200	16553	3	1.5	1	1	1958 Maple Ln	1	Arnold	MO	63010	\N	6	1967	US/Central	/MO/Arnold/1958-Maple-Ln-63010/home/63073790	Arnold Terrace	63073790	169081466	38.44625	-90.38147	23026929	5
Active	249900	1308	191	17860	3	2	2	\N	609 Glenfield Ct	1	Imperial	MO	63052	\N	6	2006	US/Central	/MO/Imperial/609-Glenfield-Ct-63052/home/62762100	Glenstone Estates Ph 02	62762100	169253921	38.365112	-90.43575	23026526	\N
Coming Soon	299999	1985	151	\N	3	2.5	2	1	1524 Meadowbrook Ct	1	Arnold	MO	63010	\N	6	1994	US/Central	/MO/Arnold/1524-Meadowbrook-Ct-63010/home/79974118	Westminister Place	79974118	169317696	38.447544	-90.424484	23028636	33
Active	299000	2367	126	8712	4	2.5	2	1	1541 Summer Chase Ln	2	Fenton	MO	63026	\N	6	1989	US/Central	/MO/Fenton/1541-Summer-Chase-Ln-63026/home/93597546	Summer Chase 1	93597546	169329441	38.513447	-90.495674	23015630	\N
Coming Soon	210000	988	213	20181	3	2	2	\N	100 Miller Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/100-Miller-Dr-63026/home/79971347	Fehrs	79971347	169340774	38.499096	-90.4937	23028744	13
Coming Soon	300000	1512	198	217800	3	3	3	\N	2554 Oaker Dr	1.5	Arnold	MO	63010	\N	6	1983	US/Central	/MO/Arnold/2554-Oaker-Dr-63010/home/79975068	Pine Valley	79975068	169387623	38.431572	-90.42844	23028415	21
Coming Soon	220000	1889	116	26458	3	3	3	\N	5107 Darkmoor Ln	1	Imperial	MO	63052	\N	6	1974	US/Central	/MO/Imperial/5107-Darkmoor-Ln-63052/home/79995933	Shadows	79995933	169433231	38.397015	-90.39304	23029349	21
Active	145000	1039	140	1307	2	1.5	1	1	3902 Cherry Brook Dr Unit B	2	Arnold	MO	63010	\N	3	1985	US/Central	/MO/Arnold/3902-Cherry-Brook-Dr-63010/unit-B/home/79988392	Cherry Brook Farms Ph 02 Rev	79988392	169452014	38.40633	-90.40378	23029487	115
Coming Soon	1795000	\N	\N	304920	\N	\N	\N	\N	1410 Hillsboro Valley Park Rd	\N	High Ridge	MO	63049	\N	8	\N	US/Central	/MO/High-Ridge/1410-Hillsboro-Valley-Park-Rd-63049/home/162686190	High Ridge	162686190	169496424	38.500854	-90.508675	23023598	\N
Active	363870	1539	236	\N	3	2	2	\N	863 Valley Pine Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/863-Valley-Pine-Dr-63026/home/181741156	Valley at Winding Bluffs	181741156	169548769	38.46924	-90.46123	23030137	\N
Coming Soon	420000	2750	153	12632	3	3	3	\N	216 Pheasant Ct	1	Imperial	MO	63052	\N	6	2018	US/Central	/MO/Imperial/216-Pheasant-Ct-63052/home/147899229	Remington Place	147899229	169572734	38.397484	-90.42338	23028604	17
Active	225000	1425	158	10341	3	2	2	\N	1998 San Luis Rey Pkwy	1.5	Fenton	MO	63026	\N	6	1969	US/Central	/MO/Fenton/1998-San-Luis-Rey-Pkwy-63026/home/62746755	San Luis 1	62746755	169541623	38.517128	-90.48923	23030056	7
Coming Soon	185000	932	198	13917	2	1.5	1	1	66 Patricia Pl	1.5	Fenton	MO	63026	\N	6	1960	US/Central	/MO/Fenton/66-Patricia-Pl-63026/home/79969946	Delores 02	79969946	169600853	38.49086	-90.46684	23025555	\N
Coming Soon	375000	2644	142	11326	4	2.5	2	1	5517 Oakcrest Dr	2	Imperial	MO	63052	\N	6	1989	US/Central	/MO/Imperial/5517-Oakcrest-Dr-63052/home/79996010	Forest Haven South 01	79996010	169633246	38.388508	-90.396706	23029066	21
Coming Soon	230000	1525	151	18705	3	2.5	2	1	1536 Stonegate Manor Dr	1	Arnold	MO	63010	\N	6	1987	US/Central	/MO/Arnold/1536-Stonegate-Manor-Dr-63010/home/79963564	Stonegate Manor 03	79963564	169673570	38.442413	-90.38716	23030949	\N
Coming Soon	359000	2185	164	7405	4	3	3	\N	31 Winter Pond Dr	1	Fenton	MO	63026	\N	6	2008	US/Central	/MO/Fenton/31-Winter-Pond-Dr-63026/home/63125117	Winter Lake Estates 2	63125117	169837202	38.494995	-90.42375	23029700	31
Coming Soon	340000	1939	175	9583	3	3	2	2	1480 Fox Ridge Ct	2	Arnold	MO	63010	\N	6	2004	US/Central	/MO/Arnold/1480-Fox-Ridge-Ct-63010/home/62717429	Fox Pointe Estates	62717429	169866228	38.430264	-90.37342	23031951	13
Coming Soon	341500	1279	267	6534	3	2	2	\N	2673 Winding Valley Dr	1	Fenton	MO	63026	\N	6	2022	US/Central	/MO/Fenton/2673-Winding-Valley-Dr-63026/home/176546826	Valley at Winding Bluffs	176546826	169905238	38.47001	-90.46473	23031943	42
Active	199900	1294	154	5828	3	2	1	2	812 Country Glen Dr	1.5	Imperial	MO	63052	\N	6	1988	US/Central	/MO/Imperial/812-Country-Glen-Dr-63052/home/79996169	Country Cottage Estates	79996169	169913427	38.394188	-90.37003	23032353	\N
Coming Soon	415000	3538	117	7841	5	3.5	3	1	4874 Sierra View Pl	2	Imperial	MO	63052	\N	6	2019	US/Central	/MO/Imperial/4874-Sierra-View-Pl-63052/home/170450035	Huntington Glen	170450035	169979906	38.42019	-90.426125	23032781	33
Active	209000	1610	130	15298	4	1.5	1	1	3712 Gail Dr	1.5	Imperial	MO	63052	\N	6	1973	US/Central	/MO/Imperial/3712-Gail-Dr-63052/home/79976957	Meramec Estates	79976957	170040368	38.436188	-90.48679	23032697	4
Coming Soon	399000	3700	108	11761	5	3.5	3	1	502 Riverchase Cir	2	St Louis	MO	63026	\N	6	1989	US/Central	/MO/Fenton/502-Riverchase-Cir-63026/home/93587160	Courtney Estates	93587160	170091724	38.528675	-90.44924	23022847	7
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
Active	334974	1279	262	\N	3	2	2	\N	2816 Winding Valley Dr	1	Fenton	MO	63026	\N	6	\N	US/Central	/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426	Valley at Winding Bluffs	183485426	164146978	38.46928	-90.46247	22078812	\N
\.


--
-- Data for Name: searches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.searches (id, city, state, "expenseFk", zip, "user", beds, "minBath", "maxBath") FROM stdin;
1	Fenton	MO	1	63026	1	3	1	2
2	Fenton	MO	\N	63026	1	3	1	2
3	Fenton	MO	\N	63026	1	3	1	2
4	Fenton	MO	\N	63026	1	3	1	2
5	Fenton	MO	\N	63026	1	3	1	2
6	Fenton	MO	\N	63026	1	3	1	2
7	Fenton	MO	53	63026	1	3	1	2
8	Fenton	MO	54	63026	1	3	1	2
9	Fenton	MO	56	63026	1	3	1	2
11	Fenton	MO	60	63026	1	3	1	2
12	Fenton	MO	62	63026	1	3	1	2
13	Fenton	MO	64	63026	1	3	1	2
14	Fenton	MO	66	63026	1	3	1	2
15	Fenton	MO	68	63026	1	3	1	2
16	Fenton	MO	70	63026	1	3	1	2
17	Fenton	MO	72	63026	1	3	1	2
18	Fenton	MO	74	63026	1	3	1	2
19	Fenton	MO	76	63026	1	3	1	2
20	Fenton	MO	78	63026	1	3	1	2
21	Fenton	MO	80	63026	1	3	1	2
22	Fenton	MO	82	63026	1	3	1	2
23	Fenton	MO	84	63026	1	3	1	2
10	Fenton	MO	5	63026	1	3	1	2
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stats ("medianPrice", "modePrice", "averagePrice", city, state, zip, beds, baths, "averagePricePerSqFt", "modePricePerSqFt", "medianPricePerSqFt", "averageSqFt", "modeSqFt", "medianSqFt", "averageLotSize", "modeLotSize", "medianLotSize", "averageBeds", "medianBeds", "modeBeds", "averageBaths", "medianBaths", "modeBaths", "averageHoa", "medianHoa", "modeHoa", "averageYearBuilt", "medianYearBuilt", "modeYearBuilt", "curDateUtc") FROM stdin;
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-10
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-10
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-10
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-10
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-10
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-24
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-24
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-24
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-24
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-24
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-24
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-24
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-31
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-03-31
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-03-31
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-03-31
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-03-31
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-03-31
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-03-31
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-07
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-07
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-07
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-07
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-07
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-07
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-07
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-17
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-17
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-17
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-17
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-17
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-17
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-17
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-21
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-21
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-21
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-21
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-21
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-21
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-21
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-04-28
219900	219900	\N	Imperial	MO	63052	2	2	\N	244	244	\N	900	900	\N	8712	8712	\N	2	2	\N	2	2	\N	21	21	\N	1992	1992	2023-04-28
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-04-28
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-04-28
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-04-28
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-04-28
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-04-28
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
309900	309900	303266.66	Imperial	MO	63052	4	3	105	127	98	2958	2438	2550	11325.667	8712	11761	4	4	4	3	3	3	12.666667	13	10	1994.3334	2001	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-05
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-05
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-05
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-05
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-05
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-05
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-05
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-12
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-12
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-12
269000	359900	279216.66	Imperial	MO	63052	3	2	184.08333	235	191	1520.0834	1532	1554.5	12860.917	7405	9801	3	3	3	2	2	2	33.2	40	42	1997.75	2000	2022	2023-05-12
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-12
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-12
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-12
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
314500	359900	290257.16	Imperial	MO	63052	3	2	190.07143	235	201	1528	1532	1562	12019.286	7405	8930	3	3	3	2	2	2	98.71429	40	42	2000.2142	2007.5	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-19
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-19
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-19
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-19
379900	379900	\N	Imperial	MO	63052	3	3	\N	91	91	\N	4152	4152	\N	12197	12197	\N	3	3	\N	3	3	\N	21	21	\N	2004	2004	2023-05-19
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-19
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-19
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-05-26
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-05-26
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-05-26
309000	359900	287566.66	Imperial	MO	63052	3	2	190.13333	235	198	1513.3334	1532	1556	12408.667	7405	9148	3	3	3	2	2	2	98.71429	40	42	2000.6	2006	2022	2023-05-26
299950	379900	299950	Imperial	MO	63052	3	3	103.5	91	103.5	3020.5	4152	3020.5	19327.5	12197	19327.5	3	3	3	3	3	3	21	21	21	1989	1989	2004	2023-05-26
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-05-26
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-05-26
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-06-09
224900	219900	224900	Imperial	MO	63052	2	2	209.5	244	209.5	1107	900	1107	9365.5	8712	9365.5	2	2	2	2	2	2	22	22	21	1996.5	1996.5	1992	2023-06-09
165051	135102	165051	Imperial	MO	63052	3	1	149	95	149	1189.5	1419	1189.5	56231.5	46252	56231.5	3	3	3	1	1	1	\N	\N	\N	1953.5	1953.5	1954	2023-06-09
279450	359900	282087.5	Imperial	MO	63052	3	2	187.875	235	194.5	1499.625	1532	1554.5	11997.375	7405	8930	3	3	3	2	2	2	98.71429	40	42	1999.8125	2004.5	2022	2023-06-09
379900	379900	339966.66	Imperial	MO	63052	3	3	120	91	116	2930.3333	4152	2750	17095.666	12197	12632	3	3	3	3	3	3	19.666666	21	21	1998.6666	2004	2004	2023-06-09
259900	259900	323266.66	Imperial	MO	63052	4	2	165.66667	132	149	1917	1971	1971	151653	11082	12197	4	4	4	2	2	2	29.5	29.5	29	1989.6666	1987	1978	2023-06-09
312400	309900	306175	Imperial	MO	63052	4	3	107	127	105.5	2916.5	2438	2671	13830.25	8712	12632.5	4	4	4	3	3	3	14.75	14	10	1992.75	1994.5	2004	2023-06-09
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
99500	40000	99500	Imperial	MO	63052	2	1	101.5	24	101.5	1272	1656	1272	20591	19868	20591	2	2	2	1	1	1	\N	\N	\N	1954	1954	1956	2023-03-10
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name) FROM stdin;
1	jklamert
3	testUser
4	testUser
5	testUser
6	testUser
7	testUser
8	testUser
9	testUser
10	testUser
11	testUser
12	testUser
13	testUser
14	testUser
15	testUser
16	testUser
17	testUser
18	testUser
19	testUser
20	testUser
21	testUser
22	testUser
23	testUser
24	testUser
25	testUser
26	testUser
27	testUser
28	testUser
29	testUser
30	testUser
31	testUser
32	testUser
33	testUser
34	testUser
35	testUser
36	testUser
37	testUser
2	testUser69
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenses_id_seq', 84, true);


--
-- Name: searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.searches_id_seq', 23, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 37, true);


--
-- Name: expenses expense_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expense_id_pk PRIMARY KEY (id);


--
-- Name: searches searches_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.searches
    ADD CONSTRAINT searches_id_pk PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: searches searches_expenses_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.searches
    ADD CONSTRAINT searches_expenses_fk FOREIGN KEY ("expenseFk") REFERENCES public.expenses(id);


--
-- Name: searches searches_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.searches
    ADD CONSTRAINT searches_user_fk FOREIGN KEY ("user") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

