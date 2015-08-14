--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO gerrard;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO gerrard;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO gerrard;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO gerrard;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO gerrard;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO gerrard;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_user (
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


ALTER TABLE auth_user OWNER TO gerrard;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO gerrard;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO gerrard;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO gerrard;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO gerrard;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO gerrard;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE blog_blogcategory (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE blog_blogcategory OWNER TO gerrard;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE blog_blogcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogcategory_id_seq OWNER TO gerrard;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE blog_blogcategory_id_seq OWNED BY blog_blogcategory.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE blog_blogpost (
    id integer NOT NULL,
    comments_count integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    content text NOT NULL,
    allow_comments boolean NOT NULL,
    featured_image character varying(255),
    site_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE blog_blogpost OWNER TO gerrard;

--
-- Name: blog_blogpost_categories; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE blog_blogpost_categories (
    id integer NOT NULL,
    blogpost_id integer NOT NULL,
    blogcategory_id integer NOT NULL
);


ALTER TABLE blog_blogpost_categories OWNER TO gerrard;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE blog_blogpost_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_categories_id_seq OWNER TO gerrard;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE blog_blogpost_categories_id_seq OWNED BY blog_blogpost_categories.id;


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_id_seq OWNER TO gerrard;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: blog_blogpost_related_posts; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE blog_blogpost_related_posts (
    id integer NOT NULL,
    from_blogpost_id integer NOT NULL,
    to_blogpost_id integer NOT NULL
);


ALTER TABLE blog_blogpost_related_posts OWNER TO gerrard;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE blog_blogpost_related_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_related_posts_id_seq OWNER TO gerrard;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE blog_blogpost_related_posts_id_seq OWNED BY blog_blogpost_related_posts.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE conf_setting (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE conf_setting OWNER TO gerrard;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE conf_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conf_setting_id_seq OWNER TO gerrard;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE conf_setting_id_seq OWNED BY conf_setting.id;


--
-- Name: core_sitepermission; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE core_sitepermission (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE core_sitepermission OWNER TO gerrard;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE core_sitepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_id_seq OWNER TO gerrard;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE core_sitepermission_id_seq OWNED BY core_sitepermission.id;


--
-- Name: core_sitepermission_sites; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE core_sitepermission_sites (
    id integer NOT NULL,
    sitepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE core_sitepermission_sites OWNER TO gerrard;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE core_sitepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_sites_id_seq OWNER TO gerrard;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE core_sitepermission_sites_id_seq OWNED BY core_sitepermission_sites.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO gerrard;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO gerrard;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE django_comment_flags OWNER TO gerrard;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comment_flags_id_seq OWNER TO gerrard;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE django_comments OWNER TO gerrard;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comments_id_seq OWNER TO gerrard;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO gerrard;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO gerrard;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO gerrard;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO gerrard;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE django_redirect OWNER TO gerrard;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_redirect_id_seq OWNER TO gerrard;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO gerrard;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO gerrard;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO gerrard;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: forms_field; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE forms_field (
    id integer NOT NULL,
    _order integer,
    label character varying(200) NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100) NOT NULL,
    help_text character varying(100) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_field OWNER TO gerrard;

--
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE forms_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_field_id_seq OWNER TO gerrard;

--
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE forms_field_id_seq OWNED BY forms_field.id;


--
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


ALTER TABLE forms_fieldentry OWNER TO gerrard;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE forms_fieldentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_fieldentry_id_seq OWNER TO gerrard;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE forms_fieldentry_id_seq OWNED BY forms_fieldentry.id;


--
-- Name: forms_form; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE forms_form (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


ALTER TABLE forms_form OWNER TO gerrard;

--
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_formentry OWNER TO gerrard;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE forms_formentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_formentry_id_seq OWNER TO gerrard;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE forms_formentry_id_seq OWNED BY forms_formentry.id;


--
-- Name: galleries_gallery; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE galleries_gallery (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    zip_import character varying(100) NOT NULL
);


ALTER TABLE galleries_gallery OWNER TO gerrard;

--
-- Name: galleries_galleryimage; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE galleries_galleryimage (
    id integer NOT NULL,
    _order integer,
    file character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE galleries_galleryimage OWNER TO gerrard;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE galleries_galleryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE galleries_galleryimage_id_seq OWNER TO gerrard;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE galleries_galleryimage_id_seq OWNED BY galleries_galleryimage.id;


--
-- Name: generic_assignedkeyword; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE generic_assignedkeyword (
    id integer NOT NULL,
    _order integer,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE generic_assignedkeyword OWNER TO gerrard;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE generic_assignedkeyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_assignedkeyword_id_seq OWNER TO gerrard;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE generic_assignedkeyword_id_seq OWNED BY generic_assignedkeyword.id;


--
-- Name: generic_keyword; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE generic_keyword (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE generic_keyword OWNER TO gerrard;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE generic_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_keyword_id_seq OWNER TO gerrard;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE generic_keyword_id_seq OWNED BY generic_keyword.id;


--
-- Name: generic_rating; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE generic_rating (
    id integer NOT NULL,
    value integer NOT NULL,
    rating_date timestamp with time zone,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE generic_rating OWNER TO gerrard;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE generic_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_rating_id_seq OWNER TO gerrard;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE generic_rating_id_seq OWNED BY generic_rating.id;


--
-- Name: generic_threadedcomment; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE generic_threadedcomment (
    comment_ptr_id integer NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    by_author boolean NOT NULL,
    replied_to_id integer
);


ALTER TABLE generic_threadedcomment OWNER TO gerrard;

--
-- Name: grow_records_bed; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_bed (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    width_in integer NOT NULL,
    length_ft integer NOT NULL,
    block_id integer,
    site_id integer
);


ALTER TABLE grow_records_bed OWNER TO gerrard;

--
-- Name: grow_records_bed_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_bed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_bed_id_seq OWNER TO gerrard;

--
-- Name: grow_records_bed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_bed_id_seq OWNED BY grow_records_bed.id;


--
-- Name: grow_records_bedrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_bedrecord (
    id integer NOT NULL,
    bed_id integer,
    nursery_record_id integer,
    variety_id integer,
    rows integer,
    spacing_in integer,
    in_bed_date timestamp with time zone,
    seeder_id integer,
    out_bed_date timestamp with time zone,
    bed_percent integer
);


ALTER TABLE grow_records_bedrecord OWNER TO gerrard;

--
-- Name: grow_records_bedrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_bedrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_bedrecord_id_seq OWNER TO gerrard;

--
-- Name: grow_records_bedrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_bedrecord_id_seq OWNED BY grow_records_bedrecord.id;


--
-- Name: grow_records_block; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_block (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    site_id integer
);


ALTER TABLE grow_records_block OWNER TO gerrard;

--
-- Name: grow_records_block_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_block_id_seq OWNER TO gerrard;

--
-- Name: grow_records_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_block_id_seq OWNED BY grow_records_block.id;


--
-- Name: grow_records_buyer; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_buyer (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE grow_records_buyer OWNER TO gerrard;

--
-- Name: grow_records_buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_buyer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_buyer_id_seq OWNER TO gerrard;

--
-- Name: grow_records_buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_buyer_id_seq OWNED BY grow_records_buyer.id;


--
-- Name: grow_records_commonname; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_commonname (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE grow_records_commonname OWNER TO gerrard;

--
-- Name: grow_records_commonname_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_commonname_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_commonname_id_seq OWNER TO gerrard;

--
-- Name: grow_records_commonname_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_commonname_id_seq OWNED BY grow_records_commonname.id;


--
-- Name: grow_records_crop; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_crop (
    id integer NOT NULL,
    genus_id integer,
    species_id integer,
    common_name_id integer
);


ALTER TABLE grow_records_crop OWNER TO gerrard;

--
-- Name: grow_records_crop_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_crop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_crop_id_seq OWNER TO gerrard;

--
-- Name: grow_records_crop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_crop_id_seq OWNED BY grow_records_crop.id;


--
-- Name: grow_records_deliveryitem; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_deliveryitem (
    id integer NOT NULL,
    amount double precision NOT NULL,
    delivery_record_id integer,
    variety_id integer,
    unit character varying(2),
    price_id integer
);


ALTER TABLE grow_records_deliveryitem OWNER TO gerrard;

--
-- Name: grow_records_deliveryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_deliveryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_deliveryitem_id_seq OWNER TO gerrard;

--
-- Name: grow_records_deliveryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_deliveryitem_id_seq OWNED BY grow_records_deliveryitem.id;


--
-- Name: grow_records_deliveryrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_deliveryrecord (
    id integer NOT NULL,
    date timestamp with time zone,
    buyer_id integer
);


ALTER TABLE grow_records_deliveryrecord OWNER TO gerrard;

--
-- Name: grow_records_deliveryrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_deliveryrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_deliveryrecord_id_seq OWNER TO gerrard;

--
-- Name: grow_records_deliveryrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_deliveryrecord_id_seq OWNED BY grow_records_deliveryrecord.id;


--
-- Name: grow_records_genus; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_genus (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE grow_records_genus OWNER TO gerrard;

--
-- Name: grow_records_genus_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_genus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_genus_id_seq OWNER TO gerrard;

--
-- Name: grow_records_genus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_genus_id_seq OWNED BY grow_records_genus.id;


--
-- Name: grow_records_harvestrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_harvestrecord (
    id integer NOT NULL,
    bed_record_id integer,
    harvest_date timestamp with time zone,
    amount double precision NOT NULL,
    unit character varying(2)
);


ALTER TABLE grow_records_harvestrecord OWNER TO gerrard;

--
-- Name: grow_records_harvestrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_harvestrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_harvestrecord_id_seq OWNER TO gerrard;

--
-- Name: grow_records_harvestrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_harvestrecord_id_seq OWNED BY grow_records_harvestrecord.id;


--
-- Name: grow_records_nurseryrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_nurseryrecord (
    id integer NOT NULL,
    in_nursery_date timestamp with time zone,
    germ_date timestamp with time zone,
    tray_size_cell integer,
    medium_id integer,
    variety_id integer,
    number_trays double precision
);


ALTER TABLE grow_records_nurseryrecord OWNER TO gerrard;

--
-- Name: grow_records_nurseryrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_nurseryrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_nurseryrecord_id_seq OWNER TO gerrard;

--
-- Name: grow_records_nurseryrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_nurseryrecord_id_seq OWNED BY grow_records_nurseryrecord.id;


--
-- Name: grow_records_potonrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_potonrecord (
    id integer NOT NULL,
    pot_on_date timestamp with time zone NOT NULL,
    pot_size_in integer,
    medium_id integer,
    nursery_record_id integer
);


ALTER TABLE grow_records_potonrecord OWNER TO gerrard;

--
-- Name: grow_records_potonrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_potonrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_potonrecord_id_seq OWNER TO gerrard;

--
-- Name: grow_records_potonrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_potonrecord_id_seq OWNED BY grow_records_potonrecord.id;


--
-- Name: grow_records_price; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_price (
    id integer NOT NULL,
    date timestamp with time zone,
    price double precision,
    unit character varying(2),
    variety_id integer
);


ALTER TABLE grow_records_price OWNER TO gerrard;

--
-- Name: grow_records_price_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_price_id_seq OWNER TO gerrard;

--
-- Name: grow_records_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_price_id_seq OWNED BY grow_records_price.id;


--
-- Name: grow_records_seederrecord; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_seederrecord (
    id integer NOT NULL,
    name character varying(2) NOT NULL,
    seeder_settings character varying(100)
);


ALTER TABLE grow_records_seederrecord OWNER TO gerrard;

--
-- Name: grow_records_seeder_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_seeder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_seeder_id_seq OWNER TO gerrard;

--
-- Name: grow_records_seeder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_seeder_id_seq OWNED BY grow_records_seederrecord.id;


--
-- Name: grow_records_site; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_site (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE grow_records_site OWNER TO gerrard;

--
-- Name: grow_records_site_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_site_id_seq OWNER TO gerrard;

--
-- Name: grow_records_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_site_id_seq OWNED BY grow_records_site.id;


--
-- Name: grow_records_soilmediumbatch; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_soilmediumbatch (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    recipe character varying(300) NOT NULL
);


ALTER TABLE grow_records_soilmediumbatch OWNER TO gerrard;

--
-- Name: grow_records_soilmediumbatch_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_soilmediumbatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_soilmediumbatch_id_seq OWNER TO gerrard;

--
-- Name: grow_records_soilmediumbatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_soilmediumbatch_id_seq OWNED BY grow_records_soilmediumbatch.id;


--
-- Name: grow_records_species; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_species (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE grow_records_species OWNER TO gerrard;

--
-- Name: grow_records_species_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_species_id_seq OWNER TO gerrard;

--
-- Name: grow_records_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_species_id_seq OWNED BY grow_records_species.id;


--
-- Name: grow_records_variety; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE grow_records_variety (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    crop_id integer
);


ALTER TABLE grow_records_variety OWNER TO gerrard;

--
-- Name: grow_records_variety_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE grow_records_variety_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grow_records_variety_id_seq OWNER TO gerrard;

--
-- Name: grow_records_variety_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE grow_records_variety_id_seq OWNED BY grow_records_variety.id;


--
-- Name: pages_link; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE pages_link (
    page_ptr_id integer NOT NULL
);


ALTER TABLE pages_link OWNER TO gerrard;

--
-- Name: pages_page; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE pages_page (
    id integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    _order integer,
    in_menus character varying(100),
    titles character varying(1000),
    content_model character varying(50),
    login_required boolean NOT NULL,
    parent_id integer,
    site_id integer NOT NULL
);


ALTER TABLE pages_page OWNER TO gerrard;

--
-- Name: pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE pages_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pages_page_id_seq OWNER TO gerrard;

--
-- Name: pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE pages_page_id_seq OWNED BY pages_page.id;


--
-- Name: pages_richtextpage; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE pages_richtextpage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE pages_richtextpage OWNER TO gerrard;

--
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE polls_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE polls_choice OWNER TO gerrard;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE polls_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polls_choice_id_seq OWNER TO gerrard;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE polls_choice_id_seq OWNED BY polls_choice.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE polls_question OWNER TO gerrard;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE polls_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polls_question_id_seq OWNER TO gerrard;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE polls_question_id_seq OWNED BY polls_question.id;


--
-- Name: twitter_query; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE twitter_query (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    value character varying(140) NOT NULL,
    interested boolean NOT NULL
);


ALTER TABLE twitter_query OWNER TO gerrard;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE twitter_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_query_id_seq OWNER TO gerrard;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE twitter_query_id_seq OWNED BY twitter_query.id;


--
-- Name: twitter_tweet; Type: TABLE; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE TABLE twitter_tweet (
    id integer NOT NULL,
    remote_id character varying(50) NOT NULL,
    created_at timestamp with time zone,
    text text,
    profile_image_url character varying(200),
    user_name character varying(100),
    full_name character varying(100),
    retweeter_profile_image_url character varying(200),
    retweeter_user_name character varying(100),
    retweeter_full_name character varying(100),
    query_id integer NOT NULL
);


ALTER TABLE twitter_tweet OWNER TO gerrard;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: gerrard
--

CREATE SEQUENCE twitter_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_tweet_id_seq OWNER TO gerrard;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gerrard
--

ALTER SEQUENCE twitter_tweet_id_seq OWNED BY twitter_tweet.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('blog_blogcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_categories ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_related_posts ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_related_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY conf_setting ALTER COLUMN id SET DEFAULT nextval('conf_setting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY core_sitepermission ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY core_sitepermission_sites ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_field ALTER COLUMN id SET DEFAULT nextval('forms_field_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('forms_fieldentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_formentry ALTER COLUMN id SET DEFAULT nextval('forms_formentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY galleries_galleryimage ALTER COLUMN id SET DEFAULT nextval('galleries_galleryimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_assignedkeyword ALTER COLUMN id SET DEFAULT nextval('generic_assignedkeyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_keyword ALTER COLUMN id SET DEFAULT nextval('generic_keyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_rating ALTER COLUMN id SET DEFAULT nextval('generic_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bed ALTER COLUMN id SET DEFAULT nextval('grow_records_bed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bedrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_bedrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_block ALTER COLUMN id SET DEFAULT nextval('grow_records_block_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_buyer ALTER COLUMN id SET DEFAULT nextval('grow_records_buyer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_commonname ALTER COLUMN id SET DEFAULT nextval('grow_records_commonname_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_crop ALTER COLUMN id SET DEFAULT nextval('grow_records_crop_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryitem ALTER COLUMN id SET DEFAULT nextval('grow_records_deliveryitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_deliveryrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_genus ALTER COLUMN id SET DEFAULT nextval('grow_records_genus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_harvestrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_harvestrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_nurseryrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_nurseryrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_potonrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_potonrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_price ALTER COLUMN id SET DEFAULT nextval('grow_records_price_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_seederrecord ALTER COLUMN id SET DEFAULT nextval('grow_records_seeder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_site ALTER COLUMN id SET DEFAULT nextval('grow_records_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_soilmediumbatch ALTER COLUMN id SET DEFAULT nextval('grow_records_soilmediumbatch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_species ALTER COLUMN id SET DEFAULT nextval('grow_records_species_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_variety ALTER COLUMN id SET DEFAULT nextval('grow_records_variety_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY pages_page ALTER COLUMN id SET DEFAULT nextval('pages_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY polls_choice ALTER COLUMN id SET DEFAULT nextval('polls_choice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY polls_question ALTER COLUMN id SET DEFAULT nextval('polls_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY twitter_query ALTER COLUMN id SET DEFAULT nextval('twitter_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY twitter_tweet ALTER COLUMN id SET DEFAULT nextval('twitter_tweet_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add redirect	5	add_redirect
14	Can change redirect	5	change_redirect
15	Can delete redirect	5	delete_redirect
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add Setting	8	add_setting
23	Can change Setting	8	change_setting
24	Can delete Setting	8	delete_setting
25	Can add Site permission	9	add_sitepermission
26	Can change Site permission	9	change_sitepermission
27	Can delete Site permission	9	delete_sitepermission
28	Can add Comment	10	add_threadedcomment
29	Can change Comment	10	change_threadedcomment
30	Can delete Comment	10	delete_threadedcomment
31	Can add Keyword	11	add_keyword
32	Can change Keyword	11	change_keyword
33	Can delete Keyword	11	delete_keyword
34	Can add assigned keyword	12	add_assignedkeyword
35	Can change assigned keyword	12	change_assignedkeyword
36	Can delete assigned keyword	12	delete_assignedkeyword
37	Can add Rating	13	add_rating
38	Can change Rating	13	change_rating
39	Can delete Rating	13	delete_rating
40	Can add Page	14	add_page
41	Can change Page	14	change_page
42	Can delete Page	14	delete_page
43	Can add Rich text page	15	add_richtextpage
44	Can change Rich text page	15	change_richtextpage
45	Can delete Rich text page	15	delete_richtextpage
46	Can add Link	16	add_link
47	Can change Link	16	change_link
48	Can delete Link	16	delete_link
49	Can add Blog post	17	add_blogpost
50	Can change Blog post	17	change_blogpost
51	Can delete Blog post	17	delete_blogpost
52	Can add Blog Category	18	add_blogcategory
53	Can change Blog Category	18	change_blogcategory
54	Can delete Blog Category	18	delete_blogcategory
55	Can add Form	19	add_form
56	Can change Form	19	change_form
57	Can delete Form	19	delete_form
58	Can add Field	20	add_field
59	Can change Field	20	change_field
60	Can delete Field	20	delete_field
61	Can add Form entry	21	add_formentry
62	Can change Form entry	21	change_formentry
63	Can delete Form entry	21	delete_formentry
64	Can add Form field entry	22	add_fieldentry
65	Can change Form field entry	22	change_fieldentry
66	Can delete Form field entry	22	delete_fieldentry
67	Can add Gallery	23	add_gallery
68	Can change Gallery	23	change_gallery
69	Can delete Gallery	23	delete_gallery
70	Can add Image	24	add_galleryimage
71	Can change Image	24	change_galleryimage
72	Can delete Image	24	delete_galleryimage
73	Can add Twitter query	25	add_query
74	Can change Twitter query	25	change_query
75	Can delete Twitter query	25	delete_query
76	Can add Tweet	26	add_tweet
77	Can change Tweet	26	change_tweet
78	Can delete Tweet	26	delete_tweet
79	Can add log entry	27	add_logentry
80	Can change log entry	27	change_logentry
81	Can delete log entry	27	delete_logentry
82	Can add comment	28	add_comment
83	Can change comment	28	change_comment
84	Can delete comment	28	delete_comment
85	Can moderate comments	28	can_moderate
86	Can add comment flag	29	add_commentflag
87	Can change comment flag	29	change_commentflag
88	Can delete comment flag	29	delete_commentflag
89	Can add question	30	add_question
90	Can change question	30	change_question
91	Can delete question	30	delete_question
92	Can add choice	31	add_choice
93	Can change choice	31	change_choice
94	Can delete choice	31	delete_choice
116	Can add variety	39	add_variety
117	Can change variety	39	change_variety
118	Can delete variety	39	delete_variety
125	Can add crop	42	add_crop
126	Can change crop	42	change_crop
127	Can delete crop	42	delete_crop
128	Can add genus	43	add_genus
129	Can change genus	43	change_genus
130	Can delete genus	43	delete_genus
131	Can add species	44	add_species
132	Can change species	44	change_species
133	Can delete species	44	delete_species
134	Can add common name	45	add_commonname
135	Can change common name	45	change_commonname
136	Can delete common name	45	delete_commonname
137	Can add site	46	add_site
138	Can change site	46	change_site
139	Can delete site	46	delete_site
140	Can add block	47	add_block
141	Can change block	47	change_block
142	Can delete block	47	delete_block
143	Can add bed	48	add_bed
144	Can change bed	48	change_bed
145	Can delete bed	48	delete_bed
146	Can add soil medium batch	49	add_soilmediumbatch
147	Can change soil medium batch	49	change_soilmediumbatch
148	Can delete soil medium batch	49	delete_soilmediumbatch
149	Can add pot on record	50	add_potonrecord
150	Can change pot on record	50	change_potonrecord
151	Can delete pot on record	50	delete_potonrecord
152	Can add nursery record	51	add_nurseryrecord
153	Can change nursery record	51	change_nurseryrecord
154	Can delete nursery record	51	delete_nurseryrecord
155	Can add bed record	52	add_bedrecord
156	Can change bed record	52	change_bedrecord
157	Can delete bed record	52	delete_bedrecord
161	Can add seeder record	54	add_seederrecord
162	Can change seeder record	54	change_seederrecord
163	Can delete seeder record	54	delete_seederrecord
164	Can add harvest record	55	add_harvestrecord
165	Can change harvest record	55	change_harvestrecord
166	Can delete harvest record	55	delete_harvestrecord
167	Can add buyer	56	add_buyer
168	Can change buyer	56	change_buyer
169	Can delete buyer	56	delete_buyer
170	Can add delivery record	57	add_deliveryrecord
171	Can change delivery record	57	change_deliveryrecord
172	Can delete delivery record	57	delete_deliveryrecord
173	Can add delivery item	58	add_deliveryitem
174	Can change delivery item	58	change_deliveryitem
175	Can delete delivery item	58	delete_deliveryitem
179	Can add price	60	add_price
180	Can change price	60	change_price
181	Can delete price	60	delete_price
182	Can add length uom	61	add_lengthuom
183	Can change length uom	61	change_lengthuom
184	Can delete length uom	61	delete_lengthuom
185	Can add family	62	add_family
186	Can change family	62	change_family
187	Can delete family	62	delete_family
188	Can add yield uom	63	add_yielduom
189	Can change yield uom	63	change_yielduom
190	Can delete yield uom	63	delete_yielduom
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_permission_id_seq', 190, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$kbfaVMnZBBpe$ET2jPe9y/Xf6z6olKlZws/Fvy5R2zBYDPHLJSohqycY=	2015-08-06 09:18:27.494875-04	t	gerrard			gerrard.w@riseup.net	t	t	2015-07-29 19:32:19.576174-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY blog_blogcategory (id, title, slug, site_id) FROM stdin;
\.


--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('blog_blogcategory_id_seq', 1, false);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY blog_blogpost (id, comments_count, keywords_string, rating_count, rating_sum, rating_average, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, content, allow_comments, featured_image, site_id, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost_categories; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY blog_blogpost_categories (id, blogpost_id, blogcategory_id) FROM stdin;
\.


--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('blog_blogpost_categories_id_seq', 1, false);


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 1, false);


--
-- Data for Name: blog_blogpost_related_posts; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY blog_blogpost_related_posts (id, from_blogpost_id, to_blogpost_id) FROM stdin;
\.


--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('blog_blogpost_related_posts_id_seq', 1, false);


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY conf_setting (id, name, value, site_id) FROM stdin;
\.


--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('conf_setting_id_seq', 1, false);


--
-- Data for Name: core_sitepermission; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY core_sitepermission (id, user_id) FROM stdin;
\.


--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('core_sitepermission_id_seq', 1, false);


--
-- Data for Name: core_sitepermission_sites; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY core_sitepermission_sites (id, sitepermission_id, site_id) FROM stdin;
\.


--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('core_sitepermission_sites_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-08-03 18:42:10.694354-04	1	What?	1		30	1
2	2015-08-06 11:48:01.028241-04	1	Astro	1		39	1
3	2015-08-06 11:56:58.250446-04	4	Eruca Sativa	1		42	1
4	2015-08-06 12:03:55.570918-04	1	Astro	2	Changed crop.	39	1
5	2015-08-06 12:04:17.826675-04	2	Regular	1		39	1
6	2015-08-06 12:08:39.522641-04	1	Eruca	1		43	1
7	2015-08-06 12:10:24.939125-04	1	sativa	1		44	1
8	2015-08-06 12:10:44.869347-04	4	Eruca Sativa	2	Changed genus and species.	42	1
9	2015-08-06 12:29:14.705563-04	1	Rocket	1		45	1
10	2015-08-06 12:29:25.866646-04	2	Arugula	1		45	1
11	2015-08-06 12:34:30.264525-04	2	Brassica	1		43	1
12	2015-08-06 12:35:05.411925-04	2	oleracea	1		44	1
13	2015-08-06 12:35:15.704904-04	3	rapa	1		44	1
14	2015-08-06 12:35:36.297288-04	5	Brassica rapa	1		42	1
15	2015-08-06 12:35:45.378963-04	6	Brassica oleracea	1		42	1
16	2015-08-06 12:43:12.597733-04	4	Arugula	2	Changed common_name.	42	1
18	2015-08-06 14:51:03.196642-04	3	Radish	1		45	1
19	2015-08-06 14:51:05.12894-04	5	Radish	2	Changed common_name.	42	1
20	2015-08-06 14:51:25.93109-04	4	Broccoli	1		45	1
21	2015-08-06 14:51:26.815896-04	6	Broccoli	2	Changed common_name.	42	1
23	2015-08-06 15:04:07.262686-04	1	Croton Greenhouses	1		46	1
24	2015-08-06 15:04:37.969311-04	1	Lower	1		47	1
25	2015-08-06 15:04:50.353934-04	1	1	1		48	1
29	2015-08-06 15:07:22.106297-04	3	Solanum	1		43	1
30	2015-08-06 15:07:34.138765-04	4	lycopersicum	1		44	1
31	2015-08-06 15:07:45.020631-04	5	Tomato	1		45	1
32	2015-08-06 15:07:46.541414-04	7	Tomato	1		42	1
33	2015-08-06 15:07:50.566352-04	3	Tomato var. Amish Paste	1		39	1
34	2015-08-06 15:08:11.10584-04	2	3	1		48	1
36	2015-08-06 15:39:08.616027-04	1	SoilMediumBatch object	1		49	1
37	2015-08-06 15:39:17.703683-04	1	NurseryRecord object	1		51	1
38	2015-08-06 15:47:07.745743-04	1	Tomato var. Amish Paste 2015-04-04 15:37	2	Changed variety.	51	1
40	2015-08-06 15:55:15.268689-04	1	Tomato var. Amish Paste 2015-04-04 15:37	2	Added pot on record "PotOnRecord object".	51	1
41	2015-08-06 16:09:56.750018-04	1	Tomato var. Amish Paste 2015-04-04 15:37	2	No fields changed.	51	1
42	2015-08-06 16:40:16.74538-04	2	Lower 3	2	Added bed record "BedRecord object".	48	1
43	2015-08-06 16:41:31.291503-04	1	BedRecord object	2	No fields changed.	52	1
44	2015-08-06 16:54:46.778279-04	1	Lower 3 - Tomato var. Amish Paste	2	Changed record_date.	52	1
45	2015-08-06 16:55:23.464955-04	1	Lower 3 - Tomato var. Amish Paste	2	No fields changed.	52	1
46	2015-08-06 17:21:41.068799-04	4	Ocimum	1		43	1
47	2015-08-06 17:21:49.492821-04	5	Basilicum	1		44	1
48	2015-08-06 17:22:01.017595-04	6	Basil	1		45	1
49	2015-08-06 17:22:02.461171-04	8	Basil	1		42	1
50	2015-08-06 17:22:27.107183-04	4	Basil var. aroma	1		39	1
51	2015-08-06 17:24:10.163954-04	2	SoilMediumBatch object	1		49	1
52	2015-08-06 17:24:55.809126-04	2	Basil var. aroma 2015-06-15 17:23	1		51	1
53	2015-08-06 17:40:53.469123-04	2	Basil var. aroma 2015-06-15 17:23	2	Changed number_trays.	51	1
54	2015-08-06 17:42:49.197863-04	1	SeederRecord object	1		54	1
55	2015-08-06 17:44:01.320394-04	2	Lower 1 - Arugula var. Astro	1		52	1
56	2015-08-06 17:45:03.199505-04	3	Lower 2	1		48	1
57	2015-08-06 17:46:51.360343-04	2	WesternGreenhouse	1		47	1
58	2015-08-06 17:48:55.253767-04	4	WesternGreenhouse 1	1		48	1
59	2015-08-06 17:49:12.591507-04	4	WesternGreenhouse 1 - Basil var. aroma	3		52	1
60	2015-08-06 17:49:53.47774-04	5	WesternGreenhouse 7	1		48	1
61	2015-08-06 17:52:57.292346-04	5	Cucurbita	1		43	1
62	2015-08-06 17:53:03.205931-04	6	pepo	1		44	1
63	2015-08-06 17:53:38.368596-04	7	Summer Squash	1		45	1
64	2015-08-06 17:53:39.735788-04	9	Summer Squash	1		42	1
65	2015-08-06 17:53:45.271929-04	5	Summer Squash var. Patty Pan	1		39	1
66	2015-08-06 17:56:32.883857-04	3	Summer Squash var. Patty Pan 2015-04-23 17:54	1		51	1
67	2015-08-06 17:57:51.847464-04	7	Lower 1 - Summer Squash var. Patty Pan	1		52	1
68	2015-08-08 15:33:01.510694-04	7	Lower 1 - Summer Squash var. Patty Pan	2	Changed out_bed_date.	52	1
69	2015-08-09 13:29:25.476915-04	1	HarvestRecord object	1		55	1
70	2015-08-09 13:30:33.699599-04	1	HarvestRecord object	2	No fields changed.	55	1
71	2015-08-10 16:27:20.27049-04	1	Buyer object	1		56	1
72	2015-08-10 16:27:44.913996-04	1	DeliveryRecord object	1		57	1
76	2015-08-10 17:02:18.829249-04	1	Pisticci --- 2015-08-10 16:27:25-04:00	2	Changed unit and price for delivery item "Arugula var. Astro - 3.0 kg @ 3.0 / kg". Changed unit and price for delivery item "Summer Squash var. Patty Pan - 9.0 kg @ 2.0 / kg". Changed unit and price for delivery item "Tomato var. Amish Paste - 5.0 kg @ 2.0 / kg".	57	1
77	2015-08-10 17:02:44.724433-04	1	3.0 kg of Arugula var. Astro from Lower 1	2	Changed unit, amount and harvest_date.	55	1
81	2015-08-10 17:05:38.70009-04	1	Pisticci --- 2015-08-10 16:27:25-04:00	2	No fields changed.	57	1
82	2015-08-10 17:06:57.503165-04	1	Pisticci --- 2015-08-10 16:27:25-04:00	2	No fields changed.	57	1
83	2015-08-10 17:34:12.982032-04	1	Arugula var. Astro @ 2.0 / kg	1		60	1
84	2015-08-10 17:34:50.955949-04	2	Tomato var. Amish Paste @ 2.0 / kg	1		60	1
85	2015-08-10 17:35:28.443173-04	2	Pisticci --- 2015-08-10 17:33:54-04:00	1		57	1
86	2015-08-10 17:35:42.450913-04	2	Pisticci --- 2015-08-10 17:33:54-04:00	2	Added delivery item "Arugula var. Astro - 2.0 kg @ Arugula var. Astro @ 2.0 / kg".	57	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 86, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
\.


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	redirects	redirect
6	sessions	session
7	sites	site
8	conf	setting
9	core	sitepermission
10	generic	threadedcomment
11	generic	keyword
12	generic	assignedkeyword
13	generic	rating
14	pages	page
15	pages	richtextpage
16	pages	link
17	blog	blogpost
18	blog	blogcategory
19	forms	form
20	forms	field
21	forms	formentry
22	forms	fieldentry
23	galleries	gallery
24	galleries	galleryimage
25	twitter	query
26	twitter	tweet
27	admin	logentry
28	django_comments	comment
29	django_comments	commentflag
30	polls	question
31	polls	choice
39	grow_records	variety
42	grow_records	crop
43	grow_records	genus
44	grow_records	species
45	grow_records	commonname
46	grow_records	site
47	grow_records	block
48	grow_records	bed
49	grow_records	soilmediumbatch
50	grow_records	potonrecord
51	grow_records	nurseryrecord
52	grow_records	bedrecord
54	grow_records	seederrecord
55	grow_records	harvestrecord
56	grow_records	buyer
57	grow_records	deliveryrecord
58	grow_records	deliveryitem
60	grow_records	price
61	grow_records	lengthuom
62	grow_records	family
63	grow_records	yielduom
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_content_type_id_seq', 63, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-07-29 19:31:39.967723-04
2	auth	0001_initial	2015-07-29 19:31:40.73605-04
3	admin	0001_initial	2015-07-29 19:31:40.915675-04
4	contenttypes	0002_remove_content_type_name	2015-07-29 19:31:40.991493-04
5	auth	0002_alter_permission_name_max_length	2015-07-29 19:31:41.024785-04
6	auth	0003_alter_user_email_max_length	2015-07-29 19:31:41.069214-04
7	auth	0004_alter_user_username_opts	2015-07-29 19:31:41.098567-04
8	auth	0005_alter_user_last_login_null	2015-07-29 19:31:41.136185-04
9	auth	0006_require_contenttypes_0002	2015-07-29 19:31:41.147403-04
10	sites	0001_initial	2015-07-29 19:31:41.214108-04
11	blog	0001_initial	2015-07-29 19:31:41.873859-04
12	blog	0002_auto_20150527_1555	2015-07-29 19:31:41.962434-04
13	conf	0001_initial	2015-07-29 19:31:42.096199-04
14	core	0001_initial	2015-07-29 19:31:42.364087-04
15	core	0002_auto_20150414_2140	2015-07-29 19:31:42.452687-04
16	django_comments	0001_initial	2015-07-29 19:31:43.032443-04
17	django_comments	0002_update_user_email_field_length	2015-07-29 19:31:43.098239-04
18	pages	0001_initial	2015-07-29 19:31:43.468046-04
19	forms	0001_initial	2015-07-29 19:31:44.334507-04
20	forms	0002_auto_20141227_0224	2015-07-29 19:31:44.410108-04
21	forms	0003_emailfield	2015-07-29 19:31:44.48967-04
22	forms	0004_auto_20150517_0510	2015-07-29 19:31:44.578544-04
23	galleries	0001_initial	2015-07-29 19:31:44.913428-04
24	galleries	0002_auto_20141227_0224	2015-07-29 19:31:45.00623-04
25	generic	0001_initial	2015-07-29 19:31:45.803671-04
26	generic	0002_auto_20141227_0224	2015-07-29 19:31:45.901364-04
27	pages	0002_auto_20141227_0224	2015-07-29 19:31:46.085083-04
28	pages	0003_auto_20150527_1555	2015-07-29 19:31:46.247494-04
29	redirects	0001_initial	2015-07-29 19:31:46.514765-04
30	sessions	0001_initial	2015-07-29 19:31:46.704341-04
31	twitter	0001_initial	2015-07-29 19:31:46.915876-04
32	polls	0001_initial	2015-08-03 18:41:29.00449-04
33	grow_records	0001_initial	2015-08-06 10:19:49.331587-04
34	grow_records	0002_auto_20150806_1100	2015-08-06 11:00:09.34433-04
35	grow_records	0003_auto_20150806_1109	2015-08-06 11:09:49.339175-04
36	grow_records	0004_auto_20150806_1133	2015-08-06 11:33:21.267438-04
37	grow_records	0005_auto_20150806_1147	2015-08-06 11:47:37.696298-04
38	grow_records	0006_auto_20150806_1153	2015-08-06 11:53:45.248089-04
39	grow_records	0007_genus	2015-08-06 12:06:37.805404-04
40	grow_records	0008_auto_20150806_1208	2015-08-06 12:08:20.135895-04
41	grow_records	0009_auto_20150806_1210	2015-08-06 12:10:10.125971-04
42	grow_records	0010_remove_crop_name	2015-08-06 12:11:19.914526-04
43	grow_records	0011_commonname	2015-08-06 12:26:20.389265-04
44	grow_records	0012_auto_20150806_1242	2015-08-06 12:42:08.927003-04
45	grow_records	0013_auto_20150806_1503	2015-08-06 15:03:25.127859-04
46	grow_records	0014_auto_20150806_1510	2015-08-06 15:11:00.304425-04
47	grow_records	0015_auto_20150806_1536	2015-08-06 15:36:45.012717-04
48	grow_records	0016_nurseryrecord_variety	2015-08-06 15:46:50.342394-04
49	grow_records	0017_potonrecord_nursery_record	2015-08-06 15:50:02.553562-04
50	grow_records	0018_auto_20150806_1627	2015-08-06 16:27:24.047548-04
51	grow_records	0019_auto_20150806_1635	2015-08-06 16:35:06.285234-04
52	grow_records	0020_auto_20150806_1639	2015-08-06 16:39:55.035161-04
53	grow_records	0021_bedrecord_record_date	2015-08-06 16:52:10.359524-04
54	grow_records	0022_auto_20150806_1657	2015-08-06 16:57:29.195972-04
55	grow_records	0002_bedrecord_seeder	2015-08-06 17:36:52.04698-04
56	grow_records	0003_remove_bedrecord_seeder	2015-08-06 17:36:52.14434-04
57	grow_records	0004_bedrecord_seeder	2015-08-06 17:36:52.257051-04
58	grow_records	0005_remove_nurseryrecord_number_trays	2015-08-06 17:40:41.12533-04
59	grow_records	0006_nurseryrecord_number_trays	2015-08-06 17:40:41.18912-04
60	grow_records	0007_auto_20150806_1743	2015-08-06 17:43:56.448427-04
61	grow_records	0008_auto_20150806_1748	2015-08-06 17:48:53.05295-04
62	grow_records	0009_auto_20150806_1756	2015-08-06 17:56:23.073769-04
63	grow_records	0010_auto_20150808_1531	2015-08-08 15:31:52.91056-04
64	grow_records	0011_auto_20150809_1327	2015-08-09 13:27:21.636455-04
65	grow_records	0012_auto_20150809_1330	2015-08-09 13:30:22.810724-04
66	grow_records	0013_harvestrecord_harvest_date	2015-08-09 14:02:44.94095-04
67	grow_records	0014_auto_20150810_1619	2015-08-10 16:19:50.461898-04
68	grow_records	0015_auto_20150810_1626	2015-08-10 16:26:09.157391-04
69	grow_records	0016_auto_20150810_1659	2015-08-10 16:59:10.007836-04
70	grow_records	0017_auto_20150810_1659	2015-08-10 16:59:58.885535-04
71	grow_records	0018_auto_20150810_1703	2015-08-10 17:03:57.823149-04
72	grow_records	0019_auto_20150810_1729	2015-08-10 17:33:33.158108-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_migrations_id_seq', 72, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
xa2qcbfm59ykdb3e0rxdgj8fdowz2t5k	OTI5YjM3YmZlNjFiZTBkMjQwNzNmZTQ5YWY3ZjJmMDM4ZGMwMzUzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3YTg2NGMzZDVmYzBiMjQyOTAyZWQxMGE3OWI0YjY3ZDRmMWYyNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJtZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2015-08-12 19:35:25.365501-04
qr2ep93hgxv0rj9xn33eeqt6i03d0qfl	OTI5YjM3YmZlNjFiZTBkMjQwNzNmZTQ5YWY3ZjJmMDM4ZGMwMzUzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3YTg2NGMzZDVmYzBiMjQyOTAyZWQxMGE3OWI0YjY3ZDRmMWYyNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJtZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2015-08-17 18:38:42.105954-04
1cex5fmk2i6tt2sypxulqbxaekzk0nah	OTI5YjM3YmZlNjFiZTBkMjQwNzNmZTQ5YWY3ZjJmMDM4ZGMwMzUzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3YTg2NGMzZDVmYzBiMjQyOTAyZWQxMGE3OWI0YjY3ZDRmMWYyNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJtZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2015-08-20 09:18:27.506454-04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY django_site (id, domain, name) FROM stdin;
1	127.0.0.1:8000	Default
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY forms_field (id, _order, label, field_type, required, visible, choices, "default", placeholder_text, help_text, form_id) FROM stdin;
\.


--
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('forms_field_id_seq', 1, false);


--
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY forms_fieldentry (id, field_id, value, entry_id) FROM stdin;
\.


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('forms_fieldentry_id_seq', 1, false);


--
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY forms_form (page_ptr_id, content, button_text, response, send_email, email_from, email_copies, email_subject, email_message) FROM stdin;
\.


--
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY forms_formentry (id, entry_time, form_id) FROM stdin;
\.


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('forms_formentry_id_seq', 1, false);


--
-- Data for Name: galleries_gallery; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY galleries_gallery (page_ptr_id, content, zip_import) FROM stdin;
\.


--
-- Data for Name: galleries_galleryimage; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY galleries_galleryimage (id, _order, file, description, gallery_id) FROM stdin;
\.


--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('galleries_galleryimage_id_seq', 1, false);


--
-- Data for Name: generic_assignedkeyword; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY generic_assignedkeyword (id, _order, object_pk, content_type_id, keyword_id) FROM stdin;
\.


--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('generic_assignedkeyword_id_seq', 1, false);


--
-- Data for Name: generic_keyword; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY generic_keyword (id, title, slug, site_id) FROM stdin;
\.


--
-- Name: generic_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('generic_keyword_id_seq', 1, false);


--
-- Data for Name: generic_rating; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY generic_rating (id, value, rating_date, object_pk, content_type_id, user_id) FROM stdin;
\.


--
-- Name: generic_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('generic_rating_id_seq', 1, false);


--
-- Data for Name: generic_threadedcomment; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY generic_threadedcomment (comment_ptr_id, rating_count, rating_sum, rating_average, by_author, replied_to_id) FROM stdin;
\.


--
-- Data for Name: grow_records_bed; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_bed (id, name, width_in, length_ft, block_id, site_id) FROM stdin;
1	1	30	40	1	1
2	3	30	40	1	1
3	2	30	40	1	1
4	1	30	20	2	1
5	7	30	20	2	1
\.


--
-- Name: grow_records_bed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_bed_id_seq', 5, true);


--
-- Data for Name: grow_records_bedrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_bedrecord (id, bed_id, nursery_record_id, variety_id, rows, spacing_in, in_bed_date, seeder_id, out_bed_date, bed_percent) FROM stdin;
1	2	1	3	1	18	2015-05-22 16:54:44-04	\N	\N	\N
2	1	\N	1	5	1	2015-08-04 17:43:25-04	1	\N	\N
3	3	\N	1	5	1	2015-08-04 17:44:44-04	1	\N	\N
5	4	2	4	3	10	2015-07-13 17:48:00-04	\N	\N	\N
6	5	2	4	3	10	2015-07-13 17:49:42-04	\N	\N	\N
7	1	3	5	1	18	2015-05-18 17:57:50-04	\N	2015-08-04 15:32:56-04	\N
\.


--
-- Name: grow_records_bedrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_bedrecord_id_seq', 7, true);


--
-- Data for Name: grow_records_block; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_block (id, name, site_id) FROM stdin;
1	Lower	1
2	WesternGreenhouse	1
\.


--
-- Name: grow_records_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_block_id_seq', 2, true);


--
-- Data for Name: grow_records_buyer; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_buyer (id, name) FROM stdin;
1	Pisticci
\.


--
-- Name: grow_records_buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_buyer_id_seq', 1, true);


--
-- Data for Name: grow_records_commonname; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_commonname (id, name) FROM stdin;
1	Rocket
2	Arugula
3	Radish
4	Broccoli
5	Tomato
6	Basil
7	Summer Squash
\.


--
-- Name: grow_records_commonname_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_commonname_id_seq', 7, true);


--
-- Data for Name: grow_records_crop; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_crop (id, genus_id, species_id, common_name_id) FROM stdin;
4	1	1	2
5	2	3	3
6	2	2	4
7	3	4	5
8	4	5	6
9	5	6	7
\.


--
-- Name: grow_records_crop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_crop_id_seq', 9, true);


--
-- Data for Name: grow_records_deliveryitem; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_deliveryitem (id, amount, delivery_record_id, variety_id, unit, price_id) FROM stdin;
\.


--
-- Name: grow_records_deliveryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_deliveryitem_id_seq', 6, true);


--
-- Data for Name: grow_records_deliveryrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_deliveryrecord (id, date, buyer_id) FROM stdin;
\.


--
-- Name: grow_records_deliveryrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_deliveryrecord_id_seq', 2, true);


--
-- Data for Name: grow_records_genus; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_genus (id, name) FROM stdin;
1	Eruca
2	Brassica
3	Solanum
4	Ocimum
5	Cucurbita
\.


--
-- Name: grow_records_genus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_genus_id_seq', 5, true);


--
-- Data for Name: grow_records_harvestrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_harvestrecord (id, bed_record_id, harvest_date, amount, unit) FROM stdin;
\.


--
-- Name: grow_records_harvestrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_harvestrecord_id_seq', 1, true);


--
-- Data for Name: grow_records_nurseryrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_nurseryrecord (id, in_nursery_date, germ_date, tray_size_cell, medium_id, variety_id, number_trays) FROM stdin;
1	2015-04-04 15:37:29-04	2015-04-30 15:37:40-04	72	1	3	\N
2	2015-06-15 17:23:08-04	2015-06-22 17:24:55-04	72	2	4	3
3	2015-04-23 17:54:00-04	2015-05-06 17:54:21-04	72	1	5	0.330000000000000016
\.


--
-- Name: grow_records_nurseryrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_nurseryrecord_id_seq', 3, true);


--
-- Data for Name: grow_records_potonrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_potonrecord (id, pot_on_date, pot_size_in, medium_id, nursery_record_id) FROM stdin;
1	2015-05-04 15:54:58-04	4	1	1
2	2015-05-11 17:55:07-04	4	1	3
\.


--
-- Name: grow_records_potonrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_potonrecord_id_seq', 2, true);


--
-- Data for Name: grow_records_price; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_price (id, date, price, unit, variety_id) FROM stdin;
\.


--
-- Name: grow_records_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_price_id_seq', 2, true);


--
-- Name: grow_records_seeder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_seeder_id_seq', 1, true);


--
-- Data for Name: grow_records_seederrecord; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_seederrecord (id, name, seeder_settings) FROM stdin;
1	GL	sm
\.


--
-- Data for Name: grow_records_site; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_site (id, name) FROM stdin;
1	Croton Greenhouses
\.


--
-- Name: grow_records_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_site_id_seq', 1, true);


--
-- Data for Name: grow_records_soilmediumbatch; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_soilmediumbatch (id, created, recipe) FROM stdin;
1	2015-04-20 15:38:22-04	1:1 compost:cocoa peat + handful feathermeal / wheelbarrow
2	2015-06-15 17:24:05-04	1:1 compost:cocoa peat + handful feathermeal / wheelbarrow
\.


--
-- Name: grow_records_soilmediumbatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_soilmediumbatch_id_seq', 2, true);


--
-- Data for Name: grow_records_species; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_species (id, name) FROM stdin;
1	sativa
2	oleracea
3	rapa
4	lycopersicum
5	Basilicum
6	pepo
\.


--
-- Name: grow_records_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_species_id_seq', 6, true);


--
-- Data for Name: grow_records_variety; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY grow_records_variety (id, name, crop_id) FROM stdin;
1	Astro	4
2	Regular	4
3	Amish Paste	7
4	aroma	8
5	Patty Pan	9
\.


--
-- Name: grow_records_variety_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('grow_records_variety_id_seq', 5, true);


--
-- Data for Name: pages_link; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY pages_link (page_ptr_id) FROM stdin;
\.


--
-- Data for Name: pages_page; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY pages_page (id, keywords_string, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, _order, in_menus, titles, content_model, login_required, parent_id, site_id) FROM stdin;
1		Blog	blog	\N	Blog	t	\N	\N	2	\N	\N	\N	t	1	1,2,3	Blog	richtextpage	f	\N	1
\.


--
-- Name: pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('pages_page_id_seq', 1, true);


--
-- Data for Name: pages_richtextpage; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY pages_richtextpage (page_ptr_id, content) FROM stdin;
1	<p>Blog</p>
\.


--
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY polls_choice (id, choice_text, votes, question_id) FROM stdin;
1	ever	1	1
\.


--
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('polls_choice_id_seq', 1, true);


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY polls_question (id, question_text, pub_date) FROM stdin;
1	What?	2015-08-03 18:42:06-04
\.


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('polls_question_id_seq', 1, true);


--
-- Data for Name: twitter_query; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY twitter_query (id, type, value, interested) FROM stdin;
1	search	from:stephen_mcd mezzanine	t
\.


--
-- Name: twitter_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('twitter_query_id_seq', 1, true);


--
-- Data for Name: twitter_tweet; Type: TABLE DATA; Schema: public; Owner: gerrard
--

COPY twitter_tweet (id, remote_id, created_at, text, profile_image_url, user_name, full_name, retweeter_profile_image_url, retweeter_user_name, retweeter_full_name, query_id) FROM stdin;
1	625158607810617344	2015-07-26 00:20:01-04	A flurry of new releases - Mezzanine, Cartridge, Drum, django-overextends, all compatible w/ latest Django: <a href="https://t.co/FjLlWjK1f4">https://t.co/FjLlWjK1f4</a> <a href="http://twitter.com/search?q=%23django">#django</a>	http://pbs.twimg.com/profile_images/591915345264283648/nxrtn_Up_normal.jpg	stephen_mcd	Stephen McDonald	\N	\N	\N	1
2	624382571418361856	2015-07-23 20:56:20-04	Status update and call for testers on upcoming Mezzanine, Cartridge and Drum releases: <a href="https://t.co/YDPFlNtQl1">https://t.co/YDPFlNtQl1</a> <a href="http://twitter.com/search?q=%23django">#django</a>	http://pbs.twimg.com/profile_images/591915345264283648/nxrtn_Up_normal.jpg	stephen_mcd	Stephen McDonald	\N	\N	\N	1
\.


--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gerrard
--

SELECT pg_catalog.setval('twitter_tweet_id_seq', 2, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_categories_blogpost_id_blogcategory_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_blogpost_id_blogcategory_id_key UNIQUE (blogpost_id, blogcategory_id);


--
-- Name: blog_blogpost_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_related_posts_from_blogpost_id_to_blogpost_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_from_blogpost_id_to_blogpost_id_key UNIQUE (from_blogpost_id, to_blogpost_id);


--
-- Name: blog_blogpost_related_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_pkey PRIMARY KEY (id);


--
-- Name: conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_sitepermission_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_sitepermission_id_site_id_key UNIQUE (sitepermission_id, site_id);


--
-- Name: core_sitepermission_user_id_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_c7a132a641f11c1_uniq; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_c7a132a641f11c1_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_old_path_key; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_old_path_key UNIQUE (site_id, old_path);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- Name: forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- Name: forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- Name: galleries_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: galleries_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT galleries_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: generic_assignedkeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyword_pkey PRIMARY KEY (id);


--
-- Name: generic_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_pkey PRIMARY KEY (id);


--
-- Name: generic_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_pkey PRIMARY KEY (id);


--
-- Name: generic_threadedcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomment_pkey PRIMARY KEY (comment_ptr_id);


--
-- Name: grow_records_bed_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_bed
    ADD CONSTRAINT grow_records_bed_pkey PRIMARY KEY (id);


--
-- Name: grow_records_bedrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_bedrecord
    ADD CONSTRAINT grow_records_bedrecord_pkey PRIMARY KEY (id);


--
-- Name: grow_records_block_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_block
    ADD CONSTRAINT grow_records_block_pkey PRIMARY KEY (id);


--
-- Name: grow_records_buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_buyer
    ADD CONSTRAINT grow_records_buyer_pkey PRIMARY KEY (id);


--
-- Name: grow_records_commonname_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_commonname
    ADD CONSTRAINT grow_records_commonname_pkey PRIMARY KEY (id);


--
-- Name: grow_records_crop_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_crop
    ADD CONSTRAINT grow_records_crop_pkey PRIMARY KEY (id);


--
-- Name: grow_records_deliveryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_deliveryitem
    ADD CONSTRAINT grow_records_deliveryitem_pkey PRIMARY KEY (id);


--
-- Name: grow_records_deliveryrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_deliveryrecord
    ADD CONSTRAINT grow_records_deliveryrecord_pkey PRIMARY KEY (id);


--
-- Name: grow_records_genus_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_genus
    ADD CONSTRAINT grow_records_genus_pkey PRIMARY KEY (id);


--
-- Name: grow_records_harvestrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_harvestrecord
    ADD CONSTRAINT grow_records_harvestrecord_pkey PRIMARY KEY (id);


--
-- Name: grow_records_nurseryrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_nurseryrecord
    ADD CONSTRAINT grow_records_nurseryrecord_pkey PRIMARY KEY (id);


--
-- Name: grow_records_potonrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_potonrecord
    ADD CONSTRAINT grow_records_potonrecord_pkey PRIMARY KEY (id);


--
-- Name: grow_records_price_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_price
    ADD CONSTRAINT grow_records_price_pkey PRIMARY KEY (id);


--
-- Name: grow_records_seeder_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_seederrecord
    ADD CONSTRAINT grow_records_seeder_pkey PRIMARY KEY (id);


--
-- Name: grow_records_site_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_site
    ADD CONSTRAINT grow_records_site_pkey PRIMARY KEY (id);


--
-- Name: grow_records_soilmediumbatch_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_soilmediumbatch
    ADD CONSTRAINT grow_records_soilmediumbatch_pkey PRIMARY KEY (id);


--
-- Name: grow_records_species_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_species
    ADD CONSTRAINT grow_records_species_pkey PRIMARY KEY (id);


--
-- Name: grow_records_variety_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY grow_records_variety
    ADD CONSTRAINT grow_records_variety_pkey PRIMARY KEY (id);


--
-- Name: pages_link_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_page_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_pkey PRIMARY KEY (id);


--
-- Name: pages_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- Name: polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: twitter_query_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY twitter_query
    ADD CONSTRAINT twitter_query_pkey PRIMARY KEY (id);


--
-- Name: twitter_tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: gerrard; Tablespace: 
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogcategory_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogcategory_9365d6e7 ON blog_blogcategory USING btree (site_id);


--
-- Name: blog_blogpost_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_9365d6e7 ON blog_blogpost USING btree (site_id);


--
-- Name: blog_blogpost_categories_53a0aca2; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_categories_53a0aca2 ON blog_blogpost_categories USING btree (blogpost_id);


--
-- Name: blog_blogpost_categories_efb54956; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_categories_efb54956 ON blog_blogpost_categories USING btree (blogcategory_id);


--
-- Name: blog_blogpost_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_e8701ad4 ON blog_blogpost USING btree (user_id);


--
-- Name: blog_blogpost_publish_date_1015da2554a8e97f_uniq; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_publish_date_1015da2554a8e97f_uniq ON blog_blogpost USING btree (publish_date);


--
-- Name: blog_blogpost_related_posts_191c4981; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_related_posts_191c4981 ON blog_blogpost_related_posts USING btree (from_blogpost_id);


--
-- Name: blog_blogpost_related_posts_71f16e58; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX blog_blogpost_related_posts_71f16e58 ON blog_blogpost_related_posts USING btree (to_blogpost_id);


--
-- Name: conf_setting_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX conf_setting_9365d6e7 ON conf_setting USING btree (site_id);


--
-- Name: core_sitepermission_sites_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX core_sitepermission_sites_9365d6e7 ON core_sitepermission_sites USING btree (site_id);


--
-- Name: core_sitepermission_sites_f6687ce4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX core_sitepermission_sites_f6687ce4 ON core_sitepermission_sites USING btree (sitepermission_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_327a6c43; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comment_flags_327a6c43 ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_69b97d17; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comment_flags_69b97d17 ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comment_flags_e8701ad4 ON django_comment_flags USING btree (user_id);


--
-- Name: django_comment_flags_flag_686b7398bb858e56_like; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comment_flags_flag_686b7398bb858e56_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comments_417f1b1c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comments_417f1b1c ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comments_9365d6e7 ON django_comments USING btree (site_id);


--
-- Name: django_comments_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_comments_e8701ad4 ON django_comments USING btree (user_id);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_redirect_91a0b591 ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_redirect_9365d6e7 ON django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_9db3e423470cdaf_like; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_redirect_old_path_9db3e423470cdaf_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: forms_field_d6cba1ad; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX forms_field_d6cba1ad ON forms_field USING btree (form_id);


--
-- Name: forms_fieldentry_b64a62ea; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX forms_fieldentry_b64a62ea ON forms_fieldentry USING btree (entry_id);


--
-- Name: forms_formentry_d6cba1ad; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX forms_formentry_d6cba1ad ON forms_formentry USING btree (form_id);


--
-- Name: galleries_galleryimage_6d994cdb; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX galleries_galleryimage_6d994cdb ON galleries_galleryimage USING btree (gallery_id);


--
-- Name: generic_assignedkeyword_417f1b1c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_assignedkeyword_417f1b1c ON generic_assignedkeyword USING btree (content_type_id);


--
-- Name: generic_assignedkeyword_5c003bba; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_assignedkeyword_5c003bba ON generic_assignedkeyword USING btree (keyword_id);


--
-- Name: generic_keyword_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_keyword_9365d6e7 ON generic_keyword USING btree (site_id);


--
-- Name: generic_rating_417f1b1c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_rating_417f1b1c ON generic_rating USING btree (content_type_id);


--
-- Name: generic_rating_e8701ad4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_rating_e8701ad4 ON generic_rating USING btree (user_id);


--
-- Name: generic_threadedcomment_21ce1e68; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX generic_threadedcomment_21ce1e68 ON generic_threadedcomment USING btree (replied_to_id);


--
-- Name: grow_records_bed_7e53bca2; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bed_7e53bca2 ON grow_records_bed USING btree (block_id);


--
-- Name: grow_records_bed_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bed_9365d6e7 ON grow_records_bed USING btree (site_id);


--
-- Name: grow_records_bedrecord_267c256e; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bedrecord_267c256e ON grow_records_bedrecord USING btree (seeder_id);


--
-- Name: grow_records_bedrecord_464836be; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bedrecord_464836be ON grow_records_bedrecord USING btree (nursery_record_id);


--
-- Name: grow_records_bedrecord_7cd27a4c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bedrecord_7cd27a4c ON grow_records_bedrecord USING btree (bed_id);


--
-- Name: grow_records_bedrecord_921d5aa4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_bedrecord_921d5aa4 ON grow_records_bedrecord USING btree (variety_id);


--
-- Name: grow_records_block_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_block_9365d6e7 ON grow_records_block USING btree (site_id);


--
-- Name: grow_records_crop_1699a6e9; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_crop_1699a6e9 ON grow_records_crop USING btree (species_id);


--
-- Name: grow_records_crop_38ec0e61; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_crop_38ec0e61 ON grow_records_crop USING btree (common_name_id);


--
-- Name: grow_records_crop_92319714; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_crop_92319714 ON grow_records_crop USING btree (genus_id);


--
-- Name: grow_records_deliveryitem_65cff675; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_deliveryitem_65cff675 ON grow_records_deliveryitem USING btree (price_id);


--
-- Name: grow_records_deliveryitem_921d5aa4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_deliveryitem_921d5aa4 ON grow_records_deliveryitem USING btree (variety_id);


--
-- Name: grow_records_deliveryitem_c8c5be59; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_deliveryitem_c8c5be59 ON grow_records_deliveryitem USING btree (delivery_record_id);


--
-- Name: grow_records_deliveryrecord_2c724d65; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_deliveryrecord_2c724d65 ON grow_records_deliveryrecord USING btree (buyer_id);


--
-- Name: grow_records_harvestrecord_3ae13f9c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_harvestrecord_3ae13f9c ON grow_records_harvestrecord USING btree (bed_record_id);


--
-- Name: grow_records_nurseryrecord_921d5aa4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_nurseryrecord_921d5aa4 ON grow_records_nurseryrecord USING btree (variety_id);


--
-- Name: grow_records_nurseryrecord_c20e5590; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_nurseryrecord_c20e5590 ON grow_records_nurseryrecord USING btree (medium_id);


--
-- Name: grow_records_potonrecord_464836be; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_potonrecord_464836be ON grow_records_potonrecord USING btree (nursery_record_id);


--
-- Name: grow_records_potonrecord_c20e5590; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_potonrecord_c20e5590 ON grow_records_potonrecord USING btree (medium_id);


--
-- Name: grow_records_price_921d5aa4; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_price_921d5aa4 ON grow_records_price USING btree (variety_id);


--
-- Name: grow_records_variety_76750efe; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX grow_records_variety_76750efe ON grow_records_variety USING btree (crop_id);


--
-- Name: pages_page_6be37982; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX pages_page_6be37982 ON pages_page USING btree (parent_id);


--
-- Name: pages_page_9365d6e7; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX pages_page_9365d6e7 ON pages_page USING btree (site_id);


--
-- Name: pages_page_publish_date_4b581dded15f4cdf_uniq; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX pages_page_publish_date_4b581dded15f4cdf_uniq ON pages_page USING btree (publish_date);


--
-- Name: polls_choice_7aa0f6ee; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX polls_choice_7aa0f6ee ON polls_choice USING btree (question_id);


--
-- Name: twitter_tweet_0bbeda9c; Type: INDEX; Schema: public; Owner: gerrard; Tablespace: 
--

CREATE INDEX twitter_tweet_0bbeda9c ON twitter_tweet USING btree (query_id);


--
-- Name: D0735ea942c6e99a080924bfd6876b31; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryitem
    ADD CONSTRAINT "D0735ea942c6e99a080924bfd6876b31" FOREIGN KEY (delivery_record_id) REFERENCES grow_records_deliveryrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D8106fafc685bfb4c0e66d978dfa8655; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bedrecord
    ADD CONSTRAINT "D8106fafc685bfb4c0e66d978dfa8655" FOREIGN KEY (nursery_record_id) REFERENCES grow_records_nurseryrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D8e54ed6535e17a5f07b3f5887fe55ff; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT "D8e54ed6535e17a5f07b3f5887fe55ff" FOREIGN KEY (replied_to_id) REFERENCES generic_threadedcomment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: b9f26fa318bc6c2d9dc7dc4f61bb3afe; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_potonrecord
    ADD CONSTRAINT b9f26fa318bc6c2d9dc7dc4f61bb3afe FOREIGN KEY (nursery_record_id) REFERENCES grow_records_nurseryrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_b_blogcategory_id_5c987a15b9426892_fk_blog_blogcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_b_blogcategory_id_5c987a15b9426892_fk_blog_blogcategory_id FOREIGN KEY (blogcategory_id) REFERENCES blog_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blog_from_blogpost_id_161efba073ba4d90_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blog_from_blogpost_id_161efba073ba4d90_fk_blog_blogpost_id FOREIGN KEY (from_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogcategory_site_id_1565b70d240d75b_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_site_id_1565b70d240d75b_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpo_to_blogpost_id_48f773544ff96fa5_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpo_to_blogpost_id_48f773544ff96fa5_fk_blog_blogpost_id FOREIGN KEY (to_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost__blogpost_id_11545014277324dc_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost__blogpost_id_11545014277324dc_fk_blog_blogpost_id FOREIGN KEY (blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_site_id_3cd2a8869a3bc877_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_site_id_3cd2a8869a3bc877_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_user_id_3d08a741310d8f6f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_user_id_3d08a741310d8f6f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co_sitepermission_id_64c924a870a6a554_fk_core_sitepermission_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT co_sitepermission_id_64c924a870a6a554_fk_core_sitepermission_id FOREIGN KEY (sitepermission_id) REFERENCES core_sitepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting_site_id_3971204fedfdfec8_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_site_id_3971204fedfdfec8_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission__site_id_6dd5fffb45435677_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission__site_id_6dd5fffb45435677_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_user_id_d964e296aed9970_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_d964e296aed9970_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_39798e235626a505_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT djan_content_type_id_39798e235626a505_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_comment_id_26f904a7f2b4c55_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_comment_id_26f904a7f2b4c55_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_1442753a03512f4c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_1442753a03512f4c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_48b7896f6ea83216_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_48b7896f6ea83216_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_20e3794dfd3a7b1e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_20e3794dfd3a7b1e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect_site_id_121a4403f653e524_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_121a4403f653e524_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_field_form_id_3660963e8b17a175_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_form_id_3660963e8b17a175_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_fieldentr_entry_id_7b83c1acf66a9d67_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentr_entry_id_7b83c1acf66a9d67_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form_page_ptr_id_2363a7422cd85950_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_page_ptr_id_2363a7422cd85950_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_formen_form_id_5fca4521fe2d9b9b_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formen_form_id_5fca4521fe2d9b9b_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: g_common_name_id_10db173fe4d08b8c_fk_grow_records_commonname_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_crop
    ADD CONSTRAINT g_common_name_id_10db173fe4d08b8c_fk_grow_records_commonname_id FOREIGN KEY (common_name_id) REFERENCES grow_records_commonname(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: g_medium_id_4c448ffbd318059f_fk_grow_records_soilmediumbatch_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_nurseryrecord
    ADD CONSTRAINT g_medium_id_4c448ffbd318059f_fk_grow_records_soilmediumbatch_id FOREIGN KEY (medium_id) REFERENCES grow_records_soilmediumbatch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: g_medium_id_6c0ba5878846f387_fk_grow_records_soilmediumbatch_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_potonrecord
    ADD CONSTRAINT g_medium_id_6c0ba5878846f387_fk_grow_records_soilmediumbatch_id FOREIGN KEY (medium_id) REFERENCES grow_records_soilmediumbatch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ga_gallery_id_5f743e845a8d8b01_fk_galleries_gallery_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT ga_gallery_id_5f743e845a8d8b01_fk_galleries_gallery_page_ptr_id FOREIGN KEY (gallery_id) REFERENCES galleries_gallery(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries_gallery_page_ptr_id_6cf84f17bef39d64_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_page_ptr_id_6cf84f17bef39d64_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gene_content_type_id_28e2096071be2a4f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT gene_content_type_id_28e2096071be2a4f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gene_content_type_id_340baca94a5341cc_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT gene_content_type_id_340baca94a5341cc_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assig_keyword_id_61d6fae39a09e150_fk_generic_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assig_keyword_id_61d6fae39a09e150_fk_generic_keyword_id FOREIGN KEY (keyword_id) REFERENCES generic_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_keyword_site_id_7727e5473a304097_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_site_id_7727e5473a304097_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rating_user_id_323dfdffa0c13bac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_user_id_323dfdffa0c13bac_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_t_comment_ptr_id_7ce6b4612f86bbc6_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_t_comment_ptr_id_7ce6b4612f86bbc6_fk_django_comments_id FOREIGN KEY (comment_ptr_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gro_bed_record_id_73629f8f798a18ca_fk_grow_records_bedrecord_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_harvestrecord
    ADD CONSTRAINT gro_bed_record_id_73629f8f798a18ca_fk_grow_records_bedrecord_id FOREIGN KEY (bed_record_id) REFERENCES grow_records_bedrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_rec_species_id_62ede60e79749d39_fk_grow_records_species_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_crop
    ADD CONSTRAINT grow_rec_species_id_62ede60e79749d39_fk_grow_records_species_id FOREIGN KEY (species_id) REFERENCES grow_records_species(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_rec_variety_id_1aea62f83ab365ca_fk_grow_records_variety_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bedrecord
    ADD CONSTRAINT grow_rec_variety_id_1aea62f83ab365ca_fk_grow_records_variety_id FOREIGN KEY (variety_id) REFERENCES grow_records_variety(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_rec_variety_id_32468d211e0c4a63_fk_grow_records_variety_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_price
    ADD CONSTRAINT grow_rec_variety_id_32468d211e0c4a63_fk_grow_records_variety_id FOREIGN KEY (variety_id) REFERENCES grow_records_variety(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_rec_variety_id_48eb1487f285e13b_fk_grow_records_variety_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_nurseryrecord
    ADD CONSTRAINT grow_rec_variety_id_48eb1487f285e13b_fk_grow_records_variety_id FOREIGN KEY (variety_id) REFERENCES grow_records_variety(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_rec_variety_id_5007c86f3b0fb66c_fk_grow_records_variety_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryitem
    ADD CONSTRAINT grow_rec_variety_id_5007c86f3b0fb66c_fk_grow_records_variety_id FOREIGN KEY (variety_id) REFERENCES grow_records_variety(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records__block_id_4005989504044be_fk_grow_records_block_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bed
    ADD CONSTRAINT grow_records__block_id_4005989504044be_fk_grow_records_block_id FOREIGN KEY (block_id) REFERENCES grow_records_block(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_b_site_id_3edd4c2c6013c787_fk_grow_records_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bed
    ADD CONSTRAINT grow_records_b_site_id_3edd4c2c6013c787_fk_grow_records_site_id FOREIGN KEY (site_id) REFERENCES grow_records_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_b_site_id_444c3f9078a13c29_fk_grow_records_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_block
    ADD CONSTRAINT grow_records_b_site_id_444c3f9078a13c29_fk_grow_records_site_id FOREIGN KEY (site_id) REFERENCES grow_records_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_bed_bed_id_6b759b3eeeb89f1d_fk_grow_records_bed_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bedrecord
    ADD CONSTRAINT grow_records_bed_bed_id_6b759b3eeeb89f1d_fk_grow_records_bed_id FOREIGN KEY (bed_id) REFERENCES grow_records_bed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_buyer_id_29944361a7c6d113_fk_grow_records_buyer_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryrecord
    ADD CONSTRAINT grow_records_buyer_id_29944361a7c6d113_fk_grow_records_buyer_id FOREIGN KEY (buyer_id) REFERENCES grow_records_buyer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_genus_id_5d466cd9f5317fa3_fk_grow_records_genus_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_crop
    ADD CONSTRAINT grow_records_genus_id_5d466cd9f5317fa3_fk_grow_records_genus_id FOREIGN KEY (genus_id) REFERENCES grow_records_genus(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_price_id_54cfc5f1a3a3c48f_fk_grow_records_price_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_deliveryitem
    ADD CONSTRAINT grow_records_price_id_54cfc5f1a3a3c48f_fk_grow_records_price_id FOREIGN KEY (price_id) REFERENCES grow_records_price(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_records_v_crop_id_2e6f1915ca3fd60d_fk_grow_records_crop_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_variety
    ADD CONSTRAINT grow_records_v_crop_id_2e6f1915ca3fd60d_fk_grow_records_crop_id FOREIGN KEY (crop_id) REFERENCES grow_records_crop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: grow_seeder_id_64704496644b5b85_fk_grow_records_seederrecord_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY grow_records_bedrecord
    ADD CONSTRAINT grow_seeder_id_64704496644b5b85_fk_grow_records_seederrecord_id FOREIGN KEY (seeder_id) REFERENCES grow_records_seederrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_link_page_ptr_id_560afe0956838fd3_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_page_ptr_id_560afe0956838fd3_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_parent_id_7bf3217d99139bb8_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_parent_id_7bf3217d99139bb8_fk_pages_page_id FOREIGN KEY (parent_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_site_id_22239f4327580ae9_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_site_id_22239f4327580ae9_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_richtextpag_page_ptr_id_303aa0962fe9608b_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpag_page_ptr_id_303aa0962fe9608b_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_choice_question_id_246c99a640fbbd72_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY polls_choice
    ADD CONSTRAINT polls_choice_question_id_246c99a640fbbd72_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twitter_tweet_query_id_5de4bfd6dfe46065_fk_twitter_query_id; Type: FK CONSTRAINT; Schema: public; Owner: gerrard
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_query_id_5de4bfd6dfe46065_fk_twitter_query_id FOREIGN KEY (query_id) REFERENCES twitter_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

