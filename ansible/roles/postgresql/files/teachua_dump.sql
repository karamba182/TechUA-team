--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: about_us_items; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.about_us_items (
    id bigint NOT NULL,
    number bigint NOT NULL,
    picture character varying(255),
    text character varying(6000),
    type bigint NOT NULL,
    video character varying(255)
);


ALTER TABLE public.about_us_items OWNER TO pmp2025;

--
-- Name: about_us_items_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.about_us_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.about_us_items_id_seq OWNER TO pmp2025;

--
-- Name: about_us_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.about_us_items_id_seq OWNED BY public.about_us_items.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    correct boolean NOT NULL,
    text character varying(255) NOT NULL,
    value integer NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.answers OWNER TO pmp2025;

--
-- Name: answers_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.answers_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answers_seq OWNER TO pmp2025;

--
-- Name: archive; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.archive (
    id bigint NOT NULL,
    class_name character varying(255) NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.archive OWNER TO pmp2025;

--
-- Name: archive_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archive_id_seq OWNER TO pmp2025;

--
-- Name: archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.archive_id_seq OWNED BY public.archive.id;


--
-- Name: banner_items; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.banner_items (
    id bigint NOT NULL,
    link character varying(255),
    picture character varying(255) NOT NULL,
    sequence_number integer NOT NULL,
    subtitle character varying(255),
    title character varying(255) NOT NULL
);


ALTER TABLE public.banner_items OWNER TO pmp2025;

--
-- Name: banner_items_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.banner_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banner_items_id_seq OWNER TO pmp2025;

--
-- Name: banner_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.banner_items_id_seq OWNED BY public.banner_items.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    background_color character varying(255),
    description character varying(255),
    name character varying(255) NOT NULL,
    sortby integer NOT NULL,
    tag_background_color character varying(255),
    tag_text_color character varying(255),
    url_logo character varying(255)
);


ALTER TABLE public.categories OWNER TO pmp2025;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO pmp2025;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: centers; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.centers (
    id bigint NOT NULL,
    center_external_id bigint,
    club_count bigint DEFAULT 0,
    contacts character varying(3000),
    description text,
    feedback_count bigint DEFAULT 0,
    name character varying(255) NOT NULL,
    rating double precision DEFAULT 0,
    url_background_picture character varying(255),
    url_logo character varying(255),
    url_web character varying(255),
    user_id bigint
);


ALTER TABLE public.centers OWNER TO pmp2025;

--
-- Name: centers_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.centers_id_seq OWNER TO pmp2025;

--
-- Name: centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.centers_id_seq OWNED BY public.centers.id;


--
-- Name: certificate_dates; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.certificate_dates (
    id bigint NOT NULL,
    course_number character varying(255),
    date character varying(255),
    duration character varying(255),
    hours integer,
    study_form character varying(255)
);


ALTER TABLE public.certificate_dates OWNER TO pmp2025;

--
-- Name: certificate_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.certificate_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certificate_dates_id_seq OWNER TO pmp2025;

--
-- Name: certificate_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.certificate_dates_id_seq OWNED BY public.certificate_dates.id;


--
-- Name: certificate_templates; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.certificate_templates (
    id integer NOT NULL,
    course_description character varying(255),
    file_path character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    picture_path character varying(255),
    project_description character varying(255),
    properties character varying(255),
    certificate_type integer
);


ALTER TABLE public.certificate_templates OWNER TO pmp2025;

--
-- Name: certificate_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.certificate_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certificate_templates_id_seq OWNER TO pmp2025;

--
-- Name: certificate_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.certificate_templates_id_seq OWNED BY public.certificate_templates.id;


--
-- Name: certificate_types; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.certificate_types (
    id integer NOT NULL,
    code_number integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.certificate_types OWNER TO pmp2025;

--
-- Name: certificate_types_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.certificate_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certificate_types_id_seq OWNER TO pmp2025;

--
-- Name: certificate_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.certificate_types_id_seq OWNED BY public.certificate_types.id;


--
-- Name: certificates; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.certificates (
    id bigint NOT NULL,
    messenger_name character varying(255),
    send_status boolean,
    user_email character varying(255),
    serial_number bigint,
    update_status date,
    user_name character varying(255),
    "values" character varying(255),
    dates_id bigint,
    messenger_id integer,
    template_id integer,
    user_id bigint
);


ALTER TABLE public.certificates OWNER TO pmp2025;

--
-- Name: certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certificates_id_seq OWNER TO pmp2025;

--
-- Name: certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.certificates_id_seq OWNED BY public.certificates.id;


--
-- Name: challenge_registrations; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.challenge_registrations (
    id bigint NOT NULL,
    comment character varying(255),
    is_active boolean NOT NULL,
    is_approved boolean NOT NULL,
    registration_date timestamp(6) without time zone NOT NULL,
    challenge_id bigint NOT NULL,
    child_id bigint,
    user_id bigint
);


ALTER TABLE public.challenge_registrations OWNER TO pmp2025;

--
-- Name: challenge_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.challenge_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenge_registrations_id_seq OWNER TO pmp2025;

--
-- Name: challenge_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.challenge_registrations_id_seq OWNED BY public.challenge_registrations.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.challenges (
    id bigint NOT NULL,
    description character varying(30000) NOT NULL,
    is_active boolean NOT NULL,
    name character varying(255) NOT NULL,
    picture character varying(255) NOT NULL,
    registration_link character varying(255),
    sort_number bigint NOT NULL,
    title character varying(255) NOT NULL,
    user_id bigint
);


ALTER TABLE public.challenges OWNER TO pmp2025;

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_id_seq OWNER TO pmp2025;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: children; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.children (
    id bigint NOT NULL,
    age smallint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    gender_id bigint NOT NULL,
    parent_id bigint NOT NULL
);


ALTER TABLE public.children OWNER TO pmp2025;

--
-- Name: children_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.children_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.children_id_seq OWNER TO pmp2025;

--
-- Name: children_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.children_id_seq OWNED BY public.children.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    latitude double precision,
    longitude double precision,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cities OWNER TO pmp2025;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO pmp2025;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: club_category; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.club_category (
    club_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.club_category OWNER TO pmp2025;

--
-- Name: club_registrations; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.club_registrations (
    id bigint NOT NULL,
    comment character varying(255),
    is_active boolean NOT NULL,
    is_approved boolean NOT NULL,
    registration_date timestamp(0) without time zone NOT NULL,
    child_id bigint,
    club_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.club_registrations OWNER TO pmp2025;

--
-- Name: club_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.club_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.club_registrations_id_seq OWNER TO pmp2025;

--
-- Name: club_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.club_registrations_id_seq OWNED BY public.club_registrations.id;


--
-- Name: clubs; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.clubs (
    id bigint NOT NULL,
    age_from integer,
    age_to integer,
    center_external_id bigint,
    club_external_id bigint,
    contacts character varying(3000),
    description text,
    feedback_count bigint DEFAULT 0,
    is_approved boolean,
    is_online boolean,
    name character varying(255) NOT NULL,
    rating double precision DEFAULT 0,
    url_background character varying(255),
    url_logo character varying(255),
    url_web character varying(255),
    center_id bigint,
    user_id bigint
);


ALTER TABLE public.clubs OWNER TO pmp2025;

--
-- Name: clubs_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.clubs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clubs_id_seq OWNER TO pmp2025;

--
-- Name: clubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.clubs_id_seq OWNED BY public.clubs.id;


--
-- Name: complaints; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.complaints (
    id bigint NOT NULL,
    answer_text character varying(255),
    date date,
    has_answer boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    text character varying(255) NOT NULL,
    club_id bigint NOT NULL,
    recipient_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.complaints OWNER TO pmp2025;

--
-- Name: complaints_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.complaints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.complaints_id_seq OWNER TO pmp2025;

--
-- Name: complaints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.complaints_id_seq OWNED BY public.complaints.id;


--
-- Name: contact_type; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.contact_type (
    id bigint NOT NULL,
    name character varying(255),
    url_logo character varying(255)
);


ALTER TABLE public.contact_type OWNER TO pmp2025;

--
-- Name: contact_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.contact_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_type_id_seq OWNER TO pmp2025;

--
-- Name: contact_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.contact_type_id_seq OWNED BY public.contact_type.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.districts (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city_id bigint NOT NULL
);


ALTER TABLE public.districts OWNER TO pmp2025;

--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.districts_id_seq OWNER TO pmp2025;

--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- Name: excel_center_entity; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.excel_center_entity (
    autogenerated_id bigint NOT NULL,
    address character varying(255),
    center_external_id bigint,
    city_name character varying(255),
    coordinates character varying(255),
    description character varying(3000),
    district character varying(255),
    name character varying(255),
    phone character varying(255),
    station character varying(255),
    web_contact character varying(3000)
);


ALTER TABLE public.excel_center_entity OWNER TO pmp2025;

--
-- Name: excel_center_entity_autogenerated_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.excel_center_entity_autogenerated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.excel_center_entity_autogenerated_id_seq OWNER TO pmp2025;

--
-- Name: excel_center_entity_autogenerated_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.excel_center_entity_autogenerated_id_seq OWNED BY public.excel_center_entity.autogenerated_id;


--
-- Name: excel_club_entity; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.excel_club_entity (
    autogenerated_id bigint NOT NULL,
    address character varying(255),
    ages character varying(255),
    categories character varying(3000),
    center_external_id bigint,
    city_name character varying(255),
    club_external_id bigint,
    coordinates character varying(255),
    description character varying(3000),
    district character varying(255),
    name character varying(255),
    phone character varying(255),
    station character varying(255),
    web_contact character varying(3000)
);


ALTER TABLE public.excel_club_entity OWNER TO pmp2025;

--
-- Name: excel_club_entity_autogenerated_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.excel_club_entity_autogenerated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.excel_club_entity_autogenerated_id_seq OWNER TO pmp2025;

--
-- Name: excel_club_entity_autogenerated_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.excel_club_entity_autogenerated_id_seq OWNED BY public.excel_club_entity.autogenerated_id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    date timestamp without time zone,
    rate real,
    text character varying(1500),
    club_id bigint,
    parent_comment_id bigint,
    user_id bigint
);


ALTER TABLE public.feedbacks OWNER TO pmp2025;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedbacks_id_seq OWNER TO pmp2025;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: galleries; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.galleries (
    id bigint NOT NULL,
    url character varying(255),
    club_id bigint NOT NULL
);


ALTER TABLE public.galleries OWNER TO pmp2025;

--
-- Name: galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galleries_id_seq OWNER TO pmp2025;

--
-- Name: galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.galleries_id_seq OWNED BY public.galleries.id;


--
-- Name: gender; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.gender (
    id bigint NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.gender OWNER TO pmp2025;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gender_id_seq OWNER TO pmp2025;

--
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;


--
-- Name: group_cohort; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.group_cohort (
    id bigint NOT NULL,
    end_date date NOT NULL,
    enrollment_key character varying(255) NOT NULL,
    start_date date NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.group_cohort OWNER TO pmp2025;

--
-- Name: group_cohort_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.group_cohort_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_cohort_seq OWNER TO pmp2025;

--
-- Name: group_test; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.group_test (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    test_id bigint NOT NULL
);


ALTER TABLE public.group_test OWNER TO pmp2025;

--
-- Name: group_test_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.group_test_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_test_seq OWNER TO pmp2025;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    address character varying(255),
    latitude double precision,
    longitude double precision,
    name character varying(255),
    phone character varying(255),
    center_id bigint,
    city_id bigint,
    club_id bigint,
    district_id bigint,
    station_id bigint
);


ALTER TABLE public.locations OWNER TO pmp2025;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO pmp2025;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    date timestamp without time zone,
    is_active boolean,
    is_answered boolean DEFAULT false NOT NULL,
    text character varying(1500),
    club_id bigint,
    recipient_id bigint,
    sender_id bigint
);


ALTER TABLE public.messages OWNER TO pmp2025;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO pmp2025;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: messengers; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.messengers (
    id integer NOT NULL,
    access_key character varying(255),
    name character varying(255)
);


ALTER TABLE public.messengers OWNER TO pmp2025;

--
-- Name: messengers_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.messengers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messengers_id_seq OWNER TO pmp2025;

--
-- Name: messengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.messengers_id_seq OWNED BY public.messengers.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    date date,
    description character varying(10000),
    is_active boolean,
    title character varying(255) NOT NULL,
    url_title_logo character varying(255),
    user_id bigint
);


ALTER TABLE public.news OWNER TO pmp2025;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO pmp2025;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.question (
    id bigint NOT NULL,
    text character varying(255),
    title character varying(255)
);


ALTER TABLE public.question OWNER TO pmp2025;

--
-- Name: question_categories; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.question_categories (
    id bigint NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.question_categories OWNER TO pmp2025;

--
-- Name: question_categories_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.question_categories_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_categories_seq OWNER TO pmp2025;

--
-- Name: question_histories; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.question_histories (
    id bigint NOT NULL,
    answer_id bigint NOT NULL,
    result_id bigint NOT NULL
);


ALTER TABLE public.question_histories OWNER TO pmp2025;

--
-- Name: question_histories_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.question_histories_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_histories_seq OWNER TO pmp2025;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_id_seq OWNER TO pmp2025;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_test; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.question_test (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    test_id bigint NOT NULL
);


ALTER TABLE public.question_test OWNER TO pmp2025;

--
-- Name: question_test_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.question_test_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_test_seq OWNER TO pmp2025;

--
-- Name: question_types; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.question_types (
    id bigint NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.question_types OWNER TO pmp2025;

--
-- Name: question_types_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.question_types_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_types_seq OWNER TO pmp2025;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    description character varying(1000) NOT NULL,
    title character varying(255) NOT NULL,
    creator_id bigint,
    category_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.questions OWNER TO pmp2025;

--
-- Name: questions_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.questions_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_seq OWNER TO pmp2025;

--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.refresh_tokens (
    user_id bigint NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO pmp2025;

--
-- Name: results; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.results (
    id bigint NOT NULL,
    grade integer NOT NULL,
    test_finish_time timestamp(6) without time zone,
    test_start_time timestamp(6) without time zone,
    test_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.results OWNER TO pmp2025;

--
-- Name: results_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.results_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.results_seq OWNER TO pmp2025;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO pmp2025;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO pmp2025;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: search_statistics; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.search_statistics (
    id bigint NOT NULL,
    search_string character varying(255) NOT NULL,
    search_count bigint,
    search_date timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.search_statistics OWNER TO pmp2025;

--
-- Name: search_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.search_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_statistics_id_seq OWNER TO pmp2025;

--
-- Name: search_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.search_statistics_id_seq OWNED BY public.search_statistics.id;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.stations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    city_id bigint NOT NULL,
    district_id bigint
);


ALTER TABLE public.stations OWNER TO pmp2025;

--
-- Name: stations_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stations_id_seq OWNER TO pmp2025;

--
-- Name: stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    expiration_date date NOT NULL,
    group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO pmp2025;

--
-- Name: subscriptions_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.subscriptions_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_seq OWNER TO pmp2025;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    description character varying(10000),
    header_text character varying(10000) NOT NULL,
    is_active boolean,
    name character varying(255) NOT NULL,
    picture character varying(255) NOT NULL,
    start_date date,
    challenge_id bigint
);


ALTER TABLE public.tasks OWNER TO pmp2025;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO pmp2025;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.tests (
    id bigint NOT NULL,
    active boolean NOT NULL,
    archived boolean NOT NULL,
    counter integer NOT NULL,
    date_of_creation date,
    description character varying(1000) NOT NULL,
    difficulty integer NOT NULL,
    duration integer NOT NULL,
    grade integer NOT NULL,
    title character varying(255) NOT NULL,
    creator_id bigint NOT NULL,
    topic_id bigint
);


ALTER TABLE public.tests OWNER TO pmp2025;

--
-- Name: tests_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.tests_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_seq OWNER TO pmp2025;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.topics (
    id bigint NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.topics OWNER TO pmp2025;

--
-- Name: topics_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.topics_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topics_seq OWNER TO pmp2025;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    phone character varying(255),
    provider character varying(255),
    provider_id character varying(255),
    status boolean,
    url_logo character varying(255),
    verification_code character varying(255),
    role_id integer,
    CONSTRAINT users_provider_check CHECK (((provider)::text = ANY ((ARRAY['local'::character varying, 'facebook'::character varying, 'google'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO pmp2025;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO pmp2025;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pmp2025
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: work_times; Type: TABLE; Schema: public; Owner: pmp2025
--

CREATE TABLE public.work_times (
    id bigint NOT NULL,
    day smallint,
    end_time character varying(255),
    start_time character varying(255),
    club_id bigint NOT NULL,
    CONSTRAINT work_times_day_check CHECK (((day >= 0) AND (day <= 6)))
);


ALTER TABLE public.work_times OWNER TO pmp2025;

--
-- Name: work_times_seq; Type: SEQUENCE; Schema: public; Owner: pmp2025
--

CREATE SEQUENCE public.work_times_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.work_times_seq OWNER TO pmp2025;

--
-- Name: about_us_items id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.about_us_items ALTER COLUMN id SET DEFAULT nextval('public.about_us_items_id_seq'::regclass);


--
-- Name: archive id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.archive ALTER COLUMN id SET DEFAULT nextval('public.archive_id_seq'::regclass);


--
-- Name: banner_items id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.banner_items ALTER COLUMN id SET DEFAULT nextval('public.banner_items_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: centers id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.centers ALTER COLUMN id SET DEFAULT nextval('public.centers_id_seq'::regclass);


--
-- Name: certificate_dates id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_dates ALTER COLUMN id SET DEFAULT nextval('public.certificate_dates_id_seq'::regclass);


--
-- Name: certificate_templates id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_templates ALTER COLUMN id SET DEFAULT nextval('public.certificate_templates_id_seq'::regclass);


--
-- Name: certificate_types id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_types ALTER COLUMN id SET DEFAULT nextval('public.certificate_types_id_seq'::regclass);


--
-- Name: certificates id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates ALTER COLUMN id SET DEFAULT nextval('public.certificates_id_seq'::regclass);


--
-- Name: challenge_registrations id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenge_registrations ALTER COLUMN id SET DEFAULT nextval('public.challenge_registrations_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: children id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.children ALTER COLUMN id SET DEFAULT nextval('public.children_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: club_registrations id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_registrations ALTER COLUMN id SET DEFAULT nextval('public.club_registrations_id_seq'::regclass);


--
-- Name: clubs id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.clubs ALTER COLUMN id SET DEFAULT nextval('public.clubs_id_seq'::regclass);


--
-- Name: complaints id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.complaints ALTER COLUMN id SET DEFAULT nextval('public.complaints_id_seq'::regclass);


--
-- Name: contact_type id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.contact_type ALTER COLUMN id SET DEFAULT nextval('public.contact_type_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- Name: excel_center_entity autogenerated_id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.excel_center_entity ALTER COLUMN autogenerated_id SET DEFAULT nextval('public.excel_center_entity_autogenerated_id_seq'::regclass);


--
-- Name: excel_club_entity autogenerated_id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.excel_club_entity ALTER COLUMN autogenerated_id SET DEFAULT nextval('public.excel_club_entity_autogenerated_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: galleries id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.galleries ALTER COLUMN id SET DEFAULT nextval('public.galleries_id_seq'::regclass);


--
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: messengers id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messengers ALTER COLUMN id SET DEFAULT nextval('public.messengers_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: search_statistics id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.search_statistics ALTER COLUMN id SET DEFAULT nextval('public.search_statistics_id_seq'::regclass);


--
-- Name: stations id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: about_us_items; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.about_us_items (id, number, picture, text, type, video) FROM stdin;
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.answers (id, correct, text, value, question_id) FROM stdin;
\.


--
-- Data for Name: archive; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.archive (id, class_name, data) FROM stdin;
\.


--
-- Data for Name: banner_items; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.banner_items (id, link, picture, sequence_number, subtitle, title) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.categories (id, background_color, description, name, sortby, tag_background_color, tag_text_color, url_logo) FROM stdin;
\.


--
-- Data for Name: centers; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.centers (id, center_external_id, club_count, contacts, description, feedback_count, name, rating, url_background_picture, url_logo, url_web, user_id) FROM stdin;
\.


--
-- Data for Name: certificate_dates; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.certificate_dates (id, course_number, date, duration, hours, study_form) FROM stdin;
\.


--
-- Data for Name: certificate_templates; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.certificate_templates (id, course_description, file_path, name, picture_path, project_description, properties, certificate_type) FROM stdin;
\.


--
-- Data for Name: certificate_types; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.certificate_types (id, code_number, name) FROM stdin;
\.


--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.certificates (id, messenger_name, send_status, user_email, serial_number, update_status, user_name, "values", dates_id, messenger_id, template_id, user_id) FROM stdin;
\.


--
-- Data for Name: challenge_registrations; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.challenge_registrations (id, comment, is_active, is_approved, registration_date, challenge_id, child_id, user_id) FROM stdin;
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.challenges (id, description, is_active, name, picture, registration_link, sort_number, title, user_id) FROM stdin;
\.


--
-- Data for Name: children; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.children (id, age, first_name, last_name, gender_id, parent_id) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.cities (id, latitude, longitude, name) FROM stdin;
\.


--
-- Data for Name: club_category; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.club_category (club_id, category_id) FROM stdin;
\.


--
-- Data for Name: club_registrations; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.club_registrations (id, comment, is_active, is_approved, registration_date, child_id, club_id, user_id) FROM stdin;
\.


--
-- Data for Name: clubs; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.clubs (id, age_from, age_to, center_external_id, club_external_id, contacts, description, feedback_count, is_approved, is_online, name, rating, url_background, url_logo, url_web, center_id, user_id) FROM stdin;
\.


--
-- Data for Name: complaints; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.complaints (id, answer_text, date, has_answer, is_active, text, club_id, recipient_id, user_id) FROM stdin;
\.


--
-- Data for Name: contact_type; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.contact_type (id, name, url_logo) FROM stdin;
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.districts (id, name, city_id) FROM stdin;
\.


--
-- Data for Name: excel_center_entity; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.excel_center_entity (autogenerated_id, address, center_external_id, city_name, coordinates, description, district, name, phone, station, web_contact) FROM stdin;
\.


--
-- Data for Name: excel_club_entity; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.excel_club_entity (autogenerated_id, address, ages, categories, center_external_id, city_name, club_external_id, coordinates, description, district, name, phone, station, web_contact) FROM stdin;
\.


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.feedbacks (id, date, rate, text, club_id, parent_comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: galleries; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.galleries (id, url, club_id) FROM stdin;
\.


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.gender (id, value) FROM stdin;
\.


--
-- Data for Name: group_cohort; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.group_cohort (id, end_date, enrollment_key, start_date, title) FROM stdin;
\.


--
-- Data for Name: group_test; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.group_test (id, group_id, test_id) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.locations (id, address, latitude, longitude, name, phone, center_id, city_id, club_id, district_id, station_id) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.messages (id, date, is_active, is_answered, text, club_id, recipient_id, sender_id) FROM stdin;
\.


--
-- Data for Name: messengers; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.messengers (id, access_key, name) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.news (id, date, description, is_active, title, url_title_logo, user_id) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.question (id, text, title) FROM stdin;
\.


--
-- Data for Name: question_categories; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.question_categories (id, title) FROM stdin;
\.


--
-- Data for Name: question_histories; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.question_histories (id, answer_id, result_id) FROM stdin;
\.


--
-- Data for Name: question_test; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.question_test (id, question_id, test_id) FROM stdin;
\.


--
-- Data for Name: question_types; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.question_types (id, title) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.questions (id, description, title, creator_id, category_id, type_id) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.refresh_tokens (user_id, token) FROM stdin;
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.results (id, grade, test_finish_time, test_start_time, test_id, user_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.roles (id, name) FROM stdin;
\.


--
-- Data for Name: search_statistics; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.search_statistics (id, search_string, search_count, search_date, user_id) FROM stdin;
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.stations (id, name, city_id, district_id) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.subscriptions (id, expiration_date, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.tasks (id, description, header_text, is_active, name, picture, start_date, challenge_id) FROM stdin;
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.tests (id, active, archived, counter, date_of_creation, description, difficulty, duration, grade, title, creator_id, topic_id) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.topics (id, title) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.users (id, email, first_name, last_name, password, phone, provider, provider_id, status, url_logo, verification_code, role_id) FROM stdin;
\.


--
-- Data for Name: work_times; Type: TABLE DATA; Schema: public; Owner: pmp2025
--

COPY public.work_times (id, day, end_time, start_time, club_id) FROM stdin;
\.


--
-- Name: about_us_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.about_us_items_id_seq', 1, false);


--
-- Name: answers_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.answers_seq', 1, false);


--
-- Name: archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.archive_id_seq', 1, false);


--
-- Name: banner_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.banner_items_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.centers_id_seq', 1, false);


--
-- Name: certificate_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.certificate_dates_id_seq', 1, false);


--
-- Name: certificate_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.certificate_templates_id_seq', 1, false);


--
-- Name: certificate_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.certificate_types_id_seq', 1, false);


--
-- Name: certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.certificates_id_seq', 1, false);


--
-- Name: challenge_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.challenge_registrations_id_seq', 1, false);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.challenges_id_seq', 1, false);


--
-- Name: children_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.children_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: club_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.club_registrations_id_seq', 1, false);


--
-- Name: clubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.clubs_id_seq', 1, false);


--
-- Name: complaints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.complaints_id_seq', 1, false);


--
-- Name: contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.contact_type_id_seq', 1, false);


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.districts_id_seq', 1, false);


--
-- Name: excel_center_entity_autogenerated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.excel_center_entity_autogenerated_id_seq', 1, false);


--
-- Name: excel_club_entity_autogenerated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.excel_club_entity_autogenerated_id_seq', 1, false);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);


--
-- Name: galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.galleries_id_seq', 1, false);


--
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.gender_id_seq', 1, false);


--
-- Name: group_cohort_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.group_cohort_seq', 1, false);


--
-- Name: group_test_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.group_test_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: messengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.messengers_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: question_categories_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.question_categories_seq', 1, false);


--
-- Name: question_histories_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.question_histories_seq', 1, false);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.question_id_seq', 1, false);


--
-- Name: question_test_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.question_test_seq', 1, false);


--
-- Name: question_types_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.question_types_seq', 1, false);


--
-- Name: questions_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.questions_seq', 1, false);


--
-- Name: results_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.results_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: search_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.search_statistics_id_seq', 1, false);


--
-- Name: stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.stations_id_seq', 1, false);


--
-- Name: subscriptions_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.subscriptions_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: tests_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.tests_seq', 1, false);


--
-- Name: topics_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.topics_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: work_times_seq; Type: SEQUENCE SET; Schema: public; Owner: pmp2025
--

SELECT pg_catalog.setval('public.work_times_seq', 1, false);


--
-- Name: about_us_items about_us_items_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.about_us_items
    ADD CONSTRAINT about_us_items_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (id);


--
-- Name: banner_items banner_items_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.banner_items
    ADD CONSTRAINT banner_items_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: centers centers_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.centers
    ADD CONSTRAINT centers_pkey PRIMARY KEY (id);


--
-- Name: certificate_dates certificate_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_dates
    ADD CONSTRAINT certificate_dates_pkey PRIMARY KEY (id);


--
-- Name: certificate_templates certificate_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_templates
    ADD CONSTRAINT certificate_templates_pkey PRIMARY KEY (id);


--
-- Name: certificate_types certificate_types_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_types
    ADD CONSTRAINT certificate_types_pkey PRIMARY KEY (id);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: challenge_registrations challenge_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenge_registrations
    ADD CONSTRAINT challenge_registrations_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: children children_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT children_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: club_category club_category_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_category
    ADD CONSTRAINT club_category_pkey PRIMARY KEY (club_id, category_id);


--
-- Name: club_registrations club_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_registrations
    ADD CONSTRAINT club_registrations_pkey PRIMARY KEY (id);


--
-- Name: clubs clubs_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT clubs_pkey PRIMARY KEY (id);


--
-- Name: complaints complaints_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT complaints_pkey PRIMARY KEY (id);


--
-- Name: contact_type contact_type_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.contact_type
    ADD CONSTRAINT contact_type_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: excel_center_entity excel_center_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.excel_center_entity
    ADD CONSTRAINT excel_center_entity_pkey PRIMARY KEY (autogenerated_id);


--
-- Name: excel_club_entity excel_club_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.excel_club_entity
    ADD CONSTRAINT excel_club_entity_pkey PRIMARY KEY (autogenerated_id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: galleries galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_pkey PRIMARY KEY (id);


--
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- Name: group_cohort group_cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_cohort
    ADD CONSTRAINT group_cohort_pkey PRIMARY KEY (id);


--
-- Name: group_test group_test_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_test
    ADD CONSTRAINT group_test_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: messengers messengers_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messengers
    ADD CONSTRAINT messengers_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: question_categories question_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_categories
    ADD CONSTRAINT question_categories_pkey PRIMARY KEY (id);


--
-- Name: question_histories question_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_histories
    ADD CONSTRAINT question_histories_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: question_test question_test_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_test
    ADD CONSTRAINT question_test_pkey PRIMARY KEY (id);


--
-- Name: question_types question_types_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_types
    ADD CONSTRAINT question_types_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (user_id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: search_statistics search_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.search_statistics
    ADD CONSTRAINT search_statistics_pkey PRIMARY KEY (id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: question_types uk_4bttdhrgb2sfkslrby2tjpeje; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_types
    ADD CONSTRAINT uk_4bttdhrgb2sfkslrby2tjpeje UNIQUE (title);


--
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: topics uk_71rjsqaorlydivvwh8xgousre; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT uk_71rjsqaorlydivvwh8xgousre UNIQUE (title);


--
-- Name: group_cohort uk_7x3042gpy70jrl0x9ewls3a54; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_cohort
    ADD CONSTRAINT uk_7x3042gpy70jrl0x9ewls3a54 UNIQUE (title);


--
-- Name: certificates uk_fhimy9jsw510b0ga7b2wo2nw2; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT uk_fhimy9jsw510b0ga7b2wo2nw2 UNIQUE (serial_number);


--
-- Name: refresh_tokens uk_ghpmfn23vmxfu3spu3lfg4r2d; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT uk_ghpmfn23vmxfu3spu3lfg4r2d UNIQUE (token);


--
-- Name: question_categories uk_gix6vh77tsywr8pqem8hqr4i1; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_categories
    ADD CONSTRAINT uk_gix6vh77tsywr8pqem8hqr4i1 UNIQUE (title);


--
-- Name: group_cohort uk_gnsw6jvw7sjgpwk7rlss5rjfj; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_cohort
    ADD CONSTRAINT uk_gnsw6jvw7sjgpwk7rlss5rjfj UNIQUE (enrollment_key);


--
-- Name: tests uk_m8r0mdwal61kks84anyptqq28; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT uk_m8r0mdwal61kks84anyptqq28 UNIQUE (title);


--
-- Name: gender uk_t5209l4f2saa5sluc94yu8gkv; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT uk_t5209l4f2saa5sluc94yu8gkv UNIQUE (value);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_times work_times_pkey; Type: CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.work_times
    ADD CONSTRAINT work_times_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens fk1lih5y2npsf8u5o3vhdb9y0os; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT fk1lih5y2npsf8u5o3vhdb9y0os FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: certificates fk1qd9d9utbnnhhqff0e01nmgwl; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fk1qd9d9utbnnhhqff0e01nmgwl FOREIGN KEY (template_id) REFERENCES public.certificate_templates(id);


--
-- Name: clubs fk1xhm2dh5qqkgmk7jvnjfypj5r; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT fk1xhm2dh5qqkgmk7jvnjfypj5r FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: feedbacks fk312drfl5lquu37mu4trk8jkwx; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk312drfl5lquu37mu4trk8jkwx FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: tests fk373ae65h4qi40iudg5ansmyl1; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT fk373ae65h4qi40iudg5ansmyl1 FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: subscriptions fk38mfc31de2cy9jonmkf8qd65j; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk38mfc31de2cy9jonmkf8qd65j FOREIGN KEY (group_id) REFERENCES public.group_cohort(id);


--
-- Name: answers fk3erw1a3t0r78st8ty27x6v3g1; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk3erw1a3t0r78st8ty27x6v3g1 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: districts fk3g7x8w4lc7qxth7ibrr5j73mn; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT fk3g7x8w4lc7qxth7ibrr5j73mn FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: questions fk3iss7rwyj4owl79g8srmcrut; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk3iss7rwyj4owl79g8srmcrut FOREIGN KEY (creator_id) REFERENCES public.users(id);


--
-- Name: challenge_registrations fk4r2wv9aynpvtudxx1lkrhpq63; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenge_registrations
    ADD CONSTRAINT fk4r2wv9aynpvtudxx1lkrhpq63 FOREIGN KEY (child_id) REFERENCES public.children(id);


--
-- Name: messages fk4ui4nnwntodh6wjvck53dbk9m; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk4ui4nnwntodh6wjvck53dbk9m FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: locations fk5ijtb4ugmep9k8ab2p4ed43l3; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk5ijtb4ugmep9k8ab2p4ed43l3 FOREIGN KEY (station_id) REFERENCES public.stations(id);


--
-- Name: feedbacks fk6417t43f58x37nb1wcp9lm5i9; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk6417t43f58x37nb1wcp9lm5i9 FOREIGN KEY (parent_comment_id) REFERENCES public.feedbacks(id);


--
-- Name: club_registrations fk6dhs80coe1dyqf5iefpb4dnfb; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_registrations
    ADD CONSTRAINT fk6dhs80coe1dyqf5iefpb4dnfb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: centers fk73norooj6brlyapi2qea4a3en; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.centers
    ADD CONSTRAINT fk73norooj6brlyapi2qea4a3en FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: work_times fk76d7ii5cl4pbrv2dty0u8qvcx; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.work_times
    ADD CONSTRAINT fk76d7ii5cl4pbrv2dty0u8qvcx FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: challenge_registrations fk7cyxfogvqq63cvt7j75rt12m1; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenge_registrations
    ADD CONSTRAINT fk7cyxfogvqq63cvt7j75rt12m1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: locations fk7xyalt4hc89w4wa9h07b04soh; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk7xyalt4hc89w4wa9h07b04soh FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: complaints fk83j5gqkd7ku4vc908g4rtmglr; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT fk83j5gqkd7ku4vc908g4rtmglr FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages fk8o3b25vv59afgqud1ouk2ku20; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk8o3b25vv59afgqud1ouk2ku20 FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: question_histories fk8tq9rhow7urng6hygcw5c6tn9; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_histories
    ADD CONSTRAINT fk8tq9rhow7urng6hygcw5c6tn9 FOREIGN KEY (answer_id) REFERENCES public.answers(id);


--
-- Name: locations fkbkovb2jgv756p7s2w86rpqjl7; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fkbkovb2jgv756p7s2w86rpqjl7 FOREIGN KEY (center_id) REFERENCES public.centers(id);


--
-- Name: club_registrations fkbq5k9lkdgpu3njex91e7ebpmu; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_registrations
    ADD CONSTRAINT fkbq5k9lkdgpu3njex91e7ebpmu FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: certificates fkd3f6enpb3p3xovee9klklf05r; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fkd3f6enpb3p3xovee9klklf05r FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: certificates fkdqyrid48p3q6pwbrce1vl9q2b; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fkdqyrid48p3q6pwbrce1vl9q2b FOREIGN KEY (messenger_id) REFERENCES public.messengers(id);


--
-- Name: results fke9uvk96os1lxpp8pf93p13lmv; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fke9uvk96os1lxpp8pf93p13lmv FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: question_test fkex6u724ix56twjgwpgryrp35x; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_test
    ADD CONSTRAINT fkex6u724ix56twjgwpgryrp35x FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: questions fkgs76rjb04cffxyn6wxdu40dr5; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fkgs76rjb04cffxyn6wxdu40dr5 FOREIGN KEY (category_id) REFERENCES public.question_categories(id);


--
-- Name: locations fkgvg10vlf7gqvbgf9rbbho3gyg; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fkgvg10vlf7gqvbgf9rbbho3gyg FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: question_histories fkhcg85hat41x6gqkhnael43bxl; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_histories
    ADD CONSTRAINT fkhcg85hat41x6gqkhnael43bxl FOREIGN KEY (result_id) REFERENCES public.results(id);


--
-- Name: messages fkhdkwfnspwb3s60j27vpg0rpg6; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fkhdkwfnspwb3s60j27vpg0rpg6 FOREIGN KEY (recipient_id) REFERENCES public.users(id);


--
-- Name: subscriptions fkhro52ohfqfbay9774bev0qinr; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fkhro52ohfqfbay9774bev0qinr FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: news fki09n75txtudw1kawj5o7i8xag; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT fki09n75txtudw1kawj5o7i8xag FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: tasks fkj2p2ll95ivoc2w5o6xk8gv19n; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fkj2p2ll95ivoc2w5o6xk8gv19n FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: stations fkji0m6sso6boeu6xvte5203s9u; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT fkji0m6sso6boeu6xvte5203s9u FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: galleries fkjwbbnldbc5ef8t6db81yc8jqc; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT fkjwbbnldbc5ef8t6db81yc8jqc FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: feedbacks fkk872m69bbxc8s1emqpeh0aotf; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fkk872m69bbxc8s1emqpeh0aotf FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: search_statistics fkko6eog41qcr1a4q0w45tt15lk; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.search_statistics
    ADD CONSTRAINT fkko6eog41qcr1a4q0w45tt15lk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: challenges fkle3q0kbl0hsc262e7qnjw6dgw; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT fkle3q0kbl0hsc262e7qnjw6dgw FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: certificate_templates fkmeau2nef2bpm5ryk386dcslw; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificate_templates
    ADD CONSTRAINT fkmeau2nef2bpm5ryk386dcslw FOREIGN KEY (certificate_type) REFERENCES public.certificate_types(id);


--
-- Name: complaints fkmwmuihaot2wl961fc34kkbixc; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT fkmwmuihaot2wl961fc34kkbixc FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: certificates fknh6803bl6ka99km8ihkbwiduy; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fknh6803bl6ka99km8ihkbwiduy FOREIGN KEY (dates_id) REFERENCES public.certificate_dates(id);


--
-- Name: children fknj4ttxxbdk18yp1765brwyeeg; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT fknj4ttxxbdk18yp1765brwyeeg FOREIGN KEY (parent_id) REFERENCES public.users(id);


--
-- Name: club_category fknsax6ydqagabtmnf4u7qhuevv; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_category
    ADD CONSTRAINT fknsax6ydqagabtmnf4u7qhuevv FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: group_test fknxc9hydliy7g2ckvyqx7hro6m; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_test
    ADD CONSTRAINT fknxc9hydliy7g2ckvyqx7hro6m FOREIGN KEY (group_id) REFERENCES public.group_cohort(id);


--
-- Name: complaints fkogqj5hg9mh4bh7to8p7widfa5; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT fkogqj5hg9mh4bh7to8p7widfa5 FOREIGN KEY (recipient_id) REFERENCES public.users(id);


--
-- Name: stations fkp4rtd15xpw5k5gdouckn6n1ot; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT fkp4rtd15xpw5k5gdouckn6n1ot FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: challenge_registrations fkp61usnjrlwluo6yu0efhbs66u; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.challenge_registrations
    ADD CONSTRAINT fkp61usnjrlwluo6yu0efhbs66u FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: questions fkpkhrd1qpikab418x0g1b08x05; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fkpkhrd1qpikab418x0g1b08x05 FOREIGN KEY (type_id) REFERENCES public.question_types(id);


--
-- Name: tests fkr7jvpkki2ex6tkkv4gebcl5ic; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT fkr7jvpkki2ex6tkkv4gebcl5ic FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- Name: group_test fkrwpma9tpdxxxr2oj4e1xn1s00; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.group_test
    ADD CONSTRAINT fkrwpma9tpdxxxr2oj4e1xn1s00 FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: locations fksd2oc9stvx013fb8ky33sxgg4; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fksd2oc9stvx013fb8ky33sxgg4 FOREIGN KEY (district_id) REFERENCES public.districts(id);


--
-- Name: clubs fktm4j4gjuxxtg4jqxlq4qwyku2; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT fktm4j4gjuxxtg4jqxlq4qwyku2 FOREIGN KEY (center_id) REFERENCES public.centers(id);


--
-- Name: club_category fktnik978vedu4t3mq441t7eqed; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_category
    ADD CONSTRAINT fktnik978vedu4t3mq441t7eqed FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: question_test fktoqoxp1agaopyslvxiesxiqix; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.question_test
    ADD CONSTRAINT fktoqoxp1agaopyslvxiesxiqix FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: children fktqqv217l2w331dq28ix06mfkj; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT fktqqv217l2w331dq28ix06mfkj FOREIGN KEY (gender_id) REFERENCES public.gender(id);


--
-- Name: club_registrations fkwje0flrlmvpjdsefdwrchtjo; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.club_registrations
    ADD CONSTRAINT fkwje0flrlmvpjdsefdwrchtjo FOREIGN KEY (child_id) REFERENCES public.children(id);


--
-- Name: results fkxtl9ahma532if6r68yvgo7ck; Type: FK CONSTRAINT; Schema: public; Owner: pmp2025
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fkxtl9ahma532if6r68yvgo7ck FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

