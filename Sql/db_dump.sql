--
-- PostgreSQL database cluster dump
--

-- Started on 2024-11-14 15:47:24

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








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

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-14 15:47:24

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

-- Completed on 2024-11-14 15:47:24

--
-- PostgreSQL database dump complete
--

--
-- Database "wb_analytics" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-14 15:47:25

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
-- TOC entry 4893 (class 1262 OID 16553)
-- Name: wb_analytics; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE wb_analytics WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE wb_analytics OWNER TO postgres;

\connect wb_analytics

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
-- TOC entry 6 (class 2615 OID 16594)
-- Name: join; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "join";


ALTER SCHEMA "join" OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16641)
-- Name: window; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "window";


ALTER SCHEMA "window" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16613)
-- Name: orders; Type: TABLE; Schema: join; Owner: postgres
--

CREATE TABLE "join".orders (
    order_date date,
    order_id integer,
    product_id integer,
    order_ammount integer
);


ALTER TABLE "join".orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16616)
-- Name: products; Type: TABLE; Schema: join; Owner: postgres
--

CREATE TABLE "join".products (
    product_id integer,
    product_name character varying(50),
    product_category character varying(50)
);


ALTER TABLE "join".products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16619)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id bigint,
    name text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16624)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint,
    customer_id bigint,
    order_date timestamp without time zone,
    shipment_date timestamp without time zone,
    order_ammount bigint,
    order_status text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16629)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer,
    name character varying(50),
    category character varying(50),
    price integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16632)
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    seller_id bigint,
    category text,
    date_reg date,
    date date,
    revenue bigint,
    rating bigint,
    delivery_days bigint
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16637)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer,
    gender character varying(50),
    age integer,
    education character varying(50),
    city character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16645)
-- Name: goods; Type: TABLE; Schema: window; Owner: postgres
--

CREATE TABLE "window".goods (
    "ID_GOOD" bigint,
    "CATEGORY" text,
    "GOOD_NAME" text,
    "PRICE" bigint
);


ALTER TABLE "window".goods OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16676)
-- Name: query; Type: TABLE; Schema: window; Owner: postgres
--

CREATE TABLE "window".query (
    searchid bigint,
    year bigint,
    month bigint,
    day bigint,
    userid bigint,
    ts bigint,
    devicetype text,
    deviceid bigint,
    query text
);


ALTER TABLE "window".query OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16642)
-- Name: salary; Type: TABLE; Schema: window; Owner: postgres
--

CREATE TABLE "window".salary (
    id integer,
    first_name character varying(50),
    last_name character varying(50),
    salary integer,
    industry character varying(50)
);


ALTER TABLE "window".salary OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16658)
-- Name: sales; Type: TABLE; Schema: window; Owner: postgres
--

CREATE TABLE "window".sales (
    "DATE" date,
    "SHOPNUMBER" bigint,
    "ID_GOOD" bigint,
    "QTY" bigint
);


ALTER TABLE "window".sales OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16653)
-- Name: shops; Type: TABLE; Schema: window; Owner: postgres
--

CREATE TABLE "window".shops (
    "SHOPNUMBER" bigint,
    "CITY" text,
    "ADDRESS" text
);


ALTER TABLE "window".shops OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 16613)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: join; Owner: postgres
--

COPY "join".orders (order_date, order_id, product_id, order_ammount) FROM stdin;
2023-10-06	56	56	120837
2023-10-05	6	94	178839
2023-10-12	1	148	94600
2023-10-22	81	23	178360
2023-10-19	6	144	146075
2023-10-24	58	40	15506
2023-10-18	39	49	171982
2023-10-13	13	2	117423
2023-10-24	24	74	121767
2023-09-29	43	132	192851
2023-10-19	80	16	60782
2023-10-14	84	161	28205
2023-10-21	64	73	149979
2023-10-16	77	154	63047
2023-10-26	6	56	670
2023-10-24	47	4	103407
2023-10-27	76	69	94657
2023-10-04	43	47	68777
2023-10-13	16	87	122043
2023-10-18	63	147	115345
2023-10-17	74	108	113235
2023-10-25	71	187	25557
2023-10-01	95	2	127994
2023-10-28	29	109	26089
2023-10-08	43	167	113579
2023-10-05	75	82	155186
2023-10-27	33	180	65550
2023-10-24	30	193	87941
2023-10-27	70	30	29278
2023-10-09	32	121	170688
2023-09-28	13	94	125713
2023-10-12	39	3	3398
2023-10-14	99	116	101677
2023-10-25	13	198	109431
2023-10-02	95	108	79416
2023-10-21	6	130	57974
2023-10-23	3	136	95863
2023-10-28	74	199	73042
2023-10-24	6	143	20732
2023-10-25	26	45	62980
2023-10-07	79	63	125397
2023-10-02	55	26	50023
2023-10-27	59	144	24738
2023-10-18	4	187	61936
2023-10-19	64	69	2859
2023-10-08	28	162	24275
2023-10-23	60	71	104828
2023-10-11	21	149	173845
2023-10-13	40	48	104656
2023-10-06	3	110	126017
2023-10-17	27	11	60640
2023-10-08	95	193	166400
2023-10-10	65	174	191609
2023-10-14	40	162	56761
2023-10-05	8	36	158599
2023-10-06	6	115	165750
2023-10-16	69	94	59109
2023-10-24	61	178	110006
2023-10-15	63	27	24801
2023-09-29	79	115	161598
2023-10-28	83	124	3717
2023-10-06	58	135	96631
2023-10-22	95	149	104251
2023-10-09	15	151	168079
2023-10-23	17	100	192289
2023-10-06	27	27	136796
2023-10-25	19	163	32961
2023-10-25	14	24	95621
2023-10-25	56	94	69412
2023-10-14	46	141	49567
2023-10-17	95	29	36483
2023-10-21	95	188	104221
2023-10-20	91	44	41247
2023-10-10	95	133	31423
2023-10-24	27	4	83011
2023-10-22	57	11	19624
2023-10-20	91	26	67046
2023-10-06	44	159	152572
2023-10-12	30	185	81702
2023-10-12	52	2	99769
2023-10-12	31	58	54091
2023-10-28	31	18	35351
2023-10-22	66	102	32597
2023-10-07	84	94	70892
2023-09-29	75	4	47768
2023-10-08	52	43	127989
2023-10-16	34	4	154245
2023-10-24	97	195	155148
2023-10-18	42	171	192801
2023-10-20	39	40	68928
2023-10-23	58	116	84330
2023-10-14	94	107	163936
2023-10-10	62	56	15563
2023-10-04	38	51	116121
2023-09-30	60	58	17966
2023-10-24	83	76	143906
2023-10-17	57	165	170360
2023-10-22	85	185	144649
2023-10-26	48	107	51770
2023-10-03	25	171	74552
2023-10-20	19	86	158731
2023-10-24	48	139	3305
2023-09-29	59	24	44488
2023-09-30	17	57	91108
2023-10-28	47	192	110783
2023-10-04	36	115	126429
2023-10-24	54	168	91062
2023-10-10	86	22	152687
2023-10-18	50	189	78590
2023-10-14	18	170	34705
2023-10-04	2	129	43914
2023-10-13	6	124	134384
2023-10-08	90	112	85152
2023-09-30	25	100	106751
2023-10-23	86	158	1255
2023-10-21	97	21	165806
2023-10-15	96	157	189032
2023-10-07	50	124	105134
2023-10-23	7	58	88526
2023-10-12	98	11	135828
2023-10-06	14	74	79480
2023-10-26	64	141	10531
2023-09-29	8	73	25229
2023-10-11	30	171	146567
2023-10-02	32	134	175298
2023-10-02	93	182	77363
2023-10-08	83	191	42177
2023-10-15	14	1	52102
2023-10-25	2	20	157617
2023-10-09	45	179	38695
2023-09-29	78	179	51086
2023-10-06	75	57	87920
2023-10-13	56	147	130177
2023-10-15	12	146	198470
2023-10-03	68	93	184828
2023-10-18	9	95	4560
2023-10-17	53	193	8393
2023-10-11	79	166	143398
2023-10-07	92	141	169908
2023-10-21	45	56	31021
2023-10-08	71	1	180769
2023-10-06	17	173	71047
2023-10-18	18	118	31298
2023-10-15	43	188	61452
2023-10-21	8	195	100018
2023-10-25	42	129	194533
2023-10-05	32	184	126024
2023-10-03	56	5	26437
2023-10-14	24	77	39148
2023-10-22	22	149	133051
2023-10-09	33	5	51093
2023-10-07	37	6	77335
2023-10-15	59	107	181993
2023-10-23	32	37	170796
2023-10-09	8	140	174309
2023-10-18	91	1	16744
2023-10-28	89	89	93370
2023-10-11	40	122	170147
2023-10-01	80	142	97097
2023-10-21	35	14	112954
2023-10-12	22	26	154100
2023-09-29	12	15	82482
2023-10-01	93	66	31211
2023-09-29	63	146	20949
2023-10-04	89	177	66024
2023-10-13	54	77	150407
2023-09-30	17	71	138007
2023-10-01	31	7	93740
2023-10-17	96	135	10685
2023-10-20	16	99	133203
2023-10-20	65	174	101330
2023-10-16	52	59	20628
2023-10-23	24	32	100919
2023-10-20	17	146	150559
2023-09-29	85	109	113371
2023-10-05	24	12	111119
2023-10-21	21	53	37198
2023-10-05	28	170	197238
2023-10-04	90	145	182619
2023-09-30	66	109	5269
2023-10-12	30	129	75107
2023-10-12	44	28	45309
2023-10-20	72	11	166009
2023-10-15	74	99	167128
2023-10-01	48	95	2060
2023-10-08	13	178	73096
2023-10-19	14	189	150991
2023-10-15	38	195	142186
2023-10-02	47	182	120448
2023-10-03	5	3	198564
2023-10-05	14	107	111514
2023-09-28	91	114	65953
2023-10-19	76	4	141211
2023-10-09	87	70	22888
2023-10-10	78	7	16969
2023-10-13	81	34	39702
2023-10-20	80	159	9786
2023-10-20	86	187	53545
2023-10-18	39	110	75115
2023-10-05	87	51	93495
\.


--
-- TOC entry 4877 (class 0 OID 16616)
-- Dependencies: 218
-- Data for Name: products; Type: TABLE DATA; Schema: join; Owner: postgres
--

COPY "join".products (product_id, product_name, product_category) FROM stdin;
183	Салат	Овощи
79	Сметана	Молочные продукты
25	Апельсин	Фрукты
3	Кофе	Напитки
138	Хлеб	Зерновые
114	Сок	Напитки
31	Сок	Напитки
5	Морковь	Овощи
94	Овсянка	Зерновые
40	Манго	Фрукты
143	Овсянка	Зерновые
33	Банан	Фрукты
198	Говядина	Мясо
188	Макароны	Зерновые
92	Груша	Фрукты
97	Помидор	Овощи
168	Рыба	Мясо
34	Макароны	Зерновые
197	Кофе	Напитки
46	Брокколи	Овощи
26	Овсянка	Зерновые
109	Кофе	Напитки
95	Сметана	Молочные продукты
56	Лимонад	Напитки
134	Рыба	Мясо
18	Яблоко	Фрукты
118	Сметана	Молочные продукты
180	Молоко	Молочные продукты
89	Кофе	Напитки
195	Макароны	Зерновые
10	Овсянка	Зерновые
30	Овсянка	Зерновые
147	Рис	Зерновые
115	Банан	Фрукты
96	Кролик	Мясо
140	Хлеб	Зерновые
146	Свинина	Мясо
85	Яблоко	Фрукты
196	Помидор	Овощи
148	Свинина	Мясо
162	Салат	Овощи
88	Яблоко	Фрукты
29	Сок	Напитки
172	Апельсин	Фрукты
59	Гречка	Зерновые
137	Макароны	Зерновые
108	Овсянка	Зерновые
54	Кролик	Мясо
91	Картофель	Овощи
107	Брокколи	Овощи
83	Овсянка	Зерновые
52	Свинина	Мясо
175	Манго	Фрукты
62	Курица	Мясо
176	Банан	Фрукты
84	Говядина	Мясо
200	Кролик	Мясо
15	Молоко	Молочные продукты
155	Масло	Молочные продукты
17	Морковь	Овощи
106	Морковь	Овощи
157	Масло	Молочные продукты
11	Манго	Фрукты
32	Творог	Молочные продукты
194	Апельсин	Фрукты
124	Кофе	Напитки
82	Банан	Фрукты
77	Сок	Напитки
156	Манго	Фрукты
136	Курица	Мясо
166	Морковь	Овощи
49	Сметана	Молочные продукты
111	Кролик	Мясо
37	Апельсин	Фрукты
103	Лимонад	Напитки
60	Банан	Фрукты
28	Гречка	Зерновые
167	Апельсин	Фрукты
161	Масло	Молочные продукты
122	Говядина	Мясо
48	Морковь	Овощи
4	Курица	Мясо
163	Хлеб	Зерновые
42	Яблоко	Фрукты
55	Говядина	Мясо
8	Хлеб	Зерновые
13	Овсянка	Зерновые
9	Хлеб	Зерновые
174	Груша	Фрукты
154	Кролик	Мясо
104	Овсянка	Зерновые
23	Сыр	Молочные продукты
123	Салат	Овощи
185	Кролик	Мясо
22	Яблоко	Фрукты
21	Манго	Фрукты
93	Лимонад	Напитки
53	Банан	Фрукты
51	Сок	Напитки
38	Картофель	Овощи
159	Груша	Фрукты
44	Говядина	Мясо
184	Сметана	Молочные продукты
99	Макароны	Зерновые
12	Сыр	Молочные продукты
50	Масло	Молочные продукты
116	Сметана	Молочные продукты
110	Сыр	Молочные продукты
135	Овсянка	Зерновые
130	Гречка	Зерновые
7	Вода	Напитки
189	Овсянка	Зерновые
150	Масло	Молочные продукты
70	Гречка	Зерновые
171	Груша	Фрукты
20	Чай	Напитки
63	Манго	Фрукты
117	Хлеб	Зерновые
132	Творог	Молочные продукты
142	Свинина	Мясо
1	Масло	Молочные продукты
141	Масло	Молочные продукты
125	Морковь	Овощи
186	Рыба	Мясо
66	Кофе	Напитки
6	Манго	Фрукты
190	Морковь	Овощи
78	Брокколи	Овощи
24	Чай	Напитки
169	Помидор	Овощи
58	Апельсин	Фрукты
165	Чай	Напитки
182	Свинина	Мясо
27	Салат	Овощи
120	Банан	Фрукты
160	Свинина	Мясо
112	Чай	Напитки
113	Хлеб	Зерновые
68	Чай	Напитки
153	Творог	Молочные продукты
101	Чай	Напитки
47	Картофель	Овощи
19	Лимонад	Напитки
87	Манго	Фрукты
75	Апельсин	Фрукты
36	Вода	Напитки
86	Картофель	Овощи
145	Чай	Напитки
98	Манго	Фрукты
35	Вода	Напитки
65	Свинина	Мясо
131	Морковь	Овощи
121	Рис	Зерновые
71	Сок	Напитки
149	Кофе	Напитки
102	Кофе	Напитки
43	Лимонад	Напитки
199	Брокколи	Овощи
181	Хлеб	Зерновые
73	Сок	Напитки
80	Яблоко	Фрукты
177	Банан	Фрукты
170	Чай	Напитки
158	Помидор	Овощи
14	Кофе	Напитки
152	Морковь	Овощи
193	Макароны	Зерновые
187	Гречка	Зерновые
72	Говядина	Мясо
16	Молоко	Молочные продукты
128	Яблоко	Фрукты
39	Кофе	Напитки
127	Груша	Фрукты
81	Картофель	Овощи
164	Масло	Молочные продукты
126	Банан	Фрукты
64	Сок	Напитки
191	Чай	Напитки
119	Гречка	Зерновые
133	Сыр	Молочные продукты
105	Курица	Мясо
173	Творог	Молочные продукты
45	Чай	Напитки
178	Молоко	Молочные продукты
57	Лимонад	Напитки
2	Кофе	Напитки
76	Сметана	Молочные продукты
192	Груша	Фрукты
144	Яблоко	Фрукты
100	Кролик	Мясо
151	Сок	Напитки
139	Груша	Фрукты
67	Гречка	Зерновые
69	Манго	Фрукты
179	Молоко	Молочные продукты
129	Манго	Фрукты
74	Хлеб	Зерновые
90	Курица	Мясо
61	Помидор	Овощи
41	Сметана	Молочные продукты
\.


--
-- TOC entry 4878 (class 0 OID 16619)
-- Dependencies: 219
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name) FROM stdin;
1	Nicole Pitts
2	Mr. Jeffrey Sullivan DDS
3	Matthew Hughes
4	Valerie Powers
5	Samantha Sanchez
6	Jacob Allen
7	Bobby Dixon
8	Ian Green
9	Brandon Gill
10	David Hill
11	Anthony Medina
12	Diane Martin
13	Lindsay Cook
14	Sara Ward
15	Krystal Lloyd
16	Mark Morton
17	Janet Quinn
18	Ryan Brown
19	Karla Carney
20	Stephanie Williams
21	Mckenzie Sanders
22	Mrs. Nicole Dodson
23	Elizabeth Gilbert
24	Joseph Diaz
25	James Patterson
26	Frank Barber
27	John Nguyen
28	Jessica Zamora
29	Judith Bennett
30	Charles Blair DVM
31	Mallory Washington
32	Jeffrey Mcconnell
33	Joseph Dudley
34	Julie Wright
35	William Gomez
36	Stephanie Everett PhD
37	Megan Shah
38	Timothy Hunt
39	Elizabeth Henry
40	Douglas Murphy
41	Michael Foley
42	Mr. Anthony Myers
43	Jessica Johnson
44	Aaron Richardson
45	Susan Harmon
46	Aaron Shepherd
47	Allison Mckee MD
48	Steven Miller
49	Kimberly Williams
50	Tonya Watson
51	Gail West
52	Ashley Thompson
53	Allison Tran
54	Donald Martinez
55	Diana White
56	Katherine Porter
57	Tina Miller
58	Kristin Mcdonald
59	Cathy Griffin
60	Steven Reyes
61	Taylor Christian
62	Fernando Ortega
63	Tony Hughes
64	Jasmin Luna
65	Mary Higgins
66	Angela Anthony
67	Christian Gates
68	Jeffrey May
69	Nicholas Munoz
70	Thomas Kline
71	Michaela Robinson
72	Kelly Leonard
73	Alexander Sloan
74	Terri Dean
75	Robert Hansen
76	Denise Vaughan
77	Melinda Ellis
78	Bradley Baker
79	James Potts
80	Justin Mclaughlin
81	Stephanie Klein
82	Tyler Rivera
83	Brittany Price
84	Gabriel Wolfe
85	Jessica Guzman
86	Michael Nelson
87	Gregory Williams
88	Marc Hart
89	Andre Hicks
90	Rhonda Ochoa
91	Carmen Beck
92	Jessica Scott
93	Vanessa James
94	Andrew Miller
95	Brittney Luna
96	Stephanie Ford
97	Erica Meyer
98	Jessica Key
99	Janet Bennett
100	Yvonne Serrano
\.


--
-- TOC entry 4879 (class 0 OID 16624)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, order_date, shipment_date, order_ammount, order_status) FROM stdin;
1	69	2021-01-22 14:09:37	2021-01-29 14:09:37	4180	Approved
2	90	2020-02-19 06:43:02	2020-02-24 06:43:02	4069	Cancel
3	47	2023-05-30 08:44:04	2023-06-04 08:44:04	1925	Cancel
4	66	2022-09-12 15:59:47	2022-09-17 15:59:47	6583	Approved
5	32	2021-04-09 19:12:06	2021-04-16 19:12:06	7354	Approved
6	36	2023-04-20 12:25:04	2023-04-25 12:25:04	6540	Cancel
7	69	2023-10-01 22:44:55	2023-10-08 22:44:55	3245	Approved
8	69	2020-11-26 22:30:07	2020-12-03 22:30:07	2001	Cancel
9	45	2020-01-04 03:15:27	2020-01-11 03:15:27	4469	Cancel
10	57	2020-01-30 20:48:44	2020-02-06 20:48:44	2369	Approved
11	55	2020-02-18 08:03:52	2020-02-25 08:03:52	3258	Cancel
12	73	2021-11-22 07:59:47	2021-11-27 07:59:47	4237	Cancel
13	7	2020-12-02 07:24:56	2020-12-09 07:24:56	6296	Approved
14	90	2021-08-30 02:23:58	2021-09-06 02:23:58	3725	Approved
15	84	2022-07-24 07:36:14	2022-07-29 07:36:14	6535	Approved
16	75	2020-12-24 22:26:01	2021-01-03 22:26:01	1726	Approved
17	73	2021-10-07 09:53:20	2021-10-12 09:53:20	6470	Approved
18	46	2023-01-23 22:05:21	2023-02-02 22:05:21	4643	Approved
19	85	2020-10-13 23:28:39	2020-10-20 23:28:39	2343	Cancel
20	30	2023-09-26 07:04:51	2023-10-06 07:04:51	4513	Approved
21	57	2020-05-31 03:55:38	2020-06-10 03:55:38	2641	Approved
22	21	2021-07-02 03:50:40	2021-07-12 03:50:40	4034	Approved
23	10	2022-03-12 17:11:12	2022-03-19 17:11:12	3838	Approved
24	48	2023-07-18 02:20:07	2023-07-25 02:20:07	5203	Approved
25	13	2023-05-19 23:30:26	2023-05-26 23:30:26	3627	Approved
26	87	2022-08-31 14:41:04	2022-09-10 14:41:04	6132	Cancel
27	44	2021-02-17 16:52:08	2021-02-24 16:52:08	1746	Approved
28	57	2020-05-05 23:44:28	2020-05-15 23:44:28	1075	Approved
29	70	2022-03-15 10:59:25	2022-03-22 10:59:25	2541	Cancel
30	10	2022-05-13 02:58:08	2022-05-20 02:58:08	1453	Cancel
31	1	2022-06-02 22:03:20	2022-06-09 22:03:20	7431	Cancel
32	90	2023-06-18 19:57:58	2023-06-23 19:57:58	6986	Approved
33	94	2021-10-17 18:12:22	2021-10-27 18:12:22	2761	Cancel
34	46	2023-03-06 02:01:08	2023-03-16 02:01:08	3745	Approved
35	78	2021-04-19 14:04:26	2021-04-29 14:04:26	1045	Cancel
36	4	2023-06-21 10:13:01	2023-06-26 10:13:01	3750	Cancel
37	83	2023-07-05 06:10:19	2023-07-15 06:10:19	7476	Approved
38	41	2022-09-14 10:11:23	2022-09-24 10:11:23	7483	Cancel
39	74	2022-01-25 12:34:05	2022-02-01 12:34:05	1307	Cancel
40	68	2023-02-28 23:33:32	2023-03-10 23:33:32	5736	Cancel
41	23	2022-09-28 22:50:59	2022-10-08 22:50:59	7658	Cancel
42	60	2023-01-25 16:48:39	2023-01-30 16:48:39	7374	Approved
43	20	2021-02-21 08:44:00	2021-02-28 08:44:00	7471	Cancel
44	43	2022-02-06 03:12:59	2022-02-11 03:12:59	2526	Approved
45	49	2021-10-06 00:55:15	2021-10-13 00:55:15	3511	Approved
46	91	2023-10-02 07:08:58	2023-10-07 07:08:58	5437	Approved
47	96	2022-05-07 22:54:45	2022-05-17 22:54:45	6766	Cancel
48	78	2021-10-10 15:42:58	2021-10-15 15:42:58	4433	Cancel
49	33	2020-02-06 03:16:04	2020-02-16 03:16:04	4806	Cancel
50	50	2023-05-25 17:53:54	2023-06-01 17:53:54	7959	Cancel
51	52	2023-04-21 13:57:45	2023-04-26 13:57:45	6220	Cancel
52	29	2023-09-03 03:23:46	2023-09-13 03:23:46	1480	Approved
53	26	2023-05-12 12:04:05	2023-05-19 12:04:05	1409	Cancel
54	6	2021-09-27 06:47:32	2021-10-02 06:47:32	7396	Approved
55	17	2021-05-26 11:32:28	2021-06-05 11:32:28	6623	Cancel
56	50	2022-10-28 20:42:19	2022-11-04 20:42:19	1781	Cancel
57	23	2020-09-13 00:12:43	2020-09-18 00:12:43	5212	Cancel
58	24	2020-07-09 06:04:17	2020-07-19 06:04:17	7773	Cancel
59	23	2022-08-25 14:16:58	2022-08-30 14:16:58	4848	Cancel
60	96	2022-08-22 15:06:45	2022-08-27 15:06:45	4781	Approved
61	15	2021-07-04 07:57:28	2021-07-09 07:57:28	3835	Approved
62	79	2023-08-22 00:51:28	2023-08-29 00:51:28	5300	Cancel
63	80	2020-09-14 07:31:58	2020-09-24 07:31:58	7658	Cancel
64	95	2021-11-15 13:30:00	2021-11-22 13:30:00	1176	Approved
65	47	2022-01-17 07:36:06	2022-01-22 07:36:06	4823	Approved
66	10	2022-05-17 21:42:47	2022-05-22 21:42:47	5494	Cancel
67	18	2021-04-02 13:02:37	2021-04-07 13:02:37	7172	Approved
68	78	2021-05-15 02:34:40	2021-05-20 02:34:40	1333	Approved
69	59	2022-08-03 01:26:22	2022-08-10 01:26:22	1715	Approved
70	30	2022-07-16 05:03:21	2022-07-23 05:03:21	4565	Approved
71	44	2023-06-12 21:14:20	2023-06-19 21:14:20	1070	Cancel
72	42	2023-09-11 10:31:26	2023-09-18 10:31:26	6930	Cancel
73	61	2020-07-14 05:09:36	2020-07-24 05:09:36	2135	Approved
74	41	2023-01-11 06:58:11	2023-01-21 06:58:11	4591	Approved
75	64	2023-03-12 14:02:10	2023-03-19 14:02:10	5010	Cancel
76	36	2022-10-17 08:14:19	2022-10-27 08:14:19	5556	Approved
77	3	2020-07-13 06:11:08	2020-07-18 06:11:08	7022	Cancel
78	90	2023-02-27 20:32:29	2023-03-06 20:32:29	7038	Approved
79	44	2022-07-13 21:15:43	2022-07-20 21:15:43	7659	Cancel
80	4	2022-01-30 00:52:17	2022-02-04 00:52:17	1435	Cancel
81	46	2022-06-06 18:01:58	2022-06-13 18:01:58	3188	Approved
82	59	2020-06-29 16:23:44	2020-07-04 16:23:44	5403	Approved
83	63	2020-04-28 11:08:37	2020-05-08 11:08:37	3788	Approved
84	22	2021-06-24 02:40:46	2021-06-29 02:40:46	3288	Approved
85	90	2021-11-12 04:00:01	2021-11-17 04:00:01	4629	Approved
86	47	2023-10-09 23:39:56	2023-10-19 23:39:56	3653	Cancel
87	86	2022-05-22 00:50:35	2022-05-29 00:50:35	4801	Approved
88	10	2022-03-25 00:23:32	2022-04-04 00:23:32	5090	Cancel
89	25	2020-01-13 08:32:36	2020-01-23 08:32:36	1674	Approved
90	95	2023-07-22 14:05:38	2023-07-29 14:05:38	984	Cancel
91	48	2020-04-10 14:55:50	2020-04-20 14:55:50	6941	Cancel
92	49	2022-09-06 11:38:01	2022-09-11 11:38:01	7191	Approved
93	63	2021-01-24 22:25:57	2021-02-03 22:25:57	4046	Cancel
94	63	2023-09-08 13:33:50	2023-09-13 13:33:50	7487	Cancel
95	88	2023-06-21 00:25:47	2023-06-26 00:25:47	5493	Approved
96	40	2020-05-24 09:10:08	2020-06-03 09:10:08	1880	Approved
97	62	2021-08-08 13:06:22	2021-08-15 13:06:22	5482	Approved
98	29	2020-06-27 01:52:06	2020-07-04 01:52:06	4113	Approved
99	28	2022-10-15 20:10:47	2022-10-25 20:10:47	5994	Cancel
100	10	2022-01-09 04:48:56	2022-01-14 04:48:56	5148	Cancel
\.


--
-- TOC entry 4880 (class 0 OID 16629)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category, price) FROM stdin;
1	Medicine Item	Health	137
2	Party Instrument	Entertainment	55
3	Mens Supplies	Clothing	85
4	Outdoors Instrument	Activity	97
5	Hair Care Supplies	Beauty	117
6	Dining Implement	Home	94
7	Hair Care Gizmo	Beauty	165
8	Sports Contraption	Activity	11
9	Tire Thingamajig	Automotive	48
10	Biking Gadget	Activity	79
11	Kids Instrument	Clothing	73
12	Truck Machine	Automotive	82
13	Makeup Whatchamacallit	Beauty	92
14	Cat Gear	Pets	130
15	Movie Gizmo	Entertainment	120
16	Cleaning Component	Home	183
17	Womens Doodad	Clothing	154
18	Truck Doodad	Automotive	92
19	Game Doodad	Entertainment	186
20	Home Improvement Implement	Home	100
21	Medicine Paraphernalia	Health	192
22	Cat Equipment	Pets	173
23	Bath Gizmo	Beauty	174
24	Aquarium Item	Pets	68
25	Furniture Gear	Home	39
26	Camping Mechanism	Activity	97
27	Medicine Mechanism	Health	113
28	Engine Equipment	Automotive	191
29	Music Machine	Entertainment	70
30	Beach Machine	Activity	163
31	Makeup Rig	Beauty	188
32	Sports Kit	Activity	172
33	Vitamin Contraption	Health	82
34	Home Improvement Attachment	Home	124
35	Storage Doodad	Home	59
36	Biking Doodad	Activity	175
37	Game Equipment	Entertainment	157
38	Cat Kit	Pets	35
39	Cat Rig	Pets	186
40	Vitamin Gear	Health	90
41	Aquarium Equipment	Pets	33
42	Kitchen Accessory	Home	97
43	Personal Device	Beauty	33
44	Bath Whatchamacallit	Beauty	113
45	Computer Accessory	Electronics	160
46	Movie Supplies	Entertainment	71
47	Home Improvement Kit	Home	78
48	Computer Gear	Electronics	40
49	Baby Equipment	Clothing	127
50	Personal Implement	Beauty	49
51	Computer Doodad	Electronics	125
52	Phone Accessory	Electronics	132
53	Sports Gadget	Activity	42
54	Vitamin Mechanism	Health	61
55	Fitness Mechanism	Activity	122
56	Party Thingamajig	Entertainment	175
57	Toy Apparatus	Entertainment	132
58	Dog Item	Pets	99
59	Mens Supplies	Clothing	174
60	Gardening Doodad	Home	65
61	Toy Machine	Entertainment	163
62	Jewelry Attachment	Clothing	71
63	Book Rig	Entertainment	182
64	Skin Care Contraption	Beauty	111
65	Cat Paraphernalia	Pets	128
66	Computer Machine	Electronics	133
67	Storage Apparatus	Home	179
68	Computer Tool	Electronics	49
69	Bath Attachment	Beauty	121
70	Music Thingamajig	Entertainment	31
71	Game Machine	Entertainment	133
72	Jewelry Implement	Clothing	106
73	Cooking Apparatus	Home	39
74	Bedding Machine	Home	125
75	Hair Care Accessory	Beauty	89
76	Nutrition Instrument	Health	73
77	Womens Gizmo	Clothing	21
78	Fitness Gizmo	Activity	186
79	Baby Implement	Clothing	26
80	Mens Doodad	Clothing	154
81	Jewelry Accessory	Clothing	52
82	Personal Attachment	Beauty	18
83	Game Device	Entertainment	96
84	Makeup Tool	Beauty	54
85	Outdoors Contraption	Activity	103
86	Book Whatchamacallit	Entertainment	167
87	Makeup Paraphernalia	Beauty	62
88	Nutrition Paraphernalia	Health	16
89	Technology Thingamajig	Electronics	36
90	First Aid Apparatus	Health	153
91	Baby Widget	Clothing	87
92	Swimming Tool	Activity	177
93	Furniture Gadget	Home	152
94	Technology Attachment	Electronics	158
95	Vitamin Instrument	Health	168
96	Kids Doodad	Clothing	71
97	Baby Whatchamacallit	Clothing	51
98	Cat Doodad	Pets	149
99	Baby Equipment	Clothing	145
100	Engine Device	Automotive	174
\.


--
-- TOC entry 4881 (class 0 OID 16632)
-- Dependencies: 222
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellers (seller_id, category, date_reg, date, revenue, rating, delivery_days) FROM stdin;
162	Medicine	2022-11-17	2023-11-17	48303	2	8
73	Hair Care	2016-01-17	2017-01-17	50798	5	4
220	Vitamin	2011-11-23	2012-11-23	61868	8	2
240	Vitamin	2022-02-23	2023-02-23	12702	3	2
197	Vitamin	2019-06-18	2020-06-18	33805	1	6
104	Tire	2012-12-25	2013-12-25	37908	5	0
157	Aquarium	2023-02-25	2024-02-25	11024	5	3
214	Fitness	2019-06-15	2020-06-15	52764	8	8
145	Phone	2017-08-02	2018-02-08	11027	3	6
97	Music	2023-05-24	2024-05-24	19009	4	6
93	Personal	2022-08-02	2023-02-08	31312	2	8
24	Bedding	2015-10-24	2016-10-24	32153	7	2
202	Bedding	2014-07-20	2015-07-20	49829	0	4
32	Toy	2019-03-28	2020-03-28	47064	1	4
256	Kids	2012-11-05	2013-05-11	50565	7	7
242	Book	2016-05-17	2017-05-17	44853	2	7
71	Technology	2012-12-14	2013-12-14	13934	0	6
32	Beach	2011-01-25	2012-01-25	21668	7	9
138	Cooking	2018-08-03	2019-03-08	45429	8	6
98	Beach	2016-06-30	2017-06-30	35481	2	8
192	Mens	2019-08-21	2020-08-21	60127	3	5
63	Truck	2016-04-13	2017-04-13	36171	3	5
221	Jewelry	2022-07-26	2023-07-26	25084	6	4
60	Vitamin	2021-08-17	2022-08-17	52125	4	8
153	Jewelry	2010-12-08	2011-08-12	3692	9	0
82	Medicine	2010-04-02	2011-02-04	59687	2	5
54	Womens	2016-04-21	2017-04-21	17716	1	3
147	Fitness	2020-11-09	2021-09-11	49729	5	0
246	Baby	2016-08-21	2017-08-21	18317	9	4
23	Tire	2011-09-19	2012-09-19	63272	3	4
117	Car	2018-02-16	2019-02-16	37597	3	5
141	Vitamin	2012-03-08	2013-08-03	59575	9	5
23	Cat	2019-02-09	2020-09-02	37402	0	4
233	Cooking	2014-10-08	2015-08-10	13472	1	5
85	Movie	2014-05-30	2015-05-30	34114	5	2
201	Tire	2015-11-04	2016-04-11	37113	7	7
144	Bath	2015-03-02	2016-02-03	1414	0	9
53	Medicine	2022-10-25	2023-10-25	24288	4	5
96	Cooking	2021-08-13	2022-08-13	13603	5	8
191	Furniture	2021-04-11	2022-11-04	19006	3	4
203	Bath	2010-06-05	2011-05-06	32570	2	9
23	Camera	2018-10-24	2019-10-24	41586	3	2
14	Truck	2013-12-02	2014-02-12	55479	5	6
209	Technology	2016-10-23	2017-10-23	6824	8	9
67	Storage	2012-12-26	2013-12-26	33585	8	3
185	Hair Care	2012-03-16	2013-03-16	40199	5	7
26	Fitness	2010-09-22	2011-09-22	39628	6	0
131	Biking	2010-11-11	2011-11-11	36024	6	8
208	Mens	2022-12-08	2023-08-12	25831	3	9
224	Furniture	2016-08-24	2017-08-24	24999	9	1
47	Bedding	2017-02-11	2018-11-02	16489	9	7
240	Bath	2016-05-06	2017-06-05	5020	5	5
144	Nutrition	2010-05-01	2011-01-05	1139	5	9
26	Game	2022-09-29	2023-09-29	53200	1	2
188	Cleaning	2015-02-07	2016-07-02	25043	5	4
83	Bedding	2012-10-10	2013-10-10	60920	2	8
196	Bath	2018-03-02	2019-02-03	33597	5	4
137	Camera	2016-07-25	2017-07-25	37205	0	9
206	Kitchen	2013-10-01	2014-01-10	57098	2	9
228	Dog	2016-08-29	2017-08-29	9050	6	6
37	Nutrition	2012-10-10	2013-10-10	63267	6	5
195	Sports	2019-07-04	2020-04-07	17001	9	8
48	Computer	2015-03-04	2016-04-03	12026	1	1
160	Tire	2016-05-08	2017-08-05	36944	8	2
128	Camera	2017-06-30	2018-06-30	5640	7	2
256	Biking	2015-09-15	2016-09-15	6741	5	7
248	Hair Care	2014-08-02	2015-02-08	36753	0	9
126	Jewelry	2013-04-27	2014-04-27	51211	7	3
227	Womens	2020-12-30	2021-12-30	21228	1	1
87	Vitamin	2015-12-28	2016-12-28	37480	7	1
190	Kitchen	2014-05-22	2015-05-22	59638	8	5
137	Technology	2020-12-17	2021-12-17	5491	3	4
104	Dining	2012-02-09	2013-09-02	27831	6	9
232	Storage	2019-09-17	2020-09-17	27992	5	0
180	Party	2011-05-01	2012-01-05	31196	7	6
249	First Aid	2022-08-03	2023-03-08	51849	4	3
127	Skin Care	2022-11-04	2023-04-11	52412	5	5
38	Toy	2013-07-10	2014-10-07	14095	6	2
2	Book	2021-03-17	2022-03-17	61200	5	3
188	Mens	2011-05-29	2012-05-29	55475	5	6
183	Game	2012-01-31	2013-01-31	46056	4	1
90	Party	2020-04-19	2021-04-19	1201	9	1
123	Home Improvement	2016-03-01	2017-01-03	41253	6	9
118	Outdoors	2021-01-27	2022-01-27	53717	7	1
19	Dining	2023-10-04	2024-04-10	718	9	8
164	Baby	2019-06-15	2020-06-15	17087	0	3
236	Home Improvement	2011-06-21	2012-06-21	14870	0	0
21	Music	2015-08-15	2016-08-15	34685	3	6
165	Vitamin	2014-02-27	2015-02-27	29928	9	9
38	Engine	2015-09-19	2016-09-19	18737	4	9
242	Cat	2018-10-01	2019-01-10	13100	2	8
236	Furniture	2022-05-28	2023-05-28	36067	7	8
64	Bedding	2010-02-26	2011-02-26	50679	3	6
228	Truck	2011-06-10	2012-10-06	50315	5	9
148	Mens	2023-03-06	2024-06-03	34053	7	1
78	Cleaning	2018-06-11	2019-11-06	58140	0	4
106	Nutrition	2012-05-17	2013-05-17	7306	4	6
243	Cleaning	2015-06-04	2016-04-06	23672	1	6
226	Kids	2015-08-28	2016-08-28	61553	3	4
21	Cooking	2019-07-15	2020-07-15	9734	3	3
13	First Aid	2019-12-27	2020-12-27	15551	2	2
253	Home Improvement	2019-01-23	2020-01-23	12014	2	8
125	Beach	2022-08-12	2023-12-08	23008	1	8
146	Nutrition	2017-05-21	2018-05-21	28359	2	8
101	Fitness	2022-09-29	2023-09-29	24766	4	2
225	Biking	2021-10-24	2022-10-24	65370	1	5
207	Jewelry	2017-09-14	2018-09-14	61473	2	2
202	Jewelry	2016-06-08	2017-08-06	9529	9	3
120	Dining	2019-10-20	2020-10-20	17011	6	8
19	Book	2011-06-22	2012-06-22	51079	6	8
189	Movie	2018-11-27	2019-11-27	49219	7	4
206	Beach	2020-01-10	2021-10-01	11576	2	2
86	Biking	2023-03-25	2024-03-25	18212	8	2
172	Camping	2023-01-10	2024-10-01	33000	3	3
254	Toy	2022-09-17	2023-09-17	40329	6	4
168	Car	2012-12-20	2013-12-20	35028	8	2
136	Toy	2021-05-22	2022-05-22	9782	4	7
150	Music	2017-08-23	2018-08-23	35992	4	1
186	Tire	2016-07-16	2017-07-16	59636	9	8
7	Camera	2019-04-15	2020-04-15	22951	7	1
230	Sports	2017-07-18	2018-07-18	13386	4	2
238	Medicine	2016-12-03	2017-03-12	11837	2	7
128	Swimming	2013-04-21	2014-04-21	20392	7	4
151	Bedding	2022-10-15	2023-10-15	41626	4	1
166	Storage	2021-11-15	2022-11-15	44825	1	2
65	Party	2022-07-07	2023-07-07	24905	9	6
17	Toy	2023-09-17	2024-09-17	45486	3	2
147	Makeup	2014-08-22	2015-08-22	26468	6	0
139	Womens	2017-08-26	2018-08-26	53825	0	7
109	Biking	2016-11-17	2017-11-17	49462	7	5
120	Technology	2016-04-14	2017-04-14	32022	3	5
138	Bath	2020-12-24	2021-12-24	51370	9	1
101	Engine	2012-12-30	2013-12-30	40621	3	2
216	Beach	2018-03-03	2019-03-03	24169	3	3
51	Camping	2016-09-29	2017-09-29	53868	5	8
205	Music	2018-07-13	2019-07-13	8074	2	7
210	Book	2021-06-06	2022-06-06	31676	0	1
146	Car	2023-04-15	2024-04-15	54490	5	5
132	Outdoors	2022-12-15	2023-12-15	57270	4	4
89	Game	2021-11-13	2022-11-13	32244	3	0
136	Music	2019-02-02	2020-02-02	64987	1	7
81	Cooking	2013-10-01	2014-01-10	21300	7	7
2	Womens	2017-07-26	2018-07-26	24315	5	1
5	Outdoors	2022-05-24	2023-05-24	60672	8	3
129	Makeup	2014-06-22	2015-06-22	38188	1	6
80	Kids	2015-01-10	2016-10-01	21128	0	4
9	Car	2015-11-01	2016-01-11	48953	2	4
54	Home Improvement	2022-07-02	2023-02-07	64235	3	4
33	Jewelry	2013-11-30	2014-11-30	46169	6	0
88	Kids	2014-03-18	2015-03-18	28902	0	2
133	Dog	2021-11-24	2022-11-24	52888	5	2
186	Mens	2020-07-07	2021-07-07	20971	2	9
122	Engine	2011-02-07	2012-07-02	14247	7	3
184	Dog	2012-03-19	2013-03-19	12590	7	0
90	Cleaning	2014-04-23	2015-04-23	14359	6	2
221	Biking	2019-03-13	2020-03-13	60011	0	6
57	Tire	2021-12-14	2022-12-14	12617	4	5
169	Baby	2012-11-10	2013-10-11	51180	4	7
141	Cooking	2022-05-28	2023-05-28	31556	3	2
178	Camera	2020-02-21	2021-02-21	16091	6	7
200	Tire	2014-04-23	2015-04-23	4895	7	5
138	Womens	2016-06-01	2017-01-06	16523	6	8
176	Makeup	2022-03-14	2023-03-14	36978	7	0
195	Bedding	2016-03-16	2017-03-16	57950	6	1
152	Dog	2013-09-21	2014-09-21	27693	8	7
53	Game	2023-05-16	2024-05-16	30425	4	4
196	Camping	2017-06-16	2018-06-16	63786	7	0
102	Kitchen	2013-08-12	2014-12-08	27697	3	6
203	Movie	2022-06-21	2023-06-21	8444	3	6
254	Music	2010-01-09	2011-09-01	8548	8	0
222	Aquarium	2023-08-03	2024-03-08	40816	9	9
135	Car	2014-01-23	2015-01-23	61080	4	1
21	Aquarium	2011-05-13	2012-05-13	42275	5	2
161	Jewelry	2012-03-28	2013-03-28	49335	9	5
102	Personal	2017-03-11	2018-11-03	53622	4	6
123	Tire	2016-01-01	2017-01-01	35136	9	4
205	Swimming	2011-02-14	2012-02-14	61419	8	1
13	Cat	2012-07-04	2013-04-07	49739	6	1
248	Skin Care	2014-03-18	2015-03-18	57678	0	9
124	Beach	2014-09-27	2015-09-27	8572	5	0
76	Nutrition	2013-02-20	2014-02-20	38421	2	3
108	Dog	2014-03-11	2015-11-03	54837	3	7
207	Jewelry	2022-06-20	2023-06-20	55614	1	2
47	Kids	2022-07-23	2023-07-23	43578	7	7
213	Gardening	2011-02-27	2012-02-27	47029	2	7
84	First Aid	2022-01-14	2023-01-14	39317	6	9
94	Biking	2022-03-13	2023-03-13	57927	7	8
249	Skin Care	2014-02-24	2015-02-24	23331	1	6
237	Sports	2011-09-20	2012-09-20	14656	7	8
66	Womens	2022-09-13	2023-09-13	57323	1	5
246	Storage	2015-02-28	2016-02-28	49276	6	5
247	Computer	2021-05-11	2022-11-05	22466	8	8
163	Furniture	2012-10-24	2013-10-24	13941	1	5
37	Camping	2011-09-06	2012-06-09	49581	4	0
75	Toy	2018-10-28	2019-10-28	58951	8	4
229	Nutrition	2015-06-21	2016-06-21	15721	9	9
99	Home Improvement	2022-08-07	2023-07-08	35455	4	2
27	Vitamin	2016-07-14	2017-07-14	40808	8	9
187	Cat	2016-09-15	2017-09-15	60918	8	6
122	Makeup	2020-08-11	2021-11-08	4504	3	6
7	Movie	2012-02-22	2013-02-22	26246	1	7
254	Cleaning	2021-12-18	2022-12-18	51804	3	2
144	Party	2021-11-24	2022-11-24	48956	7	3
137	Nutrition	2013-10-29	2014-10-29	11233	2	6
36	Jewelry	2012-08-24	2013-08-24	36946	4	0
248	Furniture	2016-07-07	2017-07-07	13085	4	0
38	Baby	2014-10-15	2015-10-15	28161	8	8
253	Kitchen	2021-12-16	2022-12-16	21574	4	9
83	Party	2015-12-17	2016-12-17	45536	2	4
202	Personal	2010-02-04	2011-04-02	7871	5	9
131	Technology	2019-08-09	2020-09-08	62535	4	2
239	Biking	2014-08-13	2015-08-13	47448	0	0
37	Cooking	2017-10-19	2018-10-19	8306	9	6
85	Dog	2020-01-05	2021-05-01	28598	9	8
85	Engine	2020-10-26	2021-10-26	64029	4	0
22	Book	2013-08-08	2014-08-08	9299	6	5
157	Dining	2015-10-22	2016-10-22	51484	3	1
209	Fitness	2020-12-06	2021-06-12	27896	4	4
234	Toy	2020-11-24	2021-11-24	14883	9	3
87	Jewelry	2019-11-10	2020-10-11	49344	1	0
249	Vitamin	2020-08-01	2021-01-08	8079	9	7
82	Vitamin	2014-05-13	2015-05-13	63884	4	5
51	Aquarium	2017-04-02	2018-02-04	22246	3	7
241	Bath	2016-08-08	2017-08-08	55401	4	8
77	Camping	2018-12-29	2019-12-29	39405	5	5
47	Swimming	2023-07-28	2024-07-28	51556	5	4
253	Engine	2019-05-01	2020-01-05	5816	9	1
18	Skin Care	2022-06-17	2023-06-17	53661	9	4
222	Sports	2018-03-02	2019-02-03	51843	5	4
61	Car	2012-11-10	2013-10-11	41283	3	8
229	Nutrition	2013-08-08	2014-08-08	16501	2	2
177	Book	2013-11-15	2014-11-15	1501	7	3
8	Bedding	2010-05-16	2011-05-16	4213	1	0
74	Personal	2010-12-29	2011-12-29	55835	1	0
162	Mens	2021-06-20	2022-06-20	694	4	8
53	Camera	2012-06-15	2013-06-15	53790	2	5
145	Technology	2019-03-12	2020-12-03	57937	1	2
189	Kitchen	2014-08-06	2015-06-08	9513	2	5
40	Car	2013-05-23	2014-05-23	42083	4	0
144	Truck	2010-01-02	2011-02-01	58688	9	4
70	Phone	2021-04-24	2022-04-24	56332	8	1
16	Computer	2011-02-11	2012-11-02	52950	1	7
69	Vitamin	2017-11-28	2018-11-28	5577	8	7
148	Kitchen	2016-02-03	2017-03-02	56359	8	0
254	Home Improvement	2011-12-07	2012-07-12	53463	2	7
95	Jewelry	2023-03-30	2024-03-30	11025	1	1
237	Dining	2010-12-05	2011-05-12	966	1	5
44	Dog	2015-08-02	2016-02-08	334	3	9
98	Tire	2013-03-20	2014-03-20	29494	4	5
206	Party	2015-05-12	2016-12-05	43808	0	1
8	Camping	2018-02-02	2019-02-02	19812	1	4
178	Medicine	2015-07-21	2016-07-21	52254	5	6
137	Mens	2023-07-05	2024-05-07	40759	1	4
60	Truck	2018-12-06	2019-06-12	38616	3	3
82	Medicine	2014-11-15	2015-11-15	57687	0	2
168	Baby	2018-06-20	2019-06-20	44171	8	5
13	Engine	2010-05-16	2011-05-16	11553	1	8
47	Bedding	2010-12-26	2011-12-26	19190	7	0
80	Vitamin	2012-06-15	2013-06-15	6722	9	1
6	Book	2011-01-08	2012-08-01	11736	1	2
215	Camera	2020-02-18	2021-02-18	48543	2	3
190	Truck	2010-02-20	2011-02-20	63335	9	4
129	Music	2014-11-06	2015-06-11	64571	0	5
109	Camping	2016-02-23	2017-02-23	14254	0	4
242	Swimming	2015-11-22	2016-11-22	25416	2	6
124	Cooking	2011-07-23	2012-07-23	20547	8	9
188	Camera	2015-03-19	2016-03-19	48513	3	5
93	Movie	2014-03-27	2015-03-27	65402	4	5
208	Sports	2014-07-25	2015-07-25	46044	9	2
23	Computer	2013-07-27	2014-07-27	9490	1	4
210	Beach	2019-11-06	2020-06-11	63560	0	5
6	Book	2022-10-29	2023-10-29	10274	5	0
129	Personal	2013-08-15	2014-08-15	58431	8	3
57	Toy	2016-02-04	2017-04-02	63927	6	3
180	Home Improvement	2015-07-15	2016-07-15	50497	4	7
170	Baby	2021-10-11	2022-11-10	47793	8	6
55	Makeup	2012-09-28	2013-09-28	37109	1	3
17	Party	2018-07-19	2019-07-19	22973	8	3
251	Biking	2019-06-20	2020-06-20	8787	9	4
81	Cleaning	2015-12-25	2016-12-25	19	2	5
167	Kitchen	2016-08-16	2017-08-16	3261	3	9
161	Hair Care	2017-04-17	2018-04-17	40620	2	0
177	Camera	2013-06-20	2014-06-20	45691	1	3
107	Game	2019-04-24	2020-04-24	59883	9	9
75	Personal	2017-01-04	2018-04-01	17590	5	8
68	Tire	2023-07-08	2024-08-07	27038	5	1
253	Dining	2011-09-17	2012-09-17	51849	0	8
26	Bath	2013-07-28	2014-07-28	43196	8	5
118	Toy	2016-04-15	2017-04-15	37028	4	7
83	Dining	2011-06-11	2012-11-06	3271	9	7
49	Gardening	2017-09-27	2018-09-27	35781	0	9
34	Storage	2013-04-12	2014-12-04	56845	4	3
22	Jewelry	2010-04-14	2011-04-14	63581	4	5
238	Party	2019-06-15	2020-06-15	5215	6	9
140	Music	2011-06-16	2012-06-16	28538	3	7
114	Car	2023-07-02	2024-02-07	34187	6	0
155	Baby	2010-03-10	2011-10-03	5301	7	9
212	Dining	2013-06-04	2014-04-06	7755	1	0
149	Kitchen	2016-10-19	2017-10-19	8254	7	7
233	Dog	2018-01-24	2019-01-24	1698	9	7
180	Game	2018-07-12	2019-12-07	8222	1	1
177	Bedding	2011-08-25	2012-08-25	23347	0	1
26	Baby	2014-12-10	2015-10-12	444	9	3
152	Personal	2015-09-28	2016-09-28	28479	5	6
207	Jewelry	2023-08-11	2024-11-08	26379	4	4
160	Kids	2016-02-23	2017-02-23	44046	8	6
33	Engine	2011-12-15	2012-12-15	54083	0	7
84	Camera	2015-04-12	2016-12-04	38047	7	5
77	Phone	2010-05-18	2011-05-18	28873	1	3
238	Tire	2014-12-05	2015-05-12	36301	4	9
171	Bedding	2020-11-17	2021-11-17	1642	6	2
139	Aquarium	2019-12-14	2020-12-14	65108	2	2
183	Book	2013-04-24	2014-04-24	41657	4	6
165	Cooking	2017-04-14	2018-04-14	6562	2	8
107	Dog	2022-10-04	2023-04-10	30105	6	8
167	Cooking	2017-12-04	2018-04-12	59695	6	4
117	Kitchen	2016-05-24	2017-05-24	59622	8	4
165	Engine	2011-02-22	2012-02-22	54686	6	1
145	Music	2014-07-13	2015-07-13	62545	3	8
101	Makeup	2010-05-20	2011-05-20	44766	9	6
176	Bath	2017-05-14	2018-05-14	8449	0	8
132	Kids	2010-07-06	2011-06-07	44487	4	3
81	Home Improvement	2019-08-16	2020-08-16	3684	3	4
198	Technology	2011-10-22	2012-10-22	36996	0	6
216	Dog	2018-09-25	2019-09-25	45889	0	0
32	Bath	2018-07-22	2019-07-22	40288	9	8
48	Technology	2012-12-20	2013-12-20	59241	3	5
89	Cooking	2021-07-16	2022-07-16	49736	7	3
216	Cat	2015-11-02	2016-02-11	56628	1	2
243	Movie	2021-05-11	2022-11-05	62724	5	8
108	Vitamin	2011-08-09	2012-09-08	18071	8	4
27	Camera	2020-05-22	2021-05-22	63511	0	2
232	Kitchen	2015-08-24	2016-08-24	3246	8	1
201	Tire	2021-11-05	2022-05-11	40734	4	5
104	Sports	2021-07-04	2022-04-07	61017	9	6
225	Sports	2010-04-21	2011-04-21	15625	6	1
234	Outdoors	2013-11-09	2014-09-11	37812	0	9
228	Beach	2010-09-03	2011-03-09	39378	9	4
147	Kids	2011-08-01	2012-01-08	62694	4	4
177	Tire	2018-07-18	2019-07-18	58271	1	5
206	Outdoors	2016-08-06	2017-06-08	458	5	1
191	Computer	2010-01-20	2011-01-20	23714	3	6
164	Womens	2015-06-08	2016-08-06	65310	2	7
248	Vitamin	2017-05-22	2018-05-22	14069	5	5
17	Phone	2016-06-10	2017-10-06	51683	1	6
22	Mens	2011-02-25	2012-02-25	59827	7	1
229	Tire	2011-07-31	2012-07-31	54902	3	0
5	Mens	2017-07-02	2018-02-07	46891	8	4
35	Dog	2019-07-13	2020-07-13	49511	3	5
187	Swimming	2016-04-08	2017-08-04	1181	5	8
98	Fitness	2016-09-03	2017-03-09	58838	7	7
188	Outdoors	2013-11-10	2014-10-11	54731	3	9
137	Mens	2010-07-04	2011-04-07	3570	5	2
108	Camera	2022-11-26	2023-11-26	59086	8	4
85	Truck	2015-02-09	2016-09-02	355	5	4
170	Skin Care	2012-03-30	2013-03-30	41601	6	6
11	Fitness	2012-08-11	2013-11-08	10615	9	5
38	Phone	2017-04-19	2018-04-19	7103	9	1
179	Cat	2014-03-17	2015-03-17	41943	9	1
207	Bath	2018-09-30	2019-09-30	6590	2	5
229	Hair Care	2010-02-02	2011-02-02	21748	5	0
233	Beach	2011-07-04	2012-04-07	62345	8	2
155	Furniture	2010-03-02	2011-02-03	1396	3	7
241	Fitness	2011-07-28	2012-07-28	20003	4	8
219	Technology	2020-12-08	2021-08-12	19056	2	8
41	Computer	2021-01-16	2022-01-16	22590	4	4
113	Medicine	2015-04-04	2016-04-04	17975	4	5
146	Storage	2016-08-28	2017-08-28	8882	9	5
142	Sports	2020-04-14	2021-04-14	26308	9	4
123	Engine	2020-02-11	2021-11-02	8494	1	5
156	Truck	2020-08-25	2021-08-25	3413	4	8
15	Party	2012-07-07	2013-07-07	11352	6	8
130	Aquarium	2021-04-25	2022-04-25	36253	2	7
153	Book	2015-02-27	2016-02-27	27116	1	7
56	Bath	2014-02-16	2015-02-16	1075	1	5
204	Biking	2012-07-09	2013-09-07	37904	4	9
29	Phone	2014-01-12	2015-12-01	5342	4	7
11	Bath	2016-02-18	2017-02-18	60524	8	7
68	Camping	2020-08-10	2021-10-08	9912	7	7
29	Gardening	2010-10-22	2011-10-22	26310	0	0
25	Bath	2019-12-01	2020-01-12	48657	0	7
81	Personal	2011-08-01	2012-01-08	27517	5	8
145	Biking	2010-08-28	2011-08-28	30084	9	5
87	Skin Care	2016-02-14	2017-02-14	17520	3	0
58	Dining	2011-05-23	2012-05-23	18866	0	3
224	Furniture	2019-08-14	2020-08-14	16453	8	9
108	Book	2015-11-22	2016-11-22	24595	5	3
222	Cleaning	2020-07-22	2021-07-22	54422	5	3
206	Mens	2020-01-21	2021-01-21	21544	7	9
151	Skin Care	2015-01-30	2016-01-30	4576	2	4
50	Vitamin	2020-04-15	2021-04-15	12763	6	6
150	Camera	2018-04-01	2019-01-04	11266	4	8
52	Kids	2012-08-15	2013-08-15	57268	1	1
201	Movie	2010-01-09	2011-09-01	62335	8	2
125	Game	2018-09-07	2019-07-09	12562	8	0
82	Kids	2019-11-04	2020-04-11	22544	0	8
173	Mens	2016-11-24	2017-11-24	28294	4	0
143	Dog	2021-12-07	2022-07-12	2260	1	6
168	Toy	2010-09-19	2011-09-19	20093	9	8
223	Medicine	2015-12-12	2016-12-12	6041	1	5
40	Phone	2017-01-13	2018-01-13	6759	7	6
208	Storage	2017-11-22	2018-11-22	21426	6	6
156	Camping	2017-04-25	2018-04-25	47432	0	9
235	Game	2019-04-26	2020-04-26	59688	8	2
173	Furniture	2013-09-20	2014-09-20	40812	5	7
194	Kitchen	2016-03-31	2017-03-31	23555	8	3
145	Biking	2021-12-27	2022-12-27	64770	5	2
240	Womens	2020-12-31	2021-12-31	17504	8	4
141	Nutrition	2014-02-26	2015-02-26	64370	2	0
98	Cooking	2010-08-17	2011-08-17	4394	9	2
229	Sports	2011-09-29	2012-09-29	25392	7	6
253	Vitamin	2021-10-10	2022-10-10	44317	0	8
74	Camping	2019-04-04	2020-04-04	2630	3	7
128	Kids	2018-07-24	2019-07-24	55120	1	0
102	Toy	2015-04-20	2016-04-20	29622	0	1
236	Movie	2020-10-02	2021-02-10	29708	1	2
213	Bedding	2015-01-12	2016-12-01	20978	9	0
105	Hair Care	2023-09-26	2024-09-26	7425	0	4
5	Technology	2020-01-12	2021-12-01	509	3	9
183	Sports	2011-02-09	2012-09-02	54353	8	0
12	Furniture	2018-10-14	2019-10-14	23625	3	6
52	Kids	2021-04-30	2022-04-30	17181	6	7
34	Jewelry	2023-05-17	2024-05-17	11658	5	2
8	Technology	2022-11-25	2023-11-25	5830	7	6
80	Music	2014-05-20	2015-05-20	17341	2	7
126	Baby	2023-01-24	2024-01-24	13833	8	1
93	Phone	2015-06-16	2016-06-16	10746	6	0
188	First Aid	2020-01-16	2021-01-16	48264	1	0
185	Fitness	2014-11-19	2015-11-19	29068	8	9
248	Jewelry	2017-04-23	2018-04-23	46259	1	2
222	Personal	2020-10-27	2021-10-27	50141	6	2
199	First Aid	2019-01-04	2020-04-01	28062	6	5
141	Hair Care	2012-05-14	2013-05-14	34481	7	1
121	Cat	2022-10-19	2023-10-19	55723	9	9
246	Camping	2011-10-19	2012-10-19	25590	3	5
54	Cooking	2014-04-27	2015-04-27	35312	3	2
239	Kids	2010-12-28	2011-12-28	61150	5	4
42	Computer	2019-03-06	2020-06-03	23449	5	3
39	Music	2017-04-14	2018-04-14	48574	1	4
11	Tire	2022-01-01	2023-01-01	34795	9	9
166	Nutrition	2018-08-20	2019-08-20	35610	6	7
188	Hair Care	2021-02-19	2022-02-19	2715	7	1
41	Computer	2017-11-03	2018-03-11	3857	8	4
250	Toy	2014-07-07	2015-07-07	26204	2	1
133	Book	2012-12-10	2013-10-12	26242	1	5
42	Gardening	2011-04-06	2012-06-04	7234	2	5
217	Womens	2015-03-16	2016-03-16	32593	1	1
142	Car	2010-10-27	2011-10-27	55666	0	6
18	Toy	2012-04-18	2013-04-18	60303	4	1
212	First Aid	2023-02-19	2024-02-19	63492	5	8
242	Engine	2013-04-04	2014-04-04	9244	3	9
88	Book	2011-06-06	2012-06-06	6100	2	1
36	Computer	2022-08-14	2023-08-14	64457	9	8
80	Game	2021-12-06	2022-06-12	36991	9	2
244	Furniture	2022-10-12	2023-12-10	2265	5	7
0	Beach	2020-06-20	2021-06-20	26976	8	2
129	Aquarium	2011-09-16	2012-09-16	6011	7	8
143	Dog	2013-01-01	2014-01-01	27947	0	8
184	Beach	2013-12-18	2014-12-18	48285	4	9
103	Game	2021-03-13	2022-03-13	38675	6	7
225	Movie	2021-03-05	2022-05-03	42516	6	5
69	Home Improvement	2020-12-17	2021-12-17	63305	7	9
21	Book	2019-07-14	2020-07-14	65085	0	7
24	Truck	2016-08-09	2017-09-08	50832	5	9
110	Book	2020-06-15	2021-06-15	50115	8	1
32	Phone	2013-09-16	2014-09-16	53716	5	5
234	Vitamin	2012-03-18	2013-03-18	44999	2	9
16	Womens	2020-04-07	2021-07-04	62233	4	4
49	Fitness	2019-12-11	2020-11-12	551	7	1
58	Mens	2016-02-14	2017-02-14	10049	8	4
124	Toy	2022-08-19	2023-08-19	53192	9	8
198	First Aid	2020-01-21	2021-01-21	35161	2	8
196	Toy	2023-10-20	2024-10-20	13844	4	6
126	Sports	2013-08-08	2014-08-08	55562	6	8
205	Bedding	2016-02-14	2017-02-14	23376	3	6
42	Bath	2010-02-12	2011-12-02	48911	4	7
94	Makeup	2018-02-17	2019-02-17	45536	0	8
153	Party	2020-10-07	2021-07-10	23792	0	6
166	Womens	2019-01-04	2020-04-01	18992	1	1
255	Sports	2019-11-19	2020-11-19	34404	5	2
84	Car	2012-06-11	2013-11-06	6318	2	3
156	Camping	2022-10-01	2023-01-10	10418	8	8
198	Tire	2015-08-10	2016-10-08	17928	0	7
5	Mens	2010-05-02	2011-02-05	23009	3	4
252	Camping	2015-11-11	2016-11-11	8329	6	8
102	Camping	2013-12-09	2014-09-12	8227	1	6
159	Biking	2015-04-16	2016-04-16	7854	4	2
161	Storage	2012-09-01	2013-01-09	10703	3	2
105	Camera	2016-03-22	2017-03-22	18836	7	2
116	Kitchen	2016-12-04	2017-04-12	33946	5	5
78	Movie	2010-09-14	2011-09-14	53259	9	2
140	Kids	2022-06-10	2023-10-06	34009	5	4
91	Dog	2013-01-08	2014-08-01	11256	3	0
44	Beach	2020-08-19	2021-08-19	40515	6	4
226	Aquarium	2015-03-30	2016-03-30	58370	4	6
196	Camera	2020-12-10	2021-10-12	1425	6	9
22	Furniture	2023-03-02	2024-02-03	29158	8	9
251	Camera	2012-01-17	2013-01-17	46208	3	0
23	Aquarium	2011-04-29	2012-04-29	64169	0	6
155	Toy	2019-12-14	2020-12-14	23432	1	2
228	Furniture	2018-07-20	2019-07-20	8225	7	2
31	Vitamin	2016-02-14	2017-02-14	43319	5	5
230	Camera	2016-06-26	2017-06-26	38752	5	6
183	Camping	2022-10-17	2023-10-17	59939	3	6
207	Outdoors	2019-01-02	2020-02-01	48116	9	5
89	Storage	2012-09-13	2013-09-13	41819	8	5
200	Kids	2019-05-07	2020-07-05	25477	7	8
109	Jewelry	2019-01-18	2020-01-18	1955	5	0
68	Skin Care	2017-06-29	2018-06-29	25691	6	5
238	Camera	2023-05-28	2024-05-28	2350	9	0
120	Toy	2015-01-29	2016-01-29	61117	6	7
248	Medicine	2015-07-10	2016-10-07	40696	6	4
38	Phone	2010-08-01	2011-01-08	26707	9	5
252	Camping	2013-06-30	2014-06-30	34461	4	9
132	Car	2019-12-08	2020-08-12	16677	3	7
204	Truck	2019-10-22	2020-10-22	59522	4	7
163	Truck	2012-07-03	2013-03-07	3800	8	8
255	Gardening	2023-08-18	2024-08-18	2037	1	7
142	Car	2016-07-14	2017-07-14	41286	8	1
98	First Aid	2011-01-13	2012-01-13	6154	2	9
65	Home Improvement	2011-01-29	2012-01-29	44552	6	2
54	Storage	2023-04-23	2024-04-23	18537	2	4
2	Storage	2023-06-14	2024-06-14	62999	0	0
34	Beach	2014-11-15	2015-11-15	30834	4	2
70	Phone	2022-07-05	2023-05-07	33165	3	1
53	Technology	2020-08-01	2021-01-08	14114	5	3
164	Outdoors	2013-02-24	2014-02-24	12314	1	3
78	Tire	2014-05-19	2015-05-19	29606	4	2
247	Camera	2021-10-14	2022-10-14	47626	0	2
190	Dog	2010-04-02	2011-02-04	9313	6	7
51	Book	2021-10-19	2022-10-19	27237	8	3
47	Kids	2023-08-09	2024-09-08	15145	7	8
202	Tire	2013-07-21	2014-07-21	1112	1	5
212	Personal	2018-09-28	2019-09-28	25854	9	9
188	Furniture	2018-01-11	2019-11-01	35587	6	4
168	Medicine	2018-11-07	2019-07-11	60017	1	0
146	Car	2014-04-16	2015-04-16	42733	5	7
164	Technology	2017-07-01	2018-01-07	15255	8	1
46	Party	2011-12-28	2012-12-28	5070	1	2
75	Sports	2017-07-19	2018-07-19	6116	5	4
134	Music	2016-12-20	2017-12-20	7957	6	8
26	Book	2022-08-18	2023-08-18	247	6	6
186	Toy	2014-03-02	2015-02-03	63325	6	8
43	Vitamin	2023-01-28	2024-01-28	45766	5	5
113	Cooking	2021-08-28	2022-08-28	35333	7	0
42	Toy	2018-04-22	2019-04-22	3333	8	5
21	Engine	2013-12-22	2014-12-22	22339	6	5
124	Beach	2019-12-27	2020-12-27	32098	1	0
107	Cleaning	2010-07-07	2011-07-07	54726	7	5
127	Home Improvement	2018-07-15	2019-07-15	6545	7	3
43	Book	2014-01-20	2015-01-20	5694	7	1
65	Engine	2023-03-10	2024-10-03	5331	0	6
195	Mens	2020-04-27	2021-04-27	17408	2	3
252	Dining	2021-03-10	2022-10-03	8702	8	4
153	Fitness	2022-12-15	2023-12-15	30111	1	4
103	Aquarium	2010-03-06	2011-06-03	1969	9	4
172	Kids	2016-02-12	2017-12-02	48529	8	8
195	Toy	2011-03-03	2012-03-03	13293	8	7
128	Baby	2018-01-03	2019-03-01	45450	7	0
190	Womens	2019-03-31	2020-03-31	49966	4	4
194	Aquarium	2013-11-28	2014-11-28	4135	3	2
176	Personal	2017-01-22	2018-01-22	11925	4	1
16	Music	2022-09-20	2023-09-20	48684	4	5
192	Camping	2021-05-16	2022-05-16	4884	4	8
18	Kids	2019-06-29	2020-06-29	25693	5	9
14	Sports	2019-02-17	2020-02-17	23543	2	2
247	Furniture	2014-04-07	2015-07-04	64045	1	7
176	Movie	2016-01-27	2017-01-27	2661	6	0
124	Baby	2010-08-19	2011-08-19	44546	8	1
51	Car	2011-02-28	2012-02-28	9541	1	8
67	Tire	2010-08-02	2011-02-08	32074	4	7
201	Medicine	2013-12-26	2014-12-26	48839	0	0
6	Swimming	2021-05-18	2022-05-18	43581	0	5
71	Storage	2021-02-11	2022-11-02	8561	8	8
116	Sports	2023-03-16	2024-03-16	20588	2	4
86	Vitamin	2021-07-07	2022-07-07	10770	1	1
150	Dog	2014-09-11	2015-11-09	19120	1	9
84	Camping	2015-12-21	2016-12-21	47037	1	7
19	Technology	2018-04-25	2019-04-25	22067	4	3
175	Jewelry	2022-03-23	2023-03-23	17319	8	7
207	Skin Care	2010-08-26	2011-08-26	61393	5	1
87	Nutrition	2013-09-14	2014-09-14	16103	2	0
128	Kids	2013-06-12	2014-12-06	17540	3	6
206	Car	2017-10-17	2018-10-17	25121	5	4
223	First Aid	2011-03-30	2012-03-30	15214	6	2
89	First Aid	2015-11-29	2016-11-29	39743	2	1
248	Womens	2014-12-09	2015-09-12	19174	8	6
16	Hair Care	2013-11-07	2014-07-11	15445	2	8
117	Womens	2012-02-22	2013-02-22	62051	8	6
169	Womens	2018-04-08	2019-08-04	26212	9	9
75	Biking	2017-10-02	2018-02-10	26935	4	8
2	Cooking	2015-04-07	2016-07-04	20698	3	6
140	Car	2019-12-04	2020-04-12	26383	6	1
47	Nutrition	2017-09-12	2018-12-09	9961	0	4
131	Toy	2023-07-06	2024-06-07	53053	0	4
111	Nutrition	2011-10-02	2012-02-10	50218	1	0
126	First Aid	2023-02-24	2024-02-24	16655	3	3
230	Makeup	2014-10-28	2015-10-28	56895	0	4
168	Camera	2022-02-20	2023-02-20	55883	9	7
116	Engine	2021-01-15	2022-01-15	21935	3	5
216	Baby	2014-11-12	2015-12-11	63502	7	9
173	First Aid	2021-01-13	2022-01-13	16088	3	7
84	Womens	2022-02-02	2023-02-02	3378	8	0
4	Outdoors	2019-04-14	2020-04-14	46803	2	6
150	Vitamin	2017-08-18	2018-08-18	21149	3	0
40	Technology	2020-03-15	2021-03-15	31489	4	9
241	Party	2015-08-28	2016-08-28	30057	4	9
73	Furniture	2012-08-31	2013-08-31	9706	6	7
254	Home Improvement	2018-10-08	2019-08-10	50022	1	1
151	Engine	2021-04-08	2022-08-04	15633	8	4
111	Makeup	2017-02-26	2018-02-26	3075	6	3
231	Bath	2018-11-05	2019-05-11	3144	2	8
144	Game	2014-08-26	2015-08-26	21716	0	6
70	Beach	2010-10-04	2011-04-10	58966	3	0
97	Aquarium	2021-03-16	2022-03-16	5950	7	2
113	Cat	2014-08-10	2015-10-08	39492	4	9
244	Mens	2020-03-23	2021-03-23	49301	6	9
76	Vitamin	2011-07-04	2012-04-07	59766	7	0
106	Womens	2020-08-11	2021-11-08	19071	0	9
191	Kids	2015-06-05	2016-05-06	43035	9	9
240	Bedding	2014-07-23	2015-07-23	34896	9	1
132	Home Improvement	2018-11-23	2019-11-23	37646	1	2
24	Cleaning	2016-09-28	2017-09-28	23563	9	7
128	Camping	2010-02-04	2011-04-02	53431	9	4
31	Outdoors	2022-04-19	2023-04-19	56729	4	5
204	Womens	2010-10-28	2011-10-28	54184	3	8
82	Nutrition	2010-11-01	2011-01-11	51756	2	0
198	Toy	2020-09-27	2021-09-27	57169	8	3
244	Bedding	2023-03-26	2024-03-26	15303	9	7
183	Medicine	2019-02-24	2020-02-24	11020	4	5
130	Beach	2016-02-08	2017-08-02	26453	7	4
223	Biking	2012-05-30	2013-05-30	53092	8	3
126	Jewelry	2022-05-08	2023-08-05	2991	6	5
200	Camping	2016-01-07	2017-07-01	21413	2	4
28	Nutrition	2015-09-16	2016-09-16	49675	8	4
195	Fitness	2013-05-12	2014-12-05	24572	2	7
16	Biking	2012-09-03	2013-03-09	43232	9	7
153	Sports	2017-10-03	2018-03-10	13730	6	3
34	Bedding	2022-06-17	2023-06-17	4435	0	9
74	Engine	2018-01-20	2019-01-20	56823	6	0
72	Dog	2023-06-10	2024-10-06	39353	8	2
30	Kids	2018-07-29	2019-07-29	3093	4	9
210	Cleaning	2021-12-10	2022-10-12	31792	1	5
153	Jewelry	2020-01-21	2021-01-21	40794	5	3
22	Tire	2015-03-11	2016-11-03	20524	9	5
237	Swimming	2019-01-14	2020-01-14	39636	8	8
245	Personal	2012-07-10	2013-10-07	60923	2	2
175	Truck	2014-09-10	2015-10-09	24667	9	2
220	Kids	2019-05-01	2020-01-05	62152	3	5
214	Car	2015-11-22	2016-11-22	37550	4	1
241	Sports	2010-07-13	2011-07-13	10229	5	9
96	Cleaning	2017-10-04	2018-04-10	4913	1	4
245	Movie	2016-10-25	2017-10-25	41031	2	8
154	Furniture	2019-07-22	2020-07-22	60602	4	0
233	Medicine	2014-08-21	2015-08-21	13708	6	8
16	Computer	2010-04-19	2011-04-19	2783	7	2
152	Biking	2021-07-20	2022-07-20	6295	7	1
176	Computer	2021-04-17	2022-04-17	21460	2	6
19	Music	2019-01-25	2020-01-25	61183	8	6
119	Makeup	2014-11-01	2015-01-11	17133	4	8
108	Camping	2022-02-27	2023-02-27	42389	0	1
67	Swimming	2010-10-30	2011-10-30	24475	0	9
254	Bath	2021-02-16	2022-02-16	20465	6	0
242	Gardening	2014-08-13	2015-08-13	57553	5	1
210	Outdoors	2020-08-12	2021-12-08	4844	1	1
198	Cooking	2014-12-15	2015-12-15	38586	0	8
22	Movie	2020-11-14	2021-11-14	15371	2	8
5	Biking	2014-08-21	2015-08-21	47124	5	0
187	Dining	2012-03-25	2013-03-25	22928	8	1
71	Party	2017-03-01	2018-01-03	24488	2	8
227	Technology	2011-08-02	2012-02-08	47059	5	6
119	Aquarium	2013-04-19	2014-04-19	24227	3	1
130	Kids	2019-07-26	2020-07-26	25737	1	8
16	Car	2014-07-28	2015-07-28	49282	7	5
77	Skin Care	2018-08-25	2019-08-25	47801	1	9
203	Furniture	2016-05-30	2017-05-30	37566	7	9
55	Cooking	2017-08-05	2018-05-08	8060	1	4
171	Gardening	2021-09-27	2022-09-27	55865	2	0
256	Cat	2018-06-01	2019-01-06	56788	7	4
252	Sports	2019-07-14	2020-07-14	15267	6	5
18	Bedding	2022-01-23	2023-01-23	1075	1	9
256	Fitness	2021-09-18	2022-09-18	2528	3	1
229	Engine	2019-05-20	2020-05-20	60973	7	8
94	Home Improvement	2018-10-26	2019-10-26	22270	3	3
220	Beach	2012-04-21	2013-04-21	14929	5	0
58	Cat	2016-09-15	2017-09-15	52791	7	9
228	Party	2018-06-19	2019-06-19	54902	0	8
33	Hair Care	2012-06-09	2013-09-06	28825	3	9
120	Hair Care	2020-01-20	2021-01-20	14652	6	4
59	Nutrition	2015-09-16	2016-09-16	1694	7	3
95	Toy	2017-01-22	2018-01-22	11760	8	6
43	Nutrition	2012-06-26	2013-06-26	22916	1	0
178	Hair Care	2012-04-07	2013-07-04	33949	7	7
150	Kitchen	2012-01-02	2013-02-01	35944	9	3
126	Music	2012-05-21	2013-05-21	57409	0	2
233	Dog	2012-06-13	2013-06-13	48963	2	0
152	Aquarium	2022-01-03	2023-03-01	60420	0	0
254	Movie	2012-12-05	2013-05-12	13675	3	3
34	Game	2021-05-06	2022-06-05	5143	5	7
87	Toy	2012-02-25	2013-02-25	35215	2	1
12	First Aid	2018-01-03	2019-03-01	32138	1	9
195	Party	2015-03-05	2016-05-03	16433	8	3
98	Dining	2023-05-03	2024-03-05	64485	2	8
42	Makeup	2011-09-10	2012-10-09	6164	9	5
40	Vitamin	2011-09-07	2012-07-09	16975	4	7
54	Sports	2019-06-10	2020-10-06	36519	6	5
191	Engine	2010-05-25	2011-05-25	11573	6	7
31	Bath	2020-06-29	2021-06-29	25768	8	7
32	Car	2014-07-24	2015-07-24	52188	5	2
100	Cooking	2022-09-27	2023-09-27	6336	6	6
71	Gardening	2020-04-12	2021-12-04	56792	8	6
14	Party	2017-12-24	2018-12-24	40010	1	8
226	Personal	2012-12-30	2013-12-30	37947	9	2
88	Kitchen	2017-07-12	2018-12-07	13521	7	2
64	Camping	2020-07-28	2021-07-28	6589	4	2
76	Biking	2016-10-27	2017-10-27	42173	0	3
17	Cleaning	2018-02-10	2019-10-02	56177	5	6
251	Book	2011-10-20	2012-10-20	40596	2	7
186	Truck	2021-09-17	2022-09-17	6298	2	8
109	Cleaning	2017-01-10	2018-10-01	19778	8	1
131	Dining	2019-02-18	2020-02-18	16561	2	4
33	Hair Care	2021-01-20	2022-01-20	36367	3	2
132	Cooking	2022-06-09	2023-09-06	36785	3	1
96	Vitamin	2019-03-09	2020-09-03	15987	8	0
160	Medicine	2014-09-23	2015-09-23	55178	9	7
251	Camping	2022-10-28	2023-10-28	60188	2	6
10	Bedding	2016-12-23	2017-12-23	16148	4	7
114	Storage	2016-07-01	2017-01-07	32186	2	2
136	Game	2020-07-16	2021-07-16	42328	1	9
99	Vitamin	2021-01-27	2022-01-27	65145	0	7
48	Makeup	2021-01-03	2022-03-01	53774	2	5
189	Aquarium	2016-05-20	2017-05-20	62695	2	4
65	Camping	2021-06-13	2022-06-13	41446	1	9
197	Camera	2018-10-30	2019-10-30	17013	5	4
169	Fitness	2016-01-17	2017-01-17	50030	6	8
146	Dog	2011-06-09	2012-09-06	3320	5	4
162	Gardening	2016-01-12	2017-12-01	48318	7	9
214	Mens	2020-09-22	2021-09-22	20370	5	0
249	Technology	2019-11-19	2020-11-19	59851	5	9
30	Technology	2010-11-24	2011-11-24	46986	9	1
94	Swimming	2019-08-13	2020-08-13	6877	9	8
162	Home Improvement	2022-12-02	2023-02-12	16657	9	7
146	First Aid	2012-06-28	2013-06-28	4168	9	3
93	Skin Care	2018-12-26	2019-12-26	40429	9	2
110	Beach	2012-01-11	2013-11-01	38716	0	6
199	Sports	2014-07-16	2015-07-16	15264	4	4
251	Jewelry	2019-12-23	2020-12-23	58251	2	1
137	Bedding	2010-07-24	2011-07-24	61243	5	3
12	Kitchen	2020-03-01	2021-01-03	8468	8	5
114	Engine	2012-12-25	2013-12-25	63941	0	3
243	Outdoors	2018-08-07	2019-07-08	8897	7	1
99	Engine	2023-10-04	2024-04-10	1718	0	2
242	Dog	2021-07-29	2022-07-29	3217	6	2
130	Cleaning	2016-01-17	2017-01-17	40031	7	9
97	Kids	2019-02-16	2020-02-16	12887	5	1
168	Vitamin	2013-11-13	2014-11-13	21890	6	5
207	Medicine	2020-12-07	2021-07-12	51337	4	9
172	Dining	2023-01-08	2024-08-01	19936	0	3
38	Toy	2017-11-03	2018-03-11	23326	2	3
0	Party	2022-09-27	2023-09-27	60814	3	7
51	Medicine	2015-03-22	2016-03-22	42041	2	8
22	Phone	2014-06-05	2015-05-06	39533	0	1
73	Womens	2017-12-25	2018-12-25	50726	6	4
159	Movie	2023-09-07	2024-07-09	37130	4	9
53	Game	2010-11-02	2011-02-11	54427	3	1
244	Home Improvement	2016-08-13	2017-08-13	13425	1	2
197	Bath	2013-08-29	2014-08-29	61196	0	9
219	Sports	2016-02-23	2017-02-23	16601	9	5
109	Game	2019-11-15	2020-11-15	43830	1	7
165	Biking	2020-04-20	2021-04-20	50344	4	0
141	Hair Care	2015-10-21	2016-10-21	28492	2	3
101	Gardening	2019-03-13	2020-03-13	49859	9	5
211	Jewelry	2016-05-12	2017-12-05	748	7	1
60	Aquarium	2014-04-26	2015-04-26	62692	4	4
207	Mens	2010-02-25	2011-02-25	49677	9	5
156	Cat	2023-06-19	2024-06-19	23276	6	1
186	Makeup	2015-10-01	2016-01-10	14664	0	9
73	Mens	2016-05-29	2017-05-29	38694	8	8
131	Technology	2019-01-25	2020-01-25	37139	1	1
195	Storage	2023-09-23	2024-09-23	23799	3	6
15	Dining	2019-12-31	2020-12-31	56308	1	0
112	Bath	2012-01-01	2013-01-01	28760	0	7
136	Storage	2013-11-16	2014-11-16	48345	0	7
21	Camping	2019-07-03	2020-03-07	58511	9	2
24	Furniture	2010-06-02	2011-02-06	19965	3	8
43	Camping	2013-10-21	2014-10-21	47594	7	4
195	Party	2016-04-23	2017-04-23	43642	1	4
55	Home Improvement	2014-04-15	2015-04-15	40202	3	1
33	Medicine	2010-10-27	2011-10-27	36809	5	8
181	Makeup	2014-02-24	2015-02-24	21044	8	0
205	Game	2018-05-15	2019-05-15	43925	0	6
101	Computer	2023-02-10	2024-10-02	52833	2	4
122	Storage	2013-06-21	2014-06-21	2237	0	2
5	Sports	2017-01-24	2018-01-24	7433	6	3
98	Cooking	2020-04-15	2021-04-15	39960	2	1
200	Dog	2023-03-30	2024-03-30	18567	8	1
106	Kids	2013-11-29	2014-11-29	39845	0	4
76	Party	2012-01-09	2013-09-01	42360	8	6
192	Movie	2016-12-24	2017-12-24	7927	5	5
189	Car	2018-01-28	2019-01-28	27177	9	7
91	Swimming	2011-10-25	2012-10-25	23620	8	7
75	Dining	2018-10-27	2019-10-27	48988	5	1
46	Biking	2019-04-21	2020-04-21	25379	9	0
5	Jewelry	2021-11-16	2022-11-16	28682	2	8
1	Furniture	2017-11-22	2018-11-22	36124	7	3
98	Kids	2012-10-20	2013-10-20	23351	7	1
224	Engine	2010-12-06	2011-06-12	20834	9	3
249	Car	2011-09-26	2012-09-26	56372	1	4
151	Fitness	2022-10-01	2023-01-10	10616	2	4
12	Phone	2023-05-18	2024-05-18	59544	5	7
88	Beach	2015-02-08	2016-08-02	60266	1	3
111	Makeup	2010-03-06	2011-06-03	25843	0	8
80	Dining	2013-05-15	2014-05-15	17979	6	4
98	Nutrition	2017-07-28	2018-07-28	20683	9	8
75	Furniture	2011-07-17	2012-07-17	51348	8	5
116	Jewelry	2014-10-04	2015-04-10	33840	6	3
136	Hair Care	2023-05-19	2024-05-19	29461	7	9
224	Biking	2023-08-29	2024-08-29	64210	6	3
91	Outdoors	2013-02-08	2014-08-02	48479	7	9
231	Phone	2014-12-05	2015-05-12	35198	2	1
168	Womens	2011-10-11	2012-11-10	54654	5	8
137	Camping	2018-04-26	2019-04-26	58758	6	7
178	Game	2017-11-17	2018-11-17	22996	1	2
79	Cleaning	2014-02-05	2015-05-02	46735	3	2
239	Jewelry	2022-04-07	2023-07-04	11057	3	7
66	Outdoors	2016-07-26	2017-07-26	18679	3	5
109	Party	2011-10-14	2012-10-14	31888	5	8
158	Hair Care	2010-09-24	2011-09-24	21402	2	4
106	Outdoors	2017-10-12	2018-12-10	53003	8	0
115	Camera	2016-01-29	2017-01-29	52993	7	1
215	Swimming	2019-06-06	2020-06-06	3088	0	2
42	Bath	2017-03-14	2018-03-14	64529	2	0
102	Jewelry	2020-12-01	2021-01-12	65034	0	6
256	Dining	2022-09-02	2023-02-09	49383	9	0
59	Skin Care	2015-08-21	2016-08-21	34136	8	6
168	Truck	2022-10-17	2023-10-17	61430	7	3
158	Bath	2020-10-25	2021-10-25	35737	1	4
26	Game	2020-09-21	2021-09-21	36594	8	9
148	Bedding	2022-06-29	2023-06-29	56421	0	7
79	Car	2019-11-26	2020-11-26	3316	0	2
99	Cleaning	2013-05-01	2014-01-05	65146	4	9
215	Baby	2012-05-02	2013-02-05	28577	9	1
166	Cat	2017-11-21	2018-11-21	8448	2	4
80	Womens	2010-06-06	2011-06-06	43346	9	8
6	Technology	2023-10-01	2024-01-10	36968	2	8
251	Biking	2011-08-22	2012-08-22	9313	6	2
232	Party	2021-11-24	2022-11-24	1439	4	0
194	Game	2016-10-21	2017-10-21	51852	4	5
45	Hair Care	2010-04-06	2011-06-04	56319	3	9
85	Fitness	2022-11-07	2023-07-11	23174	0	2
62	Cat	2015-04-09	2016-09-04	4405	9	7
208	Cooking	2022-03-03	2023-03-03	1943	8	2
154	Storage	2020-10-03	2021-03-10	23349	9	1
150	Gardening	2019-07-06	2020-06-07	55361	1	1
135	Furniture	2015-05-09	2016-09-05	16473	2	4
14	Biking	2013-10-05	2014-05-10	63312	9	7
135	Furniture	2010-10-30	2011-10-30	50620	3	1
148	Cooking	2023-01-15	2024-01-15	36927	3	0
126	Storage	2015-02-04	2016-04-02	45827	9	3
30	Camping	2019-09-01	2020-01-09	26022	2	1
250	Home Improvement	2023-07-08	2024-08-07	58744	6	6
79	Storage	2017-10-21	2018-10-21	13445	5	6
177	Skin Care	2010-02-22	2011-02-22	35012	1	2
238	Camping	2016-03-17	2017-03-17	49176	7	8
81	Home Improvement	2014-05-11	2015-11-05	7367	6	5
67	Sports	2014-03-15	2015-03-15	21727	9	3
2	Beach	2018-09-12	2019-12-09	37991	3	3
116	Vitamin	2021-10-10	2022-10-10	956	5	5
227	Vitamin	2023-07-23	2024-07-23	17932	7	9
147	Phone	2023-10-14	2024-10-14	36185	1	6
203	Truck	2015-11-03	2016-03-11	11619	2	1
39	Baby	2015-11-27	2016-11-27	59083	7	4
114	Hair Care	2015-10-25	2016-10-25	24770	3	9
24	Medicine	2019-03-25	2020-03-25	42525	3	1
41	Skin Care	2020-03-05	2021-05-03	19800	2	4
238	Swimming	2013-03-06	2014-06-03	63743	8	3
179	Phone	2010-01-21	2011-01-21	59617	4	2
246	Swimming	2016-11-14	2017-11-14	33990	1	4
153	Music	2018-12-05	2019-05-12	19595	1	1
255	Phone	2011-09-27	2012-09-27	63959	8	0
5	Cleaning	2013-01-07	2014-07-01	36399	1	7
129	Home Improvement	2013-11-10	2014-10-11	40163	1	5
70	Nutrition	2013-08-27	2014-08-27	9012	7	4
155	Medicine	2014-08-28	2015-08-28	35207	0	2
64	Camera	2013-01-24	2014-01-24	47119	1	8
221	Tire	2010-08-21	2011-08-21	58277	5	0
80	First Aid	2015-04-11	2016-11-04	10434	8	3
90	Movie	2012-03-10	2013-10-03	32770	7	3
191	Game	2022-09-12	2023-12-09	25981	4	6
35	Medicine	2011-08-31	2012-08-31	14251	0	8
47	Tire	2011-08-26	2012-08-26	21230	2	2
6	Book	2017-08-30	2018-08-30	47494	1	2
20	Engine	2016-05-06	2017-06-05	24328	0	7
16	Cat	2011-02-20	2012-02-20	40902	9	7
2	Cleaning	2019-05-11	2020-11-05	6361	2	8
137	Computer	2023-10-02	2024-02-10	45434	5	0
119	Womens	2014-07-06	2015-06-07	11081	9	0
221	Engine	2016-10-12	2017-12-10	25952	3	4
91	Bath	2013-03-10	2014-10-03	32454	5	2
139	Toy	2012-05-24	2013-05-24	45793	5	7
145	Tire	2015-03-12	2016-12-03	8903	5	5
41	Storage	2011-09-17	2012-09-17	11557	6	5
46	Home Improvement	2015-05-09	2016-09-05	2785	7	5
141	Biking	2021-05-11	2022-11-05	5473	1	8
204	Mens	2018-04-21	2019-04-21	14212	3	7
175	Outdoors	2015-01-24	2016-01-24	12034	9	7
154	Music	2018-01-17	2019-01-17	5678	8	8
102	Baby	2019-03-24	2020-03-24	7015	6	9
237	Camping	2016-05-18	2017-05-18	306	7	3
12	Kitchen	2015-05-05	2016-05-05	18555	4	7
194	Makeup	2011-01-23	2012-01-23	38305	3	3
113	Dog	2019-08-23	2020-08-23	21479	4	6
15	Camera	2020-12-13	2021-12-13	49864	7	8
106	Mens	2019-04-22	2020-04-22	23926	4	1
12	Computer	2016-08-28	2017-08-28	8691	5	6
172	Car	2019-12-19	2020-12-19	59382	2	8
148	Dining	2019-10-07	2020-07-10	2038	2	6
42	Biking	2020-02-16	2021-02-16	39203	6	7
56	Cleaning	2011-04-29	2012-04-29	37596	7	4
45	Camping	2019-04-03	2020-03-04	65070	7	4
203	Cooking	2020-07-28	2021-07-28	50803	8	1
96	Truck	2016-04-09	2017-09-04	18030	8	4
71	Aquarium	2016-05-05	2017-05-05	35743	8	9
84	Mens	2020-04-03	2021-03-04	30283	3	3
62	Movie	2023-06-01	2024-01-06	19068	2	4
216	Camera	2022-05-19	2023-05-19	12424	7	3
207	Storage	2019-03-27	2020-03-27	51070	2	5
223	Cat	2018-03-09	2019-09-03	896	4	6
172	Nutrition	2015-04-15	2016-04-15	1375	6	0
239	Music	2019-03-28	2020-03-28	40406	2	3
201	Toy	2018-04-17	2019-04-17	26036	4	7
148	Storage	2012-02-26	2013-02-26	11765	8	4
23	Beach	2013-05-05	2014-05-05	29149	7	5
74	Fitness	2016-08-29	2017-08-29	15829	8	8
83	Furniture	2019-07-28	2020-07-28	33325	1	1
107	Kids	2016-03-01	2017-01-03	28044	3	0
34	Car	2019-09-05	2020-05-09	5121	1	6
122	First Aid	2018-11-16	2019-11-16	62021	5	0
93	Party	2020-01-31	2021-01-31	62318	4	1
255	Bath	2010-06-30	2011-06-30	42191	7	9
87	Car	2016-12-15	2017-12-15	20869	2	1
227	Mens	2015-03-27	2016-03-27	58850	0	5
243	Aquarium	2020-11-25	2021-11-25	40485	7	1
48	Tire	2011-12-17	2012-12-17	58228	2	9
145	Cooking	2013-01-10	2014-10-01	62403	5	7
94	Phone	2013-09-10	2014-10-09	60369	1	1
134	Makeup	2019-01-27	2020-01-27	36680	6	0
62	Camping	2018-08-24	2019-08-24	54761	4	6
207	Dining	2018-08-09	2019-09-08	22872	2	9
138	Fitness	2012-06-03	2013-03-06	21594	8	7
48	Cleaning	2019-05-27	2020-05-27	44678	6	9
160	Womens	2016-12-09	2017-09-12	20889	6	1
241	Cleaning	2023-08-13	2024-08-13	35267	3	8
198	Party	2021-07-27	2022-07-27	23723	5	3
15	Kitchen	2019-04-20	2020-04-20	3427	3	8
61	Technology	2018-12-31	2019-12-31	52624	9	3
35	Car	2015-06-05	2016-05-06	26942	3	9
56	Aquarium	2021-09-22	2022-09-22	50463	5	0
211	Personal	2023-01-04	2024-04-01	51684	4	3
113	Kids	2022-04-03	2023-03-04	35359	6	0
81	Hair Care	2016-04-29	2017-04-29	54827	0	1
139	Book	2010-10-08	2011-08-10	50968	0	5
143	Sports	2019-10-02	2020-02-10	3034	1	5
209	Game	2022-08-05	2023-05-08	9826	2	4
21	First Aid	2019-01-14	2020-01-14	57032	3	4
35	Home Improvement	2018-01-15	2019-01-15	15458	6	2
157	Toy	2011-07-10	2012-10-07	50291	8	9
143	Cat	2013-05-03	2014-03-05	49834	3	5
239	Engine	2011-10-28	2012-10-28	29046	4	7
18	Cooking	2017-01-19	2018-01-19	47935	0	2
180	Hair Care	2016-07-24	2017-07-24	64159	2	8
33	Phone	2022-01-23	2023-01-23	45884	5	8
165	Swimming	2023-04-20	2024-04-20	51293	1	0
57	Storage	2019-10-03	2020-03-10	3822	1	1
89	Medicine	2019-08-14	2020-08-14	27836	9	0
36	Toy	2013-07-01	2014-01-07	50982	4	7
207	Movie	2022-01-21	2023-01-21	36719	7	7
70	Baby	2016-08-17	2017-08-17	59548	2	8
181	Cooking	2018-07-07	2019-07-07	47376	5	0
182	Engine	2021-02-12	2022-12-02	52765	5	0
138	Baby	2012-10-08	2013-08-10	13901	1	7
118	Beach	2023-03-02	2024-02-03	16186	4	3
38	Tire	2023-04-02	2024-02-04	8311	4	0
227	Camera	2016-11-11	2017-11-11	17320	5	7
122	Mens	2015-12-26	2016-12-26	50776	4	4
164	Book	2021-09-06	2022-06-09	30104	7	3
20	Toy	2017-12-16	2018-12-16	13480	0	8
16	Fitness	2015-06-21	2016-06-21	21167	4	2
17	Technology	2017-01-02	2018-02-01	19778	8	8
252	Party	2022-07-28	2023-07-28	33959	4	1
115	Game	2019-11-09	2020-09-11	3734	1	0
14	Gardening	2012-06-30	2013-06-30	23547	0	5
54	Womens	2019-03-15	2020-03-15	29878	9	1
189	Cooking	2017-02-06	2018-06-02	9123	8	5
28	Book	2016-02-02	2017-02-02	45352	0	1
92	Home Improvement	2015-11-27	2016-11-27	23392	4	9
219	Tire	2016-05-07	2017-07-05	38991	9	9
26	Kitchen	2011-11-25	2012-11-25	26351	3	9
172	Phone	2021-07-15	2022-07-15	11630	8	2
38	Bath	2023-07-23	2024-07-23	30697	6	8
\.


--
-- TOC entry 4882 (class 0 OID 16637)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, gender, age, education, city) FROM stdin;
1	Female	41	Doctoral degree	Rothsay
2	Male	66	Some college, no degree	Oakdale
3	Female	39	Associate degree	Solen
4	Female	22	Doctoral degree	Woodman
5	Female	40	High school diploma or equivalent	Deer Grove
6	Female	58	Associate degree	Allenport
7	Female	56	Associate degree	Grand Marais
8	Male	27	Bachelor’s degree	Tsaile
9	Male	70	Master’s degree	White
10	Female	59	Bachelor’s degree	Margaretville
11	Female	46	High school diploma or equivalent	Vass
12	Female	58	Bachelor’s degree	Spokane
13	Male	68	Doctoral degree	Vermont
14	Female	25	Associate degree	Ocala
15	Male	49	Associate degree	Fairbank
16	Male	45	Master’s degree	Mesa
17	Female	67	Some college, no degree	Flushing
18	Female	63	Bachelor’s degree	Plato Center
19	Female	33	Bachelor’s degree	Wilkes Barre
20	Male	30	Bachelor’s degree	Queen City
21	Female	33	High school diploma or equivalent	Melbourne
22	Male	31	Less than high school	Gainestown
23	Female	60	High school diploma or equivalent	Whiteside
24	Female	31	Some college, no degree	Denmark
25	Male	26	High school diploma or equivalent	Crocketts Bluff
26	Female	52	Less than high school	Sturgis
27	Female	71	Doctoral degree	Jamaica
28	Male	27	Master’s degree	West Branch
29	Male	51	Some college, no degree	Toast
30	Male	22	Some college, no degree	Riverside
31	Female	26	Less than high school	Oxnard
32	Female	29	Associate degree	Fiskeville
33	Female	58	Master’s degree	Curryville
34	Female	60	Associate degree	Spring Brook
35	Female	56	Doctoral degree	Silverstreet
36	Male	66	Master’s degree	Stow
37	Male	42	Associate degree	Haysi
38	Female	19	High school diploma or equivalent	Palo
39	Male	50	High school diploma or equivalent	Hale
40	Male	60	Less than high school	Worthington
41	Male	34	Associate degree	Scranton
42	Female	57	Bachelor’s degree	Coila
43	Male	32	Bachelor’s degree	Pope
44	Male	25	Bachelor’s degree	Swedesburg
45	Female	24	High school diploma or equivalent	San Antonio
46	Male	63	Some college, no degree	Elka Park
47	Female	68	Bachelor’s degree	Bronx
48	Male	42	Master’s degree	Morganfield
49	Male	62	Some college, no degree	New Salem
50	Female	62	Associate degree	Coalville
51	Female	32	Associate degree	Bay Saint Louis
52	Female	43	Bachelor’s degree	Wanette
53	Female	32	Master’s degree	Tucson
54	Male	59	Master’s degree	Kimberling City
55	Female	69	Some college, no degree	Custer City
56	Female	30	Associate degree	Royalston
57	Female	23	Associate degree	Lexington
58	Female	63	Bachelor’s degree	Altamont
59	Female	33	Associate degree	Thiells
60	Female	67	Associate degree	Morral
61	Male	72	Less than high school	Neodesha
62	Female	63	Master’s degree	Naples
63	Male	35	Less than high school	Longs
64	Male	62	Doctoral degree	Barry
65	Female	66	Master’s degree	Spokane
66	Female	28	Master’s degree	Walnut Creek
67	Female	72	Some college, no degree	McKeesport
68	Male	38	High school diploma or equivalent	Ennis
69	Male	51	Bachelor’s degree	Clearfield
70	Female	19	Some college, no degree	Colonial Heights
71	Female	32	High school diploma or equivalent	Gordon
72	Female	22	Master’s degree	Zeigler
73	Female	60	Bachelor’s degree	Hamden
74	Male	26	Less than high school	Phoenix
75	Female	34	Doctoral degree	Nardin
76	Female	44	Doctoral degree	Garden Grove
77	Male	67	Some college, no degree	Coleraine
78	Male	48	Bachelor’s degree	Duluth
79	Female	61	Doctoral degree	Tacoma
80	Male	34	High school diploma or equivalent	Sumner
81	Female	76	High school diploma or equivalent	Goldendale
82	Female	57	Doctoral degree	Hutchinson
83	Female	25	Less than high school	Thibodaux
84	Male	18	Less than high school	Twig
85	Male	26	Some college, no degree	Necedah
86	Male	48	Less than high school	Roy
87	Female	31	Associate degree	Chandler
88	Male	18	Associate degree	Castalia
89	Female	51	High school diploma or equivalent	Pendleton
90	Female	63	Some college, no degree	Tuscaloosa
91	Female	53	Master’s degree	Friedensburg
92	Male	64	Master’s degree	El Paso
93	Female	60	Master’s degree	Blairsville
94	Female	52	Bachelor’s degree	Ashton
95	Male	54	Less than high school	Sandia Park
96	Female	53	Bachelor’s degree	Thomaston
97	Female	39	Doctoral degree	Fairplains
98	Male	43	Associate degree	Applegate
99	Male	77	Some college, no degree	Brooklyn
100	Male	64	Bachelor’s degree	Benld
\.


--
-- TOC entry 4884 (class 0 OID 16645)
-- Dependencies: 225
-- Data for Name: goods; Type: TABLE DATA; Schema: window; Owner: postgres
--

COPY "window".goods ("ID_GOOD", "CATEGORY", "GOOD_NAME", "PRICE") FROM stdin;
1234567	КРАСОТА	шамунь	100
1234568	ЧИСТОТА	стиральный порошок	120
1234569	ЧИСТОТА	чистящее средство	50
1234570	ЧИСТОТА	средство для мытья посуды	30
1234571	ДЕКОР	резинка для волос	20
1234572	ДЕКОР	тушь для ресниц	300
1234573	ДЕКОР	помада	200
1234574	ДЕКОР	подарочный пакет	100
1234575	КРАСОТА	мыло	10
1234576	ДЕКОР	лак для ногтей	120
1234577	ДЕКОР	лак для волос	200
1234578	КРАСОТА	крем для рук	30
1234579	КРАСОТА	гель для душа	80
1234580	КРАСОТА	крем для лица	150
1234581	ЧИСТОТА	губка	15
\.


--
-- TOC entry 4887 (class 0 OID 16676)
-- Dependencies: 228
-- Data for Name: query; Type: TABLE DATA; Schema: window; Owner: postgres
--

COPY "window".query (searchid, year, month, day, userid, ts, devicetype, deviceid, query) FROM stdin;
1	2024	11	14	1001	1731564000	ios	3001	к
2	2024	11	14	1001	1731564240	ios	3001	ку
3	2024	11	14	1001	1731564360	ios	3001	куп
4	2024	11	14	1001	1731564540	ios	3001	купить
5	2024	11	14	1001	1731564720	ios	3001	купить куртку
6	2024	11	14	1001	1731565560	ios	3001	платье
7	2024	11	14	1001	1731567600	ios	3001	носки
8	2024	11	14	1001	1731567240	ios	3001	часы
9	2024	11	14	1001	1731565440	ios	3001	шампунь
10	2024	11	15	1002	1731650400	ios	3002	пл
11	2024	11	15	1002	1731650460	ios	3002	план
12	2024	11	15	1002	1731650580	ios	3002	планш
13	2024	11	15	1002	1731650640	ios	3002	планшет
14	2024	11	15	1002	1731650820	ios	3002	планшет андроид
15	2024	11	15	1002	1731657420	ios	3002	чайник
16	2024	11	15	1002	1731656640	ios	3002	наушники
17	2024	11	15	1002	1731652140	ios	3002	кружка
18	2024	11	15	1002	1731651060	ios	3002	футболка
19	2024	11	15	1003	1731650400	android	3003	тел
20	2024	11	15	1003	1731650640	android	3003	телеф
21	2024	11	15	1003	1731650820	android	3003	телефон
22	2024	11	15	1003	1731650940	android	3003	телефон новый
23	2024	11	15	1003	1731657300	android	3003	кофе
24	2024	11	15	1003	1731657060	android	3003	сахар
25	2024	11	15	1003	1731656040	android	3003	компьютер
26	2024	11	15	1003	1731655920	android	3003	обои
27	2024	11	16	1004	1731736800	android	3004	см
28	2024	11	16	1004	1731736860	android	3004	смар
29	2024	11	16	1004	1731737100	android	3004	смарт
30	2024	11	16	1004	1731737160	android	3004	смартфон
31	2024	11	16	1004	1731737220	android	3004	смартфон 2024
32	2024	11	16	1004	1731740340	android	3004	телевизор
33	2024	11	16	1004	1731738540	android	3004	гарнитура
34	2024	11	16	1004	1731742980	android	3004	подушка
35	2024	11	16	1004	1731737040	android	3004	ручка
36	2024	11	16	1005	1731736800	desktop	3005	но
37	2024	11	16	1005	1731736860	desktop	3005	ноут
38	2024	11	16	1005	1731736920	desktop	3005	ноутбук
39	2024	11	16	1005	1731737040	desktop	3005	ноутбук мощный
40	2024	11	16	1005	1731743880	desktop	3005	калькулятор
41	2024	11	16	1005	1731741900	desktop	3005	принтер
42	2024	11	16	1005	1731740940	desktop	3005	шорты
43	2024	11	16	1005	1731742680	desktop	3005	рекламный стенд
\.


--
-- TOC entry 4883 (class 0 OID 16642)
-- Dependencies: 224
-- Data for Name: salary; Type: TABLE DATA; Schema: window; Owner: postgres
--

COPY "window".salary (id, first_name, last_name, salary, industry) FROM stdin;
1	Layla	Ross	183	Publishing
3	Brandon	Kelly	242	Construction
4	Laura	Evans	213	Consumer Goods
7	Nathan	Stewart	151	Apparel
8	Ashley	Collins	207	Dairy
9	Lauren	Cox	206	Food Production
10	Mateo	Diaz	192	Computer Software
11	Jose	Murphy	80	Computer Games
12	Elizabeth	Thompson	202	Fitness
13	Jeremy	Perry	21	Building Materials
14	Melissa	Stewart	64	Security
15	Kayla	Alexander	222	Food Production
17	Alexis	Walker	1	Education
18	Claire	Alexander	179	Journalism
19	Ashley	Roberts	190	Insurance
20	Anna	Rivera	126	Legal Services
23	Aubrey	Allen	65	Furniture
24	Alexandra	Russell	94	Fitness
25	Samantha	Rogers	133	Aviation
26	Katherine	Brooks	214	Sporting Goods
27	Kyle	Russell	197	Recreational Facilities
28	Tyler	Cooper	145	Marketing
29	Aiden	Lewis	96	International Development
30	Elizabeth	Murphy	164	Semiconductors
31	Henry	Garcia	51	Security
32	Justin	Harris	139	Accounting
33	Jason	Brooks	199	Automotive
35	Alexander	Powell	8	Gambling
36	Steven	Baker	24	Web Design
37	Nicholas	Ramirez	144	Sporting Goods
38	Brian	Collins	113	Entertainment
39	Ava	Russell	170	Motion Pictures
40	Henry	Thompson	96	Apparel
41	Sofia	Green	193	Art
44	Allison	Miller	180	Glass
46	Austin	Reed	185	Concrete
47	Victoria	Lee	249	Environmental Services
48	Aaron	Reed	113	Services
49	Robert	Perry	166	Advertising
51	Rebecca	Edwards	4	Transportation
52	Nicholas	Wilson	135	Civil Engineering
53	Emily	Moore	39	Banking
54	Theodore	Stewart	119	Dairy
55	Isaac	Henderson	170	Food
56	Dylan	Lee	135	Writing
57	Maria	Rodriguez	78	Facilities Services
58	Brandon	Taylor	98	Utilities
60	John	Cox	191	Sales
61	Jose	Alexander	215	Computer Hardware
62	Courtney	Parker	225	Film
64	Jessica	Mitchell	34	Publishing
65	Lauren	Hernandez	87	Luxury Goods
66	Nicole	Perez	218	Food
67	Victoria	Harris	222	Printing
68	Alexis	Howard	39	Apparel
69	Rachel	Harris	6	Network Security
70	Nicholas	Butler	254	Transportation
71	Kevin	Ward	190	Film
72	Stephanie	Sanchez	211	Architecture
73	Elizabeth	Roberts	19	Farming
74	Joshua	Price	39	Sales
76	Emma	Roberts	69	Architecture
78	Grace	Rodriguez	66	Veterinary
79	Ryan	Wright	178	Hospitality
80	Anna	Hughes	38	Information Technology
82	Jasmine	Watson	6	Recreational Facilities
84	Justin	Hernandez	29	Marketing
85	Jessica	Butler	69	Aviation
86	Kelsey	Price	222	Health Care
87	Joshua	James	186	Motion Pictures
88	Jack	Gonzales	241	Fitness
89	Haley	Rodriguez	254	Construction
90	Maria	Stewart	227	Industrial Automation
91	Victoria	Carter	112	Recruiting
93	Victoria	Hernandez	236	Biotechnology
94	Charles	Wright	65	Leisure
95	Alexander	Collins	8	Computer Engineering
96	John	Clark	153	Marketing
98	Brianna	Morgan	241	Events Services
100	Kayla	Flores	205	Health Care
101	Mateo	Davis	175	Food Production
102	Audrey	Rivera	31	Recreational Facilities
103	Sebastian	Bailey	47	Business Supplies
104	Andrew	Reed	166	Hospitality
105	Gabriel	Morgan	33	Education
106	Ethan	Alexander	93	Building Materials
107	Theodore	King	147	Film
109	Nicholas	Foster	67	Metals
111	Benjamin	Lee	247	International Trade
112	Ethan	Gray	139	Facilities Services
113	Evelyn	Harris	178	Consumer Services
115	Elizabeth	Rogers	44	Electrical Manufacturing
116	Alexander	Allen	139	Biotechnology
117	Lillian	Young	173	Retail
119	Matthew	Hayes	148	Medical Equipment
120	Elizabeth	Hughes	27	Construction
121	Laura	Morgan	34	Retail
122	Alyssa	Hernandez	156	Legal Services
123	Natalie	Phillips	125	Aerospace
124	Maria	Morgan	113	Metals
126	Anthony	Morris	204	Shipbuilding
127	Stephen	Bailey	172	Public Relations
128	Mateo	Hall	78	Film
129	Robert	Bryant	2	Photography
130	Nicole	Roberts	221	Events Services
131	Taylor	Cox	195	Consumer Services
134	Brittany	Scott	105	Internet
137	Natalie	Reed	21	Civil Engineering
138	Patrick	Martinez	242	Environmental Services
140	Chelsea	Lewis	55	Construction
141	Brittany	Morgan	139	Freight Delivery
143	James	Baker	65	Travel
144	Steven	Thompson	79	Film
145	Ryan	Morgan	129	Sales
147	Christina	Thomas	167	Medical Equipment
149	Laura	Alexander	164	Environmental Services
151	Joseph	Washington	59	Pharmaceuticals
152	Jennifer	Jenkins	80	Human Resources
153	Ava	Robinson	181	Business Equipment
154	Audrey	Watson	142	Aerospace
155	Jeremy	Foster	124	Staffing
156	Sarah	Bryant	140	Business Equipment
157	Nicholas	Carter	108	Events Services
158	Eleanor	Parker	224	Health Care
159	Steven	Russell	0	Ceramics
160	Megan	Hernandez	184	Procurement
161	Evelyn	Garcia	213	Consumer Electronics
162	Kayla	Ross	130	Journalism
163	Justin	Young	179	Public Relations
164	Jason	Wilson	42	Mortgages
166	Chelsea	Thompson	32	Internet
167	Sebastian	Rodriguez	52	Food Production
168	Amelia	Jackson	33	Energy
169	Anna	Wood	253	Recruiting
171	Haley	Hughes	96	Film
172	Kayla	Coleman	75	Professional Training
173	Sophia	King	84	Construction
174	Isabella	Barnes	20	Publishing
175	Sebastian	Thompson	154	Containers
176	Eric	Foster	187	Consumer Electronics
179	Sean	Baker	223	Telecommunications
180	Kelsey	Bell	256	Computer Security
181	Stephanie	Jenkins	234	Translation
182	Audrey	Jackson	110	Metals
183	Timothy	Butler	116	Energy
184	Aubrey	Harris	63	Construction
185	Kelsey	Cooper	199	Journalism
186	Amber	Richardson	134	International Development
187	Emily	Flores	187	Publishing
190	Sean	Ward	253	Paper Products
191	Amber	Smith	4	Facilities Services
192	Charles	Parker	36	Luxury Goods
193	Timothy	Torres	156	Banking
195	Aubrey	Powell	171	Consumer Electronics
198	Kayla	Evans	40	Consumer Services
199	Aubrey	Peterson	95	Farming
200	Samantha	Hall	19	Dairy
201	Alyssa	Moore	186	Beverages
202	Kaitlyn	Stewart	78	Legal Services
204	Mary	Cooper	104	Business Supplies
205	Kyle	Henderson	155	Health Care
206	Alexander	Bryant	12	Industrial Automation
207	Michelle	Parker	60	Consumer Services
208	Kaitlyn	Ramirez	50	Paper Products
209	Adam	Harris	203	Graphic Design
210	Aiden	Washington	59	Computer Games
211	Samantha	Foster	22	Textiles
212	James	Jenkins	128	Internet
215	Isabella	Wood	76	Printing
216	Audrey	Adams	30	Medical Equipment
217	Mateo	Hernandez	76	Printing
219	Austin	Kelly	31	Beverages
220	Courtney	Rivera	167	Private Equity
221	Julian	Sanders	205	Beverages
222	Jeremy	Kelly	39	Electronic Manufacturing
223	Adam	Flores	27	Paper Products
224	Eleanor	Collins	224	Writing
225	Jeremy	Ramirez	93	Industrial Engineering
226	Stephen	Bryant	126	Packaging
228	Maria	Murphy	253	Security
229	Evelyn	Bell	181	Computer Networking
230	Emily	Watson	247	Semiconductors
231	Claire	Hayes	195	Film
232	Nicole	Gonzales	64	Computer Engineering
234	John	Baker	42	Veterinary
236	Andrew	Murphy	60	Glass
237	Maria	Wilson	221	Paper Products
238	Layla	Bailey	218	Gambling
239	Mary	Cook	48	Services
240	Julian	Rogers	91	Industrial Engineering
242	Amanda	Bell	199	Printing
243	Melissa	Bell	51	Telecommunications
244	Sean	Taylor	216	Computer Games
245	Aubrey	Wright	205	Health
246	Adam	Russell	94	Construction
247	Nathan	Allen	215	Information Technology
248	Nicole	Jones	222	Gambling
249	Kimberly	Perez	249	Luxury Goods
250	Aubrey	Ward	225	Mechanical Engineering
251	Rebecca	Cox	127	Animation
252	Alexander	Garcia	100	Biotechnology
253	Charlotte	Ramirez	101	Plastics
256	Jack	Roberts	250	Facilities Services
257	Haley	White	41	Chemicals
258	Erin	Torres	237	Food
259	Adam	Johnson	230	Travel
260	Christina	Foster	53	Events Services
261	Robert	Perez	172	Procurement
263	Jessica	Hayes	232	Electronic Manufacturing
264	Taylor	Parker	169	Information Services
265	Evelyn	Torres	78	Medical Equipment
266	Katherine	Wood	128	Film
268	Owen	Evans	177	Travel
269	Aiden	Phillips	85	Environmental Services
270	Robert	Adams	251	Architecture
271	Thomas	Evans	75	Fitness
273	Timothy	Mitchell	242	Packaging
274	Isaac	Powell	59	E-Learning
275	Sophia	Davis	230	Architecture
276	Haley	Foster	184	Financial Services
280	Sarah	Robinson	19	Aviation
281	Richard	Ross	47	Sales
282	Dylan	Sanders	138	Metals
283	Taylor	Simmons	145	Logistics
285	Brandon	Green	45	Performing Arts
286	Matthew	Wood	31	Fishery
289	Victoria	Adams	63	Furniture
290	Sara	Scott	77	Computer Networking
291	Abigail	Johnson	79	Photography
293	Haley	Lewis	27	International Trade
295	Jessica	Hernandez	6	Media Production
296	Anthony	James	223	Package Delivery
298	Eric	Young	169	Warehousing
299	Tyler	Alexander	244	Chemicals
302	Jack	Hayes	114	Building Materials
303	Maria	Green	204	Computer Hardware
304	Jose	Thomas	191	Computer Software
305	Claire	Sanders	4	Computer Hardware
306	Mateo	Long	77	Graphic Design
308	Charlotte	Washington	157	Business Supplies
309	Steven	Green	89	Information Technology
311	Audrey	Henderson	255	Network Security
313	Isabella	Howard	51	Management Consulting
315	Patrick	Rogers	173	Legal Services
316	Alexis	Morris	78	Utilities
317	Alexandra	Bailey	90	Telecommunications
318	Richard	Torres	21	Jewelry
319	Samantha	Hernandez	78	Information Services
322	Charles	Green	28	Professional Training
323	Alexandra	Price	140	Mortgages
324	Jack	Mitchell	92	Computer Engineering
326	Taylor	Torres	83	Legal Services
327	Jasmine	Gray	169	International Trade
328	Mateo	Edwards	247	Computer Security
329	Sebastian	Lewis	88	Farming
330	Joseph	Garcia	55	Computer Engineering
331	Kevin	White	31	Film
332	Victoria	Campbell	14	Performing Arts
333	Christopher	Lewis	199	Printing
334	Emily	Patterson	209	Architecture
335	Victoria	Davis	47	Telecommunications
337	Chelsea	Roberts	115	Packaging
338	Justin	Bryant	76	Electronic Manufacturing
339	Amelia	Bennett	132	Financial Services
340	Ryan	Reed	205	Luxury Goods
341	Charlotte	Bell	45	Private Equity
342	Charlotte	Green	14	Mortgages
343	Jessica	Murphy	130	Computer Games
345	Victoria	Parker	33	Nanotechnology
346	Claire	White	69	Automotive
350	Owen	Foster	154	Mortgages
351	Brittany	Young	167	E-Learning
352	Kyle	Bell	219	Financial Services
353	Tyler	Allen	22	Ceramics
354	Emily	Griffin	36	Logistics
355	Katherine	Martin	114	Space
356	Victoria	Cook	19	Defense
357	Henry	Washington	237	Medical Equipment
358	Michael	Johnson	158	Translation
359	Charles	Russell	251	Health
360	Jack	Scott	13	Maritime
361	Gabriel	Bennett	234	Food Production
362	Taylor	Turner	215	Computer Security
363	Sara	Ramirez	92	Crafts
365	Brian	Thompson	157	Apparel
366	Christopher	Bell	250	Fishery
367	Jennifer	Hill	194	Containers
369	Brandon	Allen	69	Insurance
370	Jeremy	Washington	8	Farming
371	Hannah	Perez	87	Computer Engineering
372	Isabella	Green	191	E-Learning
375	Amelia	Flores	256	Electrical Manufacturing
376	Lauren	Bailey	105	Textiles
378	Lillian	Rodriguez	82	Security
379	Steven	Cook	249	Health
380	Aaron	Lopez	2	Performing Arts
381	John	Perez	41	Services
382	Charlotte	Coleman	96	Defense
383	Ethan	Lewis	226	Events Services
385	Justin	Martinez	1	Logistics
387	Theodore	Foster	221	International Development
390	Sebastian	Lee	130	Containers
392	Heather	Johnson	102	Sales
393	Melissa	Hughes	114	Recreational Facilities
394	Brittany	Rivera	102	Containers
395	Brittany	Wilson	230	Legal Services
396	Natalie	Rodriguez	91	Beverages
397	Theodore	Mitchell	172	Events Services
398	Joshua	Robinson	15	Professional Training
399	Zachary	Rodriguez	170	Printing
400	Brian	Russell	28	Writing
402	Eric	Campbell	57	Semiconductors
405	Henry	Bennett	56	Construction
407	Jason	Harris	103	Mortgages
410	Emma	Gonzales	149	Art
411	Mateo	Campbell	31	Computer Games
412	Audrey	Young	83	Utilities
413	Heather	Martin	75	Leisure
414	Jason	Phillips	125	Paper Products
415	Courtney	Alexander	137	Design
416	Chelsea	Collins	107	Private Equity
417	Alexis	Jenkins	6	Computer Hardware
419	Jose	Foster	130	Telecommunications
420	Rachel	Sanders	89	Movie Production
422	Owen	Butler	139	Marketing
424	Nathan	Hill	250	Food Production
425	Brittany	Carter	211	Entertainment
426	Alexis	Perez	35	Architecture
427	Joshua	Jenkins	55	Fashion
428	Layla	Wood	38	Fitness
429	Jessica	Jenkins	244	Food
430	Heather	Reed	48	Mining
432	Emily	Hughes	53	Mortgages
433	Melissa	Kelly	7	Publishing
434	Laura	Williams	91	Dairy
435	Emma	Powell	20	Network Security
436	Emily	Hayes	41	Luxury Goods
438	Brittany	Patterson	177	Crafts
439	Megan	Martin	10	Business Equipment
440	Danielle	Wright	6	Freight Delivery
441	Oliver	Green	219	Defense
442	Alyssa	Allen	185	Food
443	Erin	Gonzales	246	Packaging
444	Olivia	Anderson	192	Recruiting
445	Christina	Adams	20	Publishing
446	Samantha	Turner	28	Biotechnology
447	Zachary	Johnson	207	Recreational Facilities
448	Nathan	Hayes	191	Accounting
449	Patrick	Garcia	84	Business Equipment
450	Brittany	Roberts	174	Web Design
451	Richard	Jenkins	255	Paper Products
453	Mateo	Barnes	226	Chemicals
454	Laura	Morris	54	Package Delivery
455	Stephen	Walker	198	Printing
456	Austin	Patterson	187	Furniture
457	Austin	Griffin	75	Music
458	Amelia	Rivera	81	Public Relations
459	Sebastian	Allen	184	Machinery
460	Lillian	Price	249	E-Learning
461	Eric	Turner	189	Utilities
462	Amelia	Hall	237	Aviation
463	Jasmine	Cooper	92	Civil Engineering
464	Henry	Nelson	74	Civil Engineering
465	Natalie	Sanchez	4	Animation
468	Brittany	Richardson	65	Wine
470	John	Watson	52	Design
471	Ava	Lee	55	Wireless
473	Theodore	Davis	251	Fashion
474	Christina	Phillips	21	Motion Pictures
475	Jonathan	Rodriguez	198	Movie Production
476	Jennifer	White	192	Textiles
478	Audrey	Gonzales	136	Services
484	Courtney	Smith	85	Fitness
485	Sebastian	Diaz	108	Private Equity
486	Joshua	Powell	216	Electronic Manufacturing
487	Abigail	White	118	Packaging
489	Alexander	Walker	26	Business Supplies
490	Timothy	Richardson	235	Network Security
491	Audrey	Coleman	168	Sports
492	Sean	Hill	83	Media Production
493	Michael	Parker	31	Architecture
495	Joseph	Davis	208	Computer Engineering
497	Sophia	Ross	11	Food
498	Amber	Brooks	143	Veterinary
499	Amanda	Torres	203	Procurement
500	Stephen	Roberts	18	Art
501	Theodore	Thomas	171	Luxury Goods
502	Taylor	Walker	206	Automotive
503	Mary	James	142	Beverages
507	Audrey	Clark	94	Containers
508	Lauren	Rodriguez	150	Security
509	Mateo	Evans	49	Health Care
510	Sara	Powell	187	Semiconductors
512	Aubrey	Mitchell	36	Package Delivery
515	Timothy	Wright	231	Banking
516	Brianna	Brown	119	Leisure
517	Alexander	Wilson	217	Electronic Manufacturing
519	Emily	Hill	189	Package Delivery
520	Amber	Jenkins	166	Package Delivery
521	Amber	Roberts	2	Food
522	Tyler	Thomas	87	Crafts
524	Stephen	King	131	Architecture
525	Jack	Henderson	182	Mortgages
526	Isabella	Lopez	192	Computer Hardware
527	Stephen	Adams	30	Legal Services
529	Dylan	Wilson	92	Chemicals
530	Eric	Perez	76	Defense
531	Laura	Lewis	158	Film
532	Brandon	Turner	190	Movie Production
533	Benjamin	Price	140	Utilities
534	Charlotte	Edwards	200	Utilities
536	Nathan	Barnes	80	Photography
537	Abigail	Brooks	1	Security
541	Ethan	Miller	100	Metals
542	Jasmine	Lewis	39	Procurement
544	Katherine	Bryant	37	Animation
545	Michelle	Washington	25	Printing
546	Amber	Cox	192	Photography
547	Austin	Murphy	80	Consumer Goods
548	Nicole	Carter	247	Mortgages
549	Hannah	Rogers	233	Sporting Goods
551	Emma	Howard	163	Computer Security
552	Nicholas	Gray	140	Design
553	Sofia	Washington	160	International Trade
554	Samantha	Roberts	162	Public Relations
555	Sophia	Price	27	Energy
557	Kimberly	Cook	185	Wireless
558	Elizabeth	Collins	37	Sales
559	Aaron	Martin	89	Marketing
562	Timothy	Russell	9	E-Learning
564	Amber	Simmons	197	Events Services
568	Melissa	Scott	142	Computer Networking
569	Aubrey	White	42	Dairy
570	Thomas	Jones	245	E-Learning
571	Sofia	Phillips	251	Recreational Facilities
572	Aaron	Powell	105	Services
573	Chelsea	King	81	Journalism
577	Audrey	Jenkins	63	Electrical Manufacturing
578	Jonathan	Mitchell	136	Design
580	Mark	Bailey	234	Business Equipment
581	Allison	Ward	132	Translation
582	Audrey	Sanders	199	Concrete
583	Charles	Rogers	18	Food Production
584	Henry	Williams	28	Publishing
585	Joseph	Mitchell	185	Furniture
586	Emily	Russell	73	Sporting Goods
587	Chelsea	Hayes	23	Computer Engineering
588	Nathan	Peterson	11	Private Equity
589	Julian	Mitchell	35	Wine
591	Brittany	King	154	Motion Pictures
594	Daniel	Brown	197	Journalism
595	Alexander	Hill	4	Semiconductors
597	Gabriel	Perez	87	Consumer Goods
598	Taylor	Adams	122	Crafts
599	Victoria	Baker	207	Textiles
600	Rebecca	Brown	72	Music
601	Charlotte	Griffin	116	Facilities Services
602	Gabriel	Alexander	131	Graphic Design
603	Austin	Bennett	196	Mortgages
605	Jasmine	Bryant	101	Procurement
606	Daniel	Gonzales	164	Electrical Manufacturing
607	Joseph	Bell	98	Accounting
608	Eric	Russell	127	Wholesale
609	William	Reed	57	Public Relations
612	Tyler	Richardson	76	Warehousing
614	Alexander	Rivera	202	Retail
616	Patrick	Nelson	248	Industrial Engineering
617	Evelyn	Henderson	31	Luxury Goods
618	Henry	Reed	94	Human Resources
619	Sophia	Sanders	167	Advertising
620	Eric	Lee	118	Warehousing
621	Samantha	Peterson	143	Network Security
622	Ryan	Phillips	24	Farming
623	Katherine	Mitchell	9	Sports
625	Sophia	Green	195	Performing Arts
626	Ethan	Howard	165	Utilities
627	Brittany	Flores	209	Computer Engineering
628	Chelsea	Ramirez	235	Mechanical Engineering
629	Layla	Davis	175	Industrial Engineering
630	Richard	Hill	112	Electrical Manufacturing
631	Emily	Richardson	123	Journalism
632	Alexander	King	158	Computer Security
633	Brandon	Peterson	86	Automotive
634	Jonathan	Bryant	242	Food Production
635	Adam	Anderson	199	Glass
636	Alyssa	Cooper	168	Professional Training
637	Courtney	Rodriguez	143	Shipbuilding
638	Eleanor	Murphy	0	Wholesale
639	Allison	Thomas	95	Sports
640	Elizabeth	Taylor	166	Animation
643	Jose	Cooper	45	Entertainment
644	Stephen	Sanchez	31	Biotechnology
645	Nicole	Thompson	204	Security
646	Sebastian	Green	208	Graphic Design
647	Kayla	Green	185	Professional Training
649	Justin	Simmons	112	Sports
650	Alyssa	Simmons	170	Security
651	Elizabeth	Kelly	32	Metals
652	Natalie	Price	44	Hospitality
653	Brian	Anderson	4	Electrical Manufacturing
654	Laura	Jackson	166	Network Security
655	Ethan	Nelson	185	Computer Engineering
656	Laura	Wood	242	Entertainment
657	Abigail	Jenkins	52	Electrical Manufacturing
658	Heather	Alexander	150	Hospitality
659	Jasmine	Sanders	179	Animation
660	James	Robinson	19	Insurance
661	Kevin	Collins	130	Glass
663	Charles	White	74	Web Design
665	Heather	Russell	69	Industrial Engineering
667	Steven	Scott	118	Farming
668	Courtney	Flores	38	Computer Engineering
669	Hannah	Lopez	173	Journalism
670	Anna	Thomas	33	Hospitality
671	Henry	Wright	238	Semiconductors
672	Victoria	Watson	89	Printing
673	Amber	Carter	121	Health
675	Abigail	Hill	202	Beverages
679	Oliver	Young	254	Mortgages
680	Samantha	Brooks	15	Containers
681	Jonathan	Bailey	25	Apparel
682	Lauren	Murphy	86	Textiles
684	Thomas	Rodriguez	102	Shipbuilding
685	Heather	Bryant	0	Computer Software
686	William	Morgan	108	Civil Engineering
687	Rebecca	Hayes	163	Insurance
688	Joshua	Perry	206	Travel
689	Melissa	Mitchell	129	E-Learning
692	Oliver	Davis	75	Environmental Services
694	Jennifer	Martin	166	Cosmetics
695	Robert	Harris	119	Building Materials
696	Benjamin	Henderson	252	Public Relations
697	Sean	Perez	210	Gambling
699	Anthony	Mitchell	145	Glass
701	Lillian	Walker	178	E-Learning
703	Kimberly	Collins	195	Electrical Manufacturing
704	Grace	Johnson	73	Crafts
705	Jessica	Young	119	Information Services
706	Chelsea	Martin	51	Building Materials
707	Austin	Wright	189	Building Materials
710	Tiffany	Mitchell	40	Gambling
713	Zachary	Reed	69	Environmental Services
715	Olivia	Roberts	192	Freight Delivery
716	Thomas	Brooks	104	Furniture
717	Alyssa	James	74	Management Consulting
718	Rachel	Rodriguez	255	Apparel
719	Joseph	Alexander	20	Fashion
720	Christina	Bailey	207	Writing
721	Alyssa	Gonzales	140	Aerospace
722	Claire	Long	17	Information Services
723	Audrey	Howard	99	Glass
724	Thomas	Mitchell	160	Apparel
725	Nicholas	Diaz	80	Machinery
726	Charlotte	Adams	99	Information Technology
727	Jessica	Perez	112	Graphic Design
728	Nicholas	Garcia	32	Space
733	Jennifer	Reed	201	Performing Arts
734	Brandon	Rivera	41	Plastics
735	Anna	Gonzales	180	Computer Security
736	Natalie	Wright	73	Industrial Automation
737	Brandon	Jackson	129	Health
738	Alexis	Mitchell	131	Semiconductors
739	Anna	Hernandez	225	Cosmetics
741	Mark	Wright	170	Apparel
742	Haley	Sanchez	249	Information Services
743	Sara	Hernandez	82	Medical Equipment
744	Joshua	Richardson	203	Computer Engineering
745	Jeremy	Perez	248	Farming
746	Matthew	Murphy	6	Professional Training
747	Brandon	Bailey	246	Civil Engineering
748	Eleanor	Roberts	98	Telecommunications
749	Megan	Phillips	26	Performing Arts
750	Erin	Rogers	33	Veterinary
752	Sofia	Price	42	Health Care
753	Theodore	Miller	22	Computer Engineering
754	Patrick	Hill	152	Farming
755	Allison	Adams	180	Business Supplies
756	Owen	Bell	205	Aerospace
757	Sebastian	Morgan	50	Beverages
759	Christina	Brown	134	Chemicals
760	Isaac	Morgan	204	Real Estate
761	Kaitlyn	James	207	Warehousing
762	Megan	Jenkins	65	Computer Software
763	Maria	Collins	73	Beverages
764	Andrew	Lee	81	Legal Services
767	Justin	Ross	190	Computer Hardware
768	Nathan	Jenkins	57	Accounting
769	Sebastian	Harris	238	Gambling
770	Zachary	Jackson	191	Graphic Design
771	Brianna	Cox	50	Education
772	Melissa	Reed	112	Nanotechnology
773	Kayla	Mitchell	184	Automotive
774	Dylan	Davis	211	Computer Engineering
775	Sofia	Wood	121	Motion Pictures
776	Aubrey	Rivera	87	Textiles
777	Danielle	Lee	97	Facilities Services
778	Laura	Bennett	178	Wholesale
779	Kayla	Reed	49	Construction
780	Eleanor	Thompson	106	Travel
781	Kelsey	Wood	1	Packaging
782	Ethan	Collins	11	Semiconductors
783	Rebecca	Thomas	249	Translation
785	Ryan	Young	73	Computer Engineering
787	Megan	Roberts	87	Business Supplies
788	Nathan	Powell	73	Network Security
789	Sophia	Lee	26	Food Production
790	Nicole	Stewart	167	Music
791	Michael	Powell	242	Leisure
792	Brittany	Thomas	247	Aerospace
793	Alyssa	Perez	177	Insurance
794	Joshua	Walker	1	Insurance
795	Aubrey	Perez	171	Electrical Manufacturing
796	Mark	Adams	83	Semiconductors
799	Nicole	Campbell	217	Information Services
801	Charlotte	Rivera	241	Freight Delivery
802	Jason	Richardson	59	Environmental Services
803	Brandon	Gonzales	183	Wine
804	Amelia	Brooks	153	International Development
805	Aiden	Reed	187	Staffing
807	Nathan	Henderson	95	Wholesale
808	Amelia	Evans	160	Professional Training
809	Jeremy	Cox	43	Information Services
811	Claire	Hall	107	Architecture
813	Nicholas	James	100	Furniture
814	Rebecca	Stewart	161	Staffing
815	Kelsey	Davis	203	Pharmaceuticals
816	Courtney	Washington	216	Aviation
817	Amanda	Turner	131	Health Care
818	Megan	Russell	159	Mortgages
819	Christina	Jenkins	144	Travel
820	Rebecca	Clark	242	Packaging
824	Aaron	Brown	115	Mining
825	Nicole	Mitchell	178	E-Learning
826	Danielle	Thompson	20	International Development
827	Joshua	Adams	232	Mortgages
828	Kimberly	Long	239	Automotive
830	Mary	Cox	29	Veterinary
831	Jason	James	186	Space
832	Mateo	Rogers	69	Health Care
833	Ethan	Coleman	224	Furniture
835	Layla	Phillips	24	Nanotechnology
836	Kevin	Young	122	Consumer Goods
837	Michael	Wilson	87	Telecommunications
839	Robert	Gonzales	26	Freight Delivery
840	Brian	Watson	181	Management Consulting
841	Michael	Reed	187	Advertising
842	Justin	Cooper	237	Events Services
844	Ava	Davis	240	Wine
846	Aubrey	Rogers	256	Art
847	Claire	Ramirez	154	Translation
848	Mary	Collins	173	Concrete
849	David	Sanders	148	Sports
850	Jasmine	Turner	151	Publishing
852	Nathan	Rogers	239	Music
853	Evelyn	Brooks	22	Veterinary
854	Tiffany	Collins	66	Machinery
855	Henry	Brooks	91	Civil Engineering
857	Evelyn	Green	200	Private Equity
859	Taylor	Jackson	255	Financial Services
860	Ethan	Lee	199	Package Delivery
861	Henry	Young	184	Semiconductors
862	Henry	Long	180	Wireless
863	Brittany	Collins	141	Security
864	Nathan	Cooper	254	Management Consulting
865	Mary	Ross	218	Insurance
866	Grace	Ross	62	Business Equipment
867	Steven	Morgan	6	Real Estate
868	Kimberly	Williams	143	Paper Products
869	Adam	Jones	243	Logistics
870	Olivia	Garcia	201	Internet
871	Mateo	Henderson	173	Ceramics
872	Laura	Cooper	117	Electronic Manufacturing
874	Amber	Bryant	9	Graphic Design
875	Sofia	Powell	256	Semiconductors
876	Steven	Hall	50	Glass
877	Austin	Hill	123	Business Equipment
878	Ethan	Peterson	54	Food Production
880	Charlotte	Clark	154	Metals
881	Danielle	Hayes	207	Legal Services
883	Allison	Perez	243	Furniture
884	Eric	Long	137	Fitness
885	Emma	Williams	232	Fashion
886	Zachary	King	141	Entertainment
887	Laura	Murphy	143	Containers
890	Alexandra	Wilson	246	Insurance
891	Anthony	Baker	201	Writing
892	Isaac	Lopez	79	Computer Games
893	Emma	Scott	225	Fishery
894	Sebastian	Anderson	13	Information Technology
895	Kayla	Foster	125	Paper Products
897	Anna	Wilson	11	Graphic Design
898	Sean	Jackson	135	Telecommunications
900	Adam	Martin	102	Furniture
902	Jonathan	Gonzales	36	Retail
903	Matthew	Thompson	242	Nanotechnology
906	Samuel	Rivera	133	Legal Services
908	Isabella	Garcia	166	Paper Products
910	Isabella	Morgan	142	Luxury Goods
911	Ethan	Young	36	Retail
912	Jack	White	68	Farming
913	Joshua	Lewis	116	Facilities Services
915	Taylor	Wilson	156	Gambling
916	Anthony	Powell	219	Food
917	Sara	Martin	249	Construction
918	Mary	Sanchez	56	Services
921	Abigail	Morgan	253	Glass
923	Emma	Bennett	118	Pharmaceuticals
924	Richard	Foster	205	Freight Delivery
928	Claire	Henderson	211	Private Equity
930	Kaitlyn	Cooper	225	Wireless
931	Amanda	Patterson	164	Insurance
932	Michelle	Young	42	Space
933	Patrick	Butler	140	Nanotechnology
934	Allison	Cooper	198	Packaging
936	Tyler	Sanders	165	Mortgages
937	Justin	Coleman	69	Services
941	Steven	Martinez	201	Wine
942	Daniel	Hayes	52	Private Equity
944	Sean	Washington	135	Glass
945	Alexander	White	174	Information Services
946	Jasmine	Ross	184	Computer Software
947	Maria	Nelson	239	Health Care
948	Emily	White	217	Aerospace
950	Oliver	Bryant	23	Glass
951	Owen	Johnson	188	Human Resources
952	Stephanie	Bell	51	Recreational Facilities
953	Tyler	Jackson	86	Mortgages
954	Sara	Edwards	134	International Development
955	Courtney	Murphy	50	Publishing
956	Theodore	Collins	83	Mortgages
957	Courtney	Ross	140	Containers
958	Ethan	Richardson	235	Education
959	Aiden	Morgan	3	Veterinary
960	Nicholas	Brooks	142	Utilities
962	Isabella	Allen	165	Services
963	Isabella	Lee	25	Computer Games
964	Heather	Powell	108	Facilities Services
967	Zachary	Simmons	211	Pharmaceuticals
969	Joseph	Lopez	144	Education
971	Patrick	Morris	166	Mechanical Engineering
975	Elizabeth	Foster	191	Recreational Facilities
977	Justin	Ramirez	70	Beverages
980	Matthew	Hill	141	Business Supplies
981	Grace	Collins	248	Biotechnology
983	Lauren	Simmons	247	Food Production
984	Justin	Flores	198	Industrial Engineering
986	Jennifer	Bryant	95	Farming
987	Kaitlyn	Patterson	225	Space
989	David	Lee	204	Banking
990	Layla	Edwards	59	Journalism
991	Patrick	Turner	79	Freight Delivery
992	Olivia	Jones	81	Internet
994	Benjamin	James	125	International Trade
995	Julian	Bell	54	Management Consulting
996	Brandon	Perry	180	Media Production
997	Mark	Wilson	37	Procurement
998	Megan	Evans	218	Management Consulting
999	Isabella	Roberts	210	Construction
\.


--
-- TOC entry 4886 (class 0 OID 16658)
-- Dependencies: 227
-- Data for Name: sales; Type: TABLE DATA; Schema: window; Owner: postgres
--

COPY "window".sales ("DATE", "SHOPNUMBER", "ID_GOOD", "QTY") FROM stdin;
2016-01-01	1	1234569	100
2016-01-01	1	1234570	200
2016-01-01	1	1234571	300
2016-01-01	1	1234572	400
2016-01-01	1	1234573	500
2016-01-01	1	1234574	600
2016-01-01	1	1234575	700
2016-01-01	2	1234577	800
2016-01-01	2	1234578	900
2016-01-01	2	1234579	1000
2016-01-01	2	1234580	120
2016-01-01	2	1234581	135
2016-01-01	3	1234571	150
2016-01-01	3	1234572	165
2016-01-01	3	1234573	180
2016-01-01	3	1234574	195
2016-01-01	4	1234575	210
2016-01-01	4	1234576	225
2016-01-01	4	1234569	240
2016-01-01	4	1234570	255
2016-01-01	4	1234571	100
2016-01-01	4	1234572	200
2016-01-01	4	1234573	300
2016-01-01	4	1234574	400
2016-01-01	4	1234577	500
2016-01-01	4	1234578	600
2016-01-01	4	1234579	700
2016-01-01	5	1234580	800
2016-01-01	5	1234581	900
2016-01-01	5	1234567	1000
2016-01-01	5	1234568	120
2016-01-01	5	1234569	135
2016-01-01	5	1234570	150
2016-01-01	5	1234571	165
2016-01-01	5	1234572	180
2016-01-01	6	1234573	195
2016-01-01	6	1234574	210
2016-01-01	6	1234575	225
2016-01-01	6	1234567	240
2016-01-01	6	1234568	255
2016-01-01	6	1234569	100
2016-01-01	6	1234570	200
2016-01-01	6	1234571	300
2016-01-01	6	1234572	400
2016-01-01	7	1234573	500
2016-01-01	7	1234574	600
2016-01-01	7	1234575	700
2016-01-01	7	1234576	800
2016-01-01	7	1234577	900
2016-01-01	7	1234578	1000
2016-01-01	7	1234579	120
2016-01-01	8	1234580	135
2016-01-01	8	1234567	150
2016-01-01	8	1234568	165
2016-01-01	8	1234569	180
2016-01-01	8	1234570	195
2016-01-01	8	1234571	210
2016-01-01	9	1234572	225
2016-01-01	9	1234573	240
2016-01-01	9	1234574	255
2016-01-01	9	1234575	100
2016-01-01	9	1234576	200
2016-01-01	10	1234577	300
2016-01-01	10	1234578	400
2016-01-01	10	1234579	500
2016-01-01	10	1234580	600
2016-01-01	10	1234581	700
2016-01-01	10	1234567	800
2016-01-01	11	1234568	900
2016-01-01	11	1234569	1000
2016-01-01	11	1234570	120
2016-01-01	11	1234571	135
2016-01-01	11	1234572	150
2016-01-01	11	1234573	165
2016-01-01	11	1234574	180
2016-01-01	12	1234575	195
2016-01-01	12	1234576	210
2016-01-01	12	1234577	225
2016-01-01	12	1234578	240
2016-01-01	12	1234579	255
2016-01-01	13	1234580	100
2016-01-01	13	1234581	200
2016-01-01	13	1234567	300
2016-01-01	13	1234568	400
2016-01-01	13	1234569	500
2016-01-01	13	1234570	600
2016-01-01	13	1234571	700
2016-01-01	13	1234572	800
2016-01-01	13	1234573	900
2016-01-01	13	1234574	1000
2016-01-01	13	1234575	120
2016-01-01	14	1234576	135
2016-01-01	14	1234577	150
2016-01-01	14	1234578	165
2016-01-01	14	1234579	180
2016-01-01	14	1234580	195
2016-01-01	14	1234581	210
2016-01-01	14	1234567	225
2016-01-01	15	1234568	240
2016-01-01	15	1234569	255
2016-01-01	15	1234570	100
2016-01-01	16	1234571	200
2016-01-01	16	1234572	300
2016-01-01	16	1234573	400
2016-01-01	16	1234574	500
2016-01-01	16	1234575	600
2016-01-01	16	1234576	700
2016-01-01	16	1234577	800
2016-01-01	16	1234578	900
2016-01-01	16	1234579	1000
2016-01-01	16	1234580	120
2016-01-01	16	1234581	135
2016-01-02	1	1234567	150
2016-01-02	1	1234568	165
2016-01-02	1	1234569	180
2016-01-02	1	1234570	195
2016-01-02	2	1234571	210
2016-01-02	2	1234572	225
2016-01-02	2	1234573	240
2016-01-02	2	1234574	255
2016-01-02	2	1234575	100
2016-01-02	2	1234576	200
2016-01-02	2	1234577	300
2016-01-02	3	1234578	400
2016-01-02	3	1234579	500
2016-01-02	3	1234580	600
2016-01-02	3	1234581	700
2016-01-02	3	1234567	800
2016-01-02	3	1234568	900
2016-01-02	4	1234569	1000
2016-01-02	4	1234570	120
2016-01-02	4	1234571	135
2016-01-02	4	1234572	150
2016-01-02	4	1234573	165
2016-01-02	4	1234574	180
2016-01-02	4	1234575	195
2016-01-02	4	1234576	210
2016-01-02	4	1234577	225
2016-01-02	5	1234578	240
2016-01-02	5	1234579	255
2016-01-02	5	1234580	100
2016-01-02	5	1234581	200
2016-01-02	5	1234567	300
2016-01-02	5	1234568	400
2016-01-02	5	1234569	500
2016-01-02	6	1234570	600
2016-01-02	6	1234571	700
2016-01-02	6	1234572	800
2016-01-02	6	1234573	900
2016-01-02	6	1234574	1000
2016-01-02	7	1234575	120
2016-01-02	7	1234576	135
2016-01-02	7	1234577	150
2016-01-02	7	1234578	165
2016-01-02	7	1234579	180
2016-01-02	7	1234580	195
2016-01-02	7	1234581	210
2016-01-02	7	1234567	225
2016-01-02	7	1234568	240
2016-01-02	8	1234569	255
2016-01-02	8	1234570	100
2016-01-02	8	1234571	200
2016-01-02	8	1234572	300
2016-01-02	8	1234573	400
2016-01-02	9	1234574	500
2016-01-02	9	1234575	600
2016-01-02	9	1234576	700
2016-01-02	9	1234577	800
2016-01-02	9	1234578	900
2016-01-02	9	1234579	1000
2016-01-02	9	1234580	120
2016-01-02	9	1234581	135
2016-01-02	9	1234567	150
2016-01-02	9	1234568	165
2016-01-02	10	1234569	180
2016-01-02	10	1234570	195
2016-01-02	10	1234571	210
2016-01-02	10	1234572	225
2016-01-02	10	1234573	240
2016-01-02	10	1234574	255
2016-01-02	10	1234575	100
2016-01-02	10	1234576	200
2016-01-02	10	1234577	300
2016-01-02	10	1234578	400
2016-01-02	11	1234579	500
2016-01-02	11	1234580	600
2016-01-02	11	1234581	700
2016-01-02	11	1234567	800
2016-01-02	11	1234568	900
2016-01-02	11	1234569	1000
2016-01-02	12	1234570	120
2016-01-02	12	1234571	135
2016-01-02	12	1234572	150
2016-01-02	12	1234573	165
2016-01-02	12	1234574	180
2016-01-02	12	1234575	195
2016-01-02	13	1234576	210
2016-01-02	13	1234577	225
2016-01-02	13	1234578	240
2016-01-02	13	1234579	255
2016-01-02	13	1234580	100
2016-01-02	13	1234581	200
2016-01-02	14	1234567	300
2016-01-02	14	1234568	400
2016-01-02	14	1234569	500
2016-01-02	14	1234570	600
2016-01-02	14	1234571	700
2016-01-02	14	1234572	800
2016-01-02	15	1234573	900
2016-01-02	15	1234574	1000
2016-01-02	15	1234575	120
2016-01-02	15	1234576	135
2016-01-02	15	1234577	150
2016-01-02	15	1234578	165
2016-01-02	16	1234579	180
2016-01-02	16	1234580	195
2016-01-02	16	1234581	210
2016-01-02	16	1234567	225
2016-01-02	16	1234568	240
2016-01-02	16	1234569	255
2016-01-03	1	1234570	100
2016-01-03	1	1234571	200
2016-01-03	1	1234572	300
2016-01-03	1	1234573	400
2016-01-03	1	1234574	500
2016-01-03	1	1234575	600
2016-01-03	2	1234576	700
2016-01-03	2	1234577	800
2016-01-03	2	1234578	900
2016-01-03	2	1234579	1000
2016-01-03	2	1234580	120
2016-01-03	2	1234581	135
2016-01-03	2	1234567	150
2016-01-03	3	1234568	165
2016-01-03	3	1234569	180
2016-01-03	3	1234570	195
2016-01-03	3	1234571	210
2016-01-03	3	1234572	225
2016-01-03	3	1234573	240
2016-01-03	3	1234574	255
2016-01-03	3	1234575	100
2016-01-03	4	1234576	200
2016-01-03	4	1234577	300
2016-01-03	4	1234578	400
2016-01-03	4	1234579	500
2016-01-03	4	1234580	600
2016-01-03	4	1234581	700
2016-01-03	5	1234567	800
2016-01-03	5	1234568	900
2016-01-03	5	1234569	1000
2016-01-03	5	1234570	120
2016-01-03	5	1234571	135
2016-01-03	5	1234572	150
2016-01-03	6	1234573	165
2016-01-03	6	1234574	180
2016-01-03	6	1234575	195
2016-01-03	6	1234576	210
2016-01-03	6	1234577	225
2016-01-03	7	1234578	240
2016-01-03	7	1234579	255
2016-01-03	7	1234580	100
2016-01-03	7	1234581	200
2016-01-03	7	1234567	300
2016-01-03	7	1234568	400
2016-01-03	8	1234569	500
2016-01-03	8	1234570	600
2016-01-03	8	1234571	700
2016-01-03	8	1234572	800
2016-01-03	8	1234573	900
2016-01-03	9	1234574	1000
2016-01-03	9	1234575	120
2016-01-03	9	1234576	135
2016-01-03	9	1234577	150
2016-01-03	9	1234578	165
2016-01-03	9	1234579	180
2016-01-03	10	1234580	195
2016-01-03	10	1234581	210
2016-01-03	10	1234567	225
2016-01-03	10	1234568	240
2016-01-03	11	1234569	255
2016-01-03	11	1234570	100
2016-01-03	11	1234571	200
2016-01-03	11	1234572	300
2016-01-03	12	1234573	400
2016-01-03	12	1234574	500
2016-01-03	12	1234575	600
2016-01-03	12	1234576	700
2016-01-03	12	1234577	800
2016-01-03	13	1234578	900
2016-01-03	13	1234579	1000
2016-01-03	13	1234580	120
2016-01-03	13	1234581	135
2016-01-03	14	1234567	150
2016-01-03	14	1234568	165
2016-01-03	15	1234569	180
2016-01-03	15	1234570	195
2016-01-03	15	1234571	210
2016-01-03	16	1234572	225
2016-01-03	16	1234573	240
2016-01-03	16	1234574	255
2016-01-03	16	1234575	100
2016-01-03	16	1234576	200
2016-01-03	16	1234577	300
2016-01-03	16	1234578	400
2016-01-03	16	1234579	500
2016-01-03	16	1234580	600
\.


--
-- TOC entry 4885 (class 0 OID 16653)
-- Dependencies: 226
-- Data for Name: shops; Type: TABLE DATA; Schema: window; Owner: postgres
--

COPY "window".shops ("SHOPNUMBER", "CITY", "ADDRESS") FROM stdin;
1	СПб	Ленина, 5
2	МСК	Пушкина, 10
3	НВГ	Ленина, 10
4	МСК	Лермонтова, 12
5	НВГ	Иванова, 56
6	СПб	Стачек, 125
7	СПб	Ветеранов, 105
8	СПб	Зеленина, 12
9	МСК	Центральная, 128
10	НВГ	Лермонтова, 18
11	СПб	Молодежная, 108
12	СПб	Зеленая, 1
13	СПб	Новая, 15
14	МСК	Советская, 2
15	МРМ	Набережная, 5
16	МРМ	Школьная, 8
\.


-- Completed on 2024-11-14 15:47:25

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-11-14 15:47:25

--
-- PostgreSQL database cluster dump complete
--

