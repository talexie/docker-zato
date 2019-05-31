--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: http_soap_connection; Type: TYPE; Schema: public; Owner: zato
--

CREATE TYPE public.http_soap_connection AS ENUM (
    'channel',
    'outgoing'
);


ALTER TYPE public.http_soap_connection OWNER TO zato;

--
-- Name: http_soap_transport; Type: TYPE; Schema: public; Owner: zato
--

CREATE TYPE public.http_soap_transport AS ENUM (
    'plain_http',
    'soap'
);


ALTER TYPE public.http_soap_transport OWNER TO zato;

--
-- Name: job_type; Type: TYPE; Schema: public; Owner: zato
--

CREATE TYPE public.job_type AS ENUM (
    'one_time',
    'interval_based',
    'cron_style'
);


ALTER TYPE public.job_type OWNER TO zato;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO zato;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zato;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zato;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zato;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zato;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zato;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zato;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zato;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zato;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zato;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zato;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zato;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zato;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: aws_s3; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.aws_s3 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    pool_size integer NOT NULL,
    address character varying(200) NOT NULL,
    debug_level integer NOT NULL,
    suppr_cons_slashes boolean NOT NULL,
    content_type character varying(200) NOT NULL,
    metadata_ character varying(2000),
    bucket character varying(2000),
    encrypt_at_rest boolean NOT NULL,
    storage_class character varying(200) NOT NULL,
    opaque1 text,
    security_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.aws_s3 OWNER TO zato;

--
-- Name: aws_s3_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.aws_s3_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aws_s3_seq OWNER TO zato;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.cache (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_default boolean NOT NULL,
    cache_type character varying(45) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.cache OWNER TO zato;

--
-- Name: cache_builtin; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.cache_builtin (
    cache_id integer NOT NULL,
    max_size integer NOT NULL,
    max_item_size integer NOT NULL,
    extend_expiry_on_get boolean NOT NULL,
    extend_expiry_on_set boolean NOT NULL,
    sync_method character varying(20) NOT NULL,
    persistent_storage character varying(40) NOT NULL
);


ALTER TABLE public.cache_builtin OWNER TO zato;

--
-- Name: cache_builtin_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.cache_builtin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cache_builtin_seq OWNER TO zato;

--
-- Name: cache_memcached; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.cache_memcached (
    cache_id integer NOT NULL,
    servers text NOT NULL,
    is_debug boolean NOT NULL,
    extra bytea
);


ALTER TABLE public.cache_memcached OWNER TO zato;

--
-- Name: channel_amqp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.channel_amqp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    queue character varying(200) NOT NULL,
    consumer_tag_prefix character varying(200) NOT NULL,
    pool_size integer NOT NULL,
    ack_mode character varying(20) NOT NULL,
    prefetch_count integer NOT NULL,
    data_format character varying(20),
    opaque1 text,
    service_id integer NOT NULL,
    def_id integer NOT NULL
);


ALTER TABLE public.channel_amqp OWNER TO zato;

--
-- Name: channel_amqp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.channel_amqp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_amqp_seq OWNER TO zato;

--
-- Name: channel_stomp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.channel_stomp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    username character varying(200) DEFAULT 'guest'::character varying,
    password character varying(200),
    address character varying(200) DEFAULT 'localhost:61613'::character varying NOT NULL,
    proto_version character varying(20) DEFAULT '1.0'::character varying NOT NULL,
    timeout integer DEFAULT 10 NOT NULL,
    sub_to text NOT NULL,
    opaque1 text,
    service_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.channel_stomp OWNER TO zato;

--
-- Name: channel_stomp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.channel_stomp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_stomp_seq OWNER TO zato;

--
-- Name: channel_web_socket; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.channel_web_socket (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    is_out boolean NOT NULL,
    address character varying(200) NOT NULL,
    data_format character varying(20) NOT NULL,
    new_token_wait_time integer NOT NULL,
    token_ttl integer NOT NULL,
    opaque1 text,
    service_id integer,
    cluster_id integer NOT NULL,
    security_id integer
);


ALTER TABLE public.channel_web_socket OWNER TO zato;

--
-- Name: channel_wmq; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.channel_wmq (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    queue character varying(200) NOT NULL,
    data_format character varying(20),
    opaque1 text,
    service_id integer NOT NULL,
    def_id integer NOT NULL
);


ALTER TABLE public.channel_wmq OWNER TO zato;

--
-- Name: channel_wmq_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.channel_wmq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_wmq_seq OWNER TO zato;

--
-- Name: channel_zmq; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.channel_zmq (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    address character varying(200) NOT NULL,
    socket_type character varying(20) NOT NULL,
    sub_key character varying(200),
    data_format character varying(20),
    socket_method character varying(20) NOT NULL,
    pool_strategy character varying(20) NOT NULL,
    service_source character varying(20) NOT NULL,
    opaque1 text,
    service_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.channel_zmq OWNER TO zato;

--
-- Name: channel_zmq_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.channel_zmq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_zmq_seq OWNER TO zato;

--
-- Name: cluster; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.cluster (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(1000),
    odb_type character varying(30) NOT NULL,
    odb_host character varying(200),
    odb_port integer,
    odb_user character varying(200),
    odb_db_name character varying(200),
    odb_schema character varying(200),
    broker_host character varying(200) NOT NULL,
    broker_port integer NOT NULL,
    lb_host character varying(200) NOT NULL,
    lb_port integer NOT NULL,
    lb_agent_port integer NOT NULL,
    cw_srv_id integer,
    cw_srv_keep_alive_dt timestamp without time zone,
    opaque1 text
);


ALTER TABLE public.cluster OWNER TO zato;

--
-- Name: cluster_color_marker; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.cluster_color_marker (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    color character varying(6) NOT NULL,
    user_profile_id integer NOT NULL
);


ALTER TABLE public.cluster_color_marker OWNER TO zato;

--
-- Name: cluster_color_marker_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.cluster_color_marker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_color_marker_id_seq OWNER TO zato;

--
-- Name: cluster_color_marker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.cluster_color_marker_id_seq OWNED BY public.cluster_color_marker.id;


--
-- Name: cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_id_seq OWNER TO zato;

--
-- Name: conn_def_amqp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.conn_def_amqp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    host character varying(200) NOT NULL,
    port integer NOT NULL,
    vhost character varying(200) NOT NULL,
    username character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    frame_max integer NOT NULL,
    heartbeat integer NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.conn_def_amqp OWNER TO zato;

--
-- Name: conn_def_amqp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.conn_def_amqp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conn_def_amqp_seq OWNER TO zato;

--
-- Name: conn_def_cassandra; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.conn_def_cassandra (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    contact_points character varying(400) NOT NULL,
    port integer NOT NULL,
    exec_size integer NOT NULL,
    proto_version integer NOT NULL,
    cql_version integer,
    default_keyspace character varying(400) NOT NULL,
    username character varying(200),
    password character varying(200),
    tls_ca_certs character varying(200),
    tls_client_cert character varying(200),
    tls_client_priv_key character varying(200),
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.conn_def_cassandra OWNER TO zato;

--
-- Name: conn_def_cassandra_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.conn_def_cassandra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conn_def_cassandra_seq OWNER TO zato;

--
-- Name: conn_def_wmq; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.conn_def_wmq (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    host character varying(200) NOT NULL,
    port integer NOT NULL,
    queue_manager character varying(200),
    channel character varying(200) NOT NULL,
    cache_open_send_queues boolean NOT NULL,
    cache_open_receive_queues boolean NOT NULL,
    use_shared_connections boolean NOT NULL,
    dynamic_queue_template character varying(200) DEFAULT 'SYSTEM.DEFAULT.MODEL.QUEUE'::character varying NOT NULL,
    ssl boolean NOT NULL,
    ssl_cipher_spec character varying(200),
    ssl_key_repository character varying(200),
    needs_mcd boolean NOT NULL,
    use_jms boolean NOT NULL,
    max_chars_printed integer NOT NULL,
    username character varying(100),
    password character varying(200),
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.conn_def_wmq OWNER TO zato;

--
-- Name: conn_def_wmq_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.conn_def_wmq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conn_def_wmq_seq OWNER TO zato;

--
-- Name: depl_package_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.depl_package_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depl_package_seq OWNER TO zato;

--
-- Name: depl_status_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.depl_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depl_status_seq OWNER TO zato;

--
-- Name: deployed_service; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.deployed_service (
    deployment_time timestamp without time zone NOT NULL,
    details character varying(2000) NOT NULL,
    source bytea,
    source_path character varying(2000),
    source_hash character varying(512),
    source_hash_method character varying(20),
    opaque1 text,
    server_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.deployed_service OWNER TO zato;

--
-- Name: deployment_package; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.deployment_package (
    id integer NOT NULL,
    deployment_time timestamp without time zone NOT NULL,
    details character varying(2000) NOT NULL,
    payload_name character varying(200) NOT NULL,
    payload bytea NOT NULL,
    opaque1 text,
    server_id integer NOT NULL
);


ALTER TABLE public.deployment_package OWNER TO zato;

--
-- Name: deployment_status; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.deployment_status (
    id integer NOT NULL,
    opaque1 text,
    package_id integer NOT NULL,
    server_id integer NOT NULL,
    status character varying(20) NOT NULL,
    status_change_time timestamp without time zone NOT NULL
);


ALTER TABLE public.deployment_status OWNER TO zato;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zato;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zato;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zato;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zato;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zato;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO zato;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO zato;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: email_imap; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.email_imap (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    host character varying(400) NOT NULL,
    port integer NOT NULL,
    timeout integer NOT NULL,
    debug_level integer NOT NULL,
    username character varying(400),
    password character varying(400),
    mode character varying(20) NOT NULL,
    get_criteria character varying(2000) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.email_imap OWNER TO zato;

--
-- Name: email_imap_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.email_imap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_imap_seq OWNER TO zato;

--
-- Name: email_smtp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.email_smtp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    host character varying(400) NOT NULL,
    port integer NOT NULL,
    timeout integer NOT NULL,
    is_debug boolean NOT NULL,
    username character varying(400),
    password character varying(400),
    mode character varying(20) NOT NULL,
    ping_address character varying(200) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.email_smtp OWNER TO zato;

--
-- Name: email_smtp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.email_smtp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_smtp_seq OWNER TO zato;

--
-- Name: generic_conn; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.generic_conn (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    type_ character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    cache_expiry integer,
    address text,
    port integer,
    timeout integer,
    data_format character varying(60),
    opaque1 text,
    is_channel boolean NOT NULL,
    is_outconn boolean NOT NULL,
    version character varying(200),
    extra text,
    pool_size integer NOT NULL,
    username character varying(1000),
    username_type character varying(45),
    secret character varying(1000),
    secret_type character varying(45),
    sec_use_rbac boolean NOT NULL,
    conn_def_id integer,
    cache_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.generic_conn OWNER TO zato;

--
-- Name: generic_conn_client; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.generic_conn_client (
    id integer NOT NULL,
    is_internal boolean NOT NULL,
    pub_client_id character varying(200) NOT NULL,
    ext_client_id character varying(200) NOT NULL,
    ext_client_name character varying(200),
    local_address character varying(400) NOT NULL,
    peer_address character varying(400) NOT NULL,
    peer_fqdn character varying(400) NOT NULL,
    connection_time timestamp without time zone NOT NULL,
    last_seen timestamp without time zone NOT NULL,
    server_proc_pid integer,
    server_name character varying(200),
    conn_id integer NOT NULL,
    server_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.generic_conn_client OWNER TO zato;

--
-- Name: generic_conn_client_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.generic_conn_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_conn_client_seq OWNER TO zato;

--
-- Name: generic_conn_def; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.generic_conn_def (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    type_ character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    cache_expiry integer,
    address text,
    port integer,
    timeout integer,
    data_format character varying(60),
    opaque1 text,
    is_channel boolean NOT NULL,
    is_outconn boolean NOT NULL,
    version character varying(200),
    extra text,
    pool_size integer NOT NULL,
    username character varying(1000),
    username_type character varying(45),
    secret character varying(1000),
    secret_type character varying(45),
    sec_use_rbac boolean NOT NULL,
    cache_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.generic_conn_def OWNER TO zato;

--
-- Name: generic_conn_def_sec; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.generic_conn_def_sec (
    id integer NOT NULL,
    opaque1 text,
    conn_def_id integer NOT NULL,
    sec_base_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.generic_conn_def_sec OWNER TO zato;

--
-- Name: generic_conn_def_sec_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.generic_conn_def_sec_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_conn_def_sec_seq OWNER TO zato;

--
-- Name: generic_conn_def_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.generic_conn_def_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_conn_def_seq OWNER TO zato;

--
-- Name: generic_conn_sec; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.generic_conn_sec (
    id integer NOT NULL,
    opaque1 text,
    conn_id integer NOT NULL,
    sec_base_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.generic_conn_sec OWNER TO zato;

--
-- Name: generic_conn_sec_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.generic_conn_sec_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generic_conn_sec_seq OWNER TO zato;

--
-- Name: http_soap; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.http_soap (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    connection public.http_soap_connection NOT NULL,
    transport public.http_soap_transport NOT NULL,
    host character varying(200),
    url_path character varying(200) NOT NULL,
    method character varying(200),
    content_encoding character varying(200),
    soap_action character varying(200) NOT NULL,
    soap_version character varying(20),
    data_format character varying(20),
    content_type character varying(200),
    ping_method character varying(60),
    pool_size integer,
    serialization_type character varying(200) NOT NULL,
    timeout integer NOT NULL,
    merge_url_params_req boolean,
    url_params_pri character varying(200),
    params_pri character varying(200),
    has_rbac boolean NOT NULL,
    sec_use_rbac boolean NOT NULL,
    cache_expiry integer,
    opaque1 text,
    security_id integer,
    sec_tls_ca_cert_id integer,
    cache_id integer,
    service_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.http_soap OWNER TO zato;

--
-- Name: http_soap_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.http_soap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.http_soap_seq OWNER TO zato;

--
-- Name: install_state; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.install_state (
    id integer NOT NULL,
    version integer NOT NULL,
    install_time timestamp without time zone NOT NULL,
    source_host character varying(200) NOT NULL,
    source_user character varying(200) NOT NULL,
    opaque1 text
);


ALTER TABLE public.install_state OWNER TO zato;

--
-- Name: install_state_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.install_state_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.install_state_seq OWNER TO zato;

--
-- Name: job; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.job (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    job_type public.job_type NOT NULL,
    start_date timestamp without time zone NOT NULL,
    extra bytea,
    opaque1 text,
    cluster_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.job OWNER TO zato;

--
-- Name: job_cron_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.job_cron_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_cron_seq OWNER TO zato;

--
-- Name: job_cron_style; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.job_cron_style (
    id integer NOT NULL,
    cron_definition character varying(4000) NOT NULL,
    opaque1 text,
    job_id integer NOT NULL
);


ALTER TABLE public.job_cron_style OWNER TO zato;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO zato;

--
-- Name: job_interval_based; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.job_interval_based (
    id integer NOT NULL,
    weeks integer,
    days integer,
    hours integer,
    minutes integer,
    seconds integer,
    repeats integer,
    opaque1 text,
    job_id integer NOT NULL
);


ALTER TABLE public.job_interval_based OWNER TO zato;

--
-- Name: job_intrvl_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.job_intrvl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_intrvl_seq OWNER TO zato;

--
-- Name: kv_data; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.kv_data (
    id integer NOT NULL,
    key bytea NOT NULL,
    value bytea,
    data_type character varying(200) NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    expiry_time timestamp without time zone,
    opaque1 text,
    cluster_id integer
);


ALTER TABLE public.kv_data OWNER TO zato;

--
-- Name: kv_data_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.kv_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kv_data_id_seq OWNER TO zato;

--
-- Name: msg_json_pointer; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.msg_json_pointer (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    value character varying(1500) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.msg_json_pointer OWNER TO zato;

--
-- Name: msg_json_pointer_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.msg_json_pointer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msg_json_pointer_seq OWNER TO zato;

--
-- Name: msg_ns; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.msg_ns (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    value character varying(500) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.msg_ns OWNER TO zato;

--
-- Name: msg_ns_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.msg_ns_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msg_ns_seq OWNER TO zato;

--
-- Name: msg_xpath; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.msg_xpath (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    value character varying(1500) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.msg_xpath OWNER TO zato;

--
-- Name: msg_xpath_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.msg_xpath_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msg_xpath_seq OWNER TO zato;

--
-- Name: notif; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.notif (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    notif_type character varying(45) NOT NULL,
    "interval" integer NOT NULL,
    name_pattern character varying(2000),
    name_pattern_neg boolean,
    get_data boolean,
    get_data_patt character varying(2000),
    get_data_patt_neg boolean,
    service_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.notif OWNER TO zato;

--
-- Name: notif_os_swift; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.notif_os_swift (
    id integer NOT NULL,
    containers character varying(20000) NOT NULL,
    def_id integer NOT NULL
);


ALTER TABLE public.notif_os_swift OWNER TO zato;

--
-- Name: notif_sql; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.notif_sql (
    id integer NOT NULL,
    query text NOT NULL,
    def_id integer NOT NULL
);


ALTER TABLE public.notif_sql OWNER TO zato;

--
-- Name: os_swift; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.os_swift (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    pool_size integer NOT NULL,
    auth_url character varying(200) NOT NULL,
    auth_version character varying(200) NOT NULL,
    "user" character varying(200),
    secret_key character varying(200),
    retries integer NOT NULL,
    is_snet boolean NOT NULL,
    starting_backoff integer NOT NULL,
    max_backoff integer NOT NULL,
    tenant_name character varying(200),
    should_validate_cert boolean NOT NULL,
    cacert character varying(200),
    should_retr_ratelimit boolean NOT NULL,
    needs_tls_compr boolean NOT NULL,
    custom_options character varying(2000),
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.os_swift OWNER TO zato;

--
-- Name: os_swift_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.os_swift_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.os_swift_seq OWNER TO zato;

--
-- Name: out_amqp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_amqp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    delivery_mode smallint NOT NULL,
    priority smallint DEFAULT '5'::smallint NOT NULL,
    content_type character varying(200),
    content_encoding character varying(200),
    expiration integer,
    user_id character varying(200),
    app_id character varying(200),
    pool_size smallint NOT NULL,
    opaque1 text,
    def_id integer NOT NULL
);


ALTER TABLE public.out_amqp OWNER TO zato;

--
-- Name: out_amqp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_amqp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_amqp_seq OWNER TO zato;

--
-- Name: out_ftp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_ftp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    host character varying(200) NOT NULL,
    "user" character varying(200),
    password character varying(200),
    acct character varying(200),
    timeout integer,
    port integer DEFAULT 21 NOT NULL,
    dircache boolean NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.out_ftp OWNER TO zato;

--
-- Name: out_ftp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_ftp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_ftp_seq OWNER TO zato;

--
-- Name: out_odoo; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_odoo (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    host character varying(200) NOT NULL,
    port integer DEFAULT 8069 NOT NULL,
    "user" character varying(200) NOT NULL,
    database character varying(200) NOT NULL,
    protocol character varying(200) NOT NULL,
    pool_size integer DEFAULT 3 NOT NULL,
    password character varying(400) NOT NULL,
    client_type character varying(40) DEFAULT 'openerp-client-lib'::character varying NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.out_odoo OWNER TO zato;

--
-- Name: out_odoo_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_odoo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_odoo_seq OWNER TO zato;

--
-- Name: out_sap; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_sap (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    host character varying(200) NOT NULL,
    sysnr character varying(3) DEFAULT '00'::character varying,
    "user" character varying(200) NOT NULL,
    client character varying(4) NOT NULL,
    sysid character varying(4) NOT NULL,
    password character varying(400) NOT NULL,
    pool_size integer DEFAULT 1 NOT NULL,
    router character varying(400),
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.out_sap OWNER TO zato;

--
-- Name: out_sap_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_sap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_sap_seq OWNER TO zato;

--
-- Name: out_stomp; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_stomp (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    username character varying(200) DEFAULT 'guest'::character varying,
    password character varying(200),
    address character varying(200) DEFAULT 'localhost:61613'::character varying NOT NULL,
    proto_version character varying(20) DEFAULT '1.0'::character varying NOT NULL,
    timeout integer DEFAULT 10 NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.out_stomp OWNER TO zato;

--
-- Name: out_stomp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_stomp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_stomp_seq OWNER TO zato;

--
-- Name: out_wmq; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_wmq (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    delivery_mode smallint NOT NULL,
    priority smallint DEFAULT '5'::smallint NOT NULL,
    expiration character varying(20),
    opaque1 text,
    def_id integer NOT NULL
);


ALTER TABLE public.out_wmq OWNER TO zato;

--
-- Name: out_wmq_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_wmq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_wmq_seq OWNER TO zato;

--
-- Name: out_zmq; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.out_zmq (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    address character varying(200) NOT NULL,
    socket_type character varying(20) NOT NULL,
    socket_method character varying(20) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.out_zmq OWNER TO zato;

--
-- Name: out_zmq_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.out_zmq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_zmq_seq OWNER TO zato;

--
-- Name: pubsub_channel; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_channel (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    conn_id character varying(100) NOT NULL,
    conn_type character varying(100) NOT NULL,
    opaque1 text,
    topic_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_channel OWNER TO zato;

--
-- Name: pubsub_channel_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_channel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_channel_seq OWNER TO zato;

--
-- Name: pubsub_endp_msg_q_inter; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_endp_msg_q_inter (
    id integer NOT NULL,
    entry_timestamp numeric(20,7) NOT NULL,
    inter_type character varying(200) NOT NULL,
    inter_details text,
    opaque1 text,
    queue_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_endp_msg_q_inter OWNER TO zato;

--
-- Name: pubsub_endp_msg_queue; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_endp_msg_queue (
    id integer NOT NULL,
    creation_time numeric(20,7) NOT NULL,
    delivery_count integer DEFAULT 0 NOT NULL,
    last_delivery_time numeric(20,7),
    is_in_staging boolean DEFAULT false NOT NULL,
    sub_pattern_matched text NOT NULL,
    is_deliverable boolean DEFAULT true NOT NULL,
    delivery_status integer DEFAULT 2 NOT NULL,
    delivery_time numeric(20,7),
    opaque1 text,
    pub_msg_id character varying(200) NOT NULL,
    endpoint_id integer NOT NULL,
    topic_id integer NOT NULL,
    sub_key character varying(200) NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_endp_msg_queue OWNER TO zato;

--
-- Name: pubsub_endp_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_endp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_endp_seq OWNER TO zato;

--
-- Name: pubsub_endp_topic; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_endp_topic (
    id integer NOT NULL,
    pub_pattern_matched text NOT NULL,
    last_pub_time numeric(20,7) NOT NULL,
    pub_msg_id character varying(200) NOT NULL,
    pub_correl_id character varying(200),
    in_reply_to character varying(200),
    ext_client_id text,
    opaque1 text,
    endpoint_id integer,
    topic_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_endp_topic OWNER TO zato;

--
-- Name: pubsub_endpoint; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_endpoint (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    endpoint_type character varying(40) NOT NULL,
    last_seen bigint,
    last_pub_time bigint,
    last_sub_time bigint,
    last_deliv_time bigint,
    role character varying(40) NOT NULL,
    tags text,
    topic_patterns text,
    pub_tag_patterns text,
    message_tag_patterns text,
    opaque1 text,
    service_id integer,
    security_id integer,
    gen_conn_id integer,
    ws_channel_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_endpoint OWNER TO zato;

--
-- Name: pubsub_endpt_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_endpt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_endpt_seq OWNER TO zato;

--
-- Name: pubsub_message; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_message (
    id integer NOT NULL,
    pub_msg_id character varying(200) NOT NULL,
    pub_correl_id character varying(200),
    in_reply_to character varying(200),
    ext_client_id text,
    group_id text,
    position_in_group integer,
    pub_pattern_matched text NOT NULL,
    pub_time numeric(20,7) NOT NULL,
    ext_pub_time numeric(20,7),
    expiration_time numeric(20,7),
    last_updated numeric(20,7),
    data text NOT NULL,
    data_prefix text NOT NULL,
    data_prefix_short character varying(200) NOT NULL,
    data_format character varying(200) DEFAULT 'text'::character varying NOT NULL,
    mime_type character varying(200) DEFAULT 'text/plain'::character varying NOT NULL,
    size integer NOT NULL,
    priority integer DEFAULT 5 NOT NULL,
    expiration bigint DEFAULT '0'::bigint NOT NULL,
    has_gd boolean DEFAULT true NOT NULL,
    is_in_sub_queue boolean DEFAULT false NOT NULL,
    opaque1 text,
    published_by_id integer NOT NULL,
    topic_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_message OWNER TO zato;

--
-- Name: pubsub_msg_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_msg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_msg_seq OWNER TO zato;

--
-- Name: pubsub_sub; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_sub (
    id integer NOT NULL,
    is_internal boolean NOT NULL,
    creation_time numeric(20,7) NOT NULL,
    sub_key character varying(200) NOT NULL,
    sub_pattern_matched text NOT NULL,
    deliver_by text,
    ext_client_id text,
    is_durable boolean NOT NULL,
    has_gd boolean NOT NULL,
    active_status character varying(200) NOT NULL,
    is_staging_enabled boolean NOT NULL,
    delivery_method character varying(200) NOT NULL,
    delivery_data_format character varying(200) NOT NULL,
    delivery_endpoint text,
    last_interaction_time numeric(20,7),
    last_interaction_type character varying(200),
    last_interaction_details text,
    delivery_batch_size integer NOT NULL,
    wrap_one_msg_in_list boolean NOT NULL,
    delivery_max_size integer NOT NULL,
    delivery_max_retry integer NOT NULL,
    delivery_err_should_block boolean NOT NULL,
    wait_sock_err integer NOT NULL,
    wait_non_sock_err integer NOT NULL,
    hook_service_id integer,
    out_http_method text,
    amqp_exchange text,
    amqp_routing_key text,
    files_directory_list text,
    ftp_directory_list text,
    sms_twilio_from text,
    sms_twilio_to_list text,
    smtp_subject text,
    smtp_from text,
    smtp_to_list text,
    smtp_body text,
    smtp_is_html boolean,
    opaque1 text,
    topic_id integer NOT NULL,
    endpoint_id integer,
    out_job_id integer,
    out_http_soap_id integer,
    out_smtp_id integer,
    out_amqp_id integer,
    out_gen_conn_id integer,
    ws_channel_id integer,
    server_id integer,
    cluster_id integer
);


ALTER TABLE public.pubsub_sub OWNER TO zato;

--
-- Name: pubsub_sub_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_sub_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_sub_seq OWNER TO zato;

--
-- Name: pubsub_topic; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.pubsub_topic (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    max_depth_gd integer NOT NULL,
    max_depth_non_gd integer NOT NULL,
    depth_check_freq integer NOT NULL,
    has_gd boolean NOT NULL,
    is_api_sub_allowed boolean NOT NULL,
    pub_buffer_size_gd integer DEFAULT 0 NOT NULL,
    task_sync_interval integer DEFAULT 500 NOT NULL,
    task_delivery_interval integer DEFAULT 2000 NOT NULL,
    opaque1 text,
    hook_service_id integer,
    cluster_id integer NOT NULL
);


ALTER TABLE public.pubsub_topic OWNER TO zato;

--
-- Name: pubsub_topic_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.pubsub_topic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pubsub_topic_seq OWNER TO zato;

--
-- Name: query_cassandra; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.query_cassandra (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    value bytea NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL,
    def_id integer NOT NULL
);


ALTER TABLE public.query_cassandra OWNER TO zato;

--
-- Name: query_cassandra_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.query_cassandra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_cassandra_seq OWNER TO zato;

--
-- Name: rbac_cli_rol_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.rbac_cli_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rbac_cli_rol_seq OWNER TO zato;

--
-- Name: rbac_client_role; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.rbac_client_role (
    id integer NOT NULL,
    name character varying(400) NOT NULL,
    client_def character varying(200) NOT NULL,
    opaque1 text,
    role_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.rbac_client_role OWNER TO zato;

--
-- Name: rbac_perm; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.rbac_perm (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.rbac_perm OWNER TO zato;

--
-- Name: rbac_perm_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.rbac_perm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rbac_perm_seq OWNER TO zato;

--
-- Name: rbac_role; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.rbac_role (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    parent_id integer,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.rbac_role OWNER TO zato;

--
-- Name: rbac_role_perm; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.rbac_role_perm (
    id integer NOT NULL,
    opaque1 text,
    role_id integer NOT NULL,
    perm_id integer NOT NULL,
    service_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.rbac_role_perm OWNER TO zato;

--
-- Name: rbac_role_perm_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.rbac_role_perm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rbac_role_perm_seq OWNER TO zato;

--
-- Name: rbac_role_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.rbac_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rbac_role_seq OWNER TO zato;

--
-- Name: search_es; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.search_es (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    hosts character varying(400) NOT NULL,
    timeout integer NOT NULL,
    body_as character varying(45) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.search_es OWNER TO zato;

--
-- Name: search_es_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.search_es_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_es_seq OWNER TO zato;

--
-- Name: search_solr; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.search_solr (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    address character varying(400) NOT NULL,
    timeout integer NOT NULL,
    ping_path character varying(40) NOT NULL,
    options character varying(800),
    pool_size integer NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.search_solr OWNER TO zato;

--
-- Name: search_solr_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.search_solr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_solr_seq OWNER TO zato;

--
-- Name: sec_apikey; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_apikey (
    id integer NOT NULL
);


ALTER TABLE public.sec_apikey OWNER TO zato;

--
-- Name: sec_aws; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_aws (
    id integer NOT NULL
);


ALTER TABLE public.sec_aws OWNER TO zato;

--
-- Name: sec_base; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_base (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    username character varying(200),
    password character varying(1000),
    password_type character varying(45),
    is_active boolean NOT NULL,
    sec_type character varying(45) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.sec_base OWNER TO zato;

--
-- Name: sec_base_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.sec_base_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_base_seq OWNER TO zato;

--
-- Name: sec_basic_auth; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_basic_auth (
    id integer NOT NULL,
    realm character varying(200) NOT NULL
);


ALTER TABLE public.sec_basic_auth OWNER TO zato;

--
-- Name: sec_jwt; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_jwt (
    id integer NOT NULL,
    ttl integer NOT NULL
);


ALTER TABLE public.sec_jwt OWNER TO zato;

--
-- Name: sec_multi; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_multi (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    priority integer NOT NULL,
    conn_id character varying(100) NOT NULL,
    conn_type character varying(100) NOT NULL,
    is_channel boolean NOT NULL,
    is_outconn boolean NOT NULL,
    opaque1 text,
    security_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.sec_multi OWNER TO zato;

--
-- Name: sec_multi_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.sec_multi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_multi_seq OWNER TO zato;

--
-- Name: sec_ntlm; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_ntlm (
    id integer NOT NULL
);


ALTER TABLE public.sec_ntlm OWNER TO zato;

--
-- Name: sec_oauth; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_oauth (
    id integer NOT NULL,
    proto_version character varying(32) NOT NULL,
    sig_method character varying(32) NOT NULL,
    max_nonce_log integer NOT NULL
);


ALTER TABLE public.sec_oauth OWNER TO zato;

--
-- Name: sec_openstack; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_openstack (
    id integer NOT NULL
);


ALTER TABLE public.sec_openstack OWNER TO zato;

--
-- Name: sec_tls_ca_cert; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_tls_ca_cert (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    value bytea NOT NULL,
    info bytea NOT NULL,
    is_active boolean NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.sec_tls_ca_cert OWNER TO zato;

--
-- Name: sec_tls_ca_cert_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.sec_tls_ca_cert_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_tls_ca_cert_seq OWNER TO zato;

--
-- Name: sec_tls_channel; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_tls_channel (
    id integer NOT NULL,
    value bytea NOT NULL
);


ALTER TABLE public.sec_tls_channel OWNER TO zato;

--
-- Name: sec_tls_key_cert; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_tls_key_cert (
    id integer NOT NULL,
    info bytea NOT NULL,
    auth_data bytea NOT NULL
);


ALTER TABLE public.sec_tls_key_cert OWNER TO zato;

--
-- Name: sec_vault_conn; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_vault_conn (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    token character varying(200),
    default_auth_method character varying(200),
    timeout integer NOT NULL,
    allow_redirects boolean NOT NULL,
    tls_verify boolean NOT NULL,
    tls_key_cert_id integer,
    tls_ca_cert_id integer,
    service_id integer
);


ALTER TABLE public.sec_vault_conn OWNER TO zato;

--
-- Name: sec_wss_def; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_wss_def (
    id integer NOT NULL,
    reject_empty_nonce_creat boolean NOT NULL,
    reject_stale_tokens boolean,
    reject_expiry_limit integer NOT NULL,
    nonce_freshness_time integer
);


ALTER TABLE public.sec_wss_def OWNER TO zato;

--
-- Name: sec_xpath; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sec_xpath (
    id integer NOT NULL,
    username_expr character varying(200) NOT NULL,
    password_expr character varying(200)
);


ALTER TABLE public.sec_xpath OWNER TO zato;

--
-- Name: server; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.server (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    host character varying(400),
    bind_host character varying(400),
    bind_port integer,
    preferred_address character varying(400),
    crypto_use_tls boolean,
    last_join_status character varying(40),
    last_join_mod_date timestamp without time zone,
    last_join_mod_by character varying(200),
    up_status character varying(40),
    up_mod_date timestamp without time zone,
    token character varying(32) NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.server OWNER TO zato;

--
-- Name: server_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_id_seq OWNER TO zato;

--
-- Name: service; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.service (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    impl_name character varying(2000) NOT NULL,
    is_internal boolean NOT NULL,
    wsdl bytea,
    wsdl_name character varying(200),
    slow_threshold integer NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.service OWNER TO zato;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO zato;

--
-- Name: sms_twilio; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sms_twilio (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    account_sid character varying(200) NOT NULL,
    auth_token character varying(200) NOT NULL,
    default_from character varying(200),
    default_to character varying(200),
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.sms_twilio OWNER TO zato;

--
-- Name: sms_twilio_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.sms_twilio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sms_twilio_id_seq OWNER TO zato;

--
-- Name: sql_pool; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.sql_pool (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    username character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    db_name character varying(200) NOT NULL,
    engine character varying(200) NOT NULL,
    extra bytea,
    host character varying(200) NOT NULL,
    port integer NOT NULL,
    pool_size integer NOT NULL,
    opaque1 text,
    cluster_id integer NOT NULL
);


ALTER TABLE public.sql_pool OWNER TO zato;

--
-- Name: sql_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.sql_pool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_pool_id_seq OWNER TO zato;

--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    timezone character varying(100),
    date_format character varying(100),
    time_format character varying(10),
    user_id integer NOT NULL
);


ALTER TABLE public.user_profile OWNER TO zato;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO zato;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zato
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: web_socket_chan_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.web_socket_chan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_socket_chan_seq OWNER TO zato;

--
-- Name: web_socket_cli_ps_keys; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.web_socket_cli_ps_keys (
    id integer NOT NULL,
    sub_key character varying(200) NOT NULL,
    opaque1 text,
    client_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.web_socket_cli_ps_keys OWNER TO zato;

--
-- Name: web_socket_cli_ps_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.web_socket_cli_ps_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_socket_cli_ps_seq OWNER TO zato;

--
-- Name: web_socket_cli_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.web_socket_cli_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_socket_cli_seq OWNER TO zato;

--
-- Name: web_socket_client; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.web_socket_client (
    id integer NOT NULL,
    is_internal boolean NOT NULL,
    pub_client_id character varying(200) NOT NULL,
    ext_client_id character varying(200) NOT NULL,
    ext_client_name character varying(200),
    local_address character varying(400) NOT NULL,
    peer_address character varying(400) NOT NULL,
    peer_fqdn character varying(400) NOT NULL,
    connection_time timestamp without time zone NOT NULL,
    last_seen timestamp without time zone NOT NULL,
    server_proc_pid integer NOT NULL,
    server_name character varying(200) NOT NULL,
    opaque1 text,
    channel_id integer NOT NULL,
    server_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.web_socket_client OWNER TO zato;

--
-- Name: web_socket_sub; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.web_socket_sub (
    id integer NOT NULL,
    is_internal boolean NOT NULL,
    ext_client_id character varying(200) NOT NULL,
    sub_key character varying(200) NOT NULL,
    opaque1 text,
    channel_id integer,
    subscription_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.web_socket_sub OWNER TO zato;

--
-- Name: web_socket_sub_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.web_socket_sub_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_socket_sub_seq OWNER TO zato;

--
-- Name: zato_sso_attr; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.zato_sso_attr (
    id integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    last_modified timestamp without time zone,
    expiration_time timestamp without time zone,
    is_session_attr boolean NOT NULL,
    is_encrypted boolean NOT NULL,
    serial_method character varying(20) NOT NULL,
    name character varying(191) NOT NULL,
    value text,
    _ust_string character varying(191) NOT NULL,
    user_id character varying(191) NOT NULL,
    ust character varying(191)
);


ALTER TABLE public.zato_sso_attr OWNER TO zato;

--
-- Name: zato_sso_attr_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.zato_sso_attr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zato_sso_attr_seq OWNER TO zato;

--
-- Name: zato_sso_session; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.zato_sso_session (
    id integer NOT NULL,
    ust character varying(191) NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    expiration_time timestamp without time zone NOT NULL,
    remote_addr text NOT NULL,
    user_agent text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.zato_sso_session OWNER TO zato;

--
-- Name: zato_sso_sid_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.zato_sso_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zato_sso_sid_seq OWNER TO zato;

--
-- Name: zato_sso_user; Type: TABLE; Schema: public; Owner: zato
--

CREATE TABLE public.zato_sso_user (
    id integer NOT NULL,
    user_id character varying(191) NOT NULL,
    is_active boolean NOT NULL,
    is_internal boolean NOT NULL,
    is_super_user boolean NOT NULL,
    is_locked boolean NOT NULL,
    locked_time timestamp without time zone,
    creation_ctx text NOT NULL,
    locked_by character varying(191),
    approval_status character varying(191) NOT NULL,
    approval_status_mod_time timestamp without time zone NOT NULL,
    approval_status_mod_by character varying(191) NOT NULL,
    username character varying(191) NOT NULL,
    password text NOT NULL,
    password_is_set boolean NOT NULL,
    password_must_change boolean NOT NULL,
    password_last_set timestamp without time zone NOT NULL,
    password_expiry timestamp without time zone NOT NULL,
    sign_up_status character varying(191) NOT NULL,
    sign_up_time timestamp without time zone NOT NULL,
    sign_up_confirm_time timestamp without time zone,
    sign_up_confirm_token character varying(191) NOT NULL,
    email text,
    display_name character varying(191),
    first_name character varying(191),
    middle_name character varying(191),
    last_name character varying(191),
    display_name_upper character varying(191),
    first_name_upper character varying(191),
    middle_name_upper character varying(191),
    last_name_upper character varying(191)
);


ALTER TABLE public.zato_sso_user OWNER TO zato;

--
-- Name: zato_sso_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zato
--

CREATE SEQUENCE public.zato_sso_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zato_sso_user_id_seq OWNER TO zato;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cluster_color_marker id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cluster_color_marker ALTER COLUMN id SET DEFAULT nextval('public.cluster_color_marker_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.alembic_version (version_num) FROM stdin;
0028_ae3419a9
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add content type	1	add_contenttype
2	Can change content type	1	change_contenttype
3	Can delete content type	1	delete_contenttype
4	Can add permission	4	add_permission
5	Can change permission	4	change_permission
6	Can delete permission	4	delete_permission
7	Can add group	2	add_group
8	Can change group	2	change_group
9	Can delete group	2	delete_group
10	Can add user	3	add_user
11	Can change user	3	change_user
12	Can delete user	3	delete_user
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add user profile	8	add_userprofile
20	Can change user profile	8	change_userprofile
21	Can delete user profile	8	delete_userprofile
22	Can add cluster color marker	7	add_clustercolormarker
23	Can change cluster color marker	7	change_clustercolormarker
24	Can delete cluster color marker	7	delete_clustercolormarker
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$0mbSFCk46Xn8$MFnkvxq2JL4KpY5zhJPD70W5uHqBYa5+5h5i0XTRR7Y=	\N	t	admin			admin@invalid.example.com	t	t	2019-05-25 15:09:41.764094+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: aws_s3; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.aws_s3 (id, name, is_active, pool_size, address, debug_level, suppr_cons_slashes, content_type, metadata_, bucket, encrypt_at_rest, storage_class, opaque1, security_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.cache (id, name, is_active, is_default, cache_type, opaque1, cluster_id) FROM stdin;
1	default	t	t	builtin	null	1
\.


--
-- Data for Name: cache_builtin; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.cache_builtin (cache_id, max_size, max_item_size, extend_expiry_on_get, extend_expiry_on_set, sync_method, persistent_storage) FROM stdin;
1	10000	1000	t	t	in-background	sql
\.


--
-- Data for Name: cache_memcached; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.cache_memcached (cache_id, servers, is_debug, extra) FROM stdin;
\.


--
-- Data for Name: channel_amqp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.channel_amqp (id, name, is_active, queue, consumer_tag_prefix, pool_size, ack_mode, prefetch_count, data_format, opaque1, service_id, def_id) FROM stdin;
\.


--
-- Data for Name: channel_stomp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.channel_stomp (id, name, is_active, username, password, address, proto_version, timeout, sub_to, opaque1, service_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: channel_web_socket; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.channel_web_socket (id, name, is_active, is_internal, is_out, address, data_format, new_token_wait_time, token_ttl, opaque1, service_id, cluster_id, security_id) FROM stdin;
\.


--
-- Data for Name: channel_wmq; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.channel_wmq (id, name, is_active, queue, data_format, opaque1, service_id, def_id) FROM stdin;
\.


--
-- Data for Name: channel_zmq; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.channel_zmq (id, name, is_active, address, socket_type, sub_key, data_format, socket_method, pool_strategy, service_source, opaque1, service_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.cluster (id, name, description, odb_type, odb_host, odb_port, odb_user, odb_db_name, odb_schema, broker_host, broker_port, lb_host, lb_port, lb_agent_port, cw_srv_id, cw_srv_keep_alive_dt, opaque1) FROM stdin;
1	cluster1	Created by zato@d11f327505b4 on 2019-05-25T14:56:41.513413 (UTC)	postgresql	zato-odb	5432	zato	zato	\N	zato-kvdb	6379	zato-lb	11223	20151	\N	\N	null
\.


--
-- Data for Name: cluster_color_marker; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.cluster_color_marker (id, cluster_id, color, user_profile_id) FROM stdin;
\.


--
-- Data for Name: conn_def_amqp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.conn_def_amqp (id, name, host, port, vhost, username, password, frame_max, heartbeat, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: conn_def_cassandra; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.conn_def_cassandra (id, name, is_active, contact_points, port, exec_size, proto_version, cql_version, default_keyspace, username, password, tls_ca_certs, tls_client_cert, tls_client_priv_key, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: conn_def_wmq; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.conn_def_wmq (id, name, host, port, queue_manager, channel, cache_open_send_queues, cache_open_receive_queues, use_shared_connections, dynamic_queue_template, ssl, ssl_cipher_spec, ssl_key_repository, needs_mcd, use_jms, max_chars_printed, username, password, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: deployed_service; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.deployed_service (deployment_time, details, source, source_path, source_hash, source_hash_method, opaque1, server_id, service_id) FROM stdin;
\.


--
-- Data for Name: deployment_package; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.deployment_package (id, deployment_time, details, payload_name, payload, opaque1, server_id) FROM stdin;
\.


--
-- Data for Name: deployment_status; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.deployment_status (id, opaque1, package_id, server_id, status, status_change_time) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	contenttypes	contenttype
2	auth	group
3	auth	user
4	auth	permission
5	sessions	session
6	sites	site
7	web	clustercolormarker
8	web	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-05-25 15:09:40.962853+00
2	contenttypes	0002_remove_content_type_name	2019-05-25 15:09:40.986321+00
3	auth	0001_initial	2019-05-25 15:09:41.266391+00
4	auth	0002_alter_permission_name_max_length	2019-05-25 15:09:41.280541+00
5	auth	0003_alter_user_email_max_length	2019-05-25 15:09:41.294628+00
6	auth	0004_alter_user_username_opts	2019-05-25 15:09:41.307144+00
7	auth	0005_alter_user_last_login_null	2019-05-25 15:09:41.321308+00
8	auth	0006_require_contenttypes_0002	2019-05-25 15:09:41.325039+00
9	auth	0007_alter_validators_add_error_messages	2019-05-25 15:09:41.336272+00
10	sessions	0001_initial	2019-05-25 15:09:41.383314+00
11	sites	0001_initial	2019-05-25 15:09:41.403521+00
12	sites	0002_alter_domain_unique	2019-05-25 15:09:41.43025+00
13	web	0001_initial	2019-05-25 15:09:41.568989+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.django_site (id, domain, name) FROM stdin;
129273	webadmin-129273.example.com	web admin
\.


--
-- Data for Name: email_imap; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.email_imap (id, name, is_active, host, port, timeout, debug_level, username, password, mode, get_criteria, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: email_smtp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.email_smtp (id, name, is_active, host, port, timeout, is_debug, username, password, mode, ping_address, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: generic_conn; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.generic_conn (id, name, type_, is_active, is_internal, cache_expiry, address, port, timeout, data_format, opaque1, is_channel, is_outconn, version, extra, pool_size, username, username_type, secret, secret_type, sec_use_rbac, conn_def_id, cache_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: generic_conn_client; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.generic_conn_client (id, is_internal, pub_client_id, ext_client_id, ext_client_name, local_address, peer_address, peer_fqdn, connection_time, last_seen, server_proc_pid, server_name, conn_id, server_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: generic_conn_def; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.generic_conn_def (id, name, type_, is_active, is_internal, cache_expiry, address, port, timeout, data_format, opaque1, is_channel, is_outconn, version, extra, pool_size, username, username_type, secret, secret_type, sec_use_rbac, cache_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: generic_conn_def_sec; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.generic_conn_def_sec (id, opaque1, conn_def_id, sec_base_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: generic_conn_sec; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.generic_conn_sec (id, opaque1, conn_id, sec_base_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: http_soap; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.http_soap (id, name, is_active, is_internal, connection, transport, host, url_path, method, content_encoding, soap_action, soap_version, data_format, content_type, ping_method, pool_size, serialization_type, timeout, merge_url_params_req, url_params_pri, params_pri, has_rbac, sec_use_rbac, cache_expiry, opaque1, security_id, sec_tls_ca_cert_id, cache_id, service_id, cluster_id) FROM stdin;
1	zato.security.wss.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.wss.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	1	1
2	zato.security.wss.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.wss.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	1	1
3	zato.channel.web-socket.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	2	1
4	zato.channel.web-socket.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	2	1
5	zato.security.apikey.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.apikey.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	3	1
6	zato.security.apikey.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.apikey.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	3	1
7	zato.cloud.openstack.swift.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.openstack.swift.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	4	1
8	zato.cloud.openstack.swift.create.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.openstack.swift.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	4	1
9	zato.service.configure-request-response	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.configure-request-response	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	5	1
10	zato.service.configure-request-response.json	t	t	channel	plain_http	\N	/zato/json/zato.service.configure-request-response	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	5	1
11	zato.email.imap.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	6	1
12	zato.email.imap.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	6	1
13	zato.security.vault.policy.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.policy.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	7	1
14	zato.security.vault.policy.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.policy.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	7	1
15	zato.message.live-browser.dispatch	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.live-browser.dispatch	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	8	1
16	zato.message.live-browser.dispatch.json	t	t	channel	plain_http	\N	/zato/json/zato.message.live-browser.dispatch	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	8	1
17	zato.security.tls.ca_cert.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.ca_cert.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	9	1
18	zato.security.tls.ca_cert.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.ca_cert.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	9	1
19	zato.security.vault.connection.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.connection.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	10	1
20	zato.security.vault.connection.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.connection.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	10	1
21	zato.service.slow-response.get	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.slow-response.get	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	11	1
22	zato.service.slow-response.get.json	t	t	channel	plain_http	\N	/zato/json/zato.service.slow-response.get	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	11	1
23	zato.security.rbac.client-role.get-client-def-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.client-role.get-client-def-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	12	1
24	zato.security.rbac.client-role.get-client-def-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.client-role.get-client-def-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	12	1
25	zato.service.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	13	1
26	zato.service.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.service.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	13	1
27	zato.helpers.input-logger	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.helpers.input-logger	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	14	1
28	zato.helpers.input-logger.json	t	t	channel	plain_http	\N	/zato/json/zato.helpers.input-logger	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	14	1
29	zato.service.upload-package	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.upload-package	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	15	1
30	zato.service.upload-package.json	t	t	channel	plain_http	\N	/zato/json/zato.service.upload-package	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	15	1
31	zato.cloud.openstack.swift.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.openstack.swift.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	16	1
32	zato.cloud.openstack.swift.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.openstack.swift.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	16	1
33	zato.kvdb.data-dict.dictionary.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	17	1
34	zato.kvdb.data-dict.dictionary.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	17	1
35	zato.channel.jms-wmq.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.jms-wmq.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	18	1
36	zato.channel.jms-wmq.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.jms-wmq.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	18	1
37	zato.security.tls.ca_cert.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.ca_cert.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	19	1
38	zato.security.tls.ca_cert.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.ca_cert.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	19	1
39	zato.cache.builtin.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cache.builtin.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	20	1
40	zato.cache.builtin.create.json	t	t	channel	plain_http	\N	/zato/json/zato.cache.builtin.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	20	1
41	zato.connector.amqp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.connector.amqp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	21	1
42	zato.connector.amqp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.connector.amqp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	21	1
43	zato.http-soap.ping	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.http-soap.ping	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	22	1
44	zato.http-soap.ping.json	t	t	channel	plain_http	\N	/zato/json/zato.http-soap.ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	22	1
45	zato.message.namespace.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.namespace.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	23	1
46	zato.message.namespace.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.message.namespace.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	23	1
47	zato.checks.json.zato.checks.sio.dict-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.dict-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	24	1
48	zato.checks.xml.zato.checks.sio.dict-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.dict-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	24	1
49	zato.checks.sio.dict-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.dict-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	24	1
50	zato.checks.sio.dict-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.dict-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	24	1
51	zato.scheduler.job.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	25	1
52	zato.scheduler.job.create.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	25	1
53	zato.outgoing.ftp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.ftp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	26	1
54	zato.outgoing.ftp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.ftp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	26	1
55	zato.outgoing.zmq.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.zmq.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	27	1
56	zato.outgoing.zmq.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.zmq.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	27	1
57	zato.security.openstack.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.openstack.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	28	1
58	zato.security.openstack.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.openstack.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	28	1
59	zato.helpers.sio-input-logger	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.helpers.sio-input-logger	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	29	1
60	zato.helpers.sio-input-logger.json	t	t	channel	plain_http	\N	/zato/json/zato.helpers.sio-input-logger	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	29	1
61	zato.stats.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	30	1
62	zato.stats.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	30	1
63	zato.kv_data.auto-clean-up	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kv_data.auto-clean-up	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	31	1
64	zato.kv_data.auto-clean-up.json	t	t	channel	plain_http	\N	/zato/json/zato.kv_data.auto-clean-up	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	31	1
65	zato.outgoing.ftp.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.ftp.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	32	1
66	zato.outgoing.ftp.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.ftp.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	32	1
67	zato.service.get-deployment-info-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-deployment-info-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	33	1
68	zato.service.get-deployment-info-list.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-deployment-info-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	33	1
69	zato.scheduler.job.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	34	1
70	zato.scheduler.job.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	34	1
71	zato.definition.amqp.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	35	1
72	zato.definition.amqp.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	35	1
73	zato.security.openstack.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.openstack.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	36	1
74	zato.security.openstack.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.openstack.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	36	1
75	zato.message.namespace.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.namespace.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	37	1
76	zato.message.namespace.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.message.namespace.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	37	1
77	zato.service.has-wsdl	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.has-wsdl	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	38	1
78	zato.service.has-wsdl.json	t	t	channel	plain_http	\N	/zato/json/zato.service.has-wsdl	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	38	1
79	admin.ide-deploy.create	t	t	channel	plain_http	\N	/ide-deploy	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	t	t	0	null	\N	\N	\N	39	1
80	zato.ide-deploy.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.ide-deploy.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	39	1
81	zato.ide-deploy.create.json	t	t	channel	plain_http	\N	/zato/json/zato.ide-deploy.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	39	1
82	zato.helpers.echo	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.helpers.echo	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	40	1
83	zato.helpers.echo.json	t	t	channel	plain_http	\N	/zato/json/zato.helpers.echo	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	40	1
84	zato.cache.builtin.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cache.builtin.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	41	1
85	zato.cache.builtin.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.cache.builtin.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	41	1
86	zato.email.imap.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	42	1
87	zato.email.imap.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	42	1
88	zato.channel.amqp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.amqp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	43	1
89	zato.channel.amqp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.amqp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	43	1
90	zato.security.apikey.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.apikey.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	44	1
91	zato.security.apikey.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.apikey.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	44	1
92	zato.security.rbac.role.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	45	1
93	zato.security.rbac.role.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	45	1
94	zato.security.rbac.client-role.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.client-role.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	46	1
95	zato.security.rbac.client-role.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.client-role.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	46	1
96	zato.checks.json.zato.checks.sio.boolean-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.boolean-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	47	1
97	zato.checks.xml.zato.checks.sio.boolean-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.boolean-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	47	1
98	zato.checks.sio.boolean-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.boolean-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	47	1
99	zato.checks.sio.boolean-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.boolean-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	47	1
100	zato.cloud.aws.s3.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.aws.s3.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	48	1
101	zato.cloud.aws.s3.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.aws.s3.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	48	1
102	zato.outgoing.sap.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sap.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	49	1
103	zato.outgoing.sap.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sap.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	49	1
104	zato.http-soap.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.http-soap.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	50	1
105	zato.http-soap.create.json	t	t	channel	plain_http	\N	/zato/json/zato.http-soap.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	50	1
106	zato.email.smtp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	51	1
107	zato.email.smtp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	51	1
108	zato.security.basic-auth.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.basic-auth.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	52	1
109	zato.security.basic-auth.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.basic-auth.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	52	1
110	zato.kvdb.data-dict.dictionary.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	53	1
111	zato.kvdb.data-dict.dictionary.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	53	1
112	zato.search.es.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.es.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	54	1
113	zato.search.es.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.search.es.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	54	1
114	zato.service.set-wsdl	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.set-wsdl	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	55	1
115	zato.service.set-wsdl.json	t	t	channel	plain_http	\N	/zato/json/zato.service.set-wsdl	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	55	1
116	zato.security.aws.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.aws.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	56	1
117	zato.security.aws.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.aws.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	56	1
118	zato.security.xpath.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.xpath.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	57	1
119	zato.security.xpath.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.xpath.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	57	1
120	zato.security.vault.connection.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.connection.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	58	1
121	zato.security.vault.connection.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.connection.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	58	1
122	zato.search.solr.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.solr.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	59	1
123	zato.search.solr.create.json	t	t	channel	plain_http	\N	/zato/json/zato.search.solr.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	59	1
124	zato.outgoing.jms-wmq.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.jms-wmq.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	60	1
125	zato.outgoing.jms-wmq.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.jms-wmq.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	60	1
126	zato.stats.summary.get-summary-by-month	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.summary.get-summary-by-month	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	61	1
127	zato.stats.summary.get-summary-by-month.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.summary.get-summary-by-month	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	61	1
128	zato.security.rbac.role.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	62	1
129	zato.security.rbac.role.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	62	1
130	zato.service.get-wsdl.soap	t	t	channel	plain_http	\N	/zato/wsdl	\N	\N		\N	\N	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	63	1
131	zato.service.get-wsdl	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-wsdl	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	63	1
132	zato.service.get-wsdl.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-wsdl	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	63	1
133	zato.security.oauth.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.oauth.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	64	1
134	zato.security.oauth.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.oauth.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	64	1
135	zato.checks.json.zato.checks.sio.utc-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.utc-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	65	1
136	zato.checks.xml.zato.checks.sio.utc-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.utc-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	65	1
137	zato.checks.sio.utc-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.utc-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	65	1
138	zato.checks.sio.utc-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.utc-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	65	1
139	zato.channel.web-socket.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	66	1
140	zato.channel.web-socket.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	66	1
141	zato.outgoing.sql.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	67	1
142	zato.outgoing.sql.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	67	1
143	zato.search.es.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.es.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	68	1
144	zato.search.es.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.search.es.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	68	1
145	zato.checks.json.zato.checks.sio.integer-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.integer-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	69	1
146	zato.checks.xml.zato.checks.sio.integer-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.integer-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	69	1
147	zato.checks.sio.integer-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.integer-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	69	1
148	zato.checks.sio.integer-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.integer-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	69	1
149	zato.channel.web-socket.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	70	1
150	zato.channel.web-socket.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	70	1
151	zato.definition.jms-wmq.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.jms-wmq.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	71	1
152	zato.definition.jms-wmq.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.jms-wmq.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	71	1
153	zato.security.tls.key_cert.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.key_cert.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	72	1
154	zato.security.tls.key_cert.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.key_cert.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	72	1
155	zato.service.get-channel-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-channel-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	73	1
156	zato.service.get-channel-list.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-channel-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	73	1
157	zato.channel.web-socket.client.delete-by-pub-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.client.delete-by-pub-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	74	1
158	zato.channel.web-socket.client.delete-by-pub-id.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.client.delete-by-pub-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	74	1
159	zato.definition.amqp.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	75	1
160	zato.definition.amqp.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	75	1
161	/zato/api/invoke	t	t	channel	plain_http	\N	/zato/api/invoke/{service_name}	\N	\N		\N	\N	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	76	1
162	pub.zato.service.service-invoker	t	t	channel	soap	\N	/zato/soap	\N	\N	pub.zato.service.service-invoker	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	76	1
163	pub.zato.service.service-invoker.json	t	t	channel	plain_http	\N	/zato/json/pub.zato.service.service-invoker	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	76	1
164	zato.outgoing.ftp.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.ftp.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	77	1
165	zato.outgoing.ftp.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.ftp.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	77	1
166	zato.security.jwt.log-out	t	t	channel	plain_http	\N	/zato/jwt/log-out	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	78	1
167	zato.security.jwt.log-out	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.log-out	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	78	1
168	zato.security.jwt.log-out.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.log-out	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	78	1
169	zato.checks.json.zato.checks.sio.no-force-type-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.no-force-type-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	79	1
170	zato.checks.xml.zato.checks.sio.no-force-type-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.no-force-type-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	79	1
171	zato.checks.sio.no-force-type-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.no-force-type-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	79	1
172	zato.checks.sio.no-force-type-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.no-force-type-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	79	1
173	zato.outgoing.sql.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	80	1
174	zato.outgoing.sql.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	80	1
175	zato.security.tls.ca_cert.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.ca_cert.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	81	1
176	zato.security.tls.ca_cert.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.ca_cert.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	81	1
177	zato.security.tls.key_cert.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.key_cert.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	82	1
178	zato.security.tls.key_cert.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.key_cert.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	82	1
179	zato.cache.builtin.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cache.builtin.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	83	1
180	zato.cache.builtin.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.cache.builtin.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	83	1
181	zato.security.rbac.client-role.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.client-role.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	84	1
182	zato.security.rbac.client-role.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.client-role.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	84	1
183	zato.outgoing.ftp.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.ftp.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	85	1
184	zato.outgoing.ftp.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.ftp.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	85	1
185	zato.checks.json.zato.checks.sio.as-is-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.as-is-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	86	1
186	zato.checks.xml.zato.checks.sio.as-is-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.as-is-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	86	1
187	zato.checks.sio.as-is-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.as-is-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	86	1
188	zato.checks.sio.as-is-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.as-is-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	86	1
189	zato.service.get-by-name	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-by-name	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	87	1
190	zato.service.get-by-name.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-by-name	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	87	1
191	zato.security.xpath.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.xpath.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	88	1
192	zato.security.xpath.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.xpath.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	88	1
193	zato.message.xpath.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.xpath.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	89	1
194	zato.message.xpath.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.message.xpath.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	89	1
195	zato.security.rbac.permission.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.permission.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	90	1
196	zato.security.rbac.permission.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.permission.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	90	1
197	zato.security.jwt.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	91	1
198	zato.security.jwt.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	91	1
199	zato.info.get-info	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.info.get-info	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	92	1
200	zato.info.get-info.json	t	t	channel	plain_http	\N	/zato/json/zato.info.get-info	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	92	1
201	zato.outgoing.odoo.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	93	1
202	zato.outgoing.odoo.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	93	1
203	zato.message.xpath.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.xpath.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	94	1
204	zato.message.xpath.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.message.xpath.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	94	1
205	zato.security.rbac.client-role.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.client-role.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	95	1
206	zato.security.rbac.client-role.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.client-role.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	95	1
207	zato.checks.json.zato.checks.sio.csv-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.csv-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	96	1
208	zato.checks.xml.zato.checks.sio.csv-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.csv-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	96	1
209	zato.checks.sio.csv-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.csv-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	96	1
210	zato.checks.sio.csv-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.csv-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	96	1
211	zato.security.jwt.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	97	1
212	zato.security.jwt.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	97	1
213	zato.outgoing.zmq.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.zmq.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	98	1
214	zato.outgoing.zmq.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.zmq.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	98	1
215	zato.checks.json.zato.checks.check-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.check-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	99	1
216	zato.checks.xml.zato.checks.check-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.check-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	99	1
217	zato.checks.check-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.check-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	99	1
218	zato.checks.check-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.check-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	99	1
219	zato.security.rbac.role.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	100	1
220	zato.security.rbac.role.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	100	1
221	zato.message.live-browser.get-web-admin-connection-details	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.live-browser.get-web-admin-connection-details	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	101	1
222	zato.message.live-browser.get-web-admin-connection-details.json	t	t	channel	plain_http	\N	/zato/json/zato.message.live-browser.get-web-admin-connection-details	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	101	1
223	zato.channel.web-socket.client.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.client.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	102	1
224	zato.channel.web-socket.client.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.client.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	102	1
225	zato.message.json_pointer.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.json_pointer.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	103	1
226	zato.message.json_pointer.create.json	t	t	channel	plain_http	\N	/zato/json/zato.message.json_pointer.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	103	1
227	zato.definition.amqp.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	104	1
228	zato.definition.amqp.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	104	1
229	zato.security.jwt.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	105	1
230	zato.security.jwt.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	105	1
231	zato.email.imap.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	106	1
232	zato.email.imap.create.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	106	1
233	zato.definition.amqp.get-by-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.get-by-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	107	1
234	zato.definition.amqp.get-by-id.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.get-by-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	107	1
235	zato.stats.trends.get-trends	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.trends.get-trends	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	108	1
236	zato.stats.trends.get-trends.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.trends.get-trends	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	108	1
237	zato.outgoing.odoo.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	109	1
238	zato.outgoing.odoo.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	109	1
239	zato.scheduler.job.execute	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.execute	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	110	1
240	zato.scheduler.job.execute.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.execute	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	110	1
241	zato.email.imap.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	111	1
242	zato.email.imap.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	111	1
243	zato.cloud.aws.s3.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.aws.s3.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	112	1
244	zato.cloud.aws.s3.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.aws.s3.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	112	1
245	zato.security.jwt.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	113	1
246	zato.security.jwt.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	113	1
247	zato.checks.json.zato.checks.sio.check-target-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.check-target-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	114	1
248	zato.checks.xml.zato.checks.sio.check-target-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.check-target-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	114	1
249	zato.checks.sio.check-target-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.check-target-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	114	1
250	zato.checks.sio.check-target-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.check-target-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	114	1
251	zato.security.openstack.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.openstack.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	115	1
252	zato.security.openstack.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.openstack.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	115	1
253	zato.cloud.aws.s3.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.aws.s3.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	116	1
254	zato.cloud.aws.s3.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.aws.s3.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	116	1
255	zato.security.openstack.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.openstack.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	117	1
256	zato.security.openstack.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.openstack.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	117	1
257	zato.definition.cassandra.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.cassandra.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	118	1
258	zato.definition.cassandra.create.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.cassandra.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	118	1
259	zato.security.wss.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.wss.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	119	1
260	zato.security.wss.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.wss.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	119	1
261	zato.definition.cassandra.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.cassandra.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	120	1
262	zato.definition.cassandra.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.cassandra.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	120	1
263	zato.message.xpath.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.xpath.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	121	1
264	zato.message.xpath.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.message.xpath.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	121	1
265	zato.channel.web-socket.subscription.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.subscription.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	122	1
266	zato.channel.web-socket.subscription.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.subscription.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	122	1
267	zato.query.cassandra.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.query.cassandra.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	123	1
268	zato.query.cassandra.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.query.cassandra.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	123	1
269	zato.message.json_pointer.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.json_pointer.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	124	1
270	zato.message.json_pointer.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.message.json_pointer.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	124	1
347	zato.channel.zmq.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.zmq.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	162	1
271	zato.email.smtp.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	125	1
272	zato.email.smtp.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	125	1
273	zato.http-soap.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.http-soap.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	126	1
274	zato.http-soap.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.http-soap.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	126	1
275	zato.kvdb.data-dict.translation.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	127	1
276	zato.kvdb.data-dict.translation.create.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	127	1
277	zato.security.rbac.permission.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.permission.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	128	1
278	zato.security.rbac.permission.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.permission.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	128	1
279	zato.security.aws.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.aws.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	129	1
280	zato.security.aws.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.aws.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	129	1
281	zato.outgoing.sql.ping	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.ping	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	130	1
282	zato.outgoing.sql.ping.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	130	1
283	zato.security.oauth.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.oauth.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	131	1
284	zato.security.oauth.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.oauth.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	131	1
285	zato.outgoing.amqp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.amqp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	132	1
286	zato.outgoing.amqp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.amqp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	132	1
287	zato.outgoing.sql.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	133	1
288	zato.outgoing.sql.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	133	1
289	zato.scheduler.job.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	134	1
290	zato.scheduler.job.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	134	1
291	zato.outgoing.jms-wmq.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.jms-wmq.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	135	1
292	zato.outgoing.jms-wmq.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.jms-wmq.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	135	1
293	zato.security.basic-auth.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.basic-auth.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	136	1
294	zato.security.basic-auth.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.basic-auth.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	136	1
295	zato.security.xpath.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.xpath.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	137	1
296	zato.security.xpath.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.xpath.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	137	1
297	zato.kvdb.remote-command.execute	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.remote-command.execute	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	138	1
298	zato.kvdb.remote-command.execute.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.remote-command.execute	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	138	1
299	zato.outgoing.odoo.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	139	1
300	zato.outgoing.odoo.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	139	1
301	zato.channel.web-socket.client.delete-by-server	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.client.delete-by-server	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	140	1
302	zato.channel.web-socket.client.delete-by-server.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.client.delete-by-server	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	140	1
303	zato.security.aws.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.aws.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	141	1
304	zato.security.aws.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.aws.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	141	1
305	zato.kvdb.data-dict.impexp.import	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.impexp.import	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	142	1
306	zato.kvdb.data-dict.impexp.import.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.impexp.import	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	142	1
307	zato.outgoing.zmq.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.zmq.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	143	1
308	zato.outgoing.zmq.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.zmq.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	143	1
348	zato.channel.zmq.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.zmq.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	162	1
309	zato.security.rbac.permission.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.permission.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	144	1
310	zato.security.rbac.permission.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.permission.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	144	1
311	zato.definition.jms-wmq.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.jms-wmq.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	145	1
312	zato.definition.jms-wmq.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.jms-wmq.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	145	1
313	zato.kvdb.data-dict.translation.get-last-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.get-last-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	146	1
314	zato.kvdb.data-dict.translation.get-last-id.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.get-last-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	146	1
315	zato.security.oauth.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.oauth.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	147	1
316	zato.security.oauth.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.oauth.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	147	1
317	zato.cloud.aws.s3.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.aws.s3.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	148	1
318	zato.cloud.aws.s3.create.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.aws.s3.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	148	1
319	zato.hot-deploy.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.hot-deploy.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	149	1
320	zato.hot-deploy.create.json	t	t	channel	plain_http	\N	/zato/json/zato.hot-deploy.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	149	1
321	zato.security.vault.connection.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.connection.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	150	1
322	zato.security.vault.connection.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.connection.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	150	1
323	zato.definition.jms-wmq.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.jms-wmq.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	151	1
324	zato.definition.jms-wmq.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.jms-wmq.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	151	1
325	zato.service.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	152	1
326	zato.service.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	152	1
327	zato.checks.json.zato.checks.sio.list-of-dicts-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.list-of-dicts-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	153	1
328	zato.checks.xml.zato.checks.sio.list-of-dicts-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.list-of-dicts-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	153	1
329	zato.checks.sio.list-of-dicts-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.list-of-dicts-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	153	1
330	zato.checks.sio.list-of-dicts-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.list-of-dicts-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	153	1
331	zato.scheduler.job.get-by-name	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.get-by-name	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	154	1
332	zato.scheduler.job.get-by-name.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.get-by-name	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	154	1
333	zato.stats.summary.get-summary-by-range	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.summary.get-summary-by-range	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	155	1
334	zato.stats.summary.get-summary-by-range.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.summary.get-summary-by-range	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	155	1
335	zato.security.tls.key_cert.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.key_cert.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	156	1
336	zato.security.tls.key_cert.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.key_cert.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	156	1
337	zato.outgoing.amqp.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.amqp.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	157	1
338	zato.outgoing.amqp.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.amqp.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	157	1
339	zato.server.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.server.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	158	1
340	zato.server.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.server.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	158	1
341	zato.security.rbac.permission.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.permission.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	159	1
342	zato.security.rbac.permission.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.permission.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	159	1
343	zato.channel.amqp.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.amqp.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	160	1
344	zato.channel.amqp.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.amqp.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	160	1
345	zato.server.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.server.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	161	1
346	zato.server.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.server.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	161	1
349	zato.checks.json.zato.checks.sio.nested-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.nested-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	163	1
350	zato.checks.xml.zato.checks.sio.nested-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.nested-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	163	1
351	zato.checks.sio.nested-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.nested-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	163	1
352	zato.checks.sio.nested-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.nested-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	163	1
353	zato.security.rbac.role-permission.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role-permission.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	164	1
354	zato.security.rbac.role-permission.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role-permission.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	164	1
355	zato.definition.cassandra.get-by-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.cassandra.get-by-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	165	1
356	zato.definition.cassandra.get-by-id.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.cassandra.get-by-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	165	1
357	zato.kvdb.data-dict.dictionary.get-system-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.get-system-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	166	1
358	zato.kvdb.data-dict.dictionary.get-system-list.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.get-system-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	166	1
359	zato.kvdb.data-dict.dictionary.get-value-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.get-value-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	167	1
360	zato.kvdb.data-dict.dictionary.get-value-list.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.get-value-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	167	1
361	zato.message.json_pointer.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.json_pointer.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	168	1
362	zato.message.json_pointer.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.message.json_pointer.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	168	1
363	zato.security.jwt.auto-clean-up	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.auto-clean-up	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	169	1
364	zato.security.jwt.auto-clean-up.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.auto-clean-up	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	169	1
365	zato.outgoing.sql.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	170	1
366	zato.outgoing.sql.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	170	1
367	zato.cloud.openstack.swift.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.openstack.swift.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	171	1
368	zato.cloud.openstack.swift.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.openstack.swift.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	171	1
369	zato.security.apikey.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.apikey.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	172	1
370	zato.security.apikey.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.apikey.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	172	1
371	zato.search.solr.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.solr.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	173	1
372	zato.search.solr.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.search.solr.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	173	1
373	zato.security.openstack.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.openstack.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	174	1
374	zato.security.openstack.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.openstack.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	174	1
375	zato.kvdb.data-dict.dictionary.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	175	1
376	zato.kvdb.data-dict.dictionary.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	175	1
377	zato.security.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	176	1
378	zato.security.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	176	1
379	zato.http-soap.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.http-soap.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	177	1
380	zato.http-soap.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.http-soap.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	177	1
381	zato.definition.jms-wmq.get-by-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.jms-wmq.get-by-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	178	1
382	zato.definition.jms-wmq.get-by-id.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.jms-wmq.get-by-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	178	1
383	zato.kvdb.data-dict.translation.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	179	1
384	zato.kvdb.data-dict.translation.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	179	1
385	zato.channel.web-socket.subscription.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.subscription.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	180	1
386	zato.channel.web-socket.subscription.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.subscription.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	180	1
387	zato.security.basic-auth.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.basic-auth.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	181	1
388	zato.security.basic-auth.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.basic-auth.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	181	1
389	zato.definition.amqp.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	182	1
390	zato.definition.amqp.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	182	1
391	zato.channel.web-socket.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	183	1
392	zato.channel.web-socket.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	183	1
393	zato.service.get-source-info	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-source-info	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	184	1
394	zato.service.get-source-info.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-source-info	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	184	1
395	zato.security.rbac.role-permission.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role-permission.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	185	1
396	zato.security.rbac.role-permission.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role-permission.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	185	1
397	zato.message.namespace.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.namespace.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	186	1
398	zato.message.namespace.create.json	t	t	channel	plain_http	\N	/zato/json/zato.message.namespace.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	186	1
399	zato.search.solr.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.solr.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	187	1
400	zato.search.solr.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.search.solr.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	187	1
401	zato.notif.cloud.sql.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.sql.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	188	1
402	zato.notif.cloud.sql.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.sql.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	188	1
403	zato.security.rbac.role-permission.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role-permission.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	189	1
404	zato.security.rbac.role-permission.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role-permission.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	189	1
405	zato.query.cassandra.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.query.cassandra.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	190	1
406	zato.query.cassandra.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.query.cassandra.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	190	1
407	zato.channel.web-socket.invalidate-token	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.invalidate-token	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	191	1
408	zato.channel.web-socket.invalidate-token.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.invalidate-token	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	191	1
409	zato.outgoing.amqp.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.amqp.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	192	1
410	zato.outgoing.amqp.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.amqp.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	192	1
411	zato.security.tls.ca_cert.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.ca_cert.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	193	1
412	zato.security.tls.ca_cert.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.ca_cert.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	193	1
413	zato.security.oauth.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.oauth.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	194	1
414	zato.security.oauth.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.oauth.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	194	1
415	zato.server.get-by-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.server.get-by-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	195	1
416	zato.server.get-by-id.json	t	t	channel	plain_http	\N	/zato/json/zato.server.get-by-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	195	1
417	zato.definition.amqp.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.amqp.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	196	1
418	zato.definition.amqp.create.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.amqp.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	196	1
419	zato.channel.jms-wmq.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.jms-wmq.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	197	1
420	zato.channel.jms-wmq.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.jms-wmq.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	197	1
421	zato.channel.amqp.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.amqp.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	198	1
422	zato.channel.amqp.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.amqp.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	198	1
423	zato.outgoing.zmq.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.zmq.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	199	1
424	zato.outgoing.zmq.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.zmq.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	199	1
425	zato.stats.summary.get-summary-by-week	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.summary.get-summary-by-week	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	200	1
426	zato.stats.summary.get-summary-by-week.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.summary.get-summary-by-week	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	200	1
427	zato.security.xpath.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.xpath.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	201	1
428	zato.security.xpath.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.xpath.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	201	1
429	zato.security.vault.policy.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.policy.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	202	1
430	zato.security.vault.policy.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.policy.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	202	1
431	zato.security.jwt.log-in	t	t	channel	plain_http	\N	/zato/jwt/log-in	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	203	1
432	zato.security.jwt.log-in	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.log-in	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	203	1
433	zato.security.jwt.log-in.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.log-in	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	203	1
434	zato.channel.web-socket.get-token	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.web-socket.get-token	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	204	1
435	zato.channel.web-socket.get-token.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.web-socket.get-token	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	204	1
436	zato.channel.jms-wmq.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.jms-wmq.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	205	1
437	zato.channel.jms-wmq.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.jms-wmq.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	205	1
438	zato.outgoing.jms-wmq.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.jms-wmq.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	206	1
439	zato.outgoing.jms-wmq.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.jms-wmq.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	206	1
440	zato.message.xpath.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.xpath.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	207	1
441	zato.message.xpath.create.json	t	t	channel	plain_http	\N	/zato/json/zato.message.xpath.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	207	1
442	zato.security.basic-auth.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.basic-auth.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	208	1
443	zato.security.basic-auth.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.basic-auth.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	208	1
444	zato.http-soap.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.http-soap.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	209	1
445	zato.http-soap.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.http-soap.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	209	1
446	zato.search.es.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.es.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	210	1
447	zato.search.es.create.json	t	t	channel	plain_http	\N	/zato/json/zato.search.es.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	210	1
448	zato.message.json_pointer.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.json_pointer.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	211	1
449	zato.message.json_pointer.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.message.json_pointer.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	211	1
450	zato.security.jwt.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.jwt.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	212	1
451	zato.security.jwt.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.jwt.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	212	1
452	zato.outgoing.sap.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sap.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	213	1
453	zato.outgoing.sap.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sap.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	213	1
454	zato.service.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	214	1
455	zato.service.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.service.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	214	1
456	zato.security.aws.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.aws.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	215	1
457	zato.security.aws.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.aws.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	215	1
458	zato.kvdb.data-dict.translation.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	216	1
459	zato.kvdb.data-dict.translation.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	216	1
460	zato.outgoing.jms-wmq.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.jms-wmq.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	217	1
461	zato.outgoing.jms-wmq.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.jms-wmq.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	217	1
462	zato.notif.cloud.openstack.swift.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.openstack.swift.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	218	1
463	zato.notif.cloud.openstack.swift.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.openstack.swift.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	218	1
464	zato.security.apikey.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.apikey.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	219	1
465	zato.security.apikey.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.apikey.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	219	1
466	zato.checks.json.zato.checks.sio.unicode-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.unicode-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	220	1
467	zato.checks.xml.zato.checks.sio.unicode-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.unicode-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	220	1
468	zato.checks.sio.unicode-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.unicode-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	220	1
469	zato.checks.sio.unicode-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.unicode-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	220	1
470	zato.outgoing.odoo.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	221	1
471	zato.outgoing.odoo.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	221	1
472	zato.channel.zmq.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.zmq.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	222	1
473	zato.channel.zmq.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.zmq.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	222	1
474	zato.channel.zmq.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.zmq.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	223	1
475	zato.channel.zmq.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.zmq.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	223	1
476	zato.search.solr.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.solr.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	224	1
477	zato.search.solr.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.search.solr.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	224	1
478	zato.security.vault.policy.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.policy.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	225	1
479	zato.security.vault.policy.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.policy.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	225	1
480	zato.security.wss.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.wss.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	226	1
481	zato.security.wss.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.wss.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	226	1
482	zato.stats.summary.get-summary-by-day	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.summary.get-summary-by-day	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	227	1
483	zato.stats.summary.get-summary-by-day.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.summary.get-summary-by-day	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	227	1
484	zato.security.oauth.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.oauth.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	228	1
485	zato.security.oauth.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.oauth.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	228	1
486	zato.info.get-server-info	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.info.get-server-info	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	229	1
487	zato.info.get-server-info.json	t	t	channel	plain_http	\N	/zato/json/zato.info.get-server-info	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	229	1
488	zato.cloud.openstack.swift.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cloud.openstack.swift.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	230	1
489	zato.cloud.openstack.swift.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.cloud.openstack.swift.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	230	1
490	zato.channel.zmq.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.zmq.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	231	1
491	zato.channel.zmq.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.zmq.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	231	1
492	zato.email.imap.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	232	1
493	zato.email.imap.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	232	1
494	zato.checks.json.zato.checks.sio.list-service	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.list-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	233	1
495	zato.checks.xml.zato.checks.sio.list-service	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.list-service	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	233	1
496	zato.checks.sio.list-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.list-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	233	1
497	zato.checks.sio.list-service.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.list-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	233	1
498	zato.cache.builtin.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.cache.builtin.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	234	1
499	zato.cache.builtin.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.cache.builtin.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	234	1
500	zato.checks.json.zato.checks.sio.check-sio	t	t	channel	plain_http	\N	/zato/checks/json/zato.checks.sio.check-sio	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	235	1
501	zato.checks.xml.zato.checks.sio.check-sio	t	t	channel	plain_http	\N	/zato/checks/xml/zato.checks.sio.check-sio	\N	\N		\N	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	235	1
502	zato.checks.sio.check-sio	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.checks.sio.check-sio	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	235	1
503	zato.checks.sio.check-sio.json	t	t	channel	plain_http	\N	/zato/json/zato.checks.sio.check-sio	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	235	1
504	zato.security.wss.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.wss.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	236	1
505	zato.security.wss.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.security.wss.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	236	1
506	zato.outgoing.sql.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sql.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	237	1
507	zato.outgoing.sql.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sql.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	237	1
508	zato.stats.summary.get-summary-by-year	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.summary.get-summary-by-year	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	238	1
509	zato.stats.summary.get-summary-by-year.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.summary.get-summary-by-year	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	238	1
510	zato.definition.cassandra.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.cassandra.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	239	1
511	zato.definition.cassandra.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.cassandra.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	239	1
512	zato.email.smtp.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	240	1
513	zato.email.smtp.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	240	1
514	zato.kvdb.data-dict.dictionary.get-key-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.get-key-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	241	1
515	zato.kvdb.data-dict.dictionary.get-key-list.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.get-key-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	241	1
516	zato.email.smtp.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	242	1
517	zato.email.smtp.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	242	1
518	zato.outgoing.sap.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sap.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	243	1
519	zato.outgoing.sap.create.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sap.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	243	1
520	zato.outgoing.ftp.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.ftp.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	244	1
521	zato.outgoing.ftp.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.ftp.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	244	1
522	zato.kvdb.data-dict.dictionary.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	245	1
523	zato.kvdb.data-dict.dictionary.create.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	245	1
524	zato.security.basic-auth.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.basic-auth.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	246	1
525	zato.security.basic-auth.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.basic-auth.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	246	1
526	zato.definition.jms-wmq.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.jms-wmq.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	247	1
527	zato.definition.jms-wmq.create.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.jms-wmq.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	247	1
528	zato.notif.cloud.openstack.swift.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.openstack.swift.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	248	1
529	zato.notif.cloud.openstack.swift.create.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.openstack.swift.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	248	1
530	zato.email.imap.ping	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.imap.ping	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	249	1
531	zato.email.imap.ping.json	t	t	channel	plain_http	\N	/zato/json/zato.email.imap.ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	249	1
532	zato.outgoing.sap.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sap.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	250	1
533	zato.outgoing.sap.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sap.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	250	1
534	zato.security.aws.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.aws.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	251	1
535	zato.security.aws.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.aws.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	251	1
536	zato.security.apikey.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.apikey.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	252	1
537	zato.security.apikey.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.apikey.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	252	1
538	zato.security.vault.policy.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.policy.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	253	1
539	zato.security.vault.policy.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.policy.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	253	1
540	zato.stats.get-by-service	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.stats.get-by-service	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	254	1
541	zato.stats.get-by-service.json	t	t	channel	plain_http	\N	/zato/json/zato.stats.get-by-service	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	254	1
542	zato.security.vault.connection.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.vault.connection.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	255	1
543	zato.security.vault.connection.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.vault.connection.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	255	1
544	zato.query.cassandra.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.query.cassandra.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	256	1
545	zato.query.cassandra.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.query.cassandra.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	256	1
546	zato.notif.cloud.sql.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.sql.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	257	1
547	zato.notif.cloud.sql.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.sql.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	257	1
548	zato.notif.cloud.sql.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.sql.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	258	1
549	zato.notif.cloud.sql.create.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.sql.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	258	1
550	zato.channel.jms-wmq.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.jms-wmq.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	259	1
551	zato.channel.jms-wmq.create.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.jms-wmq.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	259	1
552	zato.outgoing.amqp.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.amqp.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	260	1
553	zato.outgoing.amqp.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.amqp.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	260	1
554	zato.notif.cloud.sql.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.sql.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	261	1
555	zato.notif.cloud.sql.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.sql.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	261	1
556	zato.definition.cassandra.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.definition.cassandra.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	262	1
557	zato.definition.cassandra.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.definition.cassandra.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	262	1
558	zato.outgoing.sap.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.sap.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	263	1
559	zato.outgoing.sap.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.sap.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	263	1
560	zato.security.wss.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.wss.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	264	1
561	zato.security.wss.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.security.wss.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	264	1
562	zato.security.xpath.change-password	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.xpath.change-password	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	265	1
563	zato.security.xpath.change-password.json	t	t	channel	plain_http	\N	/zato/json/zato.security.xpath.change-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	265	1
564	zato.email.smtp.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	266	1
565	zato.email.smtp.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	266	1
566	zato.service.get-request-response	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.get-request-response	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	267	1
567	zato.service.get-request-response.json	t	t	channel	plain_http	\N	/zato/json/zato.service.get-request-response	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	267	1
568	zato.security.tls.ca_cert.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.ca_cert.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	268	1
569	zato.security.tls.ca_cert.create.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.ca_cert.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	268	1
570	zato.scheduler.job.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.scheduler.job.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	269	1
571	zato.scheduler.job.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.scheduler.job.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	269	1
572	zato.kvdb.data-dict.translation.translate	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.translate	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	270	1
573	zato.kvdb.data-dict.translation.translate.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.translate	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	270	1
574	zato.kvdb.data-dict.translation.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.translation.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	271	1
575	zato.kvdb.data-dict.translation.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.translation.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	271	1
576	zato.notif.cloud.openstack.swift.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.openstack.swift.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	272	1
577	zato.notif.cloud.openstack.swift.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.openstack.swift.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	272	1
578	zato.outgoing.odoo.delete	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.delete	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	273	1
579	zato.outgoing.odoo.delete.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.delete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	273	1
580	zato.security.tls.key_cert.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.tls.key_cert.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	274	1
581	zato.security.tls.key_cert.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.tls.key_cert.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	274	1
582	zato.message.namespace.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.message.namespace.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	275	1
583	zato.message.namespace.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.message.namespace.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	275	1
584	zato.notif.cloud.openstack.swift.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.notif.cloud.openstack.swift.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	276	1
585	zato.notif.cloud.openstack.swift.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.notif.cloud.openstack.swift.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	276	1
586	zato.search.es.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.search.es.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	277	1
587	zato.search.es.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.search.es.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	277	1
588	zato.security.rbac.role.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.security.rbac.role.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	278	1
589	zato.security.rbac.role.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.security.rbac.role.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	278	1
590	zato.service.slow-response.get-list	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.slow-response.get-list	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	279	1
591	zato.service.slow-response.get-list.json	t	t	channel	plain_http	\N	/zato/json/zato.service.slow-response.get-list	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	279	1
592	zato.email.smtp.ping	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.email.smtp.ping	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	280	1
593	zato.email.smtp.ping.json	t	t	channel	plain_http	\N	/zato/json/zato.email.smtp.ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	280	1
594	admin.invoke.json	t	t	channel	plain_http	\N	/zato/admin/invoke	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	1	\N	\N	281	1
595	zato.internal.invoke	t	t	channel	plain_http	\N	/zato/internal/invoke	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	3	\N	\N	281	1
596	zato.service.invoke	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.service.invoke	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	281	1
597	zato.service.invoke.json	t	t	channel	plain_http	\N	/zato/json/zato.service.invoke	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	281	1
598	zato.kvdb.data-dict.dictionary.get-last-id	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.kvdb.data-dict.dictionary.get-last-id	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	282	1
599	zato.kvdb.data-dict.dictionary.get-last-id.json	t	t	channel	plain_http	\N	/zato/json/zato.kvdb.data-dict.dictionary.get-last-id	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	282	1
600	zato.outgoing.odoo.ping	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.outgoing.odoo.ping	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	283	1
601	zato.outgoing.odoo.ping.json	t	t	channel	plain_http	\N	/zato/json/zato.outgoing.odoo.ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	283	1
602	zato.channel.amqp.edit	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.channel.amqp.edit	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	284	1
603	zato.channel.amqp.edit.json	t	t	channel	plain_http	\N	/zato/json/zato.channel.amqp.edit	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	284	1
604	zato.query.cassandra.create	t	t	channel	soap	\N	/zato/soap	\N	\N	zato.query.cassandra.create	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	285	1
605	zato.query.cassandra.create.json	t	t	channel	plain_http	\N	/zato/json/zato.query.cassandra.create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	2	\N	\N	285	1
606	zato.ping	t	t	channel	plain_http	\N	/zato/ping	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	286	1
607	zato.ping.plain_http.basic_auth	t	t	channel	plain_http	\N	/zato/ping.plain_http.basic_auth	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	5	\N	\N	286	1
608	zato.ping.soap.basic_auth	t	t	channel	soap	\N	/zato/ping.soap.basic_auth	\N	\N	zato.ping.soap.basic_auth	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	6	\N	\N	286	1
609	zato.ping.soap.wss.clear_text	t	t	channel	soap	\N	/zato/ping.soap.wss.clear_text	\N	\N	zato.ping.soap.basic_auth	1.1	xml	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	7	\N	\N	286	1
610	zato.cache.builtin.pubapi.set-contains	t	t	channel	plain_http	\N	/zato/cache/set/contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	287	1
611	zato.cache.builtin.pubapi.set-contains-any	t	t	channel	plain_http	\N	/zato/cache/set/contains-any	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	288	1
612	zato.cache.builtin.pubapi.delete-by-regex	t	t	channel	plain_http	\N	/zato/cache/delete/by-regex/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	289	1
613	zato.cache.builtin.pubapi.set-contains-all	t	t	channel	plain_http	\N	/zato/cache/set/contains-all	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	290	1
614	zato.cache.builtin.pubapi.expire-by-suffix	t	t	channel	plain_http	\N	/zato/cache/expire/by-suffix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	291	1
615	zato.cache.builtin.pubapi.delete-not-contains	t	t	channel	plain_http	\N	/zato/cache/delete/not-contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	292	1
616	zato.cache.builtin.pubapi.delete-by-suffix	t	t	channel	plain_http	\N	/zato/cache/delete/by-suffix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	293	1
617	zato.cache.builtin.pubapi.expire-by-prefix	t	t	channel	plain_http	\N	/zato/cache/expire/by-prefix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	294	1
618	zato.cache.builtin.pubapi.expire-contains-all	t	t	channel	plain_http	\N	/zato/cache/expire/contains-all	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	295	1
619	zato.cache.builtin.pubapi.delete-contains	t	t	channel	plain_http	\N	/zato/cache/delete/contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	296	1
620	zato.cache.builtin.pubapi.expire-contains-any	t	t	channel	plain_http	\N	/zato/cache/expire/contains-any	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	297	1
621	zato.cache.builtin.pubapi.expire-contains	t	t	channel	plain_http	\N	/zato/cache/expire/contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	298	1
622	zato.cache.builtin.pubapi.single-key-service	t	t	channel	plain_http	\N	/zato/cache/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	299	1
623	zato.cache.builtin.pubapi.set-by-prefix	t	t	channel	plain_http	\N	/zato/cache/set/by-prefix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	300	1
624	zato.cache.builtin.pubapi.set-not-contains	t	t	channel	plain_http	\N	/zato/cache/set/not-contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	301	1
625	zato.cache.builtin.pubapi.expire-not-contains	t	t	channel	plain_http	\N	/zato/cache/expire/not-contains/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	302	1
626	zato.cache.builtin.pubapi.delete-contains-any	t	t	channel	plain_http	\N	/zato/cache/delete/contains-any	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	303	1
627	zato.cache.builtin.pubapi.set-by-suffix	t	t	channel	plain_http	\N	/zato/cache/set/by-suffix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	304	1
628	zato.cache.builtin.pubapi.expire-by-regex	t	t	channel	plain_http	\N	/zato/cache/expire/by-prefix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	305	1
629	zato.cache.builtin.pubapi.delete-contains-all	t	t	channel	plain_http	\N	/zato/cache/delete/contains-all	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	306	1
630	zato.cache.builtin.pubapi.delete-by-prefix	t	t	channel	plain_http	\N	/zato/cache/delete/by-prefix/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	307	1
631	zato.cache.builtin.pubapi.set-by-regex	t	t	channel	plain_http	\N	/zato/cache/set/by-regex/{key}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	308	1
632	zato.crypto.encrypt	t	t	channel	plain_http	\N	/zato/crypto/encrypt	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	309	1
633	zato.crypto.hash-secret	t	t	channel	plain_http	\N	/zato/crypto/hash-secret	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	310	1
634	zato.crypto.generate-password	t	t	channel	plain_http	\N	/zato/crypto/generate-password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	311	1
635	zato.crypto.decrypt	t	t	channel	plain_http	\N	/zato/crypto/decrypt	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	312	1
636	zato.crypto.verify-hash	t	t	channel	plain_http	\N	/zato/crypto/verify-hash	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	313	1
637	zato.crypto.generate-secret	t	t	channel	plain_http	\N	/zato/crypto/generate-secret	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	314	1
638	zato.pubsub.topic.topic_name	t	t	channel	plain_http	\N	/zato/pubsub/topic/{topic_name}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	"{\\"match_slash\\": true}"	\N	\N	\N	315	1
639	zato.pubsub.subscribe.topic.topic_name	t	t	channel	plain_http	\N	/zato/pubsub/subscribe/topic/{topic_name}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	"{\\"match_slash\\": true}"	\N	\N	\N	316	1
640	zato.pubsub.msg.msg_id	t	t	channel	plain_http	\N	/zato/pubsub/msg/{msg_id}	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	"{\\"match_slash\\": true}"	\N	\N	\N	317	1
641	pubsub.demo.sample.channel	t	t	channel	plain_http	\N	/zato/pubsub/zato.demo.sample	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	"{\\"match_slash\\": true}"	10	\N	\N	318	1
642	pubsub.demo.sample.outconn	t	t	outgoing	plain_http	http://localhost:11223	/zato/pubsub/zato.demo.sample	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	"{\\"match_slash\\": true}"	10	\N	\N	\N	1
643	zato.internal.callback.wmq	t	t	channel	plain_http	\N	/zato/internal/callback/wmq	\N	\N		\N	\N	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	12	\N	\N	319	1
644	/zato/sso/user/create	t	t	channel	plain_http	\N	/zato/sso/user/create	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	320	1
645	/zato/sso/user/signup	t	t	channel	plain_http	\N	/zato/sso/user/signup	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	321	1
646	/zato/sso/user/approve	t	t	channel	plain_http	\N	/zato/sso/user/approve	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	322	1
647	/zato/sso/user/reject	t	t	channel	plain_http	\N	/zato/sso/user/reject	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	323	1
648	/zato/sso/user/login	t	t	channel	plain_http	\N	/zato/sso/user/login	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	324	1
649	/zato/sso/user/logout	t	t	channel	plain_http	\N	/zato/sso/user/logout	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	325	1
650	/zato/sso/user	t	t	channel	plain_http	\N	/zato/sso/user	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	326	1
651	/zato/sso/user/password	t	t	channel	plain_http	\N	/zato/sso/user/password	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	327	1
652	/zato/sso/user/search	t	t	channel	plain_http	\N	/zato/sso/user/search	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	328	1
653	/zato/sso/user/session	t	t	channel	plain_http	\N	/zato/sso/user/session	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	329	1
654	/zato/sso/user/password/reset/begin	t	t	channel	plain_http	\N	/zato/sso/user/password/reset/begin	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	330	1
655	/zato/sso/user/password/reset/complete	t	t	channel	plain_http	\N	/zato/sso/user/password/reset/complete	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	331	1
656	/zato/sso/user/attr	t	t	channel	plain_http	\N	/zato/sso/user/attr	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	332	1
657	/zato/sso/user/attr/exists	t	t	channel	plain_http	\N	/zato/sso/user/attr/exists	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	333	1
658	/zato/sso/user/attr/names	t	t	channel	plain_http	\N	/zato/sso/user/attr/names	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	334	1
659	/zato/sso/session/attr	t	t	channel	plain_http	\N	/zato/sso/session/attr	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	335	1
660	/zato/sso/session/attr/exists	t	t	channel	plain_http	\N	/zato/sso/session/attr/exists	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	336	1
661	/zato/sso/session/attr/names	t	t	channel	plain_http	\N	/zato/sso/session/attr/names	\N	\N		\N	json	\N	\N	\N	suds	10	t	qs-over-path	channel-params-over-msg	f	f	0	null	\N	\N	\N	337	1
\.


--
-- Data for Name: install_state; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.install_state (id, version, install_time, source_host, source_user, opaque1) FROM stdin;
1	1	2019-05-25 14:56:19.22003	d11f327505b4	zato	null
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.job (id, name, is_active, job_type, start_date, extra, opaque1, cluster_id, service_id) FROM stdin;
\.


--
-- Data for Name: job_cron_style; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.job_cron_style (id, cron_definition, opaque1, job_id) FROM stdin;
\.


--
-- Data for Name: job_interval_based; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.job_interval_based (id, weeks, days, hours, minutes, seconds, repeats, opaque1, job_id) FROM stdin;
\.


--
-- Data for Name: kv_data; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.kv_data (id, key, value, data_type, creation_time, expiry_time, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: msg_json_pointer; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.msg_json_pointer (id, name, value, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: msg_ns; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.msg_ns (id, name, value, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: msg_xpath; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.msg_xpath (id, name, value, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: notif; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.notif (id, name, is_active, notif_type, "interval", name_pattern, name_pattern_neg, get_data, get_data_patt, get_data_patt_neg, service_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: notif_os_swift; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.notif_os_swift (id, containers, def_id) FROM stdin;
\.


--
-- Data for Name: notif_sql; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.notif_sql (id, query, def_id) FROM stdin;
\.


--
-- Data for Name: os_swift; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.os_swift (id, name, is_active, pool_size, auth_url, auth_version, "user", secret_key, retries, is_snet, starting_backoff, max_backoff, tenant_name, should_validate_cert, cacert, should_retr_ratelimit, needs_tls_compr, custom_options, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: out_amqp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_amqp (id, name, is_active, delivery_mode, priority, content_type, content_encoding, expiration, user_id, app_id, pool_size, opaque1, def_id) FROM stdin;
\.


--
-- Data for Name: out_ftp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_ftp (id, name, is_active, host, "user", password, acct, timeout, port, dircache, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: out_odoo; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_odoo (id, name, is_active, host, port, "user", database, protocol, pool_size, password, client_type, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: out_sap; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_sap (id, name, is_active, host, sysnr, "user", client, sysid, password, pool_size, router, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: out_stomp; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_stomp (id, name, is_active, username, password, address, proto_version, timeout, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: out_wmq; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_wmq (id, name, is_active, delivery_mode, priority, expiration, opaque1, def_id) FROM stdin;
\.


--
-- Data for Name: out_zmq; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.out_zmq (id, name, is_active, address, socket_type, socket_method, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_channel; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_channel (id, is_active, is_internal, conn_id, conn_type, opaque1, topic_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_endp_msg_q_inter; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_endp_msg_q_inter (id, entry_timestamp, inter_type, inter_details, opaque1, queue_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_endp_msg_queue; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_endp_msg_queue (id, creation_time, delivery_count, last_delivery_time, is_in_staging, sub_pattern_matched, is_deliverable, delivery_status, delivery_time, opaque1, pub_msg_id, endpoint_id, topic_id, sub_key, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_endp_topic; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_endp_topic (id, pub_pattern_matched, last_pub_time, pub_msg_id, pub_correl_id, in_reply_to, ext_client_id, opaque1, endpoint_id, topic_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_endpoint; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_endpoint (id, name, is_internal, is_active, endpoint_type, last_seen, last_pub_time, last_sub_time, last_deliv_time, role, tags, topic_patterns, pub_tag_patterns, message_tag_patterns, opaque1, service_id, security_id, gen_conn_id, ws_channel_id, cluster_id) FROM stdin;
1	zato.pubsub.default.internal.endpoint	t	t	internal	\N	\N	\N	\N	pub-sub	\N	pub=/*\nsub=/*	\N	\N	null	\N	11	\N	\N	1
2	zato.pubsub.demo.endpoint	t	t	rest	\N	\N	\N	\N	pub-sub	\N	pub=/zato/demo/*\nsub=/zato/demo/*	\N	\N	null	\N	10	\N	\N	1
\.


--
-- Data for Name: pubsub_message; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_message (id, pub_msg_id, pub_correl_id, in_reply_to, ext_client_id, group_id, position_in_group, pub_pattern_matched, pub_time, ext_pub_time, expiration_time, last_updated, data, data_prefix, data_prefix_short, data_format, mime_type, size, priority, expiration, has_gd, is_in_sub_queue, opaque1, published_by_id, topic_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: pubsub_sub; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_sub (id, is_internal, creation_time, sub_key, sub_pattern_matched, deliver_by, ext_client_id, is_durable, has_gd, active_status, is_staging_enabled, delivery_method, delivery_data_format, delivery_endpoint, last_interaction_time, last_interaction_type, last_interaction_details, delivery_batch_size, wrap_one_msg_in_list, delivery_max_size, delivery_max_retry, delivery_err_should_block, wait_sock_err, wait_non_sock_err, hook_service_id, out_http_method, amqp_exchange, amqp_routing_key, files_directory_list, ftp_directory_list, sms_twilio_from, sms_twilio_to_list, smtp_subject, smtp_from, smtp_to_list, smtp_body, smtp_is_html, opaque1, topic_id, endpoint_id, out_job_id, out_http_soap_id, out_smtp_id, out_amqp_id, out_gen_conn_id, ws_channel_id, server_id, cluster_id) FROM stdin;
1	f	1558796202.0135640	zpsk.rest.zeci.15a331929b3c362a9a6c9973	sub=/zato/demo/*	\N	\N	t	f	pub-sub	f	notify	json	\N	\N	\N	\N	15000	f	500000	123456789	f	10	30	\N	POST	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	null	1	2	\N	642	\N	\N	\N	\N	\N	1
\.


--
-- Data for Name: pubsub_topic; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.pubsub_topic (id, name, is_active, is_internal, max_depth_gd, max_depth_non_gd, depth_check_freq, has_gd, is_api_sub_allowed, pub_buffer_size_gd, task_sync_interval, task_delivery_interval, opaque1, hook_service_id, cluster_id) FROM stdin;
1	/zato/demo/sample	t	t	10000	1000	100	f	t	0	500	2000	null	\N	1
\.


--
-- Data for Name: query_cassandra; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.query_cassandra (id, name, is_active, value, opaque1, cluster_id, def_id) FROM stdin;
\.


--
-- Data for Name: rbac_client_role; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.rbac_client_role (id, name, client_def, opaque1, role_id, cluster_id) FROM stdin;
1	sec_def:::basic_auth:::ide_publisher:::IDE Publishers	sec_def:::basic_auth:::ide_publisher	null	2	1
\.


--
-- Data for Name: rbac_perm; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.rbac_perm (id, name, opaque1, cluster_id) FROM stdin;
1	Create	null	1
2	Read	null	1
3	Update	null	1
4	Delete	null	1
\.


--
-- Data for Name: rbac_role; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.rbac_role (id, name, parent_id, opaque1, cluster_id) FROM stdin;
1	Root	\N	null	1
2	IDE Publishers	1	null	1
\.


--
-- Data for Name: rbac_role_perm; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.rbac_role_perm (id, opaque1, role_id, perm_id, service_id, cluster_id) FROM stdin;
1	null	2	2	39	1
2	null	2	1	39	1
3	null	2	3	39	1
\.


--
-- Data for Name: search_es; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.search_es (id, name, is_active, hosts, timeout, body_as, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: search_solr; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.search_solr (id, name, is_active, address, timeout, ping_path, options, pool_size, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: sec_apikey; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_apikey (id) FROM stdin;
\.


--
-- Data for Name: sec_aws; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_aws (id) FROM stdin;
\.


--
-- Data for Name: sec_base; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_base (id, name, username, password, password_type, is_active, sec_type, opaque1, cluster_id) FROM stdin;
1	admin.invoke	admin.invoke	b4b506ac-0ba8-49d8-a963-ecd3ce1010f5	\N	t	basic_auth	null	1
2	pubapi	pubapi	cba6cd4c594341c29d17c61a40bd7d84	\N	t	basic_auth	null	1
3	zato.internal.invoke	zato.internal.invoke.user	96330afcc294459c83b6bea977d5cfa5	\N	t	basic_auth	null	1
4	ide_publisher	ide_publisher	87e43fb1c1e241f9a0a9ea4e9239891b	\N	t	basic_auth	null	1
5	zato.ping.plain_http.basic_auth	zato.ping.plain_http.basic_auth	1965d188fcda4077b3b8422eac705e94	\N	t	basic_auth	null	1
6	zato.ping.soap.basic_auth	zato.ping.soap.basic_auth	602015d930f04567a505350b381f1e8f	\N	t	basic_auth	null	1
7	zato.ping.soap.wss.clear_text	zato.ping.soap.wss.clear_text	4995eb044f4d4e71bf016736eaebf295	clear_text	t	wss	null	1
8	zato.default.cache.client	zato.cache	40a7d4f7597f426ca8014de01f8b7972	\N	t	basic_auth	null	1
9	zato.default.crypto.client	zato.crypto	464229eb48c0451cb41d24664cc3209a	\N	t	basic_auth	null	1
10	zato.pubsub.demo.secdef	zato.pubsub.demo	80b0af1cb3944a70832549a075fb2173	\N	t	basic_auth	null	1
11	zato.pubsub.internal.secdef	zato.pubsub.internal	111ffd39908344d8a516196c6fd061a9	\N	t	basic_auth	null	1
12	zato.connector.wmq	zato.connector.wmq	5bcd47cee60d427190dc161ef9756a59	\N	t	basic_auth	null	1
\.


--
-- Data for Name: sec_basic_auth; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_basic_auth (id, realm) FROM stdin;
1	Zato admin invoke
2	Zato public API
3	Zato internal invoker
4	ide_publisher
5	Zato ping
6	Zato ping
8	Zato cache
9	Zato crypto
10	Zato pub/sub demo
11	Zato pub/sub internal
12	Zato IBM MQ
\.


--
-- Data for Name: sec_jwt; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_jwt (id, ttl) FROM stdin;
\.


--
-- Data for Name: sec_multi; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_multi (id, is_active, is_internal, priority, conn_id, conn_type, is_channel, is_outconn, opaque1, security_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: sec_ntlm; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_ntlm (id) FROM stdin;
\.


--
-- Data for Name: sec_oauth; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_oauth (id, proto_version, sig_method, max_nonce_log) FROM stdin;
\.


--
-- Data for Name: sec_openstack; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_openstack (id) FROM stdin;
\.


--
-- Data for Name: sec_tls_ca_cert; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_tls_ca_cert (id, name, value, info, is_active, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: sec_tls_channel; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_tls_channel (id, value) FROM stdin;
\.


--
-- Data for Name: sec_tls_key_cert; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_tls_key_cert (id, info, auth_data) FROM stdin;
\.


--
-- Data for Name: sec_vault_conn; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_vault_conn (id, url, token, default_auth_method, timeout, allow_redirects, tls_verify, tls_key_cert_id, tls_ca_cert_id, service_id) FROM stdin;
\.


--
-- Data for Name: sec_wss_def; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_wss_def (id, reject_empty_nonce_creat, reject_stale_tokens, reject_expiry_limit, nonce_freshness_time) FROM stdin;
7	f	t	3600	3600
\.


--
-- Data for Name: sec_xpath; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sec_xpath (id, username_expr, password_expr) FROM stdin;
\.


--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.server (id, name, host, bind_host, bind_port, preferred_address, crypto_use_tls, last_join_status, last_join_mod_date, last_join_mod_by, up_status, up_mod_date, token, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.service (id, name, is_active, impl_name, is_internal, wsdl, wsdl_name, slow_threshold, opaque1, cluster_id) FROM stdin;
1	zato.security.wss.create	t	zato.server.service.internal.security.wss.Create	t	\N	\N	99999	null	1
2	zato.channel.web-socket.delete	t	zato.server.service.internal.channel.web_socket.Delete	t	\N	\N	99999	null	1
3	zato.security.apikey.edit	t	zato.server.service.internal.security.apikey.Edit	t	\N	\N	99999	null	1
4	zato.cloud.openstack.swift.create	t	zato.server.service.internal.cloud.openstack.swift.Create	t	\N	\N	99999	null	1
5	zato.service.configure-request-response	t	zato.server.service.internal.service.ConfigureRequestResponse	t	\N	\N	99999	null	1
6	zato.email.imap.edit	t	zato.server.service.internal.email.imap.Edit	t	\N	\N	99999	null	1
7	zato.security.vault.policy.get-list	t	zato.server.service.internal.security.vault.policy.GetList	t	\N	\N	99999	null	1
8	zato.message.live-browser.dispatch	t	zato.server.service.internal.message.live_browser.Dispatch	t	\N	\N	99999	null	1
9	zato.security.tls.ca_cert.change-password	t	zato.server.service.internal.security.tls.ca_cert.ChangePassword	t	\N	\N	99999	null	1
10	zato.security.vault.connection.get-list	t	zato.server.service.internal.security.vault.connection.GetList	t	\N	\N	99999	null	1
11	zato.service.slow-response.get	t	zato.server.service.internal.service.GetSlowResponse	t	\N	\N	99999	null	1
12	zato.security.rbac.client-role.get-client-def-list	t	zato.server.service.internal.security.rbac.client_role.GetClientDefList	t	\N	\N	99999	null	1
13	zato.service.edit	t	zato.server.service.internal.service.Edit	t	\N	\N	99999	null	1
14	zato.helpers.input-logger	t	zato.server.service.internal.helpers.InputLogger	t	\N	\N	99999	null	1
15	zato.service.upload-package	t	zato.server.service.internal.service.UploadPackage	t	\N	\N	99999	null	1
16	zato.cloud.openstack.swift.get-list	t	zato.server.service.internal.cloud.openstack.swift.GetList	t	\N	\N	99999	null	1
17	zato.kvdb.data-dict.dictionary.get-list	t	zato.server.service.internal.kvdb.data_dict.dictionary.GetList	t	\N	\N	99999	null	1
18	zato.channel.jms-wmq.edit	t	zato.server.service.internal.channel.jms_wmq.Edit	t	\N	\N	99999	null	1
19	zato.security.tls.ca_cert.delete	t	zato.server.service.internal.security.tls.ca_cert.Delete	t	\N	\N	99999	null	1
20	zato.cache.builtin.create	t	zato.server.service.internal.cache.builtin.Create	t	\N	\N	99999	null	1
21	zato.connector.amqp.create	t	zato.server.service.internal.connector.amqp_.Create	t	\N	\N	99999	null	1
22	zato.http-soap.ping	t	zato.server.service.internal.http_soap.Ping	t	\N	\N	99999	null	1
23	zato.message.namespace.delete	t	zato.server.service.internal.message.namespace.Delete	t	\N	\N	99999	null	1
24	zato.checks.sio.dict-service	t	zato.server.service.internal.checks.sio.DictService	t	\N	\N	99999	null	1
25	zato.scheduler.job.create	t	zato.server.service.internal.scheduler.Create	t	\N	\N	99999	null	1
26	zato.outgoing.ftp.create	t	zato.server.service.internal.outgoing.ftp.Create	t	\N	\N	99999	null	1
27	zato.outgoing.zmq.get-list	t	zato.server.service.internal.outgoing.zmq.GetList	t	\N	\N	99999	null	1
28	zato.security.openstack.create	t	zato.server.service.internal.security.openstack.Create	t	\N	\N	99999	null	1
29	zato.helpers.sio-input-logger	t	zato.server.service.internal.helpers.SIOInputLogger	t	\N	\N	99999	null	1
30	zato.stats.delete	t	zato.server.service.internal.stats.Delete	t	\N	\N	99999	null	1
31	zato.kv_data.auto-clean-up	t	zato.server.service.internal.kv_data.AutoCleanUp	t	\N	\N	99999	null	1
32	zato.outgoing.ftp.get-list	t	zato.server.service.internal.outgoing.ftp.GetList	t	\N	\N	99999	null	1
33	zato.service.get-deployment-info-list	t	zato.server.service.internal.service.GetDeploymentInfoList	t	\N	\N	99999	null	1
34	zato.scheduler.job.delete	t	zato.server.service.internal.scheduler.Delete	t	\N	\N	99999	null	1
35	zato.definition.amqp.get-list	t	zato.server.service.internal.definition.amqp_.GetList	t	\N	\N	99999	null	1
36	zato.security.openstack.delete	t	zato.server.service.internal.security.openstack.Delete	t	\N	\N	99999	null	1
37	zato.message.namespace.get-list	t	zato.server.service.internal.message.namespace.GetList	t	\N	\N	99999	null	1
38	zato.service.has-wsdl	t	zato.server.service.internal.service.HasWSDL	t	\N	\N	99999	null	1
39	zato.ide-deploy.create	t	zato.server.service.internal.ide_deploy.Create	t	\N	\N	99999	null	1
40	zato.helpers.echo	t	zato.server.service.internal.helpers.Echo	t	\N	\N	99999	null	1
41	zato.cache.builtin.edit	t	zato.server.service.internal.cache.builtin.Edit	t	\N	\N	99999	null	1
42	zato.email.imap.delete	t	zato.server.service.internal.email.imap.Delete	t	\N	\N	99999	null	1
43	zato.channel.amqp.create	t	zato.server.service.internal.channel.amqp_.Create	t	\N	\N	99999	null	1
44	zato.security.apikey.create	t	zato.server.service.internal.security.apikey.Create	t	\N	\N	99999	null	1
45	zato.security.rbac.role.get-list	t	zato.server.service.internal.security.rbac.role.GetList	t	\N	\N	99999	null	1
46	zato.security.rbac.client-role.create	t	zato.server.service.internal.security.rbac.client_role.Create	t	\N	\N	99999	null	1
47	zato.checks.sio.boolean-service	t	zato.server.service.internal.checks.sio.BooleanService	t	\N	\N	99999	null	1
48	zato.cloud.aws.s3.edit	t	zato.server.service.internal.cloud.aws.s3.Edit	t	\N	\N	99999	null	1
49	zato.outgoing.sap.edit	t	zato.server.service.internal.outgoing.sap.Edit	t	\N	\N	99999	null	1
50	zato.http-soap.create	t	zato.server.service.internal.http_soap.Create	t	\N	\N	99999	null	1
51	zato.email.smtp.create	t	zato.server.service.internal.email.smtp.Create	t	\N	\N	99999	null	1
52	zato.security.basic-auth.change-password	t	zato.server.service.internal.security.basic_auth.ChangePassword	t	\N	\N	99999	null	1
53	zato.kvdb.data-dict.dictionary.edit	t	zato.server.service.internal.kvdb.data_dict.dictionary.Edit	t	\N	\N	99999	null	1
54	zato.search.es.get-list	t	zato.server.service.internal.search.es.GetList	t	\N	\N	99999	null	1
55	zato.service.set-wsdl	t	zato.server.service.internal.service.SetWSDL	t	\N	\N	99999	null	1
56	zato.security.aws.edit	t	zato.server.service.internal.security.aws.Edit	t	\N	\N	99999	null	1
57	zato.security.xpath.edit	t	zato.server.service.internal.security.xpath.Edit	t	\N	\N	99999	null	1
58	zato.security.vault.connection.delete	t	zato.server.service.internal.security.vault.connection.Delete	t	\N	\N	99999	null	1
59	zato.search.solr.create	t	zato.server.service.internal.search.solr.Create	t	\N	\N	99999	null	1
60	zato.outgoing.jms-wmq.get-list	t	zato.server.service.internal.outgoing.jms_wmq.GetList	t	\N	\N	99999	null	1
61	zato.stats.summary.get-summary-by-month	t	zato.server.service.internal.stats.summary.GetSummaryByMonth	t	\N	\N	99999	null	1
62	zato.security.rbac.role.delete	t	zato.server.service.internal.security.rbac.role.Delete	t	\N	\N	99999	null	1
63	zato.service.get-wsdl	t	zato.server.service.internal.service.GetWSDL	t	\N	\N	99999	null	1
64	zato.security.oauth.change-password	t	zato.server.service.internal.security.oauth.ChangePassword	t	\N	\N	99999	null	1
65	zato.checks.sio.utc-service	t	zato.server.service.internal.checks.sio.UTCService	t	\N	\N	99999	null	1
66	zato.channel.web-socket.get-list	t	zato.server.service.internal.channel.web_socket.GetList	t	\N	\N	99999	null	1
67	zato.outgoing.sql.create	t	zato.server.service.internal.outgoing.sql.Create	t	\N	\N	99999	null	1
68	zato.search.es.delete	t	zato.server.service.internal.search.es.Delete	t	\N	\N	99999	null	1
69	zato.checks.sio.integer-service	t	zato.server.service.internal.checks.sio.IntegerService	t	\N	\N	99999	null	1
70	zato.channel.web-socket.edit	t	zato.server.service.internal.channel.web_socket.Edit	t	\N	\N	99999	null	1
71	zato.definition.jms-wmq.delete	t	zato.server.service.internal.definition.jms_wmq.Delete	t	\N	\N	99999	null	1
72	zato.security.tls.key_cert.create	t	zato.server.service.internal.security.tls.key_cert.Create	t	\N	\N	99999	null	1
73	zato.service.get-channel-list	t	zato.server.service.internal.service.GetChannelList	t	\N	\N	99999	null	1
74	zato.channel.web-socket.client.delete-by-pub-id	t	zato.server.service.internal.channel.web_socket.client.DeleteByPubId	t	\N	\N	99999	null	1
75	zato.definition.amqp.edit	t	zato.server.service.internal.definition.amqp_.Edit	t	\N	\N	99999	null	1
76	pub.zato.service.service-invoker	t	zato.server.service.internal.service.ServiceInvoker	t	\N	\N	99999	null	1
77	zato.outgoing.ftp.change-password	t	zato.server.service.internal.outgoing.ftp.ChangePassword	t	\N	\N	99999	null	1
78	zato.security.jwt.log-out	t	zato.server.service.internal.security.jwt.LogOut	t	\N	\N	99999	null	1
79	zato.checks.sio.no-force-type-service	t	zato.server.service.internal.checks.sio.NoForceTypeService	t	\N	\N	99999	null	1
80	zato.outgoing.sql.edit	t	zato.server.service.internal.outgoing.sql.Edit	t	\N	\N	99999	null	1
81	zato.security.tls.ca_cert.edit	t	zato.server.service.internal.security.tls.ca_cert.Edit	t	\N	\N	99999	null	1
82	zato.security.tls.key_cert.get-list	t	zato.server.service.internal.security.tls.key_cert.GetList	t	\N	\N	99999	null	1
83	zato.cache.builtin.get-list	t	zato.server.service.internal.cache.builtin.GetList	t	\N	\N	99999	null	1
84	zato.security.rbac.client-role.get-list	t	zato.server.service.internal.security.rbac.client_role.GetList	t	\N	\N	99999	null	1
85	zato.outgoing.ftp.delete	t	zato.server.service.internal.outgoing.ftp.Delete	t	\N	\N	99999	null	1
86	zato.checks.sio.as-is-service	t	zato.server.service.internal.checks.sio.AsIsService	t	\N	\N	99999	null	1
87	zato.service.get-by-name	t	zato.server.service.internal.service.GetByName	t	\N	\N	99999	null	1
88	zato.security.xpath.get-list	t	zato.server.service.internal.security.xpath.GetList	t	\N	\N	99999	null	1
89	zato.message.xpath.delete	t	zato.server.service.internal.message.xpath.Delete	t	\N	\N	99999	null	1
90	zato.security.rbac.permission.delete	t	zato.server.service.internal.security.rbac.permission.Delete	t	\N	\N	99999	null	1
91	zato.security.jwt.create	t	zato.server.service.internal.security.jwt.Create	t	\N	\N	99999	null	1
92	zato.info.get-info	t	zato.server.service.internal.info.GetInfo	t	\N	\N	99999	null	1
93	zato.outgoing.odoo.create	t	zato.server.service.internal.outgoing.odoo.Create	t	\N	\N	99999	null	1
94	zato.message.xpath.edit	t	zato.server.service.internal.message.xpath.Edit	t	\N	\N	99999	null	1
95	zato.security.rbac.client-role.delete	t	zato.server.service.internal.security.rbac.client_role.Delete	t	\N	\N	99999	null	1
96	zato.checks.sio.csv-service	t	zato.server.service.internal.checks.sio.CSVService	t	\N	\N	99999	null	1
97	zato.security.jwt.edit	t	zato.server.service.internal.security.jwt.Edit	t	\N	\N	99999	null	1
98	zato.outgoing.zmq.delete	t	zato.server.service.internal.outgoing.zmq.Delete	t	\N	\N	99999	null	1
99	zato.checks.check-service	t	zato.server.service.internal.checks.CheckService	t	\N	\N	99999	null	1
100	zato.security.rbac.role.create	t	zato.server.service.internal.security.rbac.role.Create	t	\N	\N	99999	null	1
101	zato.message.live-browser.get-web-admin-connection-details	t	zato.server.service.internal.message.live_browser.GetWebAdminConnectionDetails	t	\N	\N	99999	null	1
102	zato.channel.web-socket.client.create	t	zato.server.service.internal.channel.web_socket.client.Create	t	\N	\N	99999	null	1
103	zato.message.json_pointer.create	t	zato.server.service.internal.message.json_pointer.Create	t	\N	\N	99999	null	1
104	zato.definition.amqp.change-password	t	zato.server.service.internal.definition.amqp_.ChangePassword	t	\N	\N	99999	null	1
105	zato.security.jwt.change-password	t	zato.server.service.internal.security.jwt.ChangePassword	t	\N	\N	99999	null	1
106	zato.email.imap.create	t	zato.server.service.internal.email.imap.Create	t	\N	\N	99999	null	1
107	zato.definition.amqp.get-by-id	t	zato.server.service.internal.definition.amqp_.GetByID	t	\N	\N	99999	null	1
108	zato.stats.trends.get-trends	t	zato.server.service.internal.stats.trends.GetTrends	t	\N	\N	99999	null	1
109	zato.outgoing.odoo.edit	t	zato.server.service.internal.outgoing.odoo.Edit	t	\N	\N	99999	null	1
110	zato.scheduler.job.execute	t	zato.server.service.internal.scheduler.Execute	t	\N	\N	99999	null	1
111	zato.email.imap.get-list	t	zato.server.service.internal.email.imap.GetList	t	\N	\N	99999	null	1
112	zato.cloud.aws.s3.get-list	t	zato.server.service.internal.cloud.aws.s3.GetList	t	\N	\N	99999	null	1
113	zato.security.jwt.delete	t	zato.server.service.internal.security.jwt.Delete	t	\N	\N	99999	null	1
114	zato.checks.sio.check-target-service	t	zato.server.service.internal.checks.sio.CheckTargetService	t	\N	\N	99999	null	1
115	zato.security.openstack.get-list	t	zato.server.service.internal.security.openstack.GetList	t	\N	\N	99999	null	1
116	zato.cloud.aws.s3.delete	t	zato.server.service.internal.cloud.aws.s3.Delete	t	\N	\N	99999	null	1
117	zato.security.openstack.edit	t	zato.server.service.zato_servicesinternal.security.openstack.Edit	t	\N	\N	99999	null	1
118	zato.definition.cassandra.create	t	zato.server.service.internal.definition.cassandra.Create	t	\N	\N	99999	null	1
119	zato.security.wss.change-password	t	zato.server.service.internal.security.wss.ChangePassword	t	\N	\N	99999	null	1
120	zato.definition.cassandra.edit	t	zato.server.service.internal.definition.cassandra.Edit	t	\N	\N	99999	null	1
121	zato.message.xpath.get-list	t	zato.server.service.internal.message.xpath.GetList	t	\N	\N	99999	null	1
122	zato.channel.web-socket.subscription.delete	t	zato.server.service.internal.channel.web_socket.subscription.Delete	t	\N	\N	99999	null	1
123	zato.query.cassandra.delete	t	zato.server.service.internal.query.cassandra.Delete	t	\N	\N	99999	null	1
124	zato.message.json_pointer.edit	t	zato.server.service.internal.message.json_pointer.Edit	t	\N	\N	99999	null	1
125	zato.email.smtp.change-password	t	zato.server.service.internal.email.smtp.ChangePassword	t	\N	\N	99999	null	1
126	zato.http-soap.delete	t	zato.server.service.internal.http_soap.Delete	t	\N	\N	99999	null	1
127	zato.kvdb.data-dict.translation.create	t	zato.server.service.internal.kvdb.data_dict.translation.Create	t	\N	\N	99999	null	1
128	zato.security.rbac.permission.edit	t	zato.server.service.internal.security.rbac.permission.Edit	t	\N	\N	99999	null	1
129	zato.security.aws.change-password	t	zato.server.service.internal.security.aws.ChangePassword	t	\N	\N	99999	null	1
130	zato.outgoing.sql.ping	t	zato.server.service.internal.outgoing.sql.Ping	t	\N	\N	99999	null	1
131	zato.security.oauth.delete	t	zato.server.service.internal.security.oauth.Delete	t	\N	\N	99999	null	1
132	zato.outgoing.amqp.create	t	zato.server.service.internal.outgoing.amqp_.Create	t	\N	\N	99999	null	1
133	zato.outgoing.sql.change-password	t	zato.server.service.internal.outgoing.sql.ChangePassword	t	\N	\N	99999	null	1
134	zato.scheduler.job.get-list	t	zato.server.service.internal.scheduler.GetList	t	\N	\N	99999	null	1
135	zato.outgoing.jms-wmq.delete	t	zato.server.service.internal.outgoing.jms_wmq.Delete	t	\N	\N	99999	null	1
136	zato.security.basic-auth.create	t	zato.server.service.internal.security.basic_auth.Create	t	\N	\N	99999	null	1
137	zato.security.xpath.create	t	zato.server.service.internal.security.xpath.Create	t	\N	\N	99999	null	1
138	zato.kvdb.remote-command.execute	t	zato.server.service.internal.kvdb.ExecuteCommand	t	\N	\N	99999	null	1
139	zato.outgoing.odoo.get-list	t	zato.server.service.internal.outgoing.odoo.GetList	t	\N	\N	99999	null	1
140	zato.channel.web-socket.client.delete-by-server	t	zato.server.service.internal.channel.web_socket.client.DeleteByServer	t	\N	\N	99999	null	1
141	zato.security.aws.create	t	zato.server.service.internal.security.aws.Create	t	\N	\N	99999	null	1
142	zato.kvdb.data-dict.impexp.import	t	zato.server.service.internal.kvdb.data_dict.impexp.Import	t	\N	\N	99999	null	1
143	zato.outgoing.zmq.create	t	zato.server.service.internal.outgoing.zmq.Create	t	\N	\N	99999	null	1
144	zato.security.rbac.permission.create	t	zato.server.service.internal.security.rbac.permission.Create	t	\N	\N	99999	null	1
145	zato.definition.jms-wmq.get-list	t	zato.server.service.internal.definition.jms_wmq.GetList	t	\N	\N	99999	null	1
146	zato.kvdb.data-dict.translation.get-last-id	t	zato.server.service.internal.kvdb.data_dict.translation.GetLastID	t	\N	\N	99999	null	1
147	zato.security.oauth.get-list	t	zato.server.service.internal.security.oauth.GetList	t	\N	\N	99999	null	1
148	zato.cloud.aws.s3.create	t	zato.server.service.internal.cloud.aws.s3.Create	t	\N	\N	99999	null	1
149	zato.hot-deploy.create	t	zato.server.service.internal.hot_deploy.Create	t	\N	\N	99999	null	1
150	zato.security.vault.connection.edit	t	zato.server.service.internal.security.vault.connection.Edit	t	\N	\N	99999	null	1
151	zato.definition.jms-wmq.edit	t	zato.server.service.internal.definition.jms_wmq.Edit	t	\N	\N	99999	null	1
152	zato.service.get-list	t	zato.server.service.internal.service.GetList	t	\N	\N	99999	null	1
153	zato.checks.sio.list-of-dicts-service	t	zato.server.service.internal.checks.sio.ListOfDictsService	t	\N	\N	99999	null	1
154	zato.scheduler.job.get-by-name	t	zato.server.service.internal.scheduler.GetByName	t	\N	\N	99999	null	1
155	zato.stats.summary.get-summary-by-range	t	zato.server.service.internal.stats.summary.GetSummaryByRange	t	\N	\N	99999	null	1
156	zato.security.tls.key_cert.delete	t	zato.server.service.internal.security.tls.key_cert.Delete	t	\N	\N	99999	null	1
157	zato.outgoing.amqp.edit	t	zato.server.service.internal.outgoing.amqp_.Edit	t	\N	\N	99999	null	1
158	zato.server.edit	t	zato.server.service.internal.server.Edit	t	\N	\N	99999	null	1
159	zato.security.rbac.permission.get-list	t	zato.server.service.internal.security.rbac.permission.GetList	t	\N	\N	99999	null	1
160	zato.channel.amqp.get-list	t	zato.server.service.internal.channel.amqp_.GetList	t	\N	\N	99999	null	1
161	zato.server.delete	t	zato.server.service.internal.server.Delete	t	\N	\N	99999	null	1
162	zato.channel.zmq.create	t	zato.server.service.internal.channel.zmq.Create	t	\N	\N	99999	null	1
163	zato.checks.sio.nested-service	t	zato.server.service.internal.checks.sio.NestedService	t	\N	\N	99999	null	1
164	zato.security.rbac.role-permission.create	t	zato.server.service.internal.security.rbac.role_permission.Create	t	\N	\N	99999	null	1
165	zato.definition.cassandra.get-by-id	t	zato.server.service.internal.definition.cassandra.GetByID	t	\N	\N	99999	null	1
166	zato.kvdb.data-dict.dictionary.get-system-list	t	zato.server.service.internal.kvdb.data_dict.dictionary.GetSystemList	t	\N	\N	99999	null	1
167	zato.kvdb.data-dict.dictionary.get-value-list	t	zato.server.service.internal.kvdb.data_dict.dictionary.GetValueList	t	\N	\N	99999	null	1
168	zato.message.json_pointer.delete	t	zato.server.service.internal.message.json_pointer.Delete	t	\N	\N	99999	null	1
169	zato.security.jwt.auto-clean-up	t	zato.server.service.internal.security.jwt.AutoCleanUp	t	\N	\N	99999	null	1
170	zato.outgoing.sql.delete	t	zato.server.service.internal.outgoing.sql.Delete	t	\N	\N	99999	null	1
171	zato.cloud.openstack.swift.delete	t	zato.server.service.internal.cloud.openstack.swift.Delete	t	\N	\N	99999	null	1
172	zato.security.apikey.change-password	t	zato.server.service.internal.security.apikey.ChangePassword	t	\N	\N	99999	null	1
173	zato.search.solr.delete	t	zato.server.service.internal.search.solr.Delete	t	\N	\N	99999	null	1
174	zato.security.openstack.change-password	t	zato.server.service.internal.security.openstack.ChangePassword	t	\N	\N	99999	null	1
175	zato.kvdb.data-dict.dictionary.delete	t	zato.server.service.internal.kvdb.data_dict.dictionary.Delete	t	\N	\N	99999	null	1
176	zato.security.get-list	t	zato.server.service.internal.security.GetList	t	\N	\N	99999	null	1
177	zato.http-soap.edit	t	zato.server.service.internal.http_soap.Edit	t	\N	\N	99999	null	1
178	zato.definition.jms-wmq.get-by-id	t	zato.server.service.internal.definition.jms_wmq.GetByID	t	\N	\N	99999	null	1
179	zato.kvdb.data-dict.translation.edit	t	zato.server.service.internal.kvdb.data_dict.translation.Edit	t	\N	\N	99999	null	1
180	zato.channel.web-socket.subscription.create	t	zato.server.service.internal.channel.web_socket.subscription.Create	t	\N	\N	99999	null	1
181	zato.security.basic-auth.get-list	t	zato.server.service.internal.security.basic_auth.GetList	t	\N	\N	99999	null	1
182	zato.definition.amqp.delete	t	zato.server.service.internal.definition.amqp_.Delete	t	\N	\N	99999	null	1
183	zato.channel.web-socket.create	t	zato.server.service.internal.channel.web_socket.Create	t	\N	\N	99999	null	1
184	zato.service.get-source-info	t	zato.server.service.internal.service.GetSourceInfo	t	\N	\N	99999	null	1
185	zato.security.rbac.role-permission.get-list	t	zato.server.service.internal.security.rbac.role_permission.GetList	t	\N	\N	99999	null	1
186	zato.message.namespace.create	t	zato.server.service.internal.message.namespace.Create	t	\N	\N	99999	null	1
187	zato.search.solr.get-list	t	zato.server.service.internal.search.solr.GetList	t	\N	\N	99999	null	1
188	zato.notif.cloud.sql.delete	t	zato.server.service.internal.notif.cloud.sql.Delete	t	\N	\N	99999	null	1
189	zato.security.rbac.role-permission.delete	t	zato.server.service.internal.security.rbac.role_permission.Delete	t	\N	\N	99999	null	1
190	zato.query.cassandra.get-list	t	zato.server.service.internal.query.cassandra.GetList	t	\N	\N	99999	null	1
191	zato.channel.web-socket.invalidate-token	t	zato.server.service.internal.channel.web_socket.InvalidateToken	t	\N	\N	99999	null	1
192	zato.outgoing.amqp.get-list	t	zato.server.service.internal.outgoing.amqp_.GetList	t	\N	\N	99999	null	1
193	zato.security.tls.ca_cert.get-list	t	zato.server.service.internal.security.tls.ca_cert.GetList	t	\N	\N	99999	null	1
194	zato.security.oauth.edit	t	zato.server.service.internal.security.oauth.Edit	t	\N	\N	99999	null	1
195	zato.server.get-by-id	t	zato.server.service.internal.server.GetByID	t	\N	\N	99999	null	1
196	zato.definition.amqp.create	t	zato.server.service.internal.definition.amqp_.Create	t	\N	\N	99999	null	1
197	zato.channel.jms-wmq.delete	t	zato.server.service.internal.channel.jms_wmq.Delete	t	\N	\N	99999	null	1
198	zato.channel.amqp.delete	t	zato.server.service.internal.channel.amqp_.Delete	t	\N	\N	99999	null	1
199	zato.outgoing.zmq.edit	t	zato.server.service.internal.outgoing.zmq.Edit	t	\N	\N	99999	null	1
200	zato.stats.summary.get-summary-by-week	t	zato.server.service.internal.stats.summary.GetSummaryByWeek	t	\N	\N	99999	null	1
201	zato.security.xpath.delete	t	zato.server.service.internal.security.xpath.Delete	t	\N	\N	99999	null	1
202	zato.security.vault.policy.delete	t	zato.server.service.internal.security.vault.policy.Delete	t	\N	\N	99999	null	1
203	zato.security.jwt.log-in	t	zato.server.service.internal.security.jwt.LogIn	t	\N	\N	99999	null	1
204	zato.channel.web-socket.get-token	t	zato.server.service.internal.channel.web_socket.GetToken	t	\N	\N	99999	null	1
205	zato.channel.jms-wmq.get-list	t	zato.server.service.internal.channel.jms_wmq.GetList	t	\N	\N	99999	null	1
206	zato.outgoing.jms-wmq.edit	t	zato.server.service.internal.outgoing.jms_wmq.Edit	t	\N	\N	99999	null	1
207	zato.message.xpath.create	t	zato.server.service.internal.message.xpath.Create	t	\N	\N	99999	null	1
208	zato.security.basic-auth.delete	t	zato.server.service.internal.security.basic_auth.Delete	t	\N	\N	99999	null	1
209	zato.http-soap.get-list	t	zato.server.service.internal.http_soap.GetList	t	\N	\N	99999	null	1
210	zato.search.es.create	t	zato.server.service.internal.search.es.Create	t	\N	\N	99999	null	1
211	zato.message.json_pointer.get-list	t	zato.server.service.internal.message.json_pointer.GetList	t	\N	\N	99999	null	1
212	zato.security.jwt.get-list	t	zato.server.service.internal.security.jwt.GetList	t	\N	\N	99999	null	1
213	zato.outgoing.sap.get-list	t	zato.server.service.internal.outgoing.sap.GetList	t	\N	\N	99999	null	1
214	zato.service.delete	t	zato.server.service.internal.service.Delete	t	\N	\N	99999	null	1
215	zato.security.aws.delete	t	zato.server.service.internal.security.aws.Delete	t	\N	\N	99999	null	1
216	zato.kvdb.data-dict.translation.get-list	t	zato.server.service.internal.kvdb.data_dict.translation.GetList	t	\N	\N	99999	null	1
217	zato.outgoing.jms-wmq.create	t	zato.server.service.internal.outgoing.jms_wmq.Create	t	\N	\N	99999	null	1
218	zato.notif.cloud.openstack.swift.edit	t	zato.server.service.internal.notif.cloud.openstack.swift.Edit	t	\N	\N	99999	null	1
219	zato.security.apikey.delete	t	zato.server.service.internal.security.apikey.Delete	t	\N	\N	99999	null	1
220	zato.checks.sio.unicode-service	t	zato.server.service.internal.checks.sio.UnicodeService	t	\N	\N	99999	null	1
221	zato.outgoing.odoo.change-password	t	zato.server.service.internal.outgoing.odoo.ChangePassword	t	\N	\N	99999	null	1
222	zato.channel.zmq.edit	t	zato.server.service.internal.channel.zmq.Edit	t	\N	\N	99999	null	1
223	zato.channel.zmq.get-list	t	zato.server.service.internal.channel.zmq.GetList	t	\N	\N	99999	null	1
224	zato.search.solr.edit	t	zato.server.service.internal.search.solr.Edit	t	\N	\N	99999	null	1
225	zato.security.vault.policy.edit	t	zato.server.service.internal.security.vault.policy.Edit	t	\N	\N	99999	null	1
226	zato.security.wss.edit	t	zato.server.service.internal.security.wss.Edit	t	\N	\N	99999	null	1
227	zato.stats.summary.get-summary-by-day	t	zato.server.service.internal.stats.summary.GetSummaryByDay	t	\N	\N	99999	null	1
228	zato.security.oauth.create	t	zato.server.service.internal.security.oauth.Create	t	\N	\N	99999	null	1
229	zato.info.get-server-info	t	zato.server.service.internal.info.GetServerInfo	t	\N	\N	99999	null	1
230	zato.cloud.openstack.swift.edit	t	zato.server.service.internal.cloud.openstack.swift.Edit	t	\N	\N	99999	null	1
231	zato.channel.zmq.delete	t	zato.server.service.internal.channel.zmq.Delete	t	\N	\N	99999	null	1
232	zato.email.imap.change-password	t	zato.server.service.internal.email.imap.ChangePassword	t	\N	\N	99999	null	1
233	zato.checks.sio.list-service	t	zato.server.service.internal.checks.sio.ListService	t	\N	\N	99999	null	1
234	zato.cache.builtin.delete	t	zato.server.service.internal.cache.builtin.Delete	t	\N	\N	99999	null	1
235	zato.checks.sio.check-sio	t	zato.server.service.internal.checks.sio.CheckSIO	t	\N	\N	99999	null	1
236	zato.security.wss.delete	t	zato.server.service.internal.security.wss.Delete	t	\N	\N	99999	null	1
237	zato.outgoing.sql.get-list	t	zato.server.service.internal.outgoing.sql.GetList	t	\N	\N	99999	null	1
238	zato.stats.summary.get-summary-by-year	t	zato.server.service.internal.stats.summary.GetSummaryByYear	t	\N	\N	99999	null	1
239	zato.definition.cassandra.delete	t	zato.server.service.internal.definition.cassandra.Delete	t	\N	\N	99999	null	1
240	zato.email.smtp.edit	t	zato.server.service.internal.email.smtp.Edit	t	\N	\N	99999	null	1
241	zato.kvdb.data-dict.dictionary.get-key-list	t	zato.server.service.internal.kvdb.data_dict.dictionary.GetKeyList	t	\N	\N	99999	null	1
242	zato.email.smtp.delete	t	zato.server.service.internal.email.smtp.Delete	t	\N	\N	99999	null	1
243	zato.outgoing.sap.create	t	zato.server.service.internal.outgoing.sap.Create	t	\N	\N	99999	null	1
244	zato.outgoing.ftp.edit	t	zato.server.service.internal.outgoing.ftp.Edit	t	\N	\N	99999	null	1
245	zato.kvdb.data-dict.dictionary.create	t	zato.server.service.internal.kvdb.data_dict.dictionary.Create	t	\N	\N	99999	null	1
246	zato.security.basic-auth.edit	t	zato.server.service.internal.security.basic_auth.Edit	t	\N	\N	99999	null	1
247	zato.definition.jms-wmq.create	t	zato.server.service.internal.definition.jms_wmq.Create	t	\N	\N	99999	null	1
248	zato.notif.cloud.openstack.swift.create	t	zato.server.service.internal.notif.cloud.openstack.swift.Create	t	\N	\N	99999	null	1
249	zato.email.imap.ping	t	zato.server.service.internal.email.imap.Ping	t	\N	\N	99999	null	1
250	zato.outgoing.sap.delete	t	zato.server.service.internal.outgoing.sap.Delete	t	\N	\N	99999	null	1
251	zato.security.aws.get-list	t	zato.server.service.internal.security.aws.GetList	t	\N	\N	99999	null	1
252	zato.security.apikey.get-list	t	zato.server.service.internal.security.apikey.GetList	t	\N	\N	99999	null	1
253	zato.security.vault.policy.create	t	zato.server.service.internal.security.vault.policy.Create	t	\N	\N	99999	null	1
254	zato.stats.get-by-service	t	zato.server.service.internal.stats.GetByService	t	\N	\N	99999	null	1
255	zato.security.vault.connection.create	t	zato.server.service.internal.security.vault.connection.Create	t	\N	\N	99999	null	1
256	zato.query.cassandra.edit	t	zato.server.service.internal.query.cassandra.Edit	t	\N	\N	99999	null	1
257	zato.notif.cloud.sql.get-list	t	zato.server.service.internal.notif.cloud.sql.GetList	t	\N	\N	99999	null	1
258	zato.notif.cloud.sql.create	t	zato.server.service.internal.notif.cloud.sql.Create	t	\N	\N	99999	null	1
259	zato.channel.jms-wmq.create	t	zato.server.service.internal.channel.jms_wmq.Create	t	\N	\N	99999	null	1
260	zato.outgoing.amqp.delete	t	zato.server.service.internal.outgoing.amqp_.Delete	t	\N	\N	99999	null	1
261	zato.notif.cloud.sql.edit	t	zato.server.service.internal.notif.cloud.sql.Edit	t	\N	\N	99999	null	1
262	zato.definition.cassandra.get-list	t	zato.server.service.internal.definition.cassandra.GetList	t	\N	\N	99999	null	1
263	zato.outgoing.sap.change-password	t	zato.server.service.internal.outgoing.sap.ChangePassword	t	\N	\N	99999	null	1
264	zato.security.wss.get-list	t	zato.server.service.internal.security.wss.GetList	t	\N	\N	99999	null	1
265	zato.security.xpath.change-password	t	zato.server.service.internal.security.xpath.ChangePassword	t	\N	\N	99999	null	1
266	zato.email.smtp.get-list	t	zato.server.service.internal.email.smtp.GetList	t	\N	\N	99999	null	1
267	zato.service.get-request-response	t	zato.server.service.internal.service.GetRequestResponse	t	\N	\N	99999	null	1
268	zato.security.tls.ca_cert.create	t	zato.server.service.internal.security.tls.ca_cert.Create	t	\N	\N	99999	null	1
269	zato.scheduler.job.edit	t	zato.server.service.internal.scheduler.Edit	t	\N	\N	99999	null	1
270	zato.kvdb.data-dict.translation.translate	t	zato.server.service.internal.kvdb.data_dict.translation.Translate	t	\N	\N	99999	null	1
271	zato.kvdb.data-dict.translation.delete	t	zato.server.service.internal.kvdb.data_dict.translation.Delete	t	\N	\N	99999	null	1
272	zato.notif.cloud.openstack.swift.delete	t	zato.server.service.internal.notif.cloud.openstack.swift.Delete	t	\N	\N	99999	null	1
273	zato.outgoing.odoo.delete	t	zato.server.service.internal.outgoing.odoo.Delete	t	\N	\N	99999	null	1
274	zato.security.tls.key_cert.edit	t	zato.server.service.internal.security.tls.key_cert.Edit	t	\N	\N	99999	null	1
275	zato.message.namespace.edit	t	zato.server.service.internal.message.namespace.Edit	t	\N	\N	99999	null	1
276	zato.notif.cloud.openstack.swift.get-list	t	zato.server.service.internal.notif.cloud.openstack.swift.GetList	t	\N	\N	99999	null	1
277	zato.search.es.edit	t	zato.server.service.internal.search.es.Edit	t	\N	\N	99999	null	1
278	zato.security.rbac.role.edit	t	zato.server.service.internal.security.rbac.role.Edit	t	\N	\N	99999	null	1
279	zato.service.slow-response.get-list	t	zato.server.service.internal.service.GetSlowResponseList	t	\N	\N	99999	null	1
280	zato.email.smtp.ping	t	zato.server.service.internal.email.smtp.Ping	t	\N	\N	99999	null	1
281	zato.service.invoke	t	zato.server.service.internal.service.Invoke	t	\N	\N	99999	null	1
282	zato.kvdb.data-dict.dictionary.get-last-id	t	zato.server.service.internal.kvdb.data_dict.dictionary.GetLastID	t	\N	\N	99999	null	1
283	zato.outgoing.odoo.ping	t	zato.server.service.internal.outgoing.odoo.Ping	t	\N	\N	99999	null	1
284	zato.channel.amqp.edit	t	zato.server.service.internal.channel.amqp_.Edit	t	\N	\N	99999	null	1
285	zato.query.cassandra.create	t	zato.server.service.internal.query.cassandra.Create	t	\N	\N	99999	null	1
286	zato.ping	t	zato.server.service.internal.Ping	t	\N	\N	99999	null	1
287	zato.cache.builtin.pubapi.set-contains	t	zato.server.service.internal.cache.builtin.pubapi.SetContains	t	\N	\N	99999	null	1
288	zato.cache.builtin.pubapi.set-contains-any	t	zato.server.service.internal.cache.builtin.pubapi.SetContainsAny	t	\N	\N	99999	null	1
289	zato.cache.builtin.pubapi.delete-by-regex	t	zato.server.service.internal.cache.builtin.pubapi.DeleteByRegex	t	\N	\N	99999	null	1
290	zato.cache.builtin.pubapi.set-contains-all	t	zato.server.service.internal.cache.builtin.pubapi.SetContainsAll	t	\N	\N	99999	null	1
291	zato.cache.builtin.pubapi.expire-by-suffix	t	zato.server.service.internal.cache.builtin.pubapi.ExpireBySuffix	t	\N	\N	99999	null	1
292	zato.cache.builtin.pubapi.delete-not-contains	t	zato.server.service.internal.cache.builtin.pubapi.DeleteNotContains	t	\N	\N	99999	null	1
293	zato.cache.builtin.pubapi.delete-by-suffix	t	zato.server.service.internal.cache.builtin.pubapi.DeleteBySuffix	t	\N	\N	99999	null	1
294	zato.cache.builtin.pubapi.expire-by-prefix	t	zato.server.service.internal.cache.builtin.pubapi.ExpireByPrefix	t	\N	\N	99999	null	1
295	zato.cache.builtin.pubapi.expire-contains-all	t	zato.server.service.internal.cache.builtin.pubapi.ExpireContainsAll	t	\N	\N	99999	null	1
296	zato.cache.builtin.pubapi.delete-contains	t	zato.server.service.internal.cache.builtin.pubapi.DeleteContains	t	\N	\N	99999	null	1
297	zato.cache.builtin.pubapi.expire-contains-any	t	zato.server.service.internal.cache.builtin.pubapi.ExpireContainsAny	t	\N	\N	99999	null	1
298	zato.cache.builtin.pubapi.expire-contains	t	zato.server.service.internal.cache.builtin.pubapi.ExpireContains	t	\N	\N	99999	null	1
299	zato.cache.builtin.pubapi.single-key-service	t	zato.server.service.internal.cache.builtin.pubapi.SingleKeyService	t	\N	\N	99999	null	1
300	zato.cache.builtin.pubapi.set-by-prefix	t	zato.server.service.internal.cache.builtin.pubapi.SetByPrefix	t	\N	\N	99999	null	1
301	zato.cache.builtin.pubapi.set-not-contains	t	zato.server.service.internal.cache.builtin.pubapi.SetNotContains	t	\N	\N	99999	null	1
302	zato.cache.builtin.pubapi.expire-not-contains	t	zato.server.service.internal.cache.builtin.pubapi.ExpireNotContains	t	\N	\N	99999	null	1
303	zato.cache.builtin.pubapi.delete-contains-any	t	zato.server.service.internal.cache.builtin.pubapi.DeleteContainsAny	t	\N	\N	99999	null	1
304	zato.cache.builtin.pubapi.set-by-suffix	t	zato.server.service.internal.cache.builtin.pubapi.SetBySuffix	t	\N	\N	99999	null	1
305	zato.cache.builtin.pubapi.expire-by-regex	t	zato.server.service.internal.cache.builtin.pubapi.ExpireByRegex	t	\N	\N	99999	null	1
306	zato.cache.builtin.pubapi.delete-contains-all	t	zato.server.service.internal.cache.builtin.pubapi.DeleteContainsAll	t	\N	\N	99999	null	1
307	zato.cache.builtin.pubapi.delete-by-prefix	t	zato.server.service.internal.cache.builtin.pubapi.DeleteByPrefix	t	\N	\N	99999	null	1
308	zato.cache.builtin.pubapi.set-by-regex	t	zato.server.service.internal.cache.builtin.pubapi.SetByRegex	t	\N	\N	99999	null	1
309	zato.crypto.encrypt	t	zato.server.service.internal.crypto.Encrypt	t	\N	\N	99999	null	1
310	zato.crypto.hash-secret	t	zato.server.service.internal.crypto.HashSecret	t	\N	\N	99999	null	1
311	zato.crypto.generate-password	t	zato.server.service.internal.crypto.GeneratePassword	t	\N	\N	99999	null	1
312	zato.crypto.decrypt	t	zato.server.service.internal.crypto.Decrypt	t	\N	\N	99999	null	1
313	zato.crypto.verify-hash	t	zato.server.service.internal.crypto.VerifyHash	t	\N	\N	99999	null	1
314	zato.crypto.generate-secret	t	zato.server.service.internal.crypto.GenerateSecret	t	\N	\N	99999	null	1
315	zato.pubsub.pubapi.topic-service	t	zato.server.service.internal.pubsub.pubapi.TopicService	t	\N	\N	99999	null	1
316	zato.pubsub.pubapi.subscribe-service	t	zato.server.service.internal.pubsub.pubapi.SubscribeService	t	\N	\N	99999	null	1
317	zato.pubsub.pubapi.message-service	t	zato.server.service.internal.pubsub.pubapi.MessageService	t	\N	\N	99999	null	1
318	zato.pubsub.helpers.json-raw-request-logger	t	zato.server.service.internal.helpers.JSONRawRequestLogger	t	\N	\N	99999	null	1
319	zato.channel.jms-wmq.on-message-received	t	zato.server.service.internal.channel.jms_wmq.OnMessageReceived	t	\N	\N	99999	null	1
320	zato.sso.user.create	t	zato.server.service.internal.sso.user.Create	t	\N	\N	99999	null	1
321	zato.sso.user.signup	t	zato.server.service.internal.sso.user.Signup	t	\N	\N	99999	null	1
322	zato.sso.user.approve	t	zato.server.service.internal.sso.user.Approve	t	\N	\N	99999	null	1
323	zato.sso.user.reject	t	zato.server.service.internal.sso.user.Reject	t	\N	\N	99999	null	1
324	zato.sso.user.login	t	zato.server.service.internal.sso.user.Login	t	\N	\N	99999	null	1
325	zato.sso.user.logout	t	zato.server.service.internal.sso.user.Logout	t	\N	\N	99999	null	1
326	zato.sso.user.user	t	zato.server.service.internal.sso.user.User	t	\N	\N	99999	null	1
327	zato.sso.user.password	t	zato.server.service.internal.sso.user.Password	t	\N	\N	99999	null	1
328	zato.sso.user.search	t	zato.server.service.internal.sso.user.Search	t	\N	\N	99999	null	1
329	zato.sso.session.session	t	zato.server.service.internal.sso.session.Session	t	\N	\N	99999	null	1
330	zato.sso.user.password-reset.begin	t	zato.server.service.internal.sso.password_reset.Begin	t	\N	\N	99999	null	1
331	zato.sso.user.password-reset.complete	t	zato.server.service.internal.sso.password_reset.Complete	t	\N	\N	99999	null	1
332	zato.sso.user-attr.user-attr	t	zato.server.service.internal.sso.user_attr.UserAttr	t	\N	\N	99999	null	1
333	zato.sso.user-attr.user-attr-exists	t	zato.server.service.internal.sso.user_attr.UserAttrExists	t	\N	\N	99999	null	1
334	zato.sso.user-attr.user-attr-names	t	zato.server.service.internal.sso.user_attr.UserAttrNames	t	\N	\N	99999	null	1
335	zato.sso.session-attr.session-attr	t	zato.server.service.internal.sso.session_attr.SessionAttr	t	\N	\N	99999	null	1
336	zato.sso.session-attr.session-attr-exists	t	zato.server.service.internal.sso.session_attr.SessionAttrExists	t	\N	\N	99999	null	1
337	zato.sso.session-attr.session-attr-names	t	zato.server.service.internal.sso.session_attr.SessionAttrNames	t	\N	\N	99999	null	1
\.


--
-- Data for Name: sms_twilio; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sms_twilio (id, name, is_active, is_internal, account_sid, auth_token, default_from, default_to, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: sql_pool; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.sql_pool (id, name, is_active, username, password, db_name, engine, extra, host, port, pool_size, opaque1, cluster_id) FROM stdin;
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.user_profile (id, timezone, date_format, time_format, user_id) FROM stdin;
\.


--
-- Data for Name: web_socket_cli_ps_keys; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.web_socket_cli_ps_keys (id, sub_key, opaque1, client_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: web_socket_client; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.web_socket_client (id, is_internal, pub_client_id, ext_client_id, ext_client_name, local_address, peer_address, peer_fqdn, connection_time, last_seen, server_proc_pid, server_name, opaque1, channel_id, server_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: web_socket_sub; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.web_socket_sub (id, is_internal, ext_client_id, sub_key, opaque1, channel_id, subscription_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: zato_sso_attr; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.zato_sso_attr (id, creation_time, last_modified, expiration_time, is_session_attr, is_encrypted, serial_method, name, value, _ust_string, user_id, ust) FROM stdin;
\.


--
-- Data for Name: zato_sso_session; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.zato_sso_session (id, ust, creation_time, expiration_time, remote_addr, user_agent, user_id) FROM stdin;
\.


--
-- Data for Name: zato_sso_user; Type: TABLE DATA; Schema: public; Owner: zato
--

COPY public.zato_sso_user (id, user_id, is_active, is_internal, is_super_user, is_locked, locked_time, creation_ctx, locked_by, approval_status, approval_status_mod_time, approval_status_mod_by, username, password, password_is_set, password_must_change, password_last_set, password_expiry, sign_up_status, sign_up_time, sign_up_confirm_time, sign_up_confirm_token, email, display_name, first_name, middle_name, last_name, display_name_upper, first_name_upper, middle_name_upper, last_name_upper) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: aws_s3_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.aws_s3_seq', 1, false);


--
-- Name: cache_builtin_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.cache_builtin_seq', 33, true);


--
-- Name: channel_amqp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.channel_amqp_seq', 1, false);


--
-- Name: channel_stomp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.channel_stomp_seq', 1, false);


--
-- Name: channel_wmq_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.channel_wmq_seq', 1, false);


--
-- Name: channel_zmq_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.channel_zmq_seq', 1, false);


--
-- Name: cluster_color_marker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.cluster_color_marker_id_seq', 1, false);


--
-- Name: cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.cluster_id_seq', 33, true);


--
-- Name: conn_def_amqp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.conn_def_amqp_seq', 1, false);


--
-- Name: conn_def_cassandra_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.conn_def_cassandra_seq', 1, false);


--
-- Name: conn_def_wmq_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.conn_def_wmq_seq', 1, false);


--
-- Name: depl_package_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.depl_package_seq', 1, false);


--
-- Name: depl_status_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.depl_status_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 13, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.django_site_id_seq', 129273, true);


--
-- Name: email_imap_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.email_imap_seq', 1, false);


--
-- Name: email_smtp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.email_smtp_seq', 1, false);


--
-- Name: generic_conn_client_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.generic_conn_client_seq', 1, false);


--
-- Name: generic_conn_def_sec_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.generic_conn_def_sec_seq', 1, false);


--
-- Name: generic_conn_def_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.generic_conn_def_seq', 1, false);


--
-- Name: generic_conn_sec_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.generic_conn_sec_seq', 1, false);


--
-- Name: http_soap_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.http_soap_seq', 693, true);


--
-- Name: install_state_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.install_state_seq', 33, true);


--
-- Name: job_cron_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.job_cron_seq', 1, false);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.job_id_seq', 1, false);


--
-- Name: job_intrvl_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.job_intrvl_seq', 1, false);


--
-- Name: kv_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.kv_data_id_seq', 1, false);


--
-- Name: msg_json_pointer_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.msg_json_pointer_seq', 1, false);


--
-- Name: msg_ns_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.msg_ns_seq', 1, false);


--
-- Name: msg_xpath_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.msg_xpath_seq', 1, false);


--
-- Name: os_swift_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.os_swift_seq', 1, false);


--
-- Name: out_amqp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_amqp_seq', 1, false);


--
-- Name: out_ftp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_ftp_seq', 1, false);


--
-- Name: out_odoo_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_odoo_seq', 1, false);


--
-- Name: out_sap_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_sap_seq', 1, false);


--
-- Name: out_stomp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_stomp_seq', 1, false);


--
-- Name: out_wmq_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_wmq_seq', 1, false);


--
-- Name: out_zmq_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.out_zmq_seq', 1, false);


--
-- Name: pubsub_channel_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_channel_seq', 1, false);


--
-- Name: pubsub_endp_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_endp_seq', 33, true);


--
-- Name: pubsub_endpt_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_endpt_seq', 1, false);


--
-- Name: pubsub_msg_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_msg_seq', 1, false);


--
-- Name: pubsub_sub_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_sub_seq', 33, true);


--
-- Name: pubsub_topic_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.pubsub_topic_seq', 33, true);


--
-- Name: query_cassandra_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.query_cassandra_seq', 1, false);


--
-- Name: rbac_cli_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.rbac_cli_rol_seq', 33, true);


--
-- Name: rbac_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.rbac_perm_seq', 33, true);


--
-- Name: rbac_role_perm_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.rbac_role_perm_seq', 33, true);


--
-- Name: rbac_role_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.rbac_role_seq', 33, true);


--
-- Name: search_es_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.search_es_seq', 1, false);


--
-- Name: search_solr_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.search_solr_seq', 1, false);


--
-- Name: sec_base_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.sec_base_seq', 33, true);


--
-- Name: sec_multi_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.sec_multi_seq', 1, false);


--
-- Name: sec_tls_ca_cert_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.sec_tls_ca_cert_seq', 1, false);


--
-- Name: server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.server_id_seq', 1, false);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.service_id_seq', 363, true);


--
-- Name: sms_twilio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.sms_twilio_id_seq', 1, false);


--
-- Name: sql_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.sql_pool_id_seq', 1, false);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 1, false);


--
-- Name: web_socket_chan_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.web_socket_chan_seq', 1, false);


--
-- Name: web_socket_cli_ps_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.web_socket_cli_ps_seq', 1, false);


--
-- Name: web_socket_cli_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.web_socket_cli_seq', 1, false);


--
-- Name: web_socket_sub_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.web_socket_sub_seq', 1, false);


--
-- Name: zato_sso_attr_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.zato_sso_attr_seq', 1, false);


--
-- Name: zato_sso_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.zato_sso_sid_seq', 1, false);


--
-- Name: zato_sso_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zato
--

SELECT pg_catalog.setval('public.zato_sso_user_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkey PRIMARY KEY (version_num);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: aws_s3 aws_s3_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.aws_s3
    ADD CONSTRAINT aws_s3_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: aws_s3 aws_s3_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.aws_s3
    ADD CONSTRAINT aws_s3_pkey PRIMARY KEY (id);


--
-- Name: cache_builtin cache_builtin_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache_builtin
    ADD CONSTRAINT cache_builtin_pkey PRIMARY KEY (cache_id);


--
-- Name: cache_memcached cache_memcached_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache_memcached
    ADD CONSTRAINT cache_memcached_pkey PRIMARY KEY (cache_id);


--
-- Name: cache cache_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (id);


--
-- Name: channel_amqp channel_amqp_name_def_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_amqp
    ADD CONSTRAINT channel_amqp_name_def_id_key UNIQUE (name, def_id);


--
-- Name: channel_amqp channel_amqp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_amqp
    ADD CONSTRAINT channel_amqp_pkey PRIMARY KEY (id);


--
-- Name: channel_stomp channel_stomp_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_stomp
    ADD CONSTRAINT channel_stomp_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: channel_stomp channel_stomp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_stomp
    ADD CONSTRAINT channel_stomp_pkey PRIMARY KEY (id);


--
-- Name: channel_web_socket channel_web_socket_address_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_address_cluster_id_key UNIQUE (address, cluster_id);


--
-- Name: channel_web_socket channel_web_socket_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: channel_web_socket channel_web_socket_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_pkey PRIMARY KEY (id);


--
-- Name: channel_wmq channel_wmq_name_def_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_wmq
    ADD CONSTRAINT channel_wmq_name_def_id_key UNIQUE (name, def_id);


--
-- Name: channel_wmq channel_wmq_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_wmq
    ADD CONSTRAINT channel_wmq_pkey PRIMARY KEY (id);


--
-- Name: channel_zmq channel_zmq_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_zmq
    ADD CONSTRAINT channel_zmq_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: channel_zmq channel_zmq_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_zmq
    ADD CONSTRAINT channel_zmq_pkey PRIMARY KEY (id);


--
-- Name: cluster_color_marker cluster_color_marker_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cluster_color_marker
    ADD CONSTRAINT cluster_color_marker_pkey PRIMARY KEY (id);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (id);


--
-- Name: conn_def_amqp conn_def_amqp_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_amqp
    ADD CONSTRAINT conn_def_amqp_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: conn_def_amqp conn_def_amqp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_amqp
    ADD CONSTRAINT conn_def_amqp_pkey PRIMARY KEY (id);


--
-- Name: conn_def_cassandra conn_def_cassandra_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_cassandra
    ADD CONSTRAINT conn_def_cassandra_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: conn_def_cassandra conn_def_cassandra_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_cassandra
    ADD CONSTRAINT conn_def_cassandra_pkey PRIMARY KEY (id);


--
-- Name: conn_def_wmq conn_def_wmq_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_wmq
    ADD CONSTRAINT conn_def_wmq_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: conn_def_wmq conn_def_wmq_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_wmq
    ADD CONSTRAINT conn_def_wmq_pkey PRIMARY KEY (id);


--
-- Name: deployed_service deployed_service_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployed_service
    ADD CONSTRAINT deployed_service_pkey PRIMARY KEY (server_id, service_id);


--
-- Name: deployment_package deployment_package_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_package
    ADD CONSTRAINT deployment_package_pkey PRIMARY KEY (id);


--
-- Name: deployment_status deployment_status_package_id_server_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_status
    ADD CONSTRAINT deployment_status_package_id_server_id_key UNIQUE (package_id, server_id);


--
-- Name: deployment_status deployment_status_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_status
    ADD CONSTRAINT deployment_status_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: email_imap email_imap_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_imap
    ADD CONSTRAINT email_imap_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: email_imap email_imap_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_imap
    ADD CONSTRAINT email_imap_pkey PRIMARY KEY (id);


--
-- Name: email_smtp email_smtp_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_smtp
    ADD CONSTRAINT email_smtp_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: email_smtp email_smtp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_smtp
    ADD CONSTRAINT email_smtp_pkey PRIMARY KEY (id);


--
-- Name: generic_conn_client generic_conn_client_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_client
    ADD CONSTRAINT generic_conn_client_pkey PRIMARY KEY (id);


--
-- Name: generic_conn_def generic_conn_def_name_type__cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def
    ADD CONSTRAINT generic_conn_def_name_type__cluster_id_key UNIQUE (name, type_, cluster_id);


--
-- Name: generic_conn_def generic_conn_def_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def
    ADD CONSTRAINT generic_conn_def_pkey PRIMARY KEY (id);


--
-- Name: generic_conn_def_sec generic_conn_def_sec_conn_def_id_sec_base_id_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def_sec
    ADD CONSTRAINT generic_conn_def_sec_conn_def_id_sec_base_id_cluster_id_key UNIQUE (conn_def_id, sec_base_id, cluster_id);


--
-- Name: generic_conn_def_sec generic_conn_def_sec_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def_sec
    ADD CONSTRAINT generic_conn_def_sec_pkey PRIMARY KEY (id);


--
-- Name: generic_conn generic_conn_name_type__cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn
    ADD CONSTRAINT generic_conn_name_type__cluster_id_key UNIQUE (name, type_, cluster_id);


--
-- Name: generic_conn generic_conn_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn
    ADD CONSTRAINT generic_conn_pkey PRIMARY KEY (id);


--
-- Name: generic_conn_sec generic_conn_sec_conn_id_sec_base_id_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_sec
    ADD CONSTRAINT generic_conn_sec_conn_id_sec_base_id_cluster_id_key UNIQUE (conn_id, sec_base_id, cluster_id);


--
-- Name: generic_conn_sec generic_conn_sec_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_sec
    ADD CONSTRAINT generic_conn_sec_pkey PRIMARY KEY (id);


--
-- Name: http_soap http_soap_name_connection_transport_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_name_connection_transport_cluster_id_key UNIQUE (name, connection, transport, cluster_id);


--
-- Name: http_soap http_soap_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_pkey PRIMARY KEY (id);


--
-- Name: install_state install_state_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.install_state
    ADD CONSTRAINT install_state_pkey PRIMARY KEY (id);


--
-- Name: install_state install_state_version_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.install_state
    ADD CONSTRAINT install_state_version_key UNIQUE (version);


--
-- Name: job_cron_style job_cron_style_job_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_cron_style
    ADD CONSTRAINT job_cron_style_job_id_key UNIQUE (job_id);


--
-- Name: job_cron_style job_cron_style_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_cron_style
    ADD CONSTRAINT job_cron_style_pkey PRIMARY KEY (id);


--
-- Name: job_interval_based job_interval_based_job_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_interval_based
    ADD CONSTRAINT job_interval_based_job_id_key UNIQUE (job_id);


--
-- Name: job_interval_based job_interval_based_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_interval_based
    ADD CONSTRAINT job_interval_based_pkey PRIMARY KEY (id);


--
-- Name: job job_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: kv_data kv_data_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.kv_data
    ADD CONSTRAINT kv_data_pkey PRIMARY KEY (id);


--
-- Name: msg_json_pointer msg_json_pointer_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_json_pointer
    ADD CONSTRAINT msg_json_pointer_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: msg_json_pointer msg_json_pointer_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_json_pointer
    ADD CONSTRAINT msg_json_pointer_pkey PRIMARY KEY (id);


--
-- Name: msg_ns msg_ns_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_ns
    ADD CONSTRAINT msg_ns_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: msg_ns msg_ns_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_ns
    ADD CONSTRAINT msg_ns_pkey PRIMARY KEY (id);


--
-- Name: msg_xpath msg_xpath_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_xpath
    ADD CONSTRAINT msg_xpath_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: msg_xpath msg_xpath_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_xpath
    ADD CONSTRAINT msg_xpath_pkey PRIMARY KEY (id);


--
-- Name: notif notif_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif
    ADD CONSTRAINT notif_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: notif_os_swift notif_os_swift_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_os_swift
    ADD CONSTRAINT notif_os_swift_pkey PRIMARY KEY (id, def_id);


--
-- Name: notif notif_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif
    ADD CONSTRAINT notif_pkey PRIMARY KEY (id);


--
-- Name: notif_sql notif_sql_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_sql
    ADD CONSTRAINT notif_sql_pkey PRIMARY KEY (id, def_id);


--
-- Name: os_swift os_swift_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.os_swift
    ADD CONSTRAINT os_swift_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: os_swift os_swift_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.os_swift
    ADD CONSTRAINT os_swift_pkey PRIMARY KEY (id);


--
-- Name: out_amqp out_amqp_name_def_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_amqp
    ADD CONSTRAINT out_amqp_name_def_id_key UNIQUE (name, def_id);


--
-- Name: out_amqp out_amqp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_amqp
    ADD CONSTRAINT out_amqp_pkey PRIMARY KEY (id);


--
-- Name: out_ftp out_ftp_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_ftp
    ADD CONSTRAINT out_ftp_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: out_ftp out_ftp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_ftp
    ADD CONSTRAINT out_ftp_pkey PRIMARY KEY (id);


--
-- Name: out_odoo out_odoo_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_odoo
    ADD CONSTRAINT out_odoo_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: out_odoo out_odoo_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_odoo
    ADD CONSTRAINT out_odoo_pkey PRIMARY KEY (id);


--
-- Name: out_sap out_sap_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_sap
    ADD CONSTRAINT out_sap_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: out_sap out_sap_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_sap
    ADD CONSTRAINT out_sap_pkey PRIMARY KEY (id);


--
-- Name: out_stomp out_stomp_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_stomp
    ADD CONSTRAINT out_stomp_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: out_stomp out_stomp_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_stomp
    ADD CONSTRAINT out_stomp_pkey PRIMARY KEY (id);


--
-- Name: out_wmq out_wmq_name_def_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_wmq
    ADD CONSTRAINT out_wmq_name_def_id_key UNIQUE (name, def_id);


--
-- Name: out_wmq out_wmq_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_wmq
    ADD CONSTRAINT out_wmq_pkey PRIMARY KEY (id);


--
-- Name: out_zmq out_zmq_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_zmq
    ADD CONSTRAINT out_zmq_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: out_zmq out_zmq_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_zmq
    ADD CONSTRAINT out_zmq_pkey PRIMARY KEY (id);


--
-- Name: pubsub_channel pubsub_channel_cluster_id_conn_id_conn_type_topic_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_channel
    ADD CONSTRAINT pubsub_channel_cluster_id_conn_id_conn_type_topic_id_key UNIQUE (cluster_id, conn_id, conn_type, topic_id);


--
-- Name: pubsub_channel pubsub_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_channel
    ADD CONSTRAINT pubsub_channel_pkey PRIMARY KEY (id);


--
-- Name: pubsub_endp_msg_q_inter pubsub_endp_msg_q_inter_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_q_inter
    ADD CONSTRAINT pubsub_endp_msg_q_inter_pkey PRIMARY KEY (id);


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_pkey PRIMARY KEY (id);


--
-- Name: pubsub_endp_topic pubsub_endp_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_topic
    ADD CONSTRAINT pubsub_endp_topic_pkey PRIMARY KEY (id);


--
-- Name: pubsub_endpoint pubsub_endpoint_cluster_id_security_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_cluster_id_security_id_key UNIQUE (cluster_id, security_id);


--
-- Name: pubsub_endpoint pubsub_endpoint_cluster_id_service_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_cluster_id_service_id_key UNIQUE (cluster_id, service_id);


--
-- Name: pubsub_endpoint pubsub_endpoint_cluster_id_ws_channel_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_cluster_id_ws_channel_id_key UNIQUE (cluster_id, ws_channel_id);


--
-- Name: pubsub_endpoint pubsub_endpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_pkey PRIMARY KEY (id);


--
-- Name: pubsub_message pubsub_message_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_message
    ADD CONSTRAINT pubsub_message_pkey PRIMARY KEY (id);


--
-- Name: pubsub_sub pubsub_sub_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_pkey PRIMARY KEY (id);


--
-- Name: pubsub_topic pubsub_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_topic
    ADD CONSTRAINT pubsub_topic_pkey PRIMARY KEY (id);


--
-- Name: query_cassandra query_cassandra_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.query_cassandra
    ADD CONSTRAINT query_cassandra_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: query_cassandra query_cassandra_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.query_cassandra
    ADD CONSTRAINT query_cassandra_pkey PRIMARY KEY (id);


--
-- Name: rbac_client_role rbac_client_role_client_def_role_id_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_client_role
    ADD CONSTRAINT rbac_client_role_client_def_role_id_cluster_id_key UNIQUE (client_def, role_id, cluster_id);


--
-- Name: rbac_client_role rbac_client_role_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_client_role
    ADD CONSTRAINT rbac_client_role_pkey PRIMARY KEY (id);


--
-- Name: rbac_perm rbac_perm_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_perm
    ADD CONSTRAINT rbac_perm_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: rbac_perm rbac_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_perm
    ADD CONSTRAINT rbac_perm_pkey PRIMARY KEY (id);


--
-- Name: rbac_role rbac_role_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role
    ADD CONSTRAINT rbac_role_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: rbac_role_perm rbac_role_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_pkey PRIMARY KEY (id);


--
-- Name: rbac_role_perm rbac_role_perm_role_id_perm_id_service_id_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_role_id_perm_id_service_id_cluster_id_key UNIQUE (role_id, perm_id, service_id, cluster_id);


--
-- Name: rbac_role rbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role
    ADD CONSTRAINT rbac_role_pkey PRIMARY KEY (id);


--
-- Name: search_es search_es_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_es
    ADD CONSTRAINT search_es_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: search_es search_es_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_es
    ADD CONSTRAINT search_es_pkey PRIMARY KEY (id);


--
-- Name: search_solr search_solr_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_solr
    ADD CONSTRAINT search_solr_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: search_solr search_solr_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_solr
    ADD CONSTRAINT search_solr_pkey PRIMARY KEY (id);


--
-- Name: sec_apikey sec_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_apikey
    ADD CONSTRAINT sec_apikey_pkey PRIMARY KEY (id);


--
-- Name: sec_aws sec_aws_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_aws
    ADD CONSTRAINT sec_aws_pkey PRIMARY KEY (id);


--
-- Name: sec_base sec_base_cluster_id_name_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_base
    ADD CONSTRAINT sec_base_cluster_id_name_key UNIQUE (cluster_id, name);


--
-- Name: sec_base sec_base_cluster_id_username_sec_type_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_base
    ADD CONSTRAINT sec_base_cluster_id_username_sec_type_key UNIQUE (cluster_id, username, sec_type);


--
-- Name: sec_base sec_base_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_base
    ADD CONSTRAINT sec_base_pkey PRIMARY KEY (id);


--
-- Name: sec_basic_auth sec_basic_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_basic_auth
    ADD CONSTRAINT sec_basic_auth_pkey PRIMARY KEY (id);


--
-- Name: sec_jwt sec_jwt_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_jwt
    ADD CONSTRAINT sec_jwt_pkey PRIMARY KEY (id);


--
-- Name: sec_multi sec_multi_cluster_id_conn_id_conn_type_security_id_is_chann_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_multi
    ADD CONSTRAINT sec_multi_cluster_id_conn_id_conn_type_security_id_is_chann_key UNIQUE (cluster_id, conn_id, conn_type, security_id, is_channel, is_outconn);


--
-- Name: sec_multi sec_multi_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_multi
    ADD CONSTRAINT sec_multi_pkey PRIMARY KEY (id);


--
-- Name: sec_ntlm sec_ntlm_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_ntlm
    ADD CONSTRAINT sec_ntlm_pkey PRIMARY KEY (id);


--
-- Name: sec_oauth sec_oauth_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_oauth
    ADD CONSTRAINT sec_oauth_pkey PRIMARY KEY (id);


--
-- Name: sec_openstack sec_openstack_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_openstack
    ADD CONSTRAINT sec_openstack_pkey PRIMARY KEY (id);


--
-- Name: sec_tls_ca_cert sec_tls_ca_cert_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_ca_cert
    ADD CONSTRAINT sec_tls_ca_cert_pkey PRIMARY KEY (id);


--
-- Name: sec_tls_channel sec_tls_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_channel
    ADD CONSTRAINT sec_tls_channel_pkey PRIMARY KEY (id);


--
-- Name: sec_tls_key_cert sec_tls_key_cert_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_key_cert
    ADD CONSTRAINT sec_tls_key_cert_pkey PRIMARY KEY (id);


--
-- Name: sec_vault_conn sec_vault_conn_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_vault_conn
    ADD CONSTRAINT sec_vault_conn_pkey PRIMARY KEY (id);


--
-- Name: sec_wss_def sec_wss_def_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_wss_def
    ADD CONSTRAINT sec_wss_def_pkey PRIMARY KEY (id);


--
-- Name: sec_xpath sec_xpath_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_xpath
    ADD CONSTRAINT sec_xpath_pkey PRIMARY KEY (id);


--
-- Name: server server_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: server server_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_pkey PRIMARY KEY (id);


--
-- Name: service service_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: sms_twilio sms_twilio_name_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sms_twilio
    ADD CONSTRAINT sms_twilio_name_cluster_id_key UNIQUE (name, cluster_id);


--
-- Name: sms_twilio sms_twilio_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sms_twilio
    ADD CONSTRAINT sms_twilio_pkey PRIMARY KEY (id);


--
-- Name: sql_pool sql_pool_cluster_id_name_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sql_pool
    ADD CONSTRAINT sql_pool_cluster_id_name_key UNIQUE (cluster_id, name);


--
-- Name: sql_pool sql_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sql_pool
    ADD CONSTRAINT sql_pool_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_key UNIQUE (user_id);


--
-- Name: web_socket_cli_ps_keys web_socket_cli_ps_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_cli_ps_keys
    ADD CONSTRAINT web_socket_cli_ps_keys_pkey PRIMARY KEY (id);


--
-- Name: web_socket_client web_socket_client_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_client
    ADD CONSTRAINT web_socket_client_pkey PRIMARY KEY (id);


--
-- Name: web_socket_sub web_socket_sub_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_sub
    ADD CONSTRAINT web_socket_sub_pkey PRIMARY KEY (id);


--
-- Name: zato_sso_attr zato_attr_name_uq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_attr
    ADD CONSTRAINT zato_attr_name_uq UNIQUE (name, is_session_attr, user_id, _ust_string);


--
-- Name: zato_sso_attr zato_sso_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_attr
    ADD CONSTRAINT zato_sso_attr_pkey PRIMARY KEY (id);


--
-- Name: zato_sso_session zato_sso_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_session
    ADD CONSTRAINT zato_sso_session_pkey PRIMARY KEY (id);


--
-- Name: zato_sso_user zato_sso_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_user
    ADD CONSTRAINT zato_sso_user_pkey PRIMARY KEY (id);


--
-- Name: zato_sso_user zato_u_usrn_uq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_user
    ADD CONSTRAINT zato_u_usrn_uq UNIQUE (username);


--
-- Name: zato_sso_user zato_user_id_uq; Type: CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_user
    ADD CONSTRAINT zato_user_id_uq UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cluster_color_marker_06037614; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX cluster_color_marker_06037614 ON public.cluster_color_marker USING btree (user_profile_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: gen_conn_cli_ext_i_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX gen_conn_cli_ext_i_idx ON public.generic_conn_client USING btree (cluster_id, ext_client_id);


--
-- Name: gen_conn_cli_ext_n_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX gen_conn_cli_ext_n_idx ON public.generic_conn_client USING btree (cluster_id, ext_client_name);


--
-- Name: gen_conn_cli_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX gen_conn_cli_idx ON public.generic_conn_client USING btree (cluster_id, pub_client_id);


--
-- Name: gen_conn_cli_pr_addr_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX gen_conn_cli_pr_addr_idx ON public.generic_conn_client USING btree (cluster_id, peer_address);


--
-- Name: gen_conn_cli_pr_fqdn_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX gen_conn_cli_pr_fqdn_idx ON public.generic_conn_client USING btree (cluster_id, peer_fqdn);


--
-- Name: key_clust_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX key_clust_id_idx ON public.kv_data USING btree (key, cluster_id);


--
-- Name: path_host_conn_act_clus_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX path_host_conn_act_clus_idx ON public.http_soap USING btree (url_path, host, connection, soap_action, cluster_id);


--
-- Name: pubsb_endp_clust_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_endp_clust_idx ON public.pubsub_endpoint USING btree (cluster_id);


--
-- Name: pubsb_endp_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_endp_id_idx ON public.pubsub_endpoint USING btree (cluster_id, id);


--
-- Name: pubsb_endp_name_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_endp_name_idx ON public.pubsub_endpoint USING btree (cluster_id, name);


--
-- Name: pubsb_endpt_clsendtp_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_endpt_clsendtp_idx ON public.pubsub_endp_topic USING btree (cluster_id, endpoint_id, topic_id);


--
-- Name: pubsb_endpt_clust_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_endpt_clust_idx ON public.pubsub_endp_topic USING btree (cluster_id);


--
-- Name: pubsb_endpt_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_endpt_id_idx ON public.pubsub_endp_topic USING btree (cluster_id, id);


--
-- Name: pubsb_endpt_msgid_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_endpt_msgid_idx ON public.pubsub_endp_topic USING btree (cluster_id, pub_msg_id);


--
-- Name: pubsb_enms_q_endp_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_enms_q_endp_idx ON public.pubsub_endp_msg_queue USING btree (cluster_id, endpoint_id);


--
-- Name: pubsb_enms_q_endptp_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_enms_q_endptp_idx ON public.pubsub_endp_msg_queue USING btree (cluster_id, endpoint_id, topic_id);


--
-- Name: pubsb_enms_q_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_enms_q_id_idx ON public.pubsub_endp_msg_queue USING btree (cluster_id, id);


--
-- Name: pubsb_enms_q_pubmid_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_enms_q_pubmid_idx ON public.pubsub_endp_msg_queue USING btree (cluster_id, pub_msg_id);


--
-- Name: pubsb_enms_q_subs_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_enms_q_subs_idx ON public.pubsub_endp_msg_queue USING btree (cluster_id, sub_key);


--
-- Name: pubsb_enms_qi_endptp_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_enms_qi_endptp_idx ON public.pubsub_endp_msg_q_inter USING btree (cluster_id, queue_id);


--
-- Name: pubsb_enms_qi_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_enms_qi_id_idx ON public.pubsub_endp_msg_q_inter USING btree (cluster_id, id);


--
-- Name: pubsb_msg_correl_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_msg_correl_id_idx ON public.pubsub_message USING btree (cluster_id, pub_correl_id);


--
-- Name: pubsb_msg_inreplyto_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_msg_inreplyto_id_idx ON public.pubsub_message USING btree (cluster_id, in_reply_to);


--
-- Name: pubsb_msg_pubmsg_clu_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_msg_pubmsg_clu_id_idx ON public.pubsub_message USING btree (cluster_id, pub_msg_id);


--
-- Name: pubsb_msg_pubmsg_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_msg_pubmsg_id_idx ON public.pubsub_message USING btree (pub_msg_id);


--
-- Name: pubsb_sub_clust_endpt_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_sub_clust_endpt_idx ON public.pubsub_sub USING btree (cluster_id, endpoint_id, topic_id);


--
-- Name: pubsb_sub_clust_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_sub_clust_idx ON public.pubsub_sub USING btree (cluster_id);


--
-- Name: pubsb_sub_clust_subk; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_sub_clust_subk ON public.pubsub_sub USING btree (sub_key);


--
-- Name: pubsb_sub_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_sub_id_idx ON public.pubsub_sub USING btree (cluster_id, id);


--
-- Name: pubsb_tp_clust_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX pubsb_tp_clust_idx ON public.pubsub_topic USING btree (cluster_id);


--
-- Name: pubsb_tp_id_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_tp_id_idx ON public.pubsub_topic USING btree (cluster_id, id);


--
-- Name: pubsb_tp_name_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX pubsb_tp_name_idx ON public.pubsub_topic USING btree (cluster_id, name);


--
-- Name: wscl_cli_ext_i_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_cli_ext_i_idx ON public.web_socket_client USING btree (cluster_id, ext_client_id);


--
-- Name: wscl_cli_ext_n_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_cli_ext_n_idx ON public.web_socket_client USING btree (cluster_id, ext_client_name);


--
-- Name: wscl_pr_addr_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_pr_addr_idx ON public.web_socket_client USING btree (cluster_id, peer_address);


--
-- Name: wscl_pr_fqdn_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_pr_fqdn_idx ON public.web_socket_client USING btree (cluster_id, peer_fqdn);


--
-- Name: wscl_psk_cli; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_psk_cli ON public.web_socket_cli_ps_keys USING btree (cluster_id, client_id);


--
-- Name: wscl_psk_sk; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wscl_psk_sk ON public.web_socket_cli_ps_keys USING btree (cluster_id, sub_key);


--
-- Name: wscl_pub_client_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX wscl_pub_client_idx ON public.web_socket_client USING btree (cluster_id, pub_client_id);


--
-- Name: wssub_channel_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wssub_channel_idx ON public.web_socket_sub USING btree (cluster_id, channel_id);


--
-- Name: wssub_extcli_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX wssub_extcli_idx ON public.web_socket_sub USING btree (cluster_id, ext_client_id);


--
-- Name: wssub_subkey_chan_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX wssub_subkey_chan_idx ON public.web_socket_sub USING btree (cluster_id, sub_key, channel_id);


--
-- Name: wssub_subkey_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX wssub_subkey_idx ON public.web_socket_sub USING btree (cluster_id, sub_key);


--
-- Name: zato_attr_usr; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_attr_usr ON public.zato_sso_attr USING btree (user_id);


--
-- Name: zato_attr_usr_name; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_attr_usr_name ON public.zato_sso_attr USING btree (user_id, name);


--
-- Name: zato_attr_usr_ust; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_attr_usr_ust ON public.zato_sso_attr USING btree (user_id, ust);


--
-- Name: zato_attr_usr_ust_name; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX zato_attr_usr_ust_name ON public.zato_sso_attr USING btree (user_id, ust, name);


--
-- Name: zato_sso_sust_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX zato_sso_sust_idx ON public.zato_sso_session USING btree (ust);


--
-- Name: zato_u_alln_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_alln_idx ON public.zato_sso_user USING btree (first_name_upper, middle_name_upper, last_name_upper);


--
-- Name: zato_u_appr_stat_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_appr_stat_idx ON public.zato_sso_user USING btree (approval_status);


--
-- Name: zato_u_dspn_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_dspn_idx ON public.zato_sso_user USING btree (display_name_upper);


--
-- Name: zato_u_email_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_email_idx ON public.zato_sso_user USING btree (email);


--
-- Name: zato_u_lastn_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_lastn_idx ON public.zato_sso_user USING btree (last_name_upper);


--
-- Name: zato_u_sigctok_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE UNIQUE INDEX zato_u_sigctok_idx ON public.zato_sso_user USING btree (sign_up_confirm_token);


--
-- Name: zato_u_sigst_idx; Type: INDEX; Schema: public; Owner: zato
--

CREATE INDEX zato_u_sigst_idx ON public.zato_sso_user USING btree (sign_up_status);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aws_s3 aws_s3_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.aws_s3
    ADD CONSTRAINT aws_s3_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: aws_s3 aws_s3_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.aws_s3
    ADD CONSTRAINT aws_s3_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: cache_builtin cache_builtin_cache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache_builtin
    ADD CONSTRAINT cache_builtin_cache_id_fkey FOREIGN KEY (cache_id) REFERENCES public.cache(id);


--
-- Name: cache cache_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: cache_memcached cache_memcached_cache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cache_memcached
    ADD CONSTRAINT cache_memcached_cache_id_fkey FOREIGN KEY (cache_id) REFERENCES public.cache(id);


--
-- Name: channel_amqp channel_amqp_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_amqp
    ADD CONSTRAINT channel_amqp_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.conn_def_amqp(id) ON DELETE CASCADE;


--
-- Name: channel_amqp channel_amqp_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_amqp
    ADD CONSTRAINT channel_amqp_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: channel_stomp channel_stomp_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_stomp
    ADD CONSTRAINT channel_stomp_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: channel_stomp channel_stomp_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_stomp
    ADD CONSTRAINT channel_stomp_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: channel_web_socket channel_web_socket_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: channel_web_socket channel_web_socket_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: channel_web_socket channel_web_socket_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_web_socket
    ADD CONSTRAINT channel_web_socket_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: channel_wmq channel_wmq_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_wmq
    ADD CONSTRAINT channel_wmq_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.conn_def_wmq(id) ON DELETE CASCADE;


--
-- Name: channel_wmq channel_wmq_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_wmq
    ADD CONSTRAINT channel_wmq_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: channel_zmq channel_zmq_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_zmq
    ADD CONSTRAINT channel_zmq_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: channel_zmq channel_zmq_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.channel_zmq
    ADD CONSTRAINT channel_zmq_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: cluster_color_marker cluster_color_marke_user_profile_id_9fb14033_fk_user_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.cluster_color_marker
    ADD CONSTRAINT cluster_color_marke_user_profile_id_9fb14033_fk_user_profile_id FOREIGN KEY (user_profile_id) REFERENCES public.user_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conn_def_amqp conn_def_amqp_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_amqp
    ADD CONSTRAINT conn_def_amqp_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: conn_def_cassandra conn_def_cassandra_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_cassandra
    ADD CONSTRAINT conn_def_cassandra_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: conn_def_wmq conn_def_wmq_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.conn_def_wmq
    ADD CONSTRAINT conn_def_wmq_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: deployed_service deployed_service_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployed_service
    ADD CONSTRAINT deployed_service_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: deployed_service deployed_service_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployed_service
    ADD CONSTRAINT deployed_service_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: deployment_package deployment_package_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_package
    ADD CONSTRAINT deployment_package_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: deployment_status deployment_status_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_status
    ADD CONSTRAINT deployment_status_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.deployment_package(id) ON DELETE CASCADE;


--
-- Name: deployment_status deployment_status_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.deployment_status
    ADD CONSTRAINT deployment_status_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: email_imap email_imap_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_imap
    ADD CONSTRAINT email_imap_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: email_smtp email_smtp_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.email_smtp
    ADD CONSTRAINT email_smtp_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn generic_conn_cache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn
    ADD CONSTRAINT generic_conn_cache_id_fkey FOREIGN KEY (cache_id) REFERENCES public.cache(id) ON DELETE CASCADE;


--
-- Name: generic_conn_client generic_conn_client_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_client
    ADD CONSTRAINT generic_conn_client_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn_client generic_conn_client_conn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_client
    ADD CONSTRAINT generic_conn_client_conn_id_fkey FOREIGN KEY (conn_id) REFERENCES public.generic_conn(id) ON DELETE CASCADE;


--
-- Name: generic_conn_client generic_conn_client_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_client
    ADD CONSTRAINT generic_conn_client_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: generic_conn generic_conn_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn
    ADD CONSTRAINT generic_conn_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn generic_conn_conn_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn
    ADD CONSTRAINT generic_conn_conn_def_id_fkey FOREIGN KEY (conn_def_id) REFERENCES public.generic_conn_def(id) ON DELETE CASCADE;


--
-- Name: generic_conn_def generic_conn_def_cache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def
    ADD CONSTRAINT generic_conn_def_cache_id_fkey FOREIGN KEY (cache_id) REFERENCES public.cache(id) ON DELETE CASCADE;


--
-- Name: generic_conn_def generic_conn_def_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def
    ADD CONSTRAINT generic_conn_def_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn_def_sec generic_conn_def_sec_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def_sec
    ADD CONSTRAINT generic_conn_def_sec_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn_def_sec generic_conn_def_sec_conn_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def_sec
    ADD CONSTRAINT generic_conn_def_sec_conn_def_id_fkey FOREIGN KEY (conn_def_id) REFERENCES public.generic_conn_def(id) ON DELETE CASCADE;


--
-- Name: generic_conn_def_sec generic_conn_def_sec_sec_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_def_sec
    ADD CONSTRAINT generic_conn_def_sec_sec_base_id_fkey FOREIGN KEY (sec_base_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: generic_conn_sec generic_conn_sec_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_sec
    ADD CONSTRAINT generic_conn_sec_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: generic_conn_sec generic_conn_sec_conn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_sec
    ADD CONSTRAINT generic_conn_sec_conn_id_fkey FOREIGN KEY (conn_id) REFERENCES public.generic_conn(id) ON DELETE CASCADE;


--
-- Name: generic_conn_sec generic_conn_sec_sec_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.generic_conn_sec
    ADD CONSTRAINT generic_conn_sec_sec_base_id_fkey FOREIGN KEY (sec_base_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: http_soap http_soap_cache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_cache_id_fkey FOREIGN KEY (cache_id) REFERENCES public.cache(id) ON DELETE CASCADE;


--
-- Name: http_soap http_soap_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: http_soap http_soap_sec_tls_ca_cert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_sec_tls_ca_cert_id_fkey FOREIGN KEY (sec_tls_ca_cert_id) REFERENCES public.sec_tls_ca_cert(id) ON DELETE CASCADE;


--
-- Name: http_soap http_soap_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: http_soap http_soap_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.http_soap
    ADD CONSTRAINT http_soap_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: job job_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: job_cron_style job_cron_style_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_cron_style
    ADD CONSTRAINT job_cron_style_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(id) ON DELETE CASCADE;


--
-- Name: job_interval_based job_interval_based_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job_interval_based
    ADD CONSTRAINT job_interval_based_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(id) ON DELETE CASCADE;


--
-- Name: job job_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: kv_data kv_data_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.kv_data
    ADD CONSTRAINT kv_data_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: msg_json_pointer msg_json_pointer_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_json_pointer
    ADD CONSTRAINT msg_json_pointer_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: msg_ns msg_ns_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_ns
    ADD CONSTRAINT msg_ns_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: msg_xpath msg_xpath_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.msg_xpath
    ADD CONSTRAINT msg_xpath_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: notif notif_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif
    ADD CONSTRAINT notif_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: notif_os_swift notif_os_swift_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_os_swift
    ADD CONSTRAINT notif_os_swift_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.os_swift(id);


--
-- Name: notif_os_swift notif_os_swift_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_os_swift
    ADD CONSTRAINT notif_os_swift_id_fkey FOREIGN KEY (id) REFERENCES public.notif(id);


--
-- Name: notif notif_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif
    ADD CONSTRAINT notif_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: notif_sql notif_sql_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_sql
    ADD CONSTRAINT notif_sql_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.sql_pool(id);


--
-- Name: notif_sql notif_sql_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.notif_sql
    ADD CONSTRAINT notif_sql_id_fkey FOREIGN KEY (id) REFERENCES public.notif(id);


--
-- Name: os_swift os_swift_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.os_swift
    ADD CONSTRAINT os_swift_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: out_amqp out_amqp_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_amqp
    ADD CONSTRAINT out_amqp_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.conn_def_amqp(id) ON DELETE CASCADE;


--
-- Name: out_ftp out_ftp_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_ftp
    ADD CONSTRAINT out_ftp_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: out_odoo out_odoo_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_odoo
    ADD CONSTRAINT out_odoo_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: out_sap out_sap_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_sap
    ADD CONSTRAINT out_sap_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: out_stomp out_stomp_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_stomp
    ADD CONSTRAINT out_stomp_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: out_wmq out_wmq_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_wmq
    ADD CONSTRAINT out_wmq_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.conn_def_wmq(id) ON DELETE CASCADE;


--
-- Name: out_zmq out_zmq_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.out_zmq
    ADD CONSTRAINT out_zmq_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_channel pubsub_channel_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_channel
    ADD CONSTRAINT pubsub_channel_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_channel pubsub_channel_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_channel
    ADD CONSTRAINT pubsub_channel_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.pubsub_topic(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_q_inter pubsub_endp_msg_q_inter_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_q_inter
    ADD CONSTRAINT pubsub_endp_msg_q_inter_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_q_inter pubsub_endp_msg_q_inter_queue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_q_inter
    ADD CONSTRAINT pubsub_endp_msg_q_inter_queue_id_fkey FOREIGN KEY (queue_id) REFERENCES public.pubsub_endp_msg_queue(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_endpoint_id_fkey FOREIGN KEY (endpoint_id) REFERENCES public.pubsub_endpoint(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_pub_msg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_pub_msg_id_fkey FOREIGN KEY (pub_msg_id) REFERENCES public.pubsub_message(pub_msg_id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_sub_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_sub_key_fkey FOREIGN KEY (sub_key) REFERENCES public.pubsub_sub(sub_key) ON DELETE CASCADE;


--
-- Name: pubsub_endp_msg_queue pubsub_endp_msg_queue_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_msg_queue
    ADD CONSTRAINT pubsub_endp_msg_queue_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.pubsub_topic(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_topic pubsub_endp_topic_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_topic
    ADD CONSTRAINT pubsub_endp_topic_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_topic pubsub_endp_topic_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_topic
    ADD CONSTRAINT pubsub_endp_topic_endpoint_id_fkey FOREIGN KEY (endpoint_id) REFERENCES public.pubsub_endpoint(id) ON DELETE CASCADE;


--
-- Name: pubsub_endp_topic pubsub_endp_topic_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endp_topic
    ADD CONSTRAINT pubsub_endp_topic_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.pubsub_topic(id) ON DELETE CASCADE;


--
-- Name: pubsub_endpoint pubsub_endpoint_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_endpoint pubsub_endpoint_gen_conn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_gen_conn_id_fkey FOREIGN KEY (gen_conn_id) REFERENCES public.generic_conn(id) ON DELETE CASCADE;


--
-- Name: pubsub_endpoint pubsub_endpoint_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: pubsub_endpoint pubsub_endpoint_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: pubsub_endpoint pubsub_endpoint_ws_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_endpoint
    ADD CONSTRAINT pubsub_endpoint_ws_channel_id_fkey FOREIGN KEY (ws_channel_id) REFERENCES public.channel_web_socket(id) ON DELETE CASCADE;


--
-- Name: pubsub_message pubsub_message_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_message
    ADD CONSTRAINT pubsub_message_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_message pubsub_message_published_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_message
    ADD CONSTRAINT pubsub_message_published_by_id_fkey FOREIGN KEY (published_by_id) REFERENCES public.pubsub_endpoint(id) ON DELETE CASCADE;


--
-- Name: pubsub_message pubsub_message_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_message
    ADD CONSTRAINT pubsub_message_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.pubsub_topic(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_endpoint_id_fkey FOREIGN KEY (endpoint_id) REFERENCES public.pubsub_endpoint(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_hook_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_hook_service_id_fkey FOREIGN KEY (hook_service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_out_amqp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_out_amqp_id_fkey FOREIGN KEY (out_amqp_id) REFERENCES public.out_amqp(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_out_gen_conn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_out_gen_conn_id_fkey FOREIGN KEY (out_gen_conn_id) REFERENCES public.generic_conn(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_out_http_soap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_out_http_soap_id_fkey FOREIGN KEY (out_http_soap_id) REFERENCES public.http_soap(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_out_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_out_job_id_fkey FOREIGN KEY (out_job_id) REFERENCES public.job(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_out_smtp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_out_smtp_id_fkey FOREIGN KEY (out_smtp_id) REFERENCES public.email_smtp(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.pubsub_topic(id) ON DELETE CASCADE;


--
-- Name: pubsub_sub pubsub_sub_ws_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_sub
    ADD CONSTRAINT pubsub_sub_ws_channel_id_fkey FOREIGN KEY (ws_channel_id) REFERENCES public.channel_web_socket(id) ON DELETE CASCADE;


--
-- Name: pubsub_topic pubsub_topic_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_topic
    ADD CONSTRAINT pubsub_topic_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: pubsub_topic pubsub_topic_hook_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.pubsub_topic
    ADD CONSTRAINT pubsub_topic_hook_service_id_fkey FOREIGN KEY (hook_service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: query_cassandra query_cassandra_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.query_cassandra
    ADD CONSTRAINT query_cassandra_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: query_cassandra query_cassandra_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.query_cassandra
    ADD CONSTRAINT query_cassandra_def_id_fkey FOREIGN KEY (def_id) REFERENCES public.conn_def_cassandra(id) ON DELETE CASCADE;


--
-- Name: rbac_client_role rbac_client_role_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_client_role
    ADD CONSTRAINT rbac_client_role_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: rbac_client_role rbac_client_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_client_role
    ADD CONSTRAINT rbac_client_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.rbac_role(id) ON DELETE CASCADE;


--
-- Name: rbac_perm rbac_perm_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_perm
    ADD CONSTRAINT rbac_perm_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: rbac_role rbac_role_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role
    ADD CONSTRAINT rbac_role_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: rbac_role rbac_role_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role
    ADD CONSTRAINT rbac_role_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.rbac_role(id) ON DELETE CASCADE;


--
-- Name: rbac_role_perm rbac_role_perm_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: rbac_role_perm rbac_role_perm_perm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_perm_id_fkey FOREIGN KEY (perm_id) REFERENCES public.rbac_perm(id) ON DELETE CASCADE;


--
-- Name: rbac_role_perm rbac_role_perm_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.rbac_role(id) ON DELETE CASCADE;


--
-- Name: rbac_role_perm rbac_role_perm_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.rbac_role_perm
    ADD CONSTRAINT rbac_role_perm_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: search_es search_es_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_es
    ADD CONSTRAINT search_es_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: search_solr search_solr_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.search_solr
    ADD CONSTRAINT search_solr_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sec_apikey sec_apikey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_apikey
    ADD CONSTRAINT sec_apikey_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_aws sec_aws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_aws
    ADD CONSTRAINT sec_aws_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_base sec_base_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_base
    ADD CONSTRAINT sec_base_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sec_basic_auth sec_basic_auth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_basic_auth
    ADD CONSTRAINT sec_basic_auth_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_jwt sec_jwt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_jwt
    ADD CONSTRAINT sec_jwt_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_multi sec_multi_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_multi
    ADD CONSTRAINT sec_multi_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sec_multi sec_multi_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_multi
    ADD CONSTRAINT sec_multi_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.sec_base(id) ON DELETE CASCADE;


--
-- Name: sec_ntlm sec_ntlm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_ntlm
    ADD CONSTRAINT sec_ntlm_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_oauth sec_oauth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_oauth
    ADD CONSTRAINT sec_oauth_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_openstack sec_openstack_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_openstack
    ADD CONSTRAINT sec_openstack_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_tls_ca_cert sec_tls_ca_cert_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_ca_cert
    ADD CONSTRAINT sec_tls_ca_cert_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sec_tls_channel sec_tls_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_channel
    ADD CONSTRAINT sec_tls_channel_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_tls_key_cert sec_tls_key_cert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_tls_key_cert
    ADD CONSTRAINT sec_tls_key_cert_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_vault_conn sec_vault_conn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_vault_conn
    ADD CONSTRAINT sec_vault_conn_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_vault_conn sec_vault_conn_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_vault_conn
    ADD CONSTRAINT sec_vault_conn_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: sec_vault_conn sec_vault_conn_tls_ca_cert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_vault_conn
    ADD CONSTRAINT sec_vault_conn_tls_ca_cert_id_fkey FOREIGN KEY (tls_ca_cert_id) REFERENCES public.sec_tls_ca_cert(id) ON DELETE CASCADE;


--
-- Name: sec_vault_conn sec_vault_conn_tls_key_cert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_vault_conn
    ADD CONSTRAINT sec_vault_conn_tls_key_cert_id_fkey FOREIGN KEY (tls_key_cert_id) REFERENCES public.sec_tls_key_cert(id) ON DELETE CASCADE;


--
-- Name: sec_wss_def sec_wss_def_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_wss_def
    ADD CONSTRAINT sec_wss_def_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: sec_xpath sec_xpath_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sec_xpath
    ADD CONSTRAINT sec_xpath_id_fkey FOREIGN KEY (id) REFERENCES public.sec_base(id);


--
-- Name: server server_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: service service_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sms_twilio sms_twilio_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sms_twilio
    ADD CONSTRAINT sms_twilio_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: sql_pool sql_pool_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.sql_pool
    ADD CONSTRAINT sql_pool_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: web_socket_cli_ps_keys web_socket_cli_ps_keys_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_cli_ps_keys
    ADD CONSTRAINT web_socket_cli_ps_keys_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.web_socket_client(id) ON DELETE CASCADE;


--
-- Name: web_socket_cli_ps_keys web_socket_cli_ps_keys_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_cli_ps_keys
    ADD CONSTRAINT web_socket_cli_ps_keys_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: web_socket_client web_socket_client_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_client
    ADD CONSTRAINT web_socket_client_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel_web_socket(id) ON DELETE CASCADE;


--
-- Name: web_socket_client web_socket_client_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_client
    ADD CONSTRAINT web_socket_client_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: web_socket_client web_socket_client_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_client
    ADD CONSTRAINT web_socket_client_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.server(id) ON DELETE CASCADE;


--
-- Name: web_socket_sub web_socket_sub_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_sub
    ADD CONSTRAINT web_socket_sub_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channel_web_socket(id) ON DELETE CASCADE;


--
-- Name: web_socket_sub web_socket_sub_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_sub
    ADD CONSTRAINT web_socket_sub_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(id) ON DELETE CASCADE;


--
-- Name: web_socket_sub web_socket_sub_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.web_socket_sub
    ADD CONSTRAINT web_socket_sub_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.pubsub_sub(id) ON DELETE CASCADE;


--
-- Name: zato_sso_attr zato_sso_attr_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_attr
    ADD CONSTRAINT zato_sso_attr_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.zato_sso_user(user_id) ON DELETE CASCADE;


--
-- Name: zato_sso_attr zato_sso_attr_ust_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_attr
    ADD CONSTRAINT zato_sso_attr_ust_fkey FOREIGN KEY (ust) REFERENCES public.zato_sso_session(ust) ON DELETE CASCADE;


--
-- Name: zato_sso_session zato_sso_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zato
--

ALTER TABLE ONLY public.zato_sso_session
    ADD CONSTRAINT zato_sso_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.zato_sso_user(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

