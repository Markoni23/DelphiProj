--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 10.7

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
-- Name: fnChangeOrderStatus(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fnChangeOrderStatus"(in_new_status integer, in_id_order integer) RETURNS void
    LANGUAGE sql
    AS $$update "Orders"
set "Order_Status" = in_new_status
where "ID" = in_id_order;$$;


ALTER FUNCTION public."fnChangeOrderStatus"(in_new_status integer, in_id_order integer) OWNER TO postgres;

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
    "Status" character varying NOT NULL
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
    "AddressFrom" character varying NOT NULL,
    "AddressTo" character varying,
    "ID_Driver" integer,
    "Order_Status" integer NOT NULL,
    "Additional" character varying,
    "OrderDate" date NOT NULL
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
-- Data for Name: Driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Driver" ("ID", "Login", "Password", "First_Name", "Second_Name", "Third_Name", "Car", "Phone", "Car_Sign", "Driver_Status") FROM stdin;
13	Л	П	Ф	И	О	М	Н	Г	1
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
1	Ожидает водителя
2	Водитель назначен
3	Водитель в пути
4	В поездке
5	Завершен
\.


--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" ("ID", "AddressFrom", "AddressTo", "ID_Driver", "Order_Status", "Additional", "OrderDate") FROM stdin;
5	eAddresStart	eAddresStart	\N	1	eAddresStart	2019-03-06
\.


--
-- Name: Driver_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Driver_ID_seq"', 13, true);


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

SELECT pg_catalog.setval('public."Orders_ID_seq"', 5, true);


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
-- PostgreSQL database dump complete
--

