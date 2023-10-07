PGDMP     ,    
            	    {         	   balanceDB    15.2    15.2     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25243 	   balanceDB    DATABASE        CREATE DATABASE "balanceDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "balanceDB";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    25244    balance    TABLE     d   CREATE TABLE public.balance (
    user_id integer NOT NULL,
    current_balance double precision
);
    DROP TABLE public.balance;
       public         heap    postgres    false    4            �            1259    25247    balance_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.balance_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.balance_user_id_seq;
       public          postgres    false    214    4                       0    0    balance_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.balance_user_id_seq OWNED BY public.balance.user_id;
          public          postgres    false    215            �            1259    25257 
   operations    TABLE     �  CREATE TABLE public.operations (
    operation_id integer NOT NULL,
    user_id integer NOT NULL,
    operation_type character varying(20),
    operation_time timestamp without time zone,
    money_amount double precision,
    CONSTRAINT operations_operation_type_check CHECK (((operation_type)::text = ANY ((ARRAY['take_money'::character varying, 'put_money'::character varying])::text[])))
);
    DROP TABLE public.operations;
       public         heap    postgres    false    4            �            1259    25255    operations_operation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operations_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.operations_operation_id_seq;
       public          postgres    false    218    4                       0    0    operations_operation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.operations_operation_id_seq OWNED BY public.operations.operation_id;
          public          postgres    false    216            �            1259    25256    operations_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operations_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.operations_user_id_seq;
       public          postgres    false    218    4                       0    0    operations_user_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.operations_user_id_seq OWNED BY public.operations.user_id;
          public          postgres    false    217            k           2604    25248    balance user_id    DEFAULT     r   ALTER TABLE ONLY public.balance ALTER COLUMN user_id SET DEFAULT nextval('public.balance_user_id_seq'::regclass);
 >   ALTER TABLE public.balance ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    214            l           2604    25260    operations operation_id    DEFAULT     �   ALTER TABLE ONLY public.operations ALTER COLUMN operation_id SET DEFAULT nextval('public.operations_operation_id_seq'::regclass);
 F   ALTER TABLE public.operations ALTER COLUMN operation_id DROP DEFAULT;
       public          postgres    false    216    218    218            m           2604    25261    operations user_id    DEFAULT     x   ALTER TABLE ONLY public.operations ALTER COLUMN user_id SET DEFAULT nextval('public.operations_user_id_seq'::regclass);
 A   ALTER TABLE public.operations ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    25244    balance 
   TABLE DATA           ;   COPY public.balance (user_id, current_balance) FROM stdin;
    public          postgres    false    214   ]                 0    25257 
   operations 
   TABLE DATA           i   COPY public.operations (operation_id, user_id, operation_type, operation_time, money_amount) FROM stdin;
    public          postgres    false    218   �                  0    0    balance_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.balance_user_id_seq', 7, true);
          public          postgres    false    215                       0    0    operations_operation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.operations_operation_id_seq', 21, true);
          public          postgres    false    216                       0    0    operations_user_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.operations_user_id_seq', 1, false);
          public          postgres    false    217            p           2606    25250    balance balance_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_pkey;
       public            postgres    false    214            r           2606    25264    operations operations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (operation_id);
 D   ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_pkey;
       public            postgres    false    218            s           2606    25265 "   operations operations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.balance(user_id);
 L   ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_user_id_fkey;
       public          postgres    false    214    3184    218               U   x�5̱A��a$@����_���q���(P��>w�e��
�'2f/�{�_8�W�`�j�#c<9�_ڄU ��)O���	w0��           x���;ND1E�dl`,���o-H�b*ħ
v��� �$���ƾA���yyz};%e�I���A�0ҩvK�l{PA���Ш�`�:���w �f�9�=hBR�`���r��e@	ҙ9G�5\�42x���㸩� Y$aj��n䰙�aN^r�P�i;�_��VZ�,H�� �&ϒ�<c����}��;t�-v��u�sQ�?�&^Ke���B�e��Tw��z��5�+si�G�5�#=*7䪇?at��U�o�mRY\r3�c�^'�#圿:�%     