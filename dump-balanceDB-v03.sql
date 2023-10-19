PGDMP     8    %            	    {         	   balanceDB    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25243 	   balanceDB    DATABASE        CREATE DATABASE "balanceDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "balanceDB";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    25289    balance    TABLE     W   CREATE TABLE public.balance (
    current_balance real,
    user_id bigint NOT NULL
);
    DROP TABLE public.balance;
       public         heap    postgres    false    4            �            1259    25288    balance_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.balance_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.balance_user_id_seq;
       public          postgres    false    4    215                       0    0    balance_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.balance_user_id_seq OWNED BY public.balance.user_id;
          public          postgres    false    214            �            1259    25296 
   operations    TABLE     �   CREATE TABLE public.operations (
    money_amount real,
    beneficiary_id bigint,
    operation_id bigint NOT NULL,
    operation_time timestamp(6) without time zone,
    user_id bigint,
    operation_type character varying(255)
);
    DROP TABLE public.operations;
       public         heap    postgres    false    4            �            1259    25295    operations_operation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operations_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.operations_operation_id_seq;
       public          postgres    false    4    217                       0    0    operations_operation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.operations_operation_id_seq OWNED BY public.operations.operation_id;
          public          postgres    false    216            �            1259    25331    operations_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operations_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.operations_user_id_seq;
       public          postgres    false    4    217                       0    0    operations_user_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.operations_user_id_seq OWNED BY public.operations.user_id;
          public          postgres    false    218            k           2604    25340    balance user_id    DEFAULT     r   ALTER TABLE ONLY public.balance ALTER COLUMN user_id SET DEFAULT nextval('public.balance_user_id_seq'::regclass);
 >   ALTER TABLE public.balance ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    214    215            l           2604    25341    operations operation_id    DEFAULT     �   ALTER TABLE ONLY public.operations ALTER COLUMN operation_id SET DEFAULT nextval('public.operations_operation_id_seq'::regclass);
 F   ALTER TABLE public.operations ALTER COLUMN operation_id DROP DEFAULT;
       public          postgres    false    217    216    217            m           2604    25342    operations user_id    DEFAULT     x   ALTER TABLE ONLY public.operations ALTER COLUMN user_id SET DEFAULT nextval('public.operations_user_id_seq'::regclass);
 A   ALTER TABLE public.operations ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    218    217                      0    25289    balance 
   TABLE DATA           ;   COPY public.balance (current_balance, user_id) FROM stdin;
    public          postgres    false    215   �                 0    25296 
   operations 
   TABLE DATA           y   COPY public.operations (money_amount, beneficiary_id, operation_id, operation_time, user_id, operation_type) FROM stdin;
    public          postgres    false    217   �                  0    0    balance_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.balance_user_id_seq', 7, true);
          public          postgres    false    214                       0    0    operations_operation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.operations_operation_id_seq', 27, true);
          public          postgres    false    216                       0    0    operations_user_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.operations_user_id_seq', 1, false);
          public          postgres    false    218            o           2606    25294    balance balance_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_pkey;
       public            postgres    false    215            q           2606    25301    operations operations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (operation_id);
 D   ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_pkey;
       public            postgres    false    217            r           2606    25335 "   operations operations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.balance(user_id);
 L   ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_user_id_fkey;
       public          postgres    false    3183    215    217               B   x����0�7��'a��?G%�l�̆���IŁk��1ଝ� X�JG���y�H����J��         U  x�}�KN�0E��*��>�}�Y+��:(DA��=/E4��0Mα�}o�1���{��h;�U�b�T$H���>���O��X�Yb0�V�@�2`m�*���z�3�,�c��L-otii�L�>�����tǁx�1�B��Ax{(�"�Y�Xce�V��B�Bɯ�WGX�fH�7�����7
�is*�e�	��#���	o1rk`����7�����%�6m?s���o�����Փ����OB���*+D�u����ݶ��;�Z���#/�����_��ϗ�e%p/�_��s��|y�P1���`A��@0`�0M�L�)�     