--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: fnAuthDriver(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnAuthDriver"(in_login character varying, in_password character varying) RETURNS integer
    LANGUAGE sql
    AS $$update "Driver" 
set "Driver_Status" = 2
where 
	in_login = "Login" and in_password = "Password";
select "ID" from "Driver" 
where
	in_login = "Login" and in_password = "Password";
$$;


ALTER FUNCTION public."fnAuthDriver"(in_login character varying, in_password character varying) OWNER TO postgres;

--
-- Name: fnChangeOrderStatus(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnChangeOrderStatus"(in_new_status integer, in_id_order integer) RETURNS void
    LANGUAGE sql
    AS $$update "Orders"
set "Order_Status" = in_new_status
where "ID" = in_id_order;$$;


ALTER FUNCTION public."fnChangeOrderStatus"(in_new_status integer, in_id_order integer) OWNER TO postgres;

--
-- Name: fnDeAuthDriver(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnDeAuthDriver"(in_id integer) RETURNS void
    LANGUAGE sql
    AS $$update "Driver"
set "Driver_Status" = 1
where "ID" = in_id;$$;


ALTER FUNCTION public."fnDeAuthDriver"(in_id integer) OWNER TO postgres;

--
-- Name: fnDeleteOrder(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnDeleteOrder"(in_id integer) RETURNS void
    LANGUAGE sql
    AS $$delete from "Orders" where "ID" = in_id;$$;


ALTER FUNCTION public."fnDeleteOrder"(in_id integer) OWNER TO postgres;

--
-- Name: fnDriverToOrder(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnDriverToOrder"(in_driver_id integer, in_order_id integer) RETURNS void
    LANGUAGE sql
    AS $$update "Orders"
set "ID_Driver" = in_driver_id,
     "Order_Status" = 2
where "ID" = in_order_id;
update "Driver"
set "Driver_Status" = 3
where "ID" = in_driver_id;$$;


ALTER FUNCTION public."fnDriverToOrder"(in_driver_id integer, in_order_id integer) OWNER TO postgres;

--
-- Name: fnEditDriver(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnEditDriver"(in_id integer, in_login character varying, in_password character varying, in_first_name character varying, in_second_name character varying, in_third_name character varying, in_car character varying, in_phone character varying, in_car_sign character varying, in_driver_status integer) RETURNS void
    LANGUAGE sql
    AS $$update "Driver" set
	"Login" = in_login,
	"Password" = in_password,
	"First_Name" = in_first_name,
	"Second_Name" = in_second_name,
	"Third_Name" = in_third_name,
	"Car" = in_car,
	"Phone" = in_phone,
	"Car_Sign" = in_car_sign,
	"Driver_Status" = in_driver_status
where "ID" = in_id$$;


ALTER FUNCTION public."fnEditDriver"(in_id integer, in_login character varying, in_password character varying, in_first_name character varying, in_second_name character varying, in_third_name character varying, in_car character varying, in_phone character varying, in_car_sign character varying, in_driver_status integer) OWNER TO postgres;

--
-- Name: fnEditOrder(integer, character varying, character varying, integer, integer, character varying, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnEditOrder"(in_id integer, in_addres_from character varying, in_addres_to character varying, in_id_driver integer, in_order_status integer, in_additional character varying, in_order_start date, in_order_finish date) RETURNS void
    LANGUAGE sql
    AS $$UPDATE "Orders"
   SET "AddressFrom"=in_addres_from, "AddressTo"=in_addres_to,
    "ID_Driver"=in_id_driver, "Order_Status"=in_order_status, 
       "Additional"=in_additional, "OrderDate"=in_order_start, "OrderFinish"=in_order_finish
 WHERE "ID"= in_id ;$$;


ALTER FUNCTION public."fnEditOrder"(in_id integer, in_addres_from character varying, in_addres_to character varying, in_id_driver integer, in_order_status integer, in_additional character varying, in_order_start date, in_order_finish date) OWNER TO postgres;

--
-- Name: fnNewOrder(character varying, character varying, character varying, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnNewOrder"(in_addres_from character varying, in_addres_to character varying, in_additional character varying, in_data_start date) RETURNS void
    LANGUAGE sql
    AS $$insert into "Orders"("AddressFrom","AddressTo","Additional","OrderDate","Order_Status")
values (in_addres_from,in_addres_to,in_additional,in_data_start,1);$$;


ALTER FUNCTION public."fnNewOrder"(in_addres_from character varying, in_addres_to character varying, in_additional character varying, in_data_start date) OWNER TO postgres;

--
-- Name: fncGetActiveRide(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fncGetActiveRide"(arg_driver_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	DECLARE ride_id integer; 
begin
	select
		id into ride_id
	from "tRide"
	where 1=1
		and driver_id = arg_driver_id
	limit 1;
	
	if ride_id is null
	then 
		return -1;
	else
		return ride_id;
	end if;
end;
$$;


ALTER FUNCTION public."fncGetActiveRide"(arg_driver_id integer) OWNER TO postgres;

--
-- Name: fncGetDriverId(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fncGetDriverId"(arg_driver_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	DECLARE driver_id integer; 
begin
	

	select
		 id into driver_id
	from "tDriver"
	where 1=1
		and name = arg_driver_name;

	if driver_id is null
	then
		insert into "tDriver"
		(
			name,
			status_id
		)
		values
		(
			arg_driver_name,
			0
		);
	else
		return driver_id;
	end if;

	select
		id into driver_id
	from "tDriver"
	where 1=1
		and name = arg_driver_name;

	return driver_id;
end;
$$;


ALTER FUNCTION public."fncGetDriverId"(arg_driver_name character varying) OWNER TO postgres;

--
-- Name: fncGetRideAddress(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fncGetRideAddress"(arg_ride_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE p_address varchar; 
begin
	select
		address into p_address
	from "tRide"
	where 1=1
		and id = arg_ride_id;

	return p_address;
end;
$$;


ALTER FUNCTION public."fncGetRideAddress"(arg_ride_id integer) OWNER TO postgres;

--
-- Name: fncGetRideRequirement(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fncGetRideRequirement"(arg_ride_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE p_requirement varchar; 
begin
	select
		requirement into p_requirement
	from "tRide"
	where 1=1
		and id = arg_ride_id;

	return p_requirement;
end;
$$;


ALTER FUNCTION public."fncGetRideRequirement"(arg_ride_id integer) OWNER TO postgres;

--
-- Name: fncGetRideStatus(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fncGetRideStatus"(arg_ride_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE p_status_id varchar; 
begin
	select
		stat.name into p_status_id
	from "tRide" ride
	inner join "tRideStatus" stat
		on ride.status_id = stat.id
	where 1=1
		and ride.id = arg_ride_id;

	return p_status_id;
end;
$$;


ALTER FUNCTION public."fncGetRideStatus"(arg_ride_id integer) OWNER TO postgres;

--
-- Name: fndeletedriver(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fndeletedriver(in_id integer) RETURNS void
    LANGUAGE sql
    AS $$
delete from "Driver" where "ID" = in_id$$;


ALTER FUNCTION public.fndeletedriver(in_id integer) OWNER TO postgres;

--
-- Name: fnnewdriver(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fnnewdriver(login character varying, password character varying, first_name character varying, second_name character varying, third_name character varying, car character varying, phone character varying, car_sign character varying) RETURNS void
    LANGUAGE sql
    AS $$
insert into "Driver"("Login","Password","First_Name","Second_Name","Third_Name","Car","Phone","Car_Sign","Driver_Status") values (login,password,first_name,second_name,third_name,car,phone,car_sign,1);
$$;


ALTER FUNCTION public.fnnewdriver(login character varying, password character varying, first_name character varying, second_name character varying, third_name character varying, car character varying, phone character varying, car_sign character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Driver" (
    "ID" integer NOT NULL,
    "Login" character varying(20) NOT NULL,
    "Password" character varying(20) NOT NULL,
    "First_Name" character varying(20) NOT NULL,
    "Second_Name" character varying(20) NOT NULL,
    "Third_Name" character varying(20),
    "Car" character varying(100) NOT NULL,
    "Phone" character varying(20) NOT NULL,
    "Car_Sign" character varying(10) NOT NULL,
    "Driver_Status" integer NOT NULL
);


ALTER TABLE public."Driver" OWNER TO postgres;

--
-- Name: Driver_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Driver_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Driver_ID_seq" OWNER TO postgres;

--
-- Name: Driver_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Driver_ID_seq" OWNED BY public."Driver"."ID";


--
-- Name: Driver_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Driver_status" (
    "ID" integer NOT NULL,
    "Status" character varying NOT NULL
);


ALTER TABLE public."Driver_status" OWNER TO postgres;

--
-- Name: Driver_status_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Driver_status_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Driver_status_ID_seq" OWNER TO postgres;

--
-- Name: Driver_status_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Driver_status_ID_seq" OWNED BY public."Driver_status"."ID";


--
-- Name: Order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order_status" (
    "ID" integer NOT NULL,
    "Status" character varying(20) NOT NULL
);


ALTER TABLE public."Order_status" OWNER TO postgres;

--
-- Name: Order_status_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_status_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_status_ID_seq" OWNER TO postgres;

--
-- Name: Order_status_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_status_ID_seq" OWNED BY public."Order_status"."ID";


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "ID" integer NOT NULL,
    "AddressFrom" character varying(50) NOT NULL,
    "AddressTo" character varying(50),
    "ID_Driver" integer,
    "Order_Status" integer NOT NULL,
    "Additional" character varying(50),
    "OrderDate" date NOT NULL,
    "OrderFinish" date
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- Name: Orders_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_ID_seq" OWNER TO postgres;

--
-- Name: Orders_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_ID_seq" OWNED BY public."Orders"."ID";


--
-- Name: tDriver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tDriver" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    status_id integer NOT NULL
);


ALTER TABLE public."tDriver" OWNER TO postgres;

--
-- Name: tDriverStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tDriverStatus" (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."tDriverStatus" OWNER TO postgres;

--
-- Name: tDriver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tDriver_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tDriver_id_seq" OWNER TO postgres;

--
-- Name: tDriver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tDriver_id_seq" OWNED BY public."tDriver".id;


--
-- Name: tRide; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tRide" (
    id integer NOT NULL,
    driver_id integer,
    status_id integer NOT NULL,
    requirement character varying(2000),
    create_dtm timestamp(6) without time zone NOT NULL,
    address character varying(1000) NOT NULL
);


ALTER TABLE public."tRide" OWNER TO postgres;

--
-- Name: tRideArchive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tRideArchive" (
    id integer NOT NULL,
    driver_id integer,
    create_dtm timestamp(6) without time zone NOT NULL,
    close_dtm timestamp(6) without time zone NOT NULL,
    requirement character varying(2000),
    address character varying(1000) NOT NULL
);


ALTER TABLE public."tRideArchive" OWNER TO postgres;

--
-- Name: tRideArchive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tRideArchive_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tRideArchive_id_seq" OWNER TO postgres;

--
-- Name: tRideArchive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tRideArchive_id_seq" OWNED BY public."tRideArchive".id;


--
-- Name: tRideStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tRideStatus" (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public."tRideStatus" OWNER TO postgres;

--
-- Name: tRide_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tRide_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tRide_id_seq" OWNER TO postgres;

--
-- Name: tRide_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tRide_id_seq" OWNED BY public."tRide".id;


--
-- Name: Driver ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Driver" ALTER COLUMN "ID" SET DEFAULT nextval('public."Driver_ID_seq"'::regclass);


--
-- Name: Driver_status ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Driver_status" ALTER COLUMN "ID" SET DEFAULT nextval('public."Driver_status_ID_seq"'::regclass);


--
-- Name: Order_status ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_status" ALTER COLUMN "ID" SET DEFAULT nextval('public."Order_status_ID_seq"'::regclass);


--
-- Name: Orders ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "ID" SET DEFAULT nextval('public."Orders_ID_seq"'::regclass);


--
-- Name: tDriver id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tDriver" ALTER COLUMN id SET DEFAULT nextval('public."tDriver_id_seq"'::regclass);


--
-- Name: tRide id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRide" ALTER COLUMN id SET DEFAULT nextval('public."tRide_id_seq"'::regclass);


--
-- Name: tRideArchive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRideArchive" ALTER COLUMN id SET DEFAULT nextval('public."tRideArchive_id_seq"'::regclass);


--
-- Data for Name: Driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Driver" ("ID", "Login", "Password", "First_Name", "Second_Name", "Third_Name", "Car", "Phone", "Car_Sign", "Driver_Status") FROM stdin;
2	выаыва	ываыва	Иванов	Иван	Иванович	Красная приора	234234234	23423	1
11	Vasya	1111	Сидоров	Илья	Васильевич	Белая ауди	8 918 641 58 57	йц41	1
3	йц	йц	Петров	Петр	Сергеевич	Белая приора	234234234	23423	3
12	usup	usup	Ваникин	Иван	Юсупович	Черная Ауди	124124123213	1234	1
\.


--
-- Data for Name: Driver_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Driver_status" ("ID", "Status") FROM stdin;
1	Не активен
2	Свободен
3	Выполняет заказ
\.


--
-- Data for Name: Order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order_status" ("ID", "Status") FROM stdin;
1	Поиск водителя
2	Водитель в пути
3	Ожидание клиента
4	Выполнение заказа
5	Заказ завершен
\.


--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" ("ID", "AddressFrom", "AddressTo", "ID_Driver", "Order_Status", "Additional", "OrderDate", "OrderFinish") FROM stdin;
2	йцу	йцу	3	2	йцу	2019-03-06	\N
4	Яна полуяна 43	Димитрова 15	\N	1	Можно курить	2019-03-06	\N
\.


--
-- Data for Name: tDriver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tDriver" (id, name, status_id) FROM stdin;
6	Асландбек	0
7	Асландбек2	0
8	Асланбек	0
\.


--
-- Data for Name: tDriverStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tDriverStatus" (id, name) FROM stdin;
1	Готов
0	Неактивен
\.


--
-- Data for Name: tRide; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tRide" (id, driver_id, status_id, requirement, create_dtm, address) FROM stdin;
10	\N	0	Нет\r\n	2019-01-07 15:03:26.472995	К дедушке в деревню
11	\N	0	Нет\r\n	2019-01-08 19:36:57.383521	а
12	\N	0	Нет\r\n	2019-02-20 22:34:12.96046	Димитрова 170
13	\N	0	Нет\r\n	2019-02-20 22:38:31.671728	Пробная улица дом Тест
\.


--
-- Data for Name: tRideArchive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tRideArchive" (id, driver_id, create_dtm, close_dtm, requirement, address) FROM stdin;
1	1	2018-12-26 03:41:39.602597	2018-12-26 07:32:49.98075	чтобы было удобно	Улица Пушкина, дом Колотушкина
3	\N	2018-12-26 03:42:04.984236	2018-12-26 10:24:10.471132	нет	Улица Пушкина, дом 1
4	6	2018-12-26 10:53:49.162608	2019-01-07 12:04:35.88177	Нет\r\n	yyrf
5	2	2018-12-26 10:59:14.169591	2019-01-07 12:12:47.189008	ШОбы удобно было	улица пушкина, дом колотушкина
6	3	2018-12-26 11:00:51.538283	2019-01-07 12:12:49.86242	Шобы удобно было, все \r\n	Улица
7	3	2018-12-26 10:59:21.365781	2019-01-07 12:12:51.426648	Шобы удобно было	yyrf
8	6	2019-01-07 14:39:37.829062	2019-01-07 14:41:16.712691	Нет\r\n	Туда
9	6	2019-01-07 12:15:51.2703	2019-01-07 14:41:20.816572	Нет\r\n	Димитрова 200
10	7	2019-01-07 12:03:33.690205	2019-01-07 14:41:24.648581	Не курить в салоне\r\n	Димитрова 170
11	6	2019-01-07 13:37:01.033464	2019-01-07 14:41:26.256559	Нет\r\n	ставрополька
\.


--
-- Data for Name: tRideStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tRideStatus" (id, name) FROM stdin;
1	Перемещение к исходной точке
2	Ожидание клиента
3	Перемещение в точку назначения
4	Завершение поездки
0	Новый
\.


--
-- Name: Driver_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Driver_ID_seq"', 12, true);


--
-- Name: Driver_status_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Driver_status_ID_seq"', 3, true);


--
-- Name: Order_status_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_status_ID_seq"', 5, true);


--
-- Name: Orders_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_ID_seq"', 4, true);


--
-- Name: tDriver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tDriver_id_seq"', 8, true);


--
-- Name: tRideArchive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tRideArchive_id_seq"', 11, true);


--
-- Name: tRide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tRide_id_seq"', 13, true);


--
-- Name: Driver Driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID");


--
-- Name: Driver_status Driver_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Driver_status"
    ADD CONSTRAINT "Driver_status_pkey" PRIMARY KEY ("ID");


--
-- Name: Order_status Order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_status"
    ADD CONSTRAINT "Order_status_pkey" PRIMARY KEY ("ID");


--
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("ID");


--
-- Name: tDriverStatus tDriverStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tDriverStatus"
    ADD CONSTRAINT "tDriverStatus_pkey" PRIMARY KEY (id);


--
-- Name: tDriver tDriver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tDriver"
    ADD CONSTRAINT "tDriver_pkey" PRIMARY KEY (id);


--
-- Name: tRideArchive tRideArchive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRideArchive"
    ADD CONSTRAINT "tRideArchive_pkey" PRIMARY KEY (id);


--
-- Name: tRideStatus tRideStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRideStatus"
    ADD CONSTRAINT "tRideStatus_pkey" PRIMARY KEY (id);


--
-- Name: tRide tRide_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRide"
    ADD CONSTRAINT "tRide_pkey" PRIMARY KEY (id);


--
-- Name: fki_driver_fk_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_driver_fk_status_id ON public."tDriver" USING btree (status_id);


--
-- Name: fki_fk_archive_driver_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_archive_driver_id ON public."tRideArchive" USING btree (driver_id);


--
-- Name: fki_fk_driver_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_driver_id ON public."tRide" USING btree (driver_id);


--
-- Name: fki_fk_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_status_id ON public."tRide" USING btree (status_id);


--
-- Name: Driver Driver_Driver_Status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_Driver_Status_fkey" FOREIGN KEY ("Driver_Status") REFERENCES public."Driver_status"("ID");


--
-- Name: Orders Orders_ID_Driver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_ID_Driver_fkey" FOREIGN KEY ("ID_Driver") REFERENCES public."Driver"("ID");


--
-- Name: Orders Orders_Order_Status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_Order_Status_fkey" FOREIGN KEY ("Order_Status") REFERENCES public."Order_status"("ID");


--
-- Name: tRide fk_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tRide"
    ADD CONSTRAINT fk_status_id FOREIGN KEY (status_id) REFERENCES public."tRideStatus"(id);


--
-- Name: tDriver fk_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tDriver"
    ADD CONSTRAINT fk_status_id FOREIGN KEY (status_id) REFERENCES public."tDriverStatus"(id);


--
-- PostgreSQL database dump complete
--

