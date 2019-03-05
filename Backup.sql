PGDMP     )                    w            TAXI    10.7    10.7 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16413    TAXI    DATABASE     �   CREATE DATABASE "TAXI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "TAXI";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16472    Driver    TABLE     E  CREATE TABLE public."Driver" (
    "ID" integer NOT NULL,
    "Login" text NOT NULL,
    "Password" text NOT NULL,
    "First_Name" text NOT NULL,
    "Second_Name" text NOT NULL,
    "Third_Name" text,
    "Car" text NOT NULL,
    "Phone" text NOT NULL,
    "Car_Sign" text NOT NULL,
    "Driver_Status" integer NOT NULL
);
    DROP TABLE public."Driver";
       public         postgres    false    3            �            1259    16470    Driver_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Driver_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Driver_ID_seq";
       public       postgres    false    3    201                       0    0    Driver_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Driver_ID_seq" OWNED BY public."Driver"."ID";
            public       postgres    false    200            �            1259    16427    Driver_status    TABLE     _   CREATE TABLE public."Driver_status" (
    "ID" integer NOT NULL,
    "Status" text NOT NULL
);
 #   DROP TABLE public."Driver_status";
       public         postgres    false    3            �            1259    16425    Driver_status_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Driver_status_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Driver_status_ID_seq";
       public       postgres    false    3    197                       0    0    Driver_status_ID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Driver_status_ID_seq" OWNED BY public."Driver_status"."ID";
            public       postgres    false    196            �            1259    16450    Order_status    TABLE     ^   CREATE TABLE public."Order_status" (
    "ID" integer NOT NULL,
    "Status" text NOT NULL
);
 "   DROP TABLE public."Order_status";
       public         postgres    false    3            �            1259    16448    Order_status_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_status_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Order_status_ID_seq";
       public       postgres    false    199    3                       0    0    Order_status_ID_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Order_status_ID_seq" OWNED BY public."Order_status"."ID";
            public       postgres    false    198            �            1259    16489    Orders    TABLE     �   CREATE TABLE public."Orders" (
    "ID" integer NOT NULL,
    "AddressFrom" text NOT NULL,
    "AddressTo" text,
    "ID_Driver" integer,
    "Order_Status" integer NOT NULL,
    "Additional" text,
    "OrderDate" date NOT NULL
);
    DROP TABLE public."Orders";
       public         postgres    false    3            �            1259    16487    Orders_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Orders_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Orders_ID_seq";
       public       postgres    false    3    203                       0    0    Orders_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Orders_ID_seq" OWNED BY public."Orders"."ID";
            public       postgres    false    202            �
           2604    16475 	   Driver ID    DEFAULT     l   ALTER TABLE ONLY public."Driver" ALTER COLUMN "ID" SET DEFAULT nextval('public."Driver_ID_seq"'::regclass);
 <   ALTER TABLE public."Driver" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    16430    Driver_status ID    DEFAULT     z   ALTER TABLE ONLY public."Driver_status" ALTER COLUMN "ID" SET DEFAULT nextval('public."Driver_status_ID_seq"'::regclass);
 C   ALTER TABLE public."Driver_status" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16453    Order_status ID    DEFAULT     x   ALTER TABLE ONLY public."Order_status" ALTER COLUMN "ID" SET DEFAULT nextval('public."Order_status_ID_seq"'::regclass);
 B   ALTER TABLE public."Order_status" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    16492 	   Orders ID    DEFAULT     l   ALTER TABLE ONLY public."Orders" ALTER COLUMN "ID" SET DEFAULT nextval('public."Orders_ID_seq"'::regclass);
 <   ALTER TABLE public."Orders" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    202    203    203                      0    16472    Driver 
   TABLE DATA               �   COPY public."Driver" ("ID", "Login", "Password", "First_Name", "Second_Name", "Third_Name", "Car", "Phone", "Car_Sign", "Driver_Status") FROM stdin;
    public       postgres    false    201   �)                 0    16427    Driver_status 
   TABLE DATA               9   COPY public."Driver_status" ("ID", "Status") FROM stdin;
    public       postgres    false    197   �)                 0    16450    Order_status 
   TABLE DATA               8   COPY public."Order_status" ("ID", "Status") FROM stdin;
    public       postgres    false    199   O*                 0    16489    Orders 
   TABLE DATA               |   COPY public."Orders" ("ID", "AddressFrom", "AddressTo", "ID_Driver", "Order_Status", "Additional", "OrderDate") FROM stdin;
    public       postgres    false    203   l*                   0    0    Driver_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Driver_ID_seq"', 1, false);
            public       postgres    false    200            !           0    0    Driver_status_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Driver_status_ID_seq"', 3, true);
            public       postgres    false    196            "           0    0    Order_status_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Order_status_ID_seq"', 1, false);
            public       postgres    false    198            #           0    0    Orders_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Orders_ID_seq"', 1, false);
            public       postgres    false    202            �
           2606    16480    Driver Driver_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Driver" DROP CONSTRAINT "Driver_pkey";
       public         postgres    false    201            �
           2606    16435     Driver_status Driver_status_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Driver_status"
    ADD CONSTRAINT "Driver_status_pkey" PRIMARY KEY ("ID");
 N   ALTER TABLE ONLY public."Driver_status" DROP CONSTRAINT "Driver_status_pkey";
       public         postgres    false    197            �
           2606    16458    Order_status Order_status_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Order_status"
    ADD CONSTRAINT "Order_status_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."Order_status" DROP CONSTRAINT "Order_status_pkey";
       public         postgres    false    199            �
           2606    16497    Orders Orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public         postgres    false    203            �
           2606    16481     Driver Driver_Driver_Status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_Driver_Status_fkey" FOREIGN KEY ("Driver_Status") REFERENCES public."Driver_status"("ID");
 N   ALTER TABLE ONLY public."Driver" DROP CONSTRAINT "Driver_Driver_Status_fkey";
       public       postgres    false    2697    201    197            �
           2606    16498    Orders Orders_ID_Driver_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_ID_Driver_fkey" FOREIGN KEY ("ID_Driver") REFERENCES public."Driver"("ID");
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_ID_Driver_fkey";
       public       postgres    false    203    2701    201            �
           2606    16503    Orders Orders_Order_Status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_Order_Status_fkey" FOREIGN KEY ("Order_Status") REFERENCES public."Order_status"("ID");
 M   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_Order_Status_fkey";
       public       postgres    false    199    203    2699                  x������ � �         P   x�3�0��V�.��taǅM�^��e�ya!����F �2�0�b���@���^쿰�b�� �@��+F��� ��0            x������ � �            x������ � �     