PGDMP     $    9                w           diary    9.6.3    11.2 w    B	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            C	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            D	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            E	           1262    34995    diary    DATABASE     �   CREATE DATABASE diary WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Czech_Czech Republic.1250' LC_CTYPE = 'Czech_Czech Republic.1250';
    DROP DATABASE diary;
             postgres    false                        3079    35262    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                  false            F	           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                       false    2                       1255    37863     sight_visits_counter_decrement()    FUNCTION     �   CREATE FUNCTION public.sight_visits_counter_decrement() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE sight_visits_counter SET counter = counter - 1
	WHERE sight_id = OLD.sight_id;
	RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.sight_visits_counter_decrement();
       public       postgres    false                       1255    37861     sight_visits_counter_increment()    FUNCTION     �  CREATE FUNCTION public.sight_visits_counter_increment() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF EXISTS
	     ( SELECT 
		       1 
		   FROM 
		       sight_visits_counter
		   WHERE 
		       sight_id = NEW.sight_id
		 )
	THEN
	     UPDATE sight_visits_counter SET counter = counter + 1 
	     WHERE sight_id = NEW.sight_id;
	ELSE
	     INSERT INTO sight_visits_counter (sight_id, counter)
	     VALUES (NEW.sight_id, 1);
	END IF;
	
	RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.sight_visits_counter_increment();
       public       postgres    false                       1255    37872     sight_wishes_counter_decrement()    FUNCTION     �   CREATE FUNCTION public.sight_wishes_counter_decrement() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE sight_wishes_counter SET counter = counter - 1
	WHERE sight_id = OLD.sight_id;
	RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.sight_wishes_counter_decrement();
       public       postgres    false                       1255    37871     sight_wishes_counter_increment()    FUNCTION     �  CREATE FUNCTION public.sight_wishes_counter_increment() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF EXISTS
	( SELECT
			1
		FROM
			sight_wishes_counter
		WHERE
			sight_id = NEW.sight_id
	)
	THEN
		UPDATE sight_wishes_counter SET counter = counter + 1
		WHERE sight_id = NEW.sight_id;
	ELSE
		INSERT INTO sight_wishes_counter (sight_id, counter)
		VALUES (NEW.sight_id, 1);
	END IF;

	RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.sight_wishes_counter_increment();
       public       postgres    false            �            1255    34996    user_activity_log_changes()    FUNCTION       CREATE FUNCTION public.user_activity_log_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
 if OLD.active_session = true then
 delete from user_activity_log where active_session = false and user_id=NEW.user_id;

 end if;
 return new;
end;
$$;
 2   DROP FUNCTION public.user_activity_log_changes();
       public       postgres    false            �            1259    34997    author_type    TABLE     r   CREATE TABLE public.author_type (
    type_id integer NOT NULL,
    type_descr character varying(150) NOT NULL
);
    DROP TABLE public.author_type;
       public         postgres    false            �            1259    35000    author_type_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.author_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.author_type_type_id_seq;
       public       postgres    false    186            G	           0    0    author_type_type_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.author_type_type_id_seq OWNED BY public.author_type.type_id;
            public       postgres    false    187            �            1259    35002    authors    TABLE     �   CREATE TABLE public.authors (
    auth_id integer NOT NULL,
    auth_type integer,
    auth_name character varying(150) NOT NULL
);
    DROP TABLE public.authors;
       public         postgres    false            �            1259    35005    authors_auth_id_seq    SEQUENCE     |   CREATE SEQUENCE public.authors_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.authors_auth_id_seq;
       public       postgres    false    188            H	           0    0    authors_auth_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.authors_auth_id_seq OWNED BY public.authors.auth_id;
            public       postgres    false    189            �            1259    35007    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    book_title character(255) NOT NULL,
    author character(255) NOT NULL,
    book_description text,
    published date
);
    DROP TABLE public.books;
       public         postgres    false            �            1259    35013    books_book_id_seq    SEQUENCE     z   CREATE SEQUENCE public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public       postgres    false    190            I	           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
            public       postgres    false    191            �            1259    35015    comments    TABLE     �   CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    text character(255) NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.comments;
       public         postgres    false            �            1259    35019    comments_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_comment_id_seq;
       public       postgres    false    192            J	           0    0    comments_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;
            public       postgres    false    193            �            1259    35021    conversations    TABLE     x   CREATE TABLE public.conversations (
    conversation_id integer NOT NULL,
    user_id1 integer,
    user_id2 integer
);
 !   DROP TABLE public.conversations;
       public         postgres    false            �            1259    35024 !   conversations_conversation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.conversations_conversation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.conversations_conversation_id_seq;
       public       postgres    false    194            K	           0    0 !   conversations_conversation_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.conversations_conversation_id_seq OWNED BY public.conversations.conversation_id;
            public       postgres    false    195            �            1259    35026 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_code character(4) NOT NULL,
    country_name character(45) DEFAULT NULL::bpchar,
    img_path character(45) DEFAULT NULL::bpchar
);
    DROP TABLE public.countries;
       public         postgres    false            �            1259    35041    messages    TABLE     �   CREATE TABLE public.messages (
    message_id integer NOT NULL,
    sender_id integer,
    conversation_id integer,
    sent_datetime timestamp without time zone DEFAULT now(),
    text character varying,
    is_read boolean DEFAULT false NOT NULL
);
    DROP TABLE public.messages;
       public         postgres    false            �            1259    35049    messages_message_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.messages_message_id_seq;
       public       postgres    false    199            L	           0    0    messages_message_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.messages_message_id_seq OWNED BY public.messages.message_id;
            public       postgres    false    200            �            1259    35237    oauth_client_credentials    TABLE     �  CREATE TABLE public.oauth_client_credentials (
    access_token character varying(800) NOT NULL,
    oauth_client_id character varying(800) NOT NULL,
    oauth_secret character varying(800) NOT NULL,
    refresh_token character varying(800) NOT NULL,
    token_url character varying(800) NOT NULL,
    token_expires bigint NOT NULL,
    credentials_email character varying(300),
    is_refresh_token_valid boolean NOT NULL,
    credentials_id integer NOT NULL
);
 ,   DROP TABLE public.oauth_client_credentials;
       public         postgres    false            �            1259    35303 +   oauth_client_credentials_credentials_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth_client_credentials_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.oauth_client_credentials_credentials_id_seq;
       public       postgres    false    214            M	           0    0 +   oauth_client_credentials_credentials_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.oauth_client_credentials_credentials_id_seq OWNED BY public.oauth_client_credentials.credentials_id;
            public       postgres    false    215            �            1259    35051    password_change_requests    TABLE     �   CREATE TABLE public.password_change_requests (
    uuid character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created_time timestamp without time zone NOT NULL,
    isuuidused boolean DEFAULT false NOT NULL
);
 ,   DROP TABLE public.password_change_requests;
       public         postgres    false            �            1259    35055    posts    TABLE     �  CREATE TABLE public.posts (
    post_id integer NOT NULL,
    title character varying(100) NOT NULL,
    text text NOT NULL,
    description text DEFAULT NULL::bpchar NOT NULL,
    sight_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    preview_image_url character varying(150)
);
    DROP TABLE public.posts;
       public         postgres    false            �            1259    35063    posts_post_id_seq    SEQUENCE     z   CREATE SEQUENCE public.posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.posts_post_id_seq;
       public       postgres    false    202            N	           0    0    posts_post_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts.post_id;
            public       postgres    false    203            �            1259    35065    roles    TABLE     e   CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role character varying(45) NOT NULL
);
    DROP TABLE public.roles;
       public         postgres    false            �            1259    35068    roles_role_id_seq    SEQUENCE     z   CREATE SEQUENCE public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public       postgres    false    204            O	           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
            public       postgres    false    205            �            1259    35070    sight_visits    TABLE     �   CREATE TABLE public.sight_visits (
    visit_id integer NOT NULL,
    sight_id integer NOT NULL,
    user_id integer NOT NULL,
    visited_at timestamp(6) with time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.sight_visits;
       public         postgres    false            �            1259    37834    sight_visits_counter    TABLE     t   CREATE TABLE public.sight_visits_counter (
    sight_id integer NOT NULL,
    counter integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.sight_visits_counter;
       public         postgres    false            �            1259    35074 !   sight_visits_counter_visit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sight_visits_counter_visit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.sight_visits_counter_visit_id_seq;
       public       postgres    false    206            P	           0    0 !   sight_visits_counter_visit_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.sight_visits_counter_visit_id_seq OWNED BY public.sight_visits.visit_id;
            public       postgres    false    207            �            1259    35076    sight_wishes    TABLE     �   CREATE TABLE public.sight_wishes (
    wish_id integer NOT NULL,
    sight_id integer NOT NULL,
    user_id integer NOT NULL,
    wished_at timestamp without time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.sight_wishes;
       public         postgres    false            �            1259    37849    sight_wishes_counter    TABLE     t   CREATE TABLE public.sight_wishes_counter (
    sight_id integer NOT NULL,
    counter integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.sight_wishes_counter;
       public         postgres    false            �            1259    35031    sights    TABLE     -  CREATE TABLE public.sights (
    sight_id integer NOT NULL,
    label character varying(100) NOT NULL,
    country_code character varying(2),
    img_url character varying(100) DEFAULT NULL::bpchar,
    description character varying(300) DEFAULT NULL::bpchar,
    latitude real,
    longitude real
);
    DROP TABLE public.sights;
       public         postgres    false            �            1259    35039    sights_sight_id_seq    SEQUENCE     |   CREATE SEQUENCE public.sights_sight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sights_sight_id_seq;
       public       postgres    false    197            Q	           0    0    sights_sight_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sights_sight_id_seq OWNED BY public.sights.sight_id;
            public       postgres    false    198            �            1259    35080    user_activity_log    TABLE     �  CREATE TABLE public.user_activity_log (
    user_id integer NOT NULL,
    login_time timestamp without time zone DEFAULT now() NOT NULL,
    login_ip character varying(40),
    user_hostname character varying(100),
    session_id character varying NOT NULL,
    active_session boolean DEFAULT true NOT NULL,
    os character varying,
    browser character varying,
    user_agent character varying
);
 %   DROP TABLE public.user_activity_log;
       public         postgres    false            �            1259    35088 
   user_roles    TABLE     _   CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         postgres    false            �            1259    35091    users    TABLE     E  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(64) NOT NULL,
    email character varying(45) NOT NULL,
    is_enabled boolean,
    information character varying,
    registration_date timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false            �            1259    35098    users_user_id_seq    SEQUENCE     z   CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public       postgres    false    211            R	           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
            public       postgres    false    212            �            1259    36604    verification_tokens    TABLE     �   CREATE TABLE public.verification_tokens (
    token_id integer NOT NULL,
    token character varying(10) NOT NULL,
    user_id integer NOT NULL,
    expiration_date bigint NOT NULL,
    is_valid boolean NOT NULL
);
 '   DROP TABLE public.verification_tokens;
       public         postgres    false            �            1259    36602     verification_tokens_token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.verification_tokens_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.verification_tokens_token_id_seq;
       public       postgres    false    217            S	           0    0     verification_tokens_token_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.verification_tokens_token_id_seq OWNED BY public.verification_tokens.token_id;
            public       postgres    false    216            �            1259    35100    wishes_counter_wish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wishes_counter_wish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.wishes_counter_wish_id_seq;
       public       postgres    false    208            T	           0    0    wishes_counter_wish_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.wishes_counter_wish_id_seq OWNED BY public.sight_wishes.wish_id;
            public       postgres    false    213            h           2604    35102    author_type type_id    DEFAULT     z   ALTER TABLE ONLY public.author_type ALTER COLUMN type_id SET DEFAULT nextval('public.author_type_type_id_seq'::regclass);
 B   ALTER TABLE public.author_type ALTER COLUMN type_id DROP DEFAULT;
       public       postgres    false    187    186            i           2604    35103    authors auth_id    DEFAULT     r   ALTER TABLE ONLY public.authors ALTER COLUMN auth_id SET DEFAULT nextval('public.authors_auth_id_seq'::regclass);
 >   ALTER TABLE public.authors ALTER COLUMN auth_id DROP DEFAULT;
       public       postgres    false    189    188            j           2604    35104    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public       postgres    false    191    190            l           2604    35105    comments comment_id    DEFAULT     z   ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public       postgres    false    193    192            m           2604    35106    conversations conversation_id    DEFAULT     �   ALTER TABLE ONLY public.conversations ALTER COLUMN conversation_id SET DEFAULT nextval('public.conversations_conversation_id_seq'::regclass);
 L   ALTER TABLE public.conversations ALTER COLUMN conversation_id DROP DEFAULT;
       public       postgres    false    195    194            u           2604    35108    messages message_id    DEFAULT     z   ALTER TABLE ONLY public.messages ALTER COLUMN message_id SET DEFAULT nextval('public.messages_message_id_seq'::regclass);
 B   ALTER TABLE public.messages ALTER COLUMN message_id DROP DEFAULT;
       public       postgres    false    200    199            �           2604    35305 '   oauth_client_credentials credentials_id    DEFAULT     �   ALTER TABLE ONLY public.oauth_client_credentials ALTER COLUMN credentials_id SET DEFAULT nextval('public.oauth_client_credentials_credentials_id_seq'::regclass);
 V   ALTER TABLE public.oauth_client_credentials ALTER COLUMN credentials_id DROP DEFAULT;
       public       postgres    false    215    214            x           2604    35109    posts post_id    DEFAULT     n   ALTER TABLE ONLY public.posts ALTER COLUMN post_id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);
 <   ALTER TABLE public.posts ALTER COLUMN post_id DROP DEFAULT;
       public       postgres    false    203    202            {           2604    35110    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public       postgres    false    205    204            |           2604    35111    sight_visits visit_id    DEFAULT     �   ALTER TABLE ONLY public.sight_visits ALTER COLUMN visit_id SET DEFAULT nextval('public.sight_visits_counter_visit_id_seq'::regclass);
 D   ALTER TABLE public.sight_visits ALTER COLUMN visit_id DROP DEFAULT;
       public       postgres    false    207    206                       2604    35112    sight_wishes wish_id    DEFAULT     ~   ALTER TABLE ONLY public.sight_wishes ALTER COLUMN wish_id SET DEFAULT nextval('public.wishes_counter_wish_id_seq'::regclass);
 C   ALTER TABLE public.sight_wishes ALTER COLUMN wish_id DROP DEFAULT;
       public       postgres    false    213    208            r           2604    35107    sights sight_id    DEFAULT     r   ALTER TABLE ONLY public.sights ALTER COLUMN sight_id SET DEFAULT nextval('public.sights_sight_id_seq'::regclass);
 >   ALTER TABLE public.sights ALTER COLUMN sight_id DROP DEFAULT;
       public       postgres    false    198    197            �           2604    35113    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    212    211            �           2604    36607    verification_tokens token_id    DEFAULT     �   ALTER TABLE ONLY public.verification_tokens ALTER COLUMN token_id SET DEFAULT nextval('public.verification_tokens_token_id_seq'::regclass);
 K   ALTER TABLE public.verification_tokens ALTER COLUMN token_id DROP DEFAULT;
       public       postgres    false    217    216    217            �           2606    35115    author_type author_type_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.author_type
    ADD CONSTRAINT author_type_pkey PRIMARY KEY (type_id);
 F   ALTER TABLE ONLY public.author_type DROP CONSTRAINT author_type_pkey;
       public         postgres    false    186            �           2606    35117    authors authors_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (auth_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public         postgres    false    188            �           2606    35119    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public         postgres    false    190            �           2606    35121    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         postgres    false    192            �           2606    35123     conversations conversations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (conversation_id);
 J   ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_pkey;
       public         postgres    false    194            �           2606    35125    countries countries_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_code);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public         postgres    false    196            �           2606    35127    sights countries_sights_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sights
    ADD CONSTRAINT countries_sights_pkey PRIMARY KEY (sight_id);
 F   ALTER TABLE ONLY public.sights DROP CONSTRAINT countries_sights_pkey;
       public         postgres    false    197            �           2606    35129    messages messages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public         postgres    false    199            �           2606    35307 6   oauth_client_credentials oauth_client_credentials_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth_client_credentials
    ADD CONSTRAINT oauth_client_credentials_pkey PRIMARY KEY (credentials_id);
 `   ALTER TABLE ONLY public.oauth_client_credentials DROP CONSTRAINT oauth_client_credentials_pkey;
       public         postgres    false    214            �           2606    35131 6   password_change_requests password_change_requests_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.password_change_requests
    ADD CONSTRAINT password_change_requests_pkey PRIMARY KEY (uuid);
 `   ALTER TABLE ONLY public.password_change_requests DROP CONSTRAINT password_change_requests_pkey;
       public         postgres    false    201            �           2606    35133    posts posts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public         postgres    false    202            �           2606    35135    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    204            �           2606    35137    user_activity_log session_id_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.user_activity_log
    ADD CONSTRAINT session_id_pk PRIMARY KEY (session_id);
 I   ALTER TABLE ONLY public.user_activity_log DROP CONSTRAINT session_id_pk;
       public         postgres    false    209            �           2606    35139 #   user_activity_log session_id_unique 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_activity_log
    ADD CONSTRAINT session_id_unique UNIQUE (session_id);
 M   ALTER TABLE ONLY public.user_activity_log DROP CONSTRAINT session_id_unique;
       public         postgres    false    209            �           2606    35141 &   sight_visits sight_visits_counter_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.sight_visits
    ADD CONSTRAINT sight_visits_counter_pkey PRIMARY KEY (visit_id);
 P   ALTER TABLE ONLY public.sight_visits DROP CONSTRAINT sight_visits_counter_pkey;
       public         postgres    false    206            �           2606    37838 /   sight_visits_counter sight_visits_counter_pkey1 
   CONSTRAINT     s   ALTER TABLE ONLY public.sight_visits_counter
    ADD CONSTRAINT sight_visits_counter_pkey1 PRIMARY KEY (sight_id);
 Y   ALTER TABLE ONLY public.sight_visits_counter DROP CONSTRAINT sight_visits_counter_pkey1;
       public         postgres    false    218            �           2606    37854 .   sight_wishes_counter sight_wishes_counter_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.sight_wishes_counter
    ADD CONSTRAINT sight_wishes_counter_pkey PRIMARY KEY (sight_id);
 X   ALTER TABLE ONLY public.sight_wishes_counter DROP CONSTRAINT sight_wishes_counter_pkey;
       public         postgres    false    219            �           2606    35143    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public         postgres    false    210    210            �           2606    35145    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    211            �           2606    36609 ,   verification_tokens verification_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT verification_tokens_pkey PRIMARY KEY (token_id);
 V   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT verification_tokens_pkey;
       public         postgres    false    217            �           2606    35147     sight_wishes wishes_counter_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.sight_wishes
    ADD CONSTRAINT wishes_counter_pkey PRIMARY KEY (wish_id);
 J   ALTER TABLE ONLY public.sight_wishes DROP CONSTRAINT wishes_counter_pkey;
       public         postgres    false    208            �           2620    37870 .   sight_visits sigth_visits_counter_decr_trigger    TRIGGER     �   CREATE TRIGGER sigth_visits_counter_decr_trigger AFTER DELETE ON public.sight_visits FOR EACH ROW EXECUTE PROCEDURE public.sight_visits_counter_decrement();
 G   DROP TRIGGER sigth_visits_counter_decr_trigger ON public.sight_visits;
       public       postgres    false    270    206            �           2620    46028 .   sight_visits sigth_visits_counter_incr_trigger    TRIGGER     �   CREATE TRIGGER sigth_visits_counter_incr_trigger AFTER INSERT ON public.sight_visits FOR EACH ROW EXECUTE PROCEDURE public.sight_visits_counter_increment();
 G   DROP TRIGGER sigth_visits_counter_incr_trigger ON public.sight_visits;
       public       postgres    false    269    206            �           2620    46030 .   sight_wishes sigth_wishes_counter_decr_trigger    TRIGGER     �   CREATE TRIGGER sigth_wishes_counter_decr_trigger AFTER DELETE ON public.sight_wishes FOR EACH ROW EXECUTE PROCEDURE public.sight_wishes_counter_decrement();
 G   DROP TRIGGER sigth_wishes_counter_decr_trigger ON public.sight_wishes;
       public       postgres    false    272    208            �           2620    46029 .   sight_wishes sigth_wishes_counter_incr_trigger    TRIGGER     �   CREATE TRIGGER sigth_wishes_counter_incr_trigger AFTER INSERT ON public.sight_wishes FOR EACH ROW EXECUTE PROCEDURE public.sight_wishes_counter_increment();
 G   DROP TRIGGER sigth_wishes_counter_incr_trigger ON public.sight_wishes;
       public       postgres    false    208    271            �           2620    35148 '   user_activity_log user_activity_changes    TRIGGER     �   CREATE TRIGGER user_activity_changes BEFORE UPDATE ON public.user_activity_log FOR EACH ROW EXECUTE PROCEDURE public.user_activity_log_changes();
 @   DROP TRIGGER user_activity_changes ON public.user_activity_log;
       public       postgres    false    209    220            �           2606    35149    authors authors_auth_type_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_auth_type_fkey FOREIGN KEY (auth_type) REFERENCES public.author_type(type_id);
 H   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_auth_type_fkey;
       public       postgres    false    186    188    2185            �           2606    35154    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public       postgres    false    202    192    2203            �           2606    35159    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public       postgres    false    211    192    2217            �           2606    35164 )   conversations conversations_user_id1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user_id1_fkey FOREIGN KEY (user_id1) REFERENCES public.users(user_id);
 S   ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_user_id1_fkey;
       public       postgres    false    211    194    2217            �           2606    35169 )   conversations conversations_user_id2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user_id2_fkey FOREIGN KEY (user_id2) REFERENCES public.users(user_id);
 S   ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_user_id2_fkey;
       public       postgres    false    211    194    2217            �           2606    46031 )   sights countries_sights_country_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sights
    ADD CONSTRAINT countries_sights_country_code_fkey FOREIGN KEY (country_code) REFERENCES public.countries(country_code);
 S   ALTER TABLE ONLY public.sights DROP CONSTRAINT countries_sights_country_code_fkey;
       public       postgres    false    197    196    2195            �           2606    35179 &   messages messages_conversation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_conversation_id_fkey FOREIGN KEY (conversation_id) REFERENCES public.conversations(conversation_id);
 P   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_conversation_id_fkey;
       public       postgres    false    194    199    2193            �           2606    35184     messages messages_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(user_id);
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_sender_id_fkey;
       public       postgres    false    211    199    2217            �           2606    35189 >   password_change_requests password_change_requests_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.password_change_requests
    ADD CONSTRAINT password_change_requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 h   ALTER TABLE ONLY public.password_change_requests DROP CONSTRAINT password_change_requests_user_id_fkey;
       public       postgres    false    2217    201    211            �           2606    35194    posts posts_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public       postgres    false    2217    202    211            �           2606    35199 /   sight_visits sight_visits_counter_sight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_visits
    ADD CONSTRAINT sight_visits_counter_sight_id_fkey FOREIGN KEY (sight_id) REFERENCES public.sights(sight_id);
 Y   ALTER TABLE ONLY public.sight_visits DROP CONSTRAINT sight_visits_counter_sight_id_fkey;
       public       postgres    false    206    197    2197            �           2606    37839 8   sight_visits_counter sight_visits_counter_sight_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_visits_counter
    ADD CONSTRAINT sight_visits_counter_sight_id_fkey1 FOREIGN KEY (sight_id) REFERENCES public.sights(sight_id);
 b   ALTER TABLE ONLY public.sight_visits_counter DROP CONSTRAINT sight_visits_counter_sight_id_fkey1;
       public       postgres    false    2197    197    218            �           2606    35204 .   sight_visits sight_visits_counter_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_visits
    ADD CONSTRAINT sight_visits_counter_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 X   ALTER TABLE ONLY public.sight_visits DROP CONSTRAINT sight_visits_counter_user_id_fkey;
       public       postgres    false    2217    211    206            �           2606    37855 7   sight_wishes_counter sight_wishes_counter_sight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_wishes_counter
    ADD CONSTRAINT sight_wishes_counter_sight_id_fkey FOREIGN KEY (sight_id) REFERENCES public.sights(sight_id);
 a   ALTER TABLE ONLY public.sight_wishes_counter DROP CONSTRAINT sight_wishes_counter_sight_id_fkey;
       public       postgres    false    219    197    2197            �           2606    35209 0   user_activity_log user_activity_log_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_activity_log
    ADD CONSTRAINT user_activity_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.user_activity_log DROP CONSTRAINT user_activity_log_user_id_fkey;
       public       postgres    false    209    2217    211            �           2606    35214 "   user_roles user_roles_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_role_id_fkey;
       public       postgres    false    2205    210    204            �           2606    35219 "   user_roles user_roles_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_user_id_fkey;
       public       postgres    false    210    211    2217            �           2606    36610 4   verification_tokens verification_tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT verification_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT verification_tokens_user_id_fkey;
       public       postgres    false    2217    211    217            �           2606    35224 )   sight_wishes wishes_counter_sight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_wishes
    ADD CONSTRAINT wishes_counter_sight_id_fkey FOREIGN KEY (sight_id) REFERENCES public.sights(sight_id);
 S   ALTER TABLE ONLY public.sight_wishes DROP CONSTRAINT wishes_counter_sight_id_fkey;
       public       postgres    false    2197    197    208            �           2606    35229 (   sight_wishes wishes_counter_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sight_wishes
    ADD CONSTRAINT wishes_counter_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 R   ALTER TABLE ONLY public.sight_wishes DROP CONSTRAINT wishes_counter_user_id_fkey;
       public       postgres    false    211    2217    208           