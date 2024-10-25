--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    header text NOT NULL,
    announce_description text NOT NULL,
    detailed_description text NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: article_additional_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_additional_fields (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    value text NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.article_additional_fields OWNER TO postgres;

--
-- Name: article_additional_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_additional_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.article_additional_fields_id_seq OWNER TO postgres;

--
-- Name: article_additional_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_additional_fields_id_seq OWNED BY public.article_additional_fields.id;


--
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.article_id_seq OWNER TO postgres;

--
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- Name: articles_to_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles_to_categories (
    article_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.articles_to_categories OWNER TO postgres;

--
-- Name: articles_to_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles_to_users (
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.articles_to_users OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    text text NOT NULL,
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_id_seq OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.score (
    article_id integer NOT NULL,
    user_id integer NOT NULL,
    score smallint NOT NULL
);


ALTER TABLE public.score OWNER TO postgres;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- Name: article_additional_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_additional_fields ALTER COLUMN id SET DEFAULT nextval('public.article_additional_fields_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, header, announce_description, detailed_description, tag_id) FROM stdin;
1	Шапка	Анонсовое описание	Более детальное описание	1
2	Шапка2	Анонсовое описание	Чуть более детальное описание	1
3	Шапка3	Третье анонсовое описание	Ещё более детальное описание	1
\.


--
-- Data for Name: article_additional_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_additional_fields (id, name, type, value, article_id) FROM stdin;
1	smth1	int	1974	3
2	smth2	string	some text	2
\.


--
-- Data for Name: articles_to_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles_to_categories (article_id, category_id) FROM stdin;
1	1
2	3
3	3
\.


--
-- Data for Name: articles_to_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles_to_users (article_id, user_id) FROM stdin;
1	1
2	2
3	2
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	Новости
2	Научпоп
3	Публицистика
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, article_id, user_id) FROM stdin;
1	*хвалебный комментарий*	1	3
2	*не очень лестный комментарий*	2	3
3	*не очень вежливый ответ*	2	2
4	завершение общения	2	3
\.


--
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.score (article_id, user_id, score) FROM stdin;
1	3	5
1	2	4
2	1	4
2	3	1
3	3	5
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (id, name) FROM stdin;
1	Articles
2	Not articles
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name) FROM stdin;
1	Иванов Иван Иванович
2	Улыбочкина Галина Бланка
3	Просто зашёл почитать
\.


--
-- Name: article_additional_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_additional_fields_id_seq', 2, true);


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 3, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 4, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 2, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: article_additional_fields article_additional_fields_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_additional_fields
    ADD CONSTRAINT article_additional_fields_pk PRIMARY KEY (id);


--
-- Name: article article_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pk PRIMARY KEY (id);


--
-- Name: articles_to_categories articles_to_categories_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_categories
    ADD CONSTRAINT articles_to_categories_pk PRIMARY KEY (article_id, category_id);


--
-- Name: articles_to_users articles_to_users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_users
    ADD CONSTRAINT articles_to_users_pk PRIMARY KEY (article_id, user_id);


--
-- Name: comment comment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- Name: score score_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pk PRIMARY KEY (article_id, user_id);


--
-- Name: tag tag_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pk PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: article_additional_fields article_additional_fields_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_additional_fields
    ADD CONSTRAINT article_additional_fields_fk FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: article article_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_fk FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: articles_to_categories articles_to_categories_fk_articles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_categories
    ADD CONSTRAINT articles_to_categories_fk_articles FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: articles_to_categories articles_to_categories_fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_categories
    ADD CONSTRAINT articles_to_categories_fk_users FOREIGN KEY (category_id) REFERENCES public."user"(id);


--
-- Name: articles_to_users articles_to_users_fk_articles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_users
    ADD CONSTRAINT articles_to_users_fk_articles FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: articles_to_users articles_to_users_fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_to_users
    ADD CONSTRAINT articles_to_users_fk_users FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: comment comment_fk_articles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_fk_articles FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: comment comment_fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_fk_users FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: score score_fk_articles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_fk_articles FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: score score_fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_fk_users FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

