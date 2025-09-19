--
-- PostgreSQL database dump
--

\restrict XfgvukZUgUHI9ATtJndJlRVhQhLCPEXwIt9i5VCsoQpt5F1xEI9z6vBZIiYOCHq

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Name: E-commerce; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "E-commerce";


ALTER SCHEMA "E-commerce" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".customers (
    customer_id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(15),
    city character varying(50)
);


ALTER TABLE "E-commerce".customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".customers_customer_id_seq OWNED BY "E-commerce".customers.customer_id;


--
-- Name: order_items; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer
);


ALTER TABLE "E-commerce".order_items OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".order_items_order_item_id_seq OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".order_items_order_item_id_seq OWNED BY "E-commerce".order_items.order_item_id;


--
-- Name: orders; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date DEFAULT CURRENT_DATE
);


ALTER TABLE "E-commerce".orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".orders_order_id_seq OWNED BY "E-commerce".orders.order_id;


--
-- Name: payments; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".payments (
    payment_id integer NOT NULL,
    order_id integer,
    amount numeric(10,2),
    payment_date date DEFAULT CURRENT_DATE,
    method character varying(50)
);


ALTER TABLE "E-commerce".payments OWNER TO postgres;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".payments_payment_id_seq OWNER TO postgres;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".payments_payment_id_seq OWNED BY "E-commerce".payments.payment_id;


--
-- Name: products; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".products (
    product_id integer NOT NULL,
    product_name character varying(100),
    price numeric(10,2),
    stock integer
);


ALTER TABLE "E-commerce".products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".products_product_id_seq OWNED BY "E-commerce".products.product_id;


--
-- Name: customers_order; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.customers_order AS
 SELECT c.name,
    o.order_id,
    p.product_name,
    oi.quantity
   FROM ((("E-commerce".customers c
     JOIN "E-commerce".orders o ON ((c.customer_id = o.customer_id)))
     JOIN "E-commerce".order_items oi ON ((o.order_id = oi.order_id)))
     JOIN "E-commerce".products p ON ((oi.product_id = p.product_id)));


ALTER VIEW public.customers_order OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    name character varying(100),
    department character varying(50)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks (
    mark_id integer NOT NULL,
    student_id integer,
    subject character varying(50),
    score integer
);


ALTER TABLE public.marks OWNER TO postgres;

--
-- Name: name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.name (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.name OWNER TO postgres;

--
-- Name: name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.name_id_seq OWNER TO postgres;

--
-- Name: name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.name_id_seq OWNED BY public.name.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text,
    is_active boolean,
    created_at timestamp without time zone,
    data jsonb
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


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers ALTER COLUMN customer_id SET DEFAULT nextval('"E-commerce".customers_customer_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items ALTER COLUMN order_item_id SET DEFAULT nextval('"E-commerce".order_items_order_item_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders ALTER COLUMN order_id SET DEFAULT nextval('"E-commerce".orders_order_id_seq'::regclass);


--
-- Name: payments payment_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments ALTER COLUMN payment_id SET DEFAULT nextval('"E-commerce".payments_payment_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".products ALTER COLUMN product_id SET DEFAULT nextval('"E-commerce".products_product_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.name ALTER COLUMN id SET DEFAULT nextval('public.name_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".customers (customer_id, name, email, phone, city) FROM stdin;
1	Ravi kumar	ravikumar@gmail.com	1234567845	Delhi
2	Anita Sharma	anita@example.com	9123456780	Mumbai
3	Arjun Singh	arjun@example.com	9988776655	Lucknow
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".order_items (order_item_id, order_id, product_id, quantity) FROM stdin;
1	1	1	1
2	1	3	2
3	2	2	1
4	3	4	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".orders (order_id, customer_id, order_date) FROM stdin;
1	1	2025-09-18
2	2	2025-09-18
3	1	2025-09-18
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".payments (payment_id, order_id, amount, payment_date, method) FROM stdin;
4	1	59000.00	2025-09-18	Card
5	2	20000.00	2025-09-18	UPI
6	3	1500.00	2025-09-18	Cash on Delivery
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".products (product_id, product_name, price, stock) FROM stdin;
1	Laptop	55000.00	10
2	Mobile Phone	20000.00	30
3	Headphones	2000.00	50
4	Keyboard	1500.00	40
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, name, department) FROM stdin;
1	Ravi	HR
2	Rani	IT
3	Amit	HR
4	Neha	IT
5	Raju	HR
6	Employees6	IT
7	Employees7	HR
8	Employees8	IT
9	Employees9	HR
10	Employees10	IT
11	Employees11	HR
12	Employees12	IT
13	Employees13	HR
14	Employees14	IT
15	Employees15	HR
16	Employees16	IT
17	Employees17	HR
18	Employees18	IT
19	Employees19	HR
20	Employees20	IT
21	Employees21	HR
22	Employees22	HR
23	Employees23	IT
24	Employees24	HR
25	Employees25	IT
26	Employees26	HR
27	Employees27	IT
28	Employees28	HR
29	Employees29	IT
\.


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marks (mark_id, student_id, subject, score) FROM stdin;
101	1	Math	85
102	1	Science	78
103	2	Math	90
\.


--
-- Data for Name: name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.name (id, name) FROM stdin;
1	raja
2	kar
3	gta
4	rahol
5	ewa
6	raja
7	karan
8	rita
9	gita
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, name) FROM stdin;
1	Ravi
2	Anita
3	Rahul
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, is_active, created_at, data) FROM stdin;
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".customers_customer_id_seq', 3, true);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".order_items_order_item_id_seq', 4, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".orders_order_id_seq', 3, true);


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".payments_payment_id_seq', 6, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".products_product_id_seq', 4, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 29, true);


--
-- Name: name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.name_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (mark_id);


--
-- Name: name name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.name
    ADD CONSTRAINT name_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: n; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX n ON public.name USING btree (name);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES "E-commerce".orders(order_id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES "E-commerce".products(product_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "E-commerce".customers(customer_id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES "E-commerce".orders(order_id);


--
-- PostgreSQL database dump complete
--

\unrestrict XfgvukZUgUHI9ATtJndJlRVhQhLCPEXwIt9i5VCsoQpt5F1xEI9z6vBZIiYOCHq

