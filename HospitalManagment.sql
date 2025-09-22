--
-- PostgreSQL database dump
--

\restrict QRt38Y04oDFpu4GEyWdNv69E6GD4YkAtWYNKIlqwof1XgGWlAs6zg0l5D0ZotiF

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-22 16:23:05

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
-- TOC entry 10 (class 2615 OID 24781)
-- Name: Hospital_Managment; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Hospital_Managment";


ALTER SCHEMA "Hospital_Managment" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 366 (class 1259 OID 24924)
-- Name: appointments; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".appointments (
    appointment_id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    appointment_date timestamp without time zone DEFAULT (CURRENT_TIMESTAMP + '02:00:00'::interval),
    status text
);


ALTER TABLE "Hospital_Managment".appointments OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 24923)
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".appointments_appointment_id_seq OWNER TO postgres;

--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 365
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".appointments_appointment_id_seq OWNED BY "Hospital_Managment".appointments.appointment_id;


--
-- TOC entry 364 (class 1259 OID 24900)
-- Name: bills; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".bills (
    bill_id integer NOT NULL,
    patient_id integer,
    total_amount integer,
    payment_status character varying(15),
    bill_date date DEFAULT CURRENT_DATE,
    CONSTRAINT bills_payment_status_check CHECK (((payment_status)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);


ALTER TABLE "Hospital_Managment".bills OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 24899)
-- Name: bills_bill_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".bills_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".bills_bill_id_seq OWNER TO postgres;

--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 363
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".bills_bill_id_seq OWNED BY "Hospital_Managment".bills.bill_id;


--
-- TOC entry 358 (class 1259 OID 24814)
-- Name: departments; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".departments (
    departments_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE "Hospital_Managment".departments OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 24813)
-- Name: departments_departments_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE "Hospital_Managment".departments ALTER COLUMN departments_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Hospital_Managment".departments_departments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 360 (class 1259 OID 24820)
-- Name: doctors; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".doctors (
    doctor_id integer NOT NULL,
    name character varying(100) NOT NULL,
    specialization character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    department_id integer
);


ALTER TABLE "Hospital_Managment".doctors OWNER TO postgres;

--
-- TOC entry 359 (class 1259 OID 24819)
-- Name: doctors_doctor_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".doctors_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".doctors_doctor_id_seq OWNER TO postgres;

--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 359
-- Name: doctors_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".doctors_doctor_id_seq OWNED BY "Hospital_Managment".doctors.doctor_id;


--
-- TOC entry 362 (class 1259 OID 24893)
-- Name: medicines; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".medicines (
    medicine_id integer NOT NULL,
    name character varying(100),
    price integer
);


ALTER TABLE "Hospital_Managment".medicines OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 24892)
-- Name: medicines_medicine_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".medicines_medicine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".medicines_medicine_id_seq OWNER TO postgres;

--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 361
-- Name: medicines_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".medicines_medicine_id_seq OWNED BY "Hospital_Managment".medicines.medicine_id;


--
-- TOC entry 356 (class 1259 OID 24783)
-- Name: patients; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".patients (
    patient_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer NOT NULL,
    gender character varying(10),
    phone character varying(15),
    address character varying(100),
    CONSTRAINT patients_age_check CHECK (((age >= 1) AND (age <= 150))),
    CONSTRAINT patients_gender_check CHECK (((gender)::text = ANY ((ARRAY['Male'::character varying, 'Female'::character varying])::text[])))
);


ALTER TABLE "Hospital_Managment".patients OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 24782)
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".patients_patient_id_seq OWNER TO postgres;

--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 355
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".patients_patient_id_seq OWNED BY "Hospital_Managment".patients.patient_id;


--
-- TOC entry 369 (class 1259 OID 24968)
-- Name: treatment_medicines; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".treatment_medicines (
    treatment_id integer NOT NULL,
    medicine_id integer NOT NULL,
    quantity integer DEFAULT 1
);


ALTER TABLE "Hospital_Managment".treatment_medicines OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 24944)
-- Name: treatments; Type: TABLE; Schema: Hospital_Managment; Owner: postgres
--

CREATE TABLE "Hospital_Managment".treatments (
    treatment_id integer NOT NULL,
    appointment_id integer,
    patient_id integer,
    doctor_id integer,
    description text,
    treatment_date timestamp without time zone DEFAULT (CURRENT_TIMESTAMP + '02:00:00'::interval)
);


ALTER TABLE "Hospital_Managment".treatments OWNER TO postgres;

--
-- TOC entry 367 (class 1259 OID 24943)
-- Name: treatments_treatment_id_seq; Type: SEQUENCE; Schema: Hospital_Managment; Owner: postgres
--

CREATE SEQUENCE "Hospital_Managment".treatments_treatment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Hospital_Managment".treatments_treatment_id_seq OWNER TO postgres;

--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 367
-- Name: treatments_treatment_id_seq; Type: SEQUENCE OWNED BY; Schema: Hospital_Managment; Owner: postgres
--

ALTER SEQUENCE "Hospital_Managment".treatments_treatment_id_seq OWNED BY "Hospital_Managment".treatments.treatment_id;


--
-- TOC entry 5169 (class 2604 OID 24927)
-- Name: appointments appointment_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".appointments ALTER COLUMN appointment_id SET DEFAULT nextval('"Hospital_Managment".appointments_appointment_id_seq'::regclass);


--
-- TOC entry 5167 (class 2604 OID 24903)
-- Name: bills bill_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".bills ALTER COLUMN bill_id SET DEFAULT nextval('"Hospital_Managment".bills_bill_id_seq'::regclass);


--
-- TOC entry 5165 (class 2604 OID 24823)
-- Name: doctors doctor_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".doctors ALTER COLUMN doctor_id SET DEFAULT nextval('"Hospital_Managment".doctors_doctor_id_seq'::regclass);


--
-- TOC entry 5166 (class 2604 OID 24896)
-- Name: medicines medicine_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".medicines ALTER COLUMN medicine_id SET DEFAULT nextval('"Hospital_Managment".medicines_medicine_id_seq'::regclass);


--
-- TOC entry 5164 (class 2604 OID 24786)
-- Name: patients patient_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".patients ALTER COLUMN patient_id SET DEFAULT nextval('"Hospital_Managment".patients_patient_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 24947)
-- Name: treatments treatment_id; Type: DEFAULT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatments ALTER COLUMN treatment_id SET DEFAULT nextval('"Hospital_Managment".treatments_treatment_id_seq'::regclass);


--
-- TOC entry 5361 (class 0 OID 24924)
-- Dependencies: 366
-- Data for Name: appointments; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".appointments (appointment_id, patient_id, doctor_id, appointment_date, status) FROM stdin;
11	1	1	2025-09-22 15:39:57.663895	Scheduled
12	2	2	2025-09-22 15:39:57.663895	Completed
13	3	3	2025-09-22 15:39:57.663895	Cancelled
14	4	4	2025-09-22 15:39:57.663895	Scheduled
15	5	5	2025-09-22 15:39:57.663895	Completed
16	6	6	2025-09-22 15:39:57.663895	Scheduled
17	7	7	2025-09-22 15:39:57.663895	Completed
18	8	8	2025-09-22 15:39:57.663895	Scheduled
19	9	9	2025-09-22 15:39:57.663895	Cancelled
20	10	10	2025-09-22 15:39:57.663895	Scheduled
21	1	1	2025-09-22 15:48:11.15127	Scheduled
22	2	2	2025-09-22 15:48:11.15127	Scheduled
23	3	3	2025-09-22 15:48:11.15127	Scheduled
24	4	4	2025-09-22 15:48:11.15127	Scheduled
25	5	5	2025-09-22 15:48:11.15127	Scheduled
26	6	6	2025-09-22 15:48:11.15127	Scheduled
27	7	7	2025-09-22 15:48:11.15127	Scheduled
28	8	8	2025-09-22 15:48:11.15127	Scheduled
29	9	9	2025-09-22 15:48:11.15127	Scheduled
30	10	10	2025-09-22 15:48:11.15127	Scheduled
\.


--
-- TOC entry 5359 (class 0 OID 24900)
-- Dependencies: 364
-- Data for Name: bills; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".bills (bill_id, patient_id, total_amount, payment_status, bill_date) FROM stdin;
1	1	500	Yes	2025-09-22
2	2	1000	No	2025-09-22
3	3	750	Yes	2025-09-22
4	4	600	Yes	2025-09-22
5	5	1200	No	2025-09-22
6	6	450	Yes	2025-09-22
7	7	800	No	2025-09-22
8	8	900	Yes	2025-09-22
9	9	1500	No	2025-09-22
10	10	700	Yes	2025-09-22
\.


--
-- TOC entry 5353 (class 0 OID 24814)
-- Dependencies: 358
-- Data for Name: departments; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".departments (departments_id, name) FROM stdin;
1000	Cardiology
1001	Neurology
1002	Orthopedics
1003	Dermatology
1004	Gynecology
1005	Pediatrics
1006	ENT
1007	Psychiatry
1008	Oncology
1009	General Medicine
\.


--
-- TOC entry 5355 (class 0 OID 24820)
-- Dependencies: 360
-- Data for Name: doctors; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".doctors (doctor_id, name, specialization, phone, department_id) FROM stdin;
1	Dr. Rajesh Kumar	Cardiologist	9123456780	1000
2	Dr. Neeta Singh	Neurologist	9123456781	1001
3	Dr. Anil Verma	Orthopedic	9123456782	1002
4	Dr. Pooja Mehta	Dermatologist	9123456783	1003
5	Dr. Sunita Patel	Gynecologist	9123456784	1004
6	Dr. Rohit Sharma	Pediatrician	9123456785	1005
7	Dr. Kavita Joshi	ENT Specialist	9123456786	1006
8	Dr. Arjun Reddy	Psychiatrist	9123456787	1007
9	Dr. Meena Kumar	Oncologist	9123456788	1008
10	Dr. Suresh Gupta	General Physician	9123456789	1009
\.


--
-- TOC entry 5357 (class 0 OID 24893)
-- Dependencies: 362
-- Data for Name: medicines; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".medicines (medicine_id, name, price) FROM stdin;
1	Paracetamol	20
2	Amoxicillin	50
3	Ibuprofen	30
4	Cetirizine	25
5	Metformin	40
6	Aspirin	15
7	Omeprazole	35
8	Azithromycin	60
9	Hydrocortisone	45
10	Lisinopril	55
\.


--
-- TOC entry 5351 (class 0 OID 24783)
-- Dependencies: 356
-- Data for Name: patients; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".patients (patient_id, name, age, gender, phone, address) FROM stdin;
1	Rahul Sharma	25	Male	9876543210	Indore
2	Anita Verma	32	Female	9876543211	Bhopal
3	Vikram Singh	40	Male	9876543212	Pune
4	Sonal Mehta	28	Female	9876543213	Mumbai
5	Amit Patel	35	Male	9876543214	Ahmedabad
6	Neha Gupta	22	Female	9876543215	Delhi
7	Rohan Joshi	30	Male	9876543216	Kolkata
8	Priya Reddy	27	Female	9876543217	Hyderabad
9	Manoj Kumar	45	Male	9876543218	Chennai
10	Kavita Sharma	38	Female	9876543219	Bangalore
\.


--
-- TOC entry 5364 (class 0 OID 24968)
-- Dependencies: 369
-- Data for Name: treatment_medicines; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".treatment_medicines (treatment_id, medicine_id, quantity) FROM stdin;
81	1	2
81	2	1
82	3	1
82	4	2
83	2	1
83	5	1
84	1	1
84	6	3
85	3	2
85	7	1
\.


--
-- TOC entry 5363 (class 0 OID 24944)
-- Dependencies: 368
-- Data for Name: treatments; Type: TABLE DATA; Schema: Hospital_Managment; Owner: postgres
--

COPY "Hospital_Managment".treatments (treatment_id, appointment_id, patient_id, doctor_id, description, treatment_date) FROM stdin;
81	11	1	1	Heart checkup and medication prescribed	2025-09-22 15:52:10.572472
82	12	2	2	Migraine treatment and MRI advised	2025-09-22 15:52:10.572472
83	13	3	3	Fracture treatment	2025-09-22 15:52:10.572472
84	14	4	4	Skin allergy treatment	2025-09-22 15:52:10.572472
85	15	5	5	Pregnancy checkup	2025-09-22 15:52:10.572472
86	16	6	6	Routine pediatric checkup	2025-09-22 15:52:10.572472
87	17	7	7	Ear infection treatment	2025-09-22 15:52:10.572472
88	18	8	8	Counseling session	2025-09-22 15:52:10.572472
89	19	9	9	Cancer consultation	2025-09-22 15:52:10.572472
90	20	10	10	General health checkup	2025-09-22 15:52:10.572472
\.


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 365
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".appointments_appointment_id_seq', 30, true);


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 363
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".bills_bill_id_seq', 10, true);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 357
-- Name: departments_departments_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".departments_departments_id_seq', 1009, true);


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 359
-- Name: doctors_doctor_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".doctors_doctor_id_seq', 10, true);


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 361
-- Name: medicines_medicine_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".medicines_medicine_id_seq', 10, true);


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 355
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".patients_patient_id_seq', 10, true);


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 367
-- Name: treatments_treatment_id_seq; Type: SEQUENCE SET; Schema: Hospital_Managment; Owner: postgres
--

SELECT pg_catalog.setval('"Hospital_Managment".treatments_treatment_id_seq', 90, true);


--
-- TOC entry 5190 (class 2606 OID 24932)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- TOC entry 5188 (class 2606 OID 24907)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 5180 (class 2606 OID 24818)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (departments_id);


--
-- TOC entry 5182 (class 2606 OID 24827)
-- Name: doctors doctors_phone_key; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".doctors
    ADD CONSTRAINT doctors_phone_key UNIQUE (phone);


--
-- TOC entry 5184 (class 2606 OID 24825)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 5186 (class 2606 OID 24898)
-- Name: medicines medicines_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (medicine_id);


--
-- TOC entry 5178 (class 2606 OID 24790)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 5194 (class 2606 OID 24973)
-- Name: treatment_medicines treatment_medicines_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatment_medicines
    ADD CONSTRAINT treatment_medicines_pkey PRIMARY KEY (treatment_id, medicine_id);


--
-- TOC entry 5192 (class 2606 OID 24952)
-- Name: treatments treatments_pkey; Type: CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatments
    ADD CONSTRAINT treatments_pkey PRIMARY KEY (treatment_id);


--
-- TOC entry 5197 (class 2606 OID 24938)
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES "Hospital_Managment".doctors(doctor_id);


--
-- TOC entry 5198 (class 2606 OID 24933)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES "Hospital_Managment".patients(patient_id);


--
-- TOC entry 5196 (class 2606 OID 24908)
-- Name: bills bills_patiend_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".bills
    ADD CONSTRAINT bills_patiend_id_fkey FOREIGN KEY (patient_id) REFERENCES "Hospital_Managment".patients(patient_id);


--
-- TOC entry 5195 (class 2606 OID 24828)
-- Name: doctors doctors_department_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".doctors
    ADD CONSTRAINT doctors_department_id_fkey FOREIGN KEY (department_id) REFERENCES "Hospital_Managment".departments(departments_id);


--
-- TOC entry 5202 (class 2606 OID 24979)
-- Name: treatment_medicines treatment_medicines_medicine_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatment_medicines
    ADD CONSTRAINT treatment_medicines_medicine_id_fkey FOREIGN KEY (medicine_id) REFERENCES "Hospital_Managment".medicines(medicine_id);


--
-- TOC entry 5203 (class 2606 OID 24974)
-- Name: treatment_medicines treatment_medicines_treatment_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatment_medicines
    ADD CONSTRAINT treatment_medicines_treatment_id_fkey FOREIGN KEY (treatment_id) REFERENCES "Hospital_Managment".treatments(treatment_id);


--
-- TOC entry 5199 (class 2606 OID 24953)
-- Name: treatments treatments_appointment_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatments
    ADD CONSTRAINT treatments_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES "Hospital_Managment".appointments(appointment_id);


--
-- TOC entry 5200 (class 2606 OID 24963)
-- Name: treatments treatments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatments
    ADD CONSTRAINT treatments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES "Hospital_Managment".doctors(doctor_id);


--
-- TOC entry 5201 (class 2606 OID 24958)
-- Name: treatments treatments_patient_id_fkey; Type: FK CONSTRAINT; Schema: Hospital_Managment; Owner: postgres
--

ALTER TABLE ONLY "Hospital_Managment".treatments
    ADD CONSTRAINT treatments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES "Hospital_Managment".patients(patient_id);


-- Completed on 2025-09-22 16:23:05

--
-- PostgreSQL database dump complete
--

\unrestrict QRt38Y04oDFpu4GEyWdNv69E6GD4YkAtWYNKIlqwof1XgGWlAs6zg0l5D0ZotiF

