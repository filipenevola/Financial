--
-- PostgreSQL database dump
--

-- Started on 2011-05-08 12:25:48

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1213 (class 1259 OID 39938)
-- Dependencies: 4
-- Name: category; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    pay boolean,
    value double precision NOT NULL,
    users integer,
    notificationlist character varying(500)
);


ALTER TABLE public.category OWNER TO filipenevola;

--
-- TOC entry 1223 (class 1259 OID 227727)
-- Dependencies: 4
-- Name: collectivebuy; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE collectivebuy (
    id integer NOT NULL,
    alerted boolean,
    canusedays character varying(200),
    dateofbuy character varying(200),
    enddate character varying(200),
    name character varying(200) NOT NULL,
    originalvalue double precision,
    place character varying(200),
    printed boolean,
    startdate character varying(200),
    used boolean,
    value double precision,
    users integer
);


ALTER TABLE public.collectivebuy OWNER TO filipenevola;

--
-- TOC entry 1221 (class 1259 OID 40827)
-- Dependencies: 4
-- Name: investiment; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE investiment (
    id integer NOT NULL,
    dateofinvestiment character varying(255),
    value character varying(255),
    users integer
);


ALTER TABLE public.investiment OWNER TO filipenevola;

--
-- TOC entry 1214 (class 1259 OID 39942)
-- Dependencies: 4
-- Name: move; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE move (
    id integer NOT NULL,
    categoryid integer,
    dateofmove character varying(200),
    dateofpay character varying(200),
    name character varying(200) NOT NULL,
    place character varying(200),
    typeofpayid integer,
    value double precision NOT NULL,
    category integer,
    typeofpay integer,
    sendnotification boolean
);


ALTER TABLE public.move OWNER TO filipenevola;

--
-- TOC entry 1217 (class 1259 OID 39977)
-- Dependencies: 4
-- Name: seqcategory; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE seqcategory
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seqcategory OWNER TO filipenevola;

--
-- TOC entry 1574 (class 0 OID 0)
-- Dependencies: 1217
-- Name: seqcategory; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqcategory', 72, true);


--
-- TOC entry 1224 (class 1259 OID 227742)
-- Dependencies: 4
-- Name: seqcollectivebuy; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE seqcollectivebuy
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seqcollectivebuy OWNER TO filipenevola;

--
-- TOC entry 1575 (class 0 OID 0)
-- Dependencies: 1224
-- Name: seqcollectivebuy; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqcollectivebuy', 11, true);


--
-- TOC entry 1222 (class 1259 OID 40839)
-- Dependencies: 4
-- Name: seqinvestiment; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE seqinvestiment
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seqinvestiment OWNER TO filipenevola;

--
-- TOC entry 1576 (class 0 OID 0)
-- Dependencies: 1222
-- Name: seqinvestiment; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqinvestiment', 20, true);


--
-- TOC entry 1218 (class 1259 OID 39979)
-- Dependencies: 4
-- Name: seqmove; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE seqmove
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seqmove OWNER TO filipenevola;

--
-- TOC entry 1577 (class 0 OID 0)
-- Dependencies: 1218
-- Name: seqmove; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqmove', 929, true);


--
-- TOC entry 1219 (class 1259 OID 39981)
-- Dependencies: 4
-- Name: seqtypeofpay; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE seqtypeofpay
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seqtypeofpay OWNER TO filipenevola;

--
-- TOC entry 1578 (class 0 OID 0)
-- Dependencies: 1219
-- Name: seqtypeofpay; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqtypeofpay', 23, true);


--
-- TOC entry 1220 (class 1259 OID 39983)
-- Dependencies: 4
-- Name: sequser; Type: SEQUENCE; Schema: public; Owner: filipenevola
--

CREATE SEQUENCE sequser
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequser OWNER TO filipenevola;

--
-- TOC entry 1579 (class 0 OID 0)
-- Dependencies: 1220
-- Name: sequser; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('sequser', 1, false);


--
-- TOC entry 1215 (class 1259 OID 39949)
-- Dependencies: 4
-- Name: typeofpay; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE typeofpay (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    users integer
);


ALTER TABLE public.typeofpay OWNER TO filipenevola;

--
-- TOC entry 1216 (class 1259 OID 39953)
-- Dependencies: 4
-- Name: users; Type: TABLE; Schema: public; Owner: filipenevola; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying(200) NOT NULL,
    pass character varying(200) NOT NULL,
    email character varying(200)
);


ALTER TABLE public.users OWNER TO filipenevola;

--
-- TOC entry 1564 (class 0 OID 39938)
-- Dependencies: 1213
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (7, 'mercado', true, 200, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (8, 'almoco trabalho', true, 230, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (11, 'roupas', true, 100, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (12, 'cabelereiro', true, 15, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (14, 'celular vivo', true, 143.90000000000001, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (15, 'celular tim', true, 25, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (16, 'lanches', true, 100, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (17, 'transporte', true, 26, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (18, 'jogos', true, 15, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (19, 'fds comida', true, 80, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (9, 'beneficios', false, 1258, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (20, 'taxas trabalho', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (21, 'moveis', true, 50, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (23, 'saude', true, 60, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (26, 'diversos', true, 30, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (28, 'energia', true, 123, 4, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (29, 'alimentacao', true, 300, 3, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (30, 'casa', true, 500, 3, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (24, 'tecnologia', true, 202, 3, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (31, 'coaching', false, 288, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (34, 'New Category', true, 76, 3, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (35, 'diversao', true, 100, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (36, 'servidor', true, 20, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (37, 'ingles', true, 100, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (13, 'bancos', true, 5.5, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (40, 'salario people', false, 480, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (10, 'salario', false, 2296, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (42, 'carro', true, 300, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (43, 'carro extra', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (44, 'estacionamento', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (45, 'igreja', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (39, 'freelancers', false, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (46, 'Pipoca Ofertas', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (48, 'reembolsos', false, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (49, 'Mude depois Carol', true, 5, 6, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (50, 'carreira', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (51, 'almoco', true, 0, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (52, 'diversos', true, 39.899999999999999, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (54, 'mercado', true, 0, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (58, 'cerveja', true, 0, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (59, 'casamento', true, 6000, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (61, 'lanche', true, 0, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (62, 'janta', true, 0, 7, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (63, 'salario', false, 0, 8, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (64, '13 salario', false, 0, 8, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (65, 'transporte', true, 0, 8, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (66, 'lazer', true, 0, 8, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (60, 'v ddos carnaval/2011', true, 1200, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (38, 'v ddos setembro/2010', true, 0, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (47, 'v cps pais e amor 2010/2011', true, 1000, 1, NULL);
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (22, 'casa', true, 400, 1, 'lfbitt@gmail.com;raoniteixeira@gmail.com;leandropaschuini@gmail.com;filipemkv@gmail.com');
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (68, 'galo', true, 0, 1, 'leandropaschuini@gmail.com;filipemkv@gmail.com');
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (69, 'raoni', true, 0, 1, 'raoniteixeira@gmail.com;filipemkv@gmail.com');
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (70, 'v ddos pascoa/2011', true, 0, 1, ';');
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (71, 'tecsinapse', true, 0, 1, 'filipemkv@gmail.com');
INSERT INTO category (id, name, pay, value, users, notificationlist) VALUES (72, 'reembolso tecsinapse', false, 0, 1, ' ');


--
-- TOC entry 1569 (class 0 OID 227727)
-- Dependencies: 1223
-- Data for Name: collectivebuy; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (1, false, 'Terca a Quinta (noite)', '2011/03/25', '2011/06/02', '04 Chopps Brahma + 02 Lanches de Qualquer Sabor', 59.799999999999997, 'Confessionario Bar', true, '2011/03/25', false, 16.75, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (3, false, 'Segunda a Quarta (noite)', '2011/05/05', '2011/08/09', 'New York + 1/2 Porcao de Batata Frita', 27.300000000000001, 'Big Jack Dom Pedro', false, '2011/05/09', false, 13, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (2, false, 'Segunda a Quinta e Domingo (noite)', '2011/04/10', '2011/08/11', 'Rodizio Hamburguer', 40, 'Rockville', true, '2011/04/12', false, 15, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (4, false, 'Segunda a Quarta (noite)', '2011/05/05', '2011/08/09', 'New York + 1/2 Porcao de Batata Frita', 27.300000000000001, 'Big Jack Dom Pedro', false, '2011/05/09', false, 13, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (5, false, 'Segunda a Quarta (noite)', '2011/05/05', '2011/08/09', 'New York + 1/2 Porcao de Batata Frita', 27.300000000000001, 'Big Jack Dom Pedro', false, '2011/05/09', false, 13, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (6, false, 'Segunda a Quarta (noite)', '2011/05/05', '2011/08/09', 'New York + 1/2 Porcao de Batata Frita', 27.300000000000001, 'Big Jack Dom Pedro', false, '2011/05/09', false, 13, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (7, false, 'Sexta a Domingo (noite)', '2011/04/12', '2011/07/07', 'Babybeef p/ 2 pessoas com arroz carreteiro e tropeiro + 2 sobremesas flambadas', 85.5, 'Steakhouse', true, '2011/04/13', false, 29.899999999999999, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (8, false, 'Segunda a Sexta (almoco)', '2011/05/04', '2011/07/04', 'Batata + Sobremesa + Salada', 23.5, 'Battataria Suica Barao', false, '2011/05/04', false, 11.75, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (9, false, 'Segunda a Sexta (almoco)', '2011/05/04', '2011/07/04', 'Batata + Sobremesa + Salada', 23.5, 'Battataria Suica Barao', false, '2011/05/04', false, 11.75, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (10, false, 'Terca a Quinta (noite)', '2011/05/04', '2011/07/31', 'Rodizio de pizza completo (salgada e doce) + 1 taca de vinho', 31.899999999999999, 'Pizzaria Fiducia', true, '2011/05/05', false, 15, 1);
INSERT INTO collectivebuy (id, alerted, canusedays, dateofbuy, enddate, name, originalvalue, place, printed, startdate, used, value, users) VALUES (11, false, 'Todos os dias (noite)', '2011/04/20', '2011/05/27', 'Qualquer pizza da Pizzaria Don Luiggi Cambui', 23.899999999999999, 'Pizzaria Don Luiggi Cambui', true, '2011/04/28', false, 11.949999999999999, 1);


--
-- TOC entry 1568 (class 0 OID 40827)
-- Dependencies: 1221
-- Data for Name: investiment; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (6, '07/27/2010', '300', NULL);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (17, '09/09/2010', '360', NULL);


--
-- TOC entry 1565 (class 0 OID 39942)
-- Dependencies: 1214
-- Data for Name: move; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (321, 16, '2010/10/21', '2010/10/21', 'sorvete', 'artesanal', 5, 4.4000000000000004, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (2, 8, '2010/07/02', '2010/07/02', 'almoco jogo br', 'casa alessandra', 3, 7, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (8, 26, '2010/07/05', '2010/07/05', 'xerox docs ibm', 'lan barao', 3, 3.6000000000000001, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (12, 26, '2010/07/05', '2010/07/05', '9 fotos 3x4', 'galeria glicerio', 3, 7, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (13, 28, '2010/07/05', '2010/07/05', 'New move', '', 9, 123, 28, 9, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (17, 16, '2010/07/06', '2010/07/06', 'coca + povilho', 'barao', 3, 5.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (18, 17, '2010/07/06', '2010/07/06', 'onibus jaguariuna', 'onibus campinas', 3, 8, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (19, 17, '2010/07/06', '2010/07/06', 'onibus jaguariuna', 'onibus campinas', 3, 8, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (24, 24, '2010/07/06', '2010/07/06', 'celular', 'vivo', 11, 100, 24, 11, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (25, 17, '2010/07/07', '2010/07/07', 'onibus hortolandi', 'onibus campinas', 3, 2.8999999999999999, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (27, 8, '2010/07/07', '2010/07/07', 'almoco', 'gr ibm', 5, 8.9299999999999997, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (28, 16, '2010/07/07', '2010/07/07', 'salgado + coxinha', 'lanchonete ibm', 3, 5.2000000000000002, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (29, 8, '2010/07/08', '2010/07/08', 'almoco', 'joe e leos', 5, 49.850000000000001, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (31, 15, '2010/07/09', '2010/07/09', 'conta tim', 'bb', 5, 24.890000000000001, 15, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (32, 7, '2010/07/10', '2010/08/17', 'pernil + bisn + banana + tampico', 'barao', 8, 19.850000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (3, 7, '2010/07/03', '2010/08/17', 'carnes, bisnag, sorvete, etc', 'barao', 8, 56.270000000000003, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (7, 8, '2010/07/05', '2010/08/17', 'almoco', 'barao', 8, 10.6, 8, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (14, 7, '2010/07/05', '2010/08/15', 'requeijao e clube social', 'barao', 7, 7.8600000000000003, 7, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (16, 8, '2010/07/06', '2010/08/15', 'almoco', 'premium bar jaguariuna', 7, 10.52, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (30, 31, '2010/07/07', '2010/07/07', 'coaching', 'transf flavio', 13, 288, 31, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (20, 10, '2010/07/06', '2010/07/06', 'salario', 'progonos', 13, 2296, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (22, 22, '2010/07/06', '2010/07/06', 'despesas', 'luiz', 13, 329.36000000000001, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (21, 22, '2010/07/06', '2010/07/06', 'cleo', 'casa', 13, 50, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (36, 35, '2010/07/11', '2010/08/17', 'boliche', 'dom pedro - star bowling', 8, 29.260000000000002, 35, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (11, 36, '2010/07/05', '2010/07/05', 'servidor integrator', 'integrator', 3, 20, 36, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (37, 8, '2010/07/12', '2010/07/12', 'almoco', 'gr', 5, 8.3399999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (38, 7, '2010/07/12', '2010/08/17', '2 club social + pao + manga + morango', 'barao', 8, 14.460000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (39, 8, '2010/07/13', '2010/08/15', 'almoco', 'subway campinas shopp', 7, 16.149999999999999, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (40, 7, '2010/07/13', '2010/08/17', 'pao + pto peru + queijo + salgadinho', 'barao', 8, 11.74, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (41, 37, '2010/07/13', '2010/07/13', 'ingles', 'casa gracinda', 3, 100, 37, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (42, 8, '2010/07/14', '2010/07/14', 'almoco', 'gr', 5, 10.300000000000001, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (43, 16, '2010/07/14', '2010/07/14', 'chocolate', 'maquina medco', 5, 1.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (44, 13, '2010/07/14', '2010/07/14', 'bb', 'bb', 5, 4.8499999999999996, 13, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (45, 8, '2010/07/15', '2010/07/15', 'almoco', 'gr', 5, 14.85, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (46, 7, '2010/07/16', '2010/07/16', 'pao + pres + queij + torta + bisn + lasanha + contra filet', 'barao', 5, 31.66, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (47, 8, '2010/07/16', '2010/07/17', 'almoco', 'restaurante da lagoa (horto)', 5, 12.44, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (48, 35, '2010/07/18', '2010/08/17', 'LU cine', 'kinoplex dom pedro', 8, 21.399999999999999, 35, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (49, 16, '2010/07/18', '2010/08/17', 'lanche mac', 'mac donald', 8, 26.25, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (50, 35, '2010/07/18', '2010/08/17', 'cinema', 'kinoplex dom pedro', 8, 11.9, 35, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (51, 17, '2010/07/18', '2010/07/18', 'busao dom pedro', 'busao d pedro', 3, 7.7999999999999998, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (52, 16, '2010/07/18', '2010/08/17', 'milk shake', 'bobs dom pedro', 8, 9.3000000000000007, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (53, 16, '2010/07/19', '2010/07/19', 'dog mineiro', 'dog do mineiro', 3, 10, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (55, 19, '2010/07/18', '2010/08/15', 'batata recheada', 'iguatemi backed potato', 7, 37, 19, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (56, 11, '2010/07/18', '2010/08/17', 'tenis adidas', 'iguatemi world tennis', 8, 299.99000000000001, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (54, 11, '2010/07/18', '2010/08/17', '2 calcas + 2 camisa + 1 camiseta', 'iguatemi riachuelo', 8, 165.5, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (57, 8, '2010/07/19', '2010/07/19', 'almoco', 'rest jardim', 5, 12.68, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (58, 11, '2010/07/18', '2010/08/17', 'casaco', 'iguatemi colombo', 8, 100, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (59, 17, '2010/07/18', '2010/07/18', 'taxi', 'iguatemi - barao', 3, 25, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (61, 11, '2010/07/18', '2010/07/18', 'SOGRA casaco', 'iguatemi - colombo', 3, 75, 11, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (60, 26, '2010/07/18', '2010/08/17', 'headset + papel + trident', 'iguatemi - kalunga', 8, 37.600000000000001, 26, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (62, 11, '2010/03/19', '2010/07/17', 'roupa social', 'dom pedro - colombo', 8, 60, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (63, 11, '2010/03/19', '2010/08/17', 'roupa social', 'dom pedro - colombo', 8, 60, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (66, 8, '2010/07/21', '2010/07/21', 'almoco', 'necos', 5, 11.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (68, 16, '2010/07/21', '2010/07/21', 'batata-frita media', 'bobs rodoviaria campinas', 3, 4.7999999999999998, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (69, 19, '2010/07/17', '2010/07/21', 'milk shake morango grande', 'bobs dom pedro', 8, 9.3000000000000007, 19, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (70, 8, '2010/07/22', '2010/08/15', 'almoco', 'la piedra', 7, 17.5, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (72, 26, '2010/07/23', '2010/07/23', 'coleira, ioio e protecao cracha', 'ibm', 5, 19, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (73, 8, '2010/07/27', '2010/07/27', 'almoco', 'padoca pinheiro', 5, 13.949999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (74, 26, '2010/07/25', '2010/08/17', 'SOGRA niver', 'floricultura cambui', 8, 59.899999999999999, 26, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (75, 35, '2010/07/27', '2010/07/27', 'bolao', 'chastel conta', 13, 22, 35, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (76, 8, '2010/07/26', '2010/08/15', 'almoco', 'montana grill campinas shopp', 7, 24.300000000000001, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (77, 8, '2010/07/23', '2010/07/23', 'almoco', 'subway campinas shopp', 5, 15.65, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (78, 16, '2010/07/26', '2010/07/26', 'bolo e beijinho', 'casa da sobremesa campinas shopp', 5, 6.3600000000000003, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (79, 16, '2010/07/24', '2010/07/24', '2 donuts e suco de laranja', 'graal congonhas', 5, 11.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (80, 16, '2010/07/25', '2010/07/25', 'del vale', 'graal congonhas', 5, 3.7000000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (81, 8, '2010/07/20', '2010/07/20', 'almoco', 'gr', 5, 20.879999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (71, 16, '2010/07/22', '2010/08/15', 'janta outback', 'outback dom pedro', 7, 127.90000000000001, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (82, 35, '2010/03/16', '2010/08/15', 'mesa botao 5/8', 'shop time', 6, 14.869999999999999, 35, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (83, 8, '2010/07/28', '2010/07/28', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (87, 8, '2010/07/30', '2010/07/30', 'almoco', 'churras garcia', 5, 38.359999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (88, 16, '2010/07/30', '2010/07/30', 'pastel de belem', 'grill garcia', 3, 2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (90, 7, '2010/07/28', '2010/07/28', 'catupir + banana + etc', 'barao', 5, 11.43, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (91, 8, '2010/07/29', '2010/07/29', 'almoco', 'jardim', 5, 14.699999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (92, 17, '2010/07/30', '2010/07/30', 'metro', 'metro sta cecilia', 3, 7.9500000000000002, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (95, 8, '2010/08/02', '2010/08/02', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (93, 16, '2010/08/02', '2010/08/02', '2 pao d queijo + 1 suco d laranja', 'lanchonete barra funda', 5, 5.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (96, 17, '2010/07/30', '2010/07/30', 'passagem sp', 'ibm - seu garcia', 3, 20, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (97, 8, '2010/08/05', '2010/08/05', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (98, 16, '2010/08/06', '2010/08/06', 'hot dog + coca', 'dog do gil', 3, 7, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (99, 8, '2010/08/03', '2010/08/03', 'almoco', 'gr', 5, 8.3399999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (101, 8, '2010/08/04', '2010/08/04', 'almoco', 'jardim', 5, 12.42, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (102, 8, '2010/08/06', '2010/08/06', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (103, 7, '2010/08/02', '2010/08/02', 'refri + queijo', 'barao', 5, 9.4199999999999999, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (104, 7, '2010/08/06', '2010/08/06', 'bomba+carolina+morang+pao+banana', 'barao', 15, 15.359999999999999, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (105, 7, '2010/08/07', '2010/08/07', 'nuggets+lasanha+chocotone+salgadinhos', 'barao', 15, 19.809999999999999, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (107, 26, '2010/08/07', '2010/08/07', 'presente pai', 'conta bb mana', 13, 54, 26, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (108, 9, '2010/08/04', '2010/08/04', 'beneficio', 'bb stefanini', 13, 83.329999999999998, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (109, 10, '2010/08/05', '2010/08/05', 'salario', 'bb stefanini', 13, 1026.4100000000001, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (110, 8, '2010/08/09', '2010/08/09', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (111, 26, '2010/08/11', '2010/08/11', 'servidor', 'itau', 13, 20, 26, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (112, 16, '2010/08/09', '2010/08/09', 'batata suica', 'battataria suica', 5, 33.810000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (113, 16, '2010/08/10', '2010/08/10', 'coxinhas + entrada + cocas', 'bar do jair', 5, 32.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (114, 8, '2010/08/10', '2010/08/10', 'almoco', 'gr', 16, 9.6699999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (115, 8, '2010/08/11', '2010/08/11', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (116, 16, '2010/08/11', '2010/08/11', 'hot dog', 'dog central', 3, 5.75, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (117, 8, '2010/08/12', '2010/08/12', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (118, 9, '2010/08/01', '2010/08/01', 'beneficio restaurante', 'ticket', 13, 106.45, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (120, 7, '2010/08/12', '2010/08/12', 'mercado', 'super barao', 15, 27.82, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (121, 8, '2010/08/13', '2010/08/13', 'almoco', 'jardim', 5, 11.4, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (122, 7, '2010/08/13', '2010/08/13', 'super compras', 'wall mart', 15, 167.59999999999999, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (123, 17, '2010/08/13', '2010/08/13', 'taxi', 'taxi dom pedro', 3, 10, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (124, 19, '2010/08/13', '2010/08/13', 'cebola + costela + coca', 'outback dom pedro', 16, 32.700000000000003, 19, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (125, 13, '2010/08/13', '2010/08/13', 'taxas', 'bb', 5, 3.7999999999999998, 13, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (126, 16, '2010/08/14', '2010/08/14', 'pao', 'super barao', 3, 1.95, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (127, 8, '2010/08/16', '2010/08/16', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (129, 8, '2010/08/17', '2010/08/17', 'almoco', 'lagoa', 5, 20.93, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (130, 7, '2010/08/17', '2010/09/17', 'bolo + lombo + mussarela + baguete', 'barao', 8, 10.66, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (131, 17, '2010/08/23', '2010/08/23', 'taxi', 'campinas shopp', 3, 28, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (128, 35, '2010/08/16', '2010/08/16', 'ingressos palmeiras', 'brindo de ouro', 13, 40, 35, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (134, 17, '2010/08/22', '2010/08/22', 'onibus palmeiras', 'busao', 3, 7.7999999999999998, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (135, 16, '2010/08/22', '2010/08/22', 'comida estadio', 'brinco de ouro', 3, 6, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (136, 8, '2010/08/23', '2010/08/23', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (137, 8, '2010/08/24', '2010/08/24', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (138, 16, '2010/08/23', '2010/08/23', '6 espihas + 1L suco laranja', 'habibs av brasil', 5, 10.35, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (140, 37, '2010/08/05', '2010/08/05', 'ingles', 'vizinha', 3, 100, 37, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (142, 8, '2010/08/20', '2010/08/20', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (143, 8, '2010/08/19', '2010/08/19', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (145, 8, '2010/08/18', '2010/08/18', 'almoco', 'jardim', 16, 13.15, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (147, 16, '2010/08/20', '2010/08/20', 'hot dog', 'gil', 3, 7, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (149, 11, '2010/08/20', '2010/09/17', '2 bermudas para tenis', 'pro spin', 8, 66.799999999999997, 11, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (141, 19, '2010/08/22', '2010/09/15', 'coca + whopper', 'burguer king dom pedro', 7, 18.899999999999999, 19, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (139, 7, '2010/08/21', '2010/09/17', 'bacon+lombo+queijo+calabresa+pao+bala+hamb+maionese+limao+cebola', 'barao', 8, 36.670000000000002, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (144, 16, '2010/08/19', '2010/09/17', 'cafe da manha IBM', 'barao', 8, 12.01, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (89, 9, '2010/07/29', '2010/08/01', 'beneficio', 'bb stefanini', 13, 222, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (119, 9, '2010/08/01', '2010/08/01', 'beneficio alimentacao', 'ticket', 13, 463.52999999999997, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (150, 8, '2010/08/26', '2010/08/26', 'almoco', 'gr', 5, 7.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (151, 8, '2010/08/27', '2010/08/27', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (152, 8, '2010/08/28', '2010/08/28', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (153, 17, '2010/08/28', '2010/08/28', 'busao hortolandia + campinas', 'busao', 3, 10.6, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (154, 8, '2010/08/25', '2010/08/25', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (155, 13, '2010/08/25', '2010/08/25', 'tarifa sms', 'bb', 5, 2.5, 13, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (156, 16, '2010/08/26', '2010/09/17', 'lanche + refri joes', 'clube urbano', 8, 15.9, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (157, 7, '2010/08/27', '2010/09/15', 'lasa + faixa azul + rocombole +sorvete', 'pao de acucar barao', 7, 22.710000000000001, 7, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (158, 7, '2010/08/26', '2010/09/17', 'nuggets + pao de queijo + baguete + queijo branco + torta', 'barao', 8, 20.239999999999998, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (159, 7, '2010/08/29', '2010/09/17', 'refri + tomate + cebola + linguica + pao frances + carvao', 'barao', 8, 20.309999999999999, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (160, 22, '2010/08/05', '2010/08/05', 'despesas', 'luiz', 13, 345.63, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (161, 16, '2010/08/31', '2010/08/31', '2 cocas + bolinhos + batata + salsicha', 'rei do joelho', 5, 14.58, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (162, 8, '2010/08/31', '2010/08/31', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (163, 8, '2010/08/30', '2010/08/30', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (164, 38, '2010/09/08', '2010/09/08', 'taxi volta aeroporto', 'maxxima transp', 3, 65, 38, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (165, 38, '2010/09/03', '2010/09/03', 'taxi ida aeroporto', 'maxxima transp', 3, 65, 38, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (167, 38, '2010/09/06', '2010/09/15', 'almoco com a lu', 'fogao mineiro', 7, 31.5, 38, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (168, 38, '2010/09/06', '2010/09/15', '2 rodizio pizza + 2 coca + suco', 'dio santo', 7, 50.600000000000001, 38, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (166, 38, '2010/09/05', '2010/09/15', '2 catu salada + coca  + suco', 'dog e cia', 7, 26, 38, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (169, 38, '2010/09/07', '2010/09/15', 'pizza + coca + suco', 'bella italia', 7, 31.350000000000001, 38, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (170, 8, '2010/09/08', '2010/09/08', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (171, 8, '2010/09/03', '2010/09/03', 'almoco', 'casa das massas', 16, 9.9900000000000002, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (172, 9, '2010/09/03', '2010/09/03', 'ingles', 'bb stefanini', 13, 100, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (173, 10, '2010/09/06', '2010/09/06', 'salario', 'bb stefanini', 13, 1404, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (175, 9, '2010/09/01', '2010/09/01', 'beneficio restaurante', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (176, 17, '2010/09/02', '2010/09/02', 'cartao transurc', 'term barao geraldo', 3, 20, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (177, 8, '2010/09/01', '2010/09/01', 'almoco', 'lagoa', 16, 16.420000000000002, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (178, 16, '2010/09/01', '2010/09/01', '2 salgados + sorvete', 'posto anchieta', 5, 8.25, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (179, 8, '2010/09/02', '2010/09/02', 'almoco', 'casa das massas', 16, 14.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (181, 22, '2010/09/08', '2010/09/08', 'despesas casa', 'conta luiz', 13, 338.94, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (180, 35, '2010/09/08', '2010/09/08', 'bolao', 'chastel bb', 13, 20, 35, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (182, 38, '2010/09/09', '2010/09/09', 'churrasco ddos', 'conta sogro', 13, 100, 38, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (183, 14, '2010/09/09', '2010/09/09', 'celular vivo', 'conta sogro', 13, 101.18000000000001, 14, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (184, 15, '2010/09/15', '2010/09/15', 'celular tim', 'bb', 7, 24.890000000000001, 15, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (185, 8, '2010/09/10', '2010/09/15', 'almoco', 'colonial grill', 7, 23, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (186, 16, '2010/09/10', '2010/09/10', 'sorvete', 'sorvete artesanal', 5, 5.3499999999999996, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (187, 7, '2010/09/12', '2010/10/17', 'sorvete + coca + pingo de ouro + chocotone', 'pao de acucar barao', 8, 26.780000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (188, 26, '2010/09/11', '2010/09/11', 'servidor', 'itau', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (189, 8, '2010/09/09', '2010/09/09', 'almoco', 'fassarella', 16, 7.75, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (190, 19, '2010/09/11', '2010/10/17', 'subway + coca + 2 cookies', 'shop dom pedro', 8, 21.800000000000001, 19, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (191, 7, '2010/09/11', '2010/10/15', 'carne + 4 salgados pulman', 'barao', 7, 11.19, 7, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (192, 16, '2010/09/11', '2010/09/11', 'sorvete', 'posto anchieta', 5, 4, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (193, 16, '2010/09/11', '2010/09/11', 'coca-cola', 'pingo dagua', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (194, 35, '2010/09/11', '2010/09/11', 'cinema', 'kinoplex dom pedro', 5, 19, 35, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (195, 39, '2010/09/13', '2010/09/13', 'poc debora (5horas)', 'bb', 13, 150, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (196, 37, '2010/09/14', '2010/09/14', 'ingles', 'vizinha', 3, 100, 37, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (197, 35, '2010/09/15', '2010/09/15', 'bolinha tenis + corda + cushion grip', 'bb sogro', 13, 84.189999999999998, 35, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (198, 7, '2010/09/15', '2010/09/15', '6 desodorantes', 'bb sogro', 13, 30, 7, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (199, 13, '2010/09/15', '2010/09/15', 'tarifa ibis', 'ibis', 5, 3.5, 13, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (200, 16, '2010/09/15', '2010/10/17', 'steakhouse cambui', 'clube urbano', 8, 11.94, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (201, 16, '2010/09/15', '2010/10/15', 'lanche + coca + fatia de bolo', 'pizzaria de capri', 7, 11.75, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (202, 8, '2010/09/14', '2010/09/14', 'almoco', 'lagoa', 16, 14.800000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (203, 8, '2010/09/13', '2010/09/15', 'almoco', 'sport bar', 16, 11.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (204, 16, '2010/09/15', '2010/09/15', 'corneto', 'gr ikasa', 5, 3.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (205, 8, '2010/09/15', '2010/09/15', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (206, 16, '2010/09/17', '2010/09/17', 'dog + coca', 'dog do gil', 3, 8, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (207, 17, '2010/09/18', '2010/09/18', 'credito onibus', 'terminal barao', 3, 22, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (208, 26, '2010/09/18', '2010/09/18', 'seringa + agulha', 'farmaestro dom pedro', 5, 3.7999999999999998, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (209, 8, '2010/09/16', '2010/09/16', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (211, 8, '2010/09/17', '2010/09/17', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (212, 19, '2010/09/18', '2010/10/15', 'lanche + batata + coca', 'burguer king dom pedro', 7, 17.899999999999999, 19, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (210, 16, '2010/09/18', '2010/09/18', 'pretzel', 'mr pretzels', 5, 5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (148, 10, '2010/08/20', '2010/08/20', 'adiantamento clt', 'stefanini', 13, 1026.5699999999999, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (85, 10, '2010/07/20', '2010/07/20', 'adiantamento clt', 'bb stefanini', 13, 870.97000000000003, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (213, 38, '2010/09/03', '2010/09/03', 'passagens aviao', 'trip / pai', 15, 645, 38, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (214, 9, '2010/09/03', '2010/09/03', 'beneficio alimentacao', 'ticket', 13, 645, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (215, 8, '2010/09/20', '2010/09/20', 'almoco', 'gr', 16, 7.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (216, 35, '2010/03/15', '2010/09/15', 'mesa botao 6/8', 'shop time', 6, 14.869999999999999, 35, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (217, 14, '2010/08/15', '2010/09/15', 'celular vivo', 'bb sogro', 13, 120, 14, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (218, 8, '2010/09/21', '2010/09/21', 'almoco', 'gr', 16, 9.6699999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (219, 8, '2010/09/22', '2010/09/22', 'almoco', 'jardim', 16, 15.199999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (220, 10, '2010/09/20', '2010/09/20', 'adiantamento clt', 'bb stefanini', 13, 1000.49, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (221, 8, '2010/09/23', '2010/09/23', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (222, 8, '2010/09/24', '2010/09/24', 'almoco', 'bom d+', 16, 23.100000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (223, 7, '2010/09/25', '2010/10/15', '2salgadinho + banana + limao + batata + 3 cocas', 'barao', 7, 14.550000000000001, 7, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (225, 16, '2010/09/24', '2010/10/15', 'lanche + coca', 'ponto final', 7, 16.350000000000001, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (226, 19, '2010/09/25', '2010/09/25', 'almoco barao', 'barao', 5, 14.82, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (227, 7, '2010/09/25', '2010/10/17', 'carne moida + carne churras + bomba chocolate', 'dalben', 8, 18.399999999999999, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (229, 16, '2010/09/26', '2010/10/15', 'bolo de morango', 'casa da sobremesa iguatemi', 7, 7.7999999999999998, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (228, 7, '2010/09/26', '2010/10/16', '4 bolacha + 2 salgadinhos + lasanha + qjo + pao + etc', 'pao de acucar barao', 8, 55.100000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (230, 8, '2010/09/28', '2010/09/28', 'almoco', 'lagoa', 16, 12.66, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (231, 9, '2010/09/27', '2010/09/27', 'beneficio resturante clt', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (174, 9, '2010/08/27', '2010/08/27', 'beneficio restaurante clt', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (235, 8, '2010/09/29', '2010/09/29', 'almooco', 'lagoa', 16, 15.369999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (236, 8, '2010/09/30', '2010/09/30', 'almoco', 'lagoa', 16, 18.390000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (237, 16, '2010/09/30', '2010/09/30', 'dog + del vale', 'dog do gil', 3, 7.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (238, 16, '2010/10/01', '2010/10/01', 'sorvete', 'artesanal', 5, 5.7000000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (239, 8, '2010/10/01', '2010/10/01', 'almoco', 'colonial grill', 16, 28.27, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (240, 17, '2010/10/02', '2010/10/02', 'onibus people', 'busao', 3, 5.2000000000000002, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (241, 35, '2010/10/03', '2010/10/03', 'voucher kinoplex e cinemark', 'conta lincard', 3, 40, 35, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (243, 19, '2010/10/03', '2010/10/15', 'almoco', 'sapore', 7, 11.74, 19, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (242, 7, '2010/10/03', '2010/10/03', 'panetone + chocolate + donut + pao hotdog', 'pao de acucar barao', 5, 19.32, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (244, 9, '2010/10/01', '2010/10/01', 'beneficio restaurante', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (245, 9, '2010/10/04', '2010/10/04', 'beneficio alimentacao', 'ticket pai', 13, 500, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (246, 8, '2010/10/04', '2010/10/04', 'almoco', 'ticket', 16, 5.5800000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (247, 8, '2010/10/05', '2010/10/05', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (248, 9, '2010/10/04', '2010/10/04', 'reembolso ingles', 'bb stefanini', 13, 100, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (249, 40, '2010/10/05', '2010/10/05', 'salario', 'bb people', 13, 324, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (250, 10, '2010/10/05', '2010/10/05', 'salario', 'bb stefanini', 13, 1296, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (251, 43, '2010/10/06', '2010/10/06', 'seguro 1/4', 'bb', 13, 463.88999999999999, 43, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (252, 22, '2010/10/06', '2010/10/06', 'despesas casa', 'bb', 13, 373.52999999999997, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (253, 16, '2010/10/06', '2010/10/06', 'hamburguer + coca', 'big jack', 5, 24, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (254, 42, '2010/10/06', '2010/10/06', 'alcool', 'ipiranga orozimbro', 5, 84.019999999999996, 42, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (255, 16, '2010/10/06', '2010/10/06', '2 yourgut', 'showgourt - peixe urbano', 5, 4, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (256, 43, '2010/10/06', '2010/10/06', 'insulfilm', 'nova concorde', 5, 160, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (257, 17, '2010/10/06', '2010/10/06', 'onibus para campinas', 'onibus', 3, 2.7000000000000002, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (258, 17, '2010/10/06', '2010/10/06', 'taxi para nova concorde', 'taxi', 3, 15, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (259, 8, '2010/10/06', '2010/10/06', 'almoco', 'fassarella', 16, 5.5099999999999998, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (260, 8, '2010/10/07', '2010/10/07', 'almoco', 'fassarella', 16, 9.8900000000000006, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (262, 8, '2010/10/08', '2010/10/08', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (263, 7, '2010/10/07', '2010/11/17', 'frutas + coca', 'pao de acucar barao', 8, 14.43, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (264, 16, '2010/10/07', '2010/11/17', 'lanhce + coca lata', 'ponto final', 8, 16.199999999999999, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (265, 26, '2010/10/09', '2010/10/09', 'servidor', 'itau integrator', 13, 20, 26, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (266, 26, '2010/10/09', '2010/10/09', '2 resfenol', 'droga raia', 5, 11.9, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (267, 7, '2010/10/09', '2010/10/09', '1/2 picanha + cds + 1/2 coca', 'walmart dom pedro', 5, 35.82, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (268, 16, '2010/10/08', '2010/10/08', '1 pastel + 1 salgado + 1 suco laranja', 'opostel', 5, 11.300000000000001, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (269, 19, '2010/10/09', '2010/10/09', 'parmegiana + 1/2 coca', 'alamanda', 5, 9.9000000000000004, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (270, 44, '2010/10/09', '2010/10/09', 'estacionamento d pedro', 'shopp dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (272, 7, '2010/10/10', '2010/10/10', 'frutas + panetone + req + 1/2 lombo', 'pao de acucar barao', 5, 38.460000000000001, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (273, 19, '2010/10/11', '2010/10/11', 'rodizio + coca', 'picanha de ouro', 5, 20.780000000000001, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (274, 26, '2010/10/11', '2010/10/11', 'chave', 'chaveiro barao', 3, 3.5, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (275, 26, '2010/10/11', '2010/10/11', '3 tabuas cama', 'marcenaria barao', 3, 25, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (276, 16, '2010/10/12', '2010/10/12', 'yorgut', 'thutugurt', 5, 7.25, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (277, 8, '2010/10/13', '2010/10/13', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (279, 8, '2010/10/14', '2010/10/14', 'almoco', 'lagoa', 16, 16.16, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (280, 26, '2010/10/15', '2010/10/15', 'acerto raoni', 'raoni', 3, 33, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (281, 16, '2010/10/15', '2010/11/17', '3 espihas + 1 kibe + 1 suco', 'papai salim', 8, 11.220000000000001, 16, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (282, 8, '2010/10/15', '2010/10/15', 'almoco', 'lagoa', 16, 17.039999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (283, 42, '2010/10/15', '2010/10/15', 'lavagem carro', 'lava-rapido horto', 3, 15, 42, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (284, 16, '2010/10/15', '2010/10/15', '4 subways + 8 cookies', 'peixe urbano bb', 5, 22, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (285, 8, '2010/10/19', '2010/10/19', 'almoco', 'lagoa', 16, 14.06, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (286, 8, '2010/10/18', '2010/10/18', 'almoco', 'jardim', 16, 8.9399999999999995, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (287, 8, '2010/10/16', '2010/10/16', 'almoco', 'posto anchieta', 5, 8.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (288, 16, '2010/10/18', '2010/10/18', 'hot dog + coca 2L', 'dog central barao', 3, 10.75, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (290, 15, '2010/10/16', '2010/10/16', 'celular', 'bb', 7, 24.890000000000001, 15, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (291, 43, '2010/10/19', '2010/10/19', 'fm transmitter', 'paulo akira bb', 13, 53.340000000000003, 43, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (293, 16, '2010/10/21', '2010/10/21', 'sorvete', 'artesanal', 5, 4.4000000000000004, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (294, 8, '2010/10/20', '2010/10/20', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (295, 8, '2010/10/21', '2010/10/21', 'almoco', 'colonial grill', 16, 25.800000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (296, 14, '2010/10/21', '2010/10/21', 'conta', 'bb sogro', 13, 119, 14, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (297, 26, '2010/10/21', '2010/10/21', 'presente lu', 'bb sogro', 13, 121, 26, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (298, 10, '2010/10/20', '2010/10/20', 'salario adiantamento clt', 'bb stefanini', 13, 1000.49, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (292, 35, '2010/10/20', '2010/11/15', 'x-tudo + guarana + pepsi + 1/2 porcao batata', 'star clean', 7, 19.649999999999999, 35, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (299, 24, '2010/10/13', '2010/10/05', 'New move', 'dsad', 10, 12.5, 24, 10, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (300, 16, '2010/10/23', '2010/10/23', 'pao d queijo + del vale', 'lanchonete anchieta', 3, 4.2000000000000002, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (301, 16, '2010/10/19', '2010/10/19', 'salgado', 'posto anchieta', 3, 2.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (302, 16, '2010/10/26', '2010/10/26', 'doce ibm', 'carrinho do lanche', 3, 2.6000000000000001, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (303, 8, '2010/10/18', '2010/10/18', 'almoco', 'jardim', 16, 8.9399999999999995, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (304, 8, '2010/10/19', '2010/10/19', 'almoco', 'lagoa', 16, 14.06, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (305, 8, '2010/10/20', '2010/10/20', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (306, 8, '2010/10/21', '2010/10/21', 'almoco', 'colonial grill', 16, 25.800000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (307, 8, '2010/10/22', '2010/10/22', 'almoco', 'lagoa', 16, 14.06, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (308, 8, '2010/10/25', '2010/10/25', 'almoco', 'jardim', 16, 10.4, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (309, 8, '2010/10/26', '2010/10/26', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (310, 8, '2010/10/27', '2010/10/27', 'almoco', 'fassarella', 16, 13.49, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (311, 8, '2010/10/28', '2010/10/28', 'almoco', 'jardim', 16, 16.75, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (312, 8, '2010/10/29', '2010/10/29', 'almoco', 'garcia', 16, 40.560000000000002, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (313, 42, '2010/10/13', '2010/11/17', 'alcool', 'posto campineira', 8, 73.010000000000005, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (261, 43, '2010/10/08', '2010/10/08', 'suporte gps', 'ML', 5, 33.899999999999999, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (314, 42, '2010/10/21', '2010/11/17', 'alcool', 'posto campineira', 8, 54.030000000000001, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (315, 16, '2010/10/20', '2010/11/15', 'lanche + coca + batata', 'star clean', 7, 19.649999999999999, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (316, 16, '2010/10/27', '2010/10/27', 'lanche + guarana', 'star clean', 7, 9.5999999999999996, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (317, 16, '2010/10/16', '2010/10/16', '2 salgados + refrigerante', 'posto anchieta', 5, 8.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (318, 16, '2010/10/22', '2010/10/22', '3 espihas', 'papai salim', 5, 5.5999999999999996, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (319, 16, '2010/10/29', '2010/11/15', 'salgado + sorvete', 'posto anchieta', 7, 6.5, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (320, 16, '2010/10/23', '2010/11/15', '2 salgado + refrigerante', 'posto anchieta', 7, 7.2000000000000002, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (322, 44, '2010/10/25', '2010/10/25', 'estacionamento', 'shop dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (323, 42, '2010/10/29', '2010/10/29', 'lavagem carro', 'lava-rapido horto', 3, 15, 42, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (324, 7, '2010/10/26', '2010/11/17', 'contra file + lasanha + bisnaga', 'pao de acucar barao', 8, 17.649999999999999, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (325, 7, '2010/10/23', '2010/11/17', 'coca 2L + pao hamb + chedar + presunto + contra file', 'pao de acucar barao', 8, 19.289999999999999, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (326, 16, '2010/10/30', '2010/10/30', 'salgado + suco + chiclete', 'esquina people', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (327, 8, '2010/10/30', '2010/10/30', '2 salgados + del vale', 'posto anchieta', 7, 8.5, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (328, 16, '2010/10/30', '2010/11/15', 'sorvete', 'posto anchieta', 7, 3.75, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (329, 7, '2010/10/30', '2010/11/17', 'cat + batata palha + pao + cheddar + peito de', 'pao d acucar barao', 8, 46.030000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (330, 42, '2010/10/30', '2010/11/17', 'alcool', 'posto campineira', 8, 64, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (331, 9, '2010/11/04', '2010/11/04', 'reembolso ingles', 'stefanini bb', 13, 100, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (332, 10, '2010/11/05', '2010/11/05', 'salario', 'stefanini bb', 13, 1294, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (333, 16, '2010/11/05', '2010/11/05', 'comida arabe', 'peixe urbano', 5, 10, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (334, 16, '2010/11/06', '2010/11/06', 'sorvete', 'posto anchieta', 3, 2.75, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (335, 19, '2010/11/07', '2010/11/07', 'servico + coca', 'tenda arabe', 3, 5, 19, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (336, 16, '2010/11/06', '2010/11/06', '2 pao de queijo', 'esquina people', 3, 1.2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (337, 40, '2010/11/08', '2010/11/08', 'salario people', 'bb people', 13, 716, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (338, 22, '2010/11/08', '2010/11/08', 'despesas', 'conta luiz', 13, 275.31999999999999, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (339, 43, '2010/11/08', '2010/11/08', 'seguro carro', 'sulamerica', 5, 463.88999999999999, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (341, 13, '2010/11/08', '2010/11/17', 'tarifa cartao ibis', 'ibis', 8, 3.5, 13, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (342, 7, '2010/11/07', '2010/12/17', '1 pizza + 1/2 coca', 'dalben barao', 8, 8.2799999999999994, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (344, 8, '2010/11/02', '2010/11/17', 'lanche + refri + batata', 'subway campinas shopp', 8, 15.35, 8, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (345, 7, '2010/11/02', '2010/11/17', 'piraque + coca + cocada + alface+ carne', 'pao de acucar barao', 8, 20.190000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (346, 7, '2010/11/03', '2010/12/17', 'suco + saboneteira + papel + etc', 'dalben barao', 8, 51.090000000000003, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (347, 16, '2010/11/05', '2010/12/15', 'sorvete', 'posto anchieta', 7, 3.75, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (349, 8, '2010/11/06', '2010/12/15', '2 salgados + 1 del vale + 1 trident', 'posto anchieta', 7, 9.9000000000000004, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (348, 16, '2010/11/05', '2010/12/15', '2 salgados + 1 del vale', 'posto anchieta', 7, 8.5, 16, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (350, 42, '2010/11/07', '2010/12/17', 'alcool', 'posto campineira', 8, 57, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (351, 8, '2010/11/08', '2010/11/08', 'almoco', 'jardim', 16, 9.2599999999999998, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (352, 8, '2010/11/03', '2010/11/03', 'almoco', 'fassarella', 16, 14.19, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (353, 8, '2010/11/01', '2010/11/01', 'almoco', 'bom demais', 16, 22, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (354, 8, '2010/11/04', '2010/11/04', 'almoco', 'lagoa', 16, 13.619999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (355, 8, '2010/11/05', '2010/11/05', 'almoco', 'bom demais', 16, 32.289999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (356, 8, '2010/11/09', '2010/11/09', 'almoco', 'lagoa', 16, 13.31, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (357, 26, '2010/11/09', '2010/11/09', 'servidor', 'integrator', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (358, 8, '2010/11/11', '2010/11/11', 'almoco', 'lagoa', 16, 11.65, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (359, 8, '2010/11/10', '2010/11/10', 'almoco', 'macarronada campinas shopp', 16, 31.199999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (360, 16, '2010/11/10', '2010/11/10', 'bolo', 'casa da sobremesa campinas shopp', 16, 7.4800000000000004, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (361, 16, '2010/11/10', '2010/12/15', 'lance + 1/2 batata + guarana 600ml', 'star clean', 6, 11.1, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (362, 8, '2010/11/12', '2010/12/15', 'almoco', 'burguer king brasil', 6, 18.899999999999999, 8, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (364, 7, '2010/11/13', '2010/11/13', 'mercado + 1 pizza', 'dalben barao', 5, 48.130000000000003, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (365, 44, '2010/11/14', '2010/11/14', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (366, 8, '2010/11/15', '2010/11/15', 'almoco', 'gr', 16, 8.5800000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (233, 43, '2010/09/29', '2010/10/16', 'documentos e placa 1/3', 'ouro verde despachante', 8, 244.22, 43, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (232, 43, '2010/09/29', '2010/11/17', 'documentos e placa 2/3', 'ouro verde despachante', 8, 244.22, 43, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (234, 43, '2010/09/29', '2010/12/17', 'documentos e placa 3/3', 'ouro verde despachante', 8, 244.22, 43, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (367, 19, '2010/11/11', '2010/11/11', 'cebola + batata + frango + coca', 'outback dom pedro', 16, 27.850000000000001, 19, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (368, 7, '2010/11/17', '2010/11/17', 'bolacha + pipoca + frutas + sabonetes + pizza', 'dalben barao', 5, 37.060000000000002, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (369, 8, '2010/11/17', '2010/11/17', 'almoco', 'fassarella', 16, 16.25, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (370, 8, '2010/11/16', '2010/11/16', 'almoco', 'jardim', 16, 14.039999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (371, 42, '2010/11/15', '2010/11/15', 'alcool', 'posto campineira', 5, 56, 42, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (372, 16, '2010/11/14', '2010/11/14', 'burguer + batata + coca', 'gregs burguer', 5, 26.620000000000001, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (373, 16, '2010/11/15', '2010/11/15', 'pizza + coca', 'casa da vo', 5, 17.48, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (374, 16, '2010/11/12', '2010/12/15', '2 salgados + refri + sorvete', 'posto anchieta', 6, 10.5, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (375, 19, '2010/11/14', '2010/12/15', 'batata + coca', 'roasted potato dom pedro', 6, 16.800000000000001, 19, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (376, 8, '2010/11/18', '2010/11/18', 'almoco', 'fassarella', 5, 13.880000000000001, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (378, 45, '2010/11/14', '2010/11/14', 'oferta', 'ibcu', 3, 20, 45, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (377, 16, '2010/11/13', '2010/11/13', 'sorvete + refri', 'posto anchieta', 3, 6, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (379, 37, '2010/11/18', '2010/11/18', 'ingles', 'gracinda', 3, 100, 37, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (380, 19, '2010/11/20', '2010/11/20', 'pizza + almoco', 'anderson', 3, 20, 19, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (382, 39, '2010/11/20', '2010/11/20', 'freelancer jefferson lima heranca', 'bb', 13, 100, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (383, 16, '2010/11/19', '2010/11/19', '2 espihas + 1 espiha fechada + 1 kibe + 1 suco', 'posto anchieta', 5, 12.9, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (381, 8, '2010/11/19', '2010/11/19', 'almoco', 'lagoa', 5, 14.119999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (384, 9, '2010/11/01', '2010/11/01', 'restaurante', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (385, 9, '2010/11/01', '2010/11/01', 'restaurante clt', 'ticket', 13, 132, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (386, 46, '2010/11/20', '2010/12/15', '2 dominios .com.br', 'registro br', 7, 60, 46, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (387, 14, '2010/11/21', '2010/11/21', 'celular', 'bb', 13, 119, 14, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (388, 8, '2010/11/22', '2010/11/22', 'almoco', 'lagoa', 3, 10, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (389, 10, '2010/11/22', '2010/11/22', 'salario adiantamento', 'bb stefanini', 13, 1000.59, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (390, 8, '2010/11/23', '2010/11/23', 'almoco', 'fassarella', 5, 14.91, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (391, 7, '2010/11/23', '2010/11/23', 'pizza + guarana + ovo', 'dalben barao', 8, 36.119999999999997, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (392, 8, '2010/11/24', '2010/12/17', 'almoco', 'subway cmp shopp', 8, 13.85, 8, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (393, 7, '2010/11/24', '2010/11/24', '2 panetones', 'nestle ibm', 5, 21.98, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (394, 7, '2010/11/26', '2010/11/26', '3 panetones', 'nestle ibm', 5, 32.969999999999999, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (395, 8, '2010/11/26', '2010/11/26', 'almoco', 'fassarella', 5, 14.1, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (396, 16, '2010/11/26', '2010/12/15', '2 salgados + 1 sorvete + 1 trident', 'posto anchieta', 6, 8.4000000000000004, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (398, 8, '2010/11/27', '2010/12/15', 'almoco', 'posto anchieta', 7, 11.699999999999999, 8, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (399, 16, '2010/11/26', '2010/12/15', '2 salgados + 1 sorvete', 'posto anchieta', 6, 8.4000000000000004, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (400, 16, '2010/11/26', '2010/11/26', 'sorvete', 'posto anchieta', 5, 3.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (401, 19, '2010/11/27', '2010/12/15', 'porcoes + coca + limonada suica', 'fogao mineiro jq egidio', 6, 28.579999999999998, 19, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (402, 16, '2010/11/27', '2010/11/27', 'sorvete', 'posto anchieta', 5, 2.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (403, 42, '2010/11/26', '2010/12/15', 'alcool', 'posto futuro', 6, 80, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (404, 39, '2010/11/24', '2010/11/24', 'freelance campo minado', 'francisca', 13, 391.5, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (405, 15, '2010/11/15', '2010/11/15', 'celular tim', 'tim', 7, 32, 15, 7, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (406, 7, '2010/11/28', '2010/12/17', 'pizza + coca + sucos', 'dalben barao', 8, 15.49, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (407, 8, '2010/11/29', '2010/12/15', 'lanche + coca + batata', 'bk brasil', 6, 22.399999999999999, 8, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (408, 16, '2010/11/30', '2010/11/30', 'coxinha', 'ikasa', 3, 2.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (409, 8, '2010/11/30', '2010/12/15', 'almoco', 'lagoa', 6, 13.359999999999999, 8, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (410, 10, '2010/11/30', '2010/11/30', '13 salario 1 parcela', 'bb stefanini', 13, 675, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (411, 40, '2010/11/30', '2010/11/30', '13 salario people', 'bb people', 13, 294, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (412, 16, '2010/11/30', '2010/11/30', 'dog + coca', 'dog do gil', 3, 9.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (397, 8, '2010/11/25', '2010/11/25', 'almoco', '1 de abril', 3, 12.1, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (413, 16, '2010/11/30', '2010/11/30', 'sundae', 'mac donalds', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (414, 7, '2010/12/01', '2010/12/17', 'bolachas + pipoca + pizza', 'dalben barao', 8, 21.75, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (415, 44, '2010/12/01', '2010/12/01', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (416, 44, '2010/11/29', '2010/11/29', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (417, 16, '2010/12/01', '2010/12/01', '6 espiha + pepsi', 'habibs dom pedro', 5, 9.3200000000000003, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (418, 26, '2010/12/01', '2010/12/01', 'amigo secreto havaiana', 'havaianas dom pedro', 5, 32.899999999999999, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (419, 8, '2010/12/01', '2010/12/01', 'almoco', 'fassarella', 16, 14.98, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (422, 39, '2010/12/02', '2010/12/02', 'free graficos francisca', 'bb franscisca', 13, 700, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (423, 26, '2010/11/29', '2010/11/29', 'adaptador tomada', 'fnac dom pedro', 3, 9.9000000000000004, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (424, 8, '2010/12/02', '2010/12/02', 'almoco', 'fassarella', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (425, 8, '2010/12/03', '2010/12/03', 'almoco', 'lagoa', 16, 13.02, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (426, 8, '2010/12/04', '2010/12/04', '2 salgados + refri', 'esquina da people', 3, 6.5999999999999996, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (427, 16, '2010/12/04', '2010/12/04', 'sorvete', 'posto anchieta', 5, 3.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (428, 42, '2010/12/04', '2010/12/17', 'alcool', 'posto vinhedo', 8, 47.020000000000003, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (429, 7, '2010/12/04', '2010/12/17', 'coca + limao + ameixa + laranja', 'dalben barao', 8, 14.67, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (430, 26, '2010/12/04', '2010/12/04', 'remedio lisador', 'droga raia barao', 3, 2.9300000000000002, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (431, 19, '2010/12/05', '2010/12/17', 'almoco + coca', 'sapore barao', 8, 13.65, 19, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (432, 16, '2010/12/04', '2010/12/15', 'lanche + batata + coca', 'lanchao barao', 6, 15.9, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (433, 44, '2010/12/04', '2010/12/04', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (434, 8, '2010/12/06', '2010/12/06', 'almoco', 'jardim', 16, 5.4800000000000004, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (435, 26, '2010/12/07', '2010/12/07', '1/4 panetone + papel de presente', 'gustavo', 3, 7, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (436, 8, '2010/12/07', '2010/12/07', 'almoco', 'fassarella', 16, 6.7800000000000002, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (437, 43, '2010/12/07', '2010/12/07', 'seguro 3/4', 'sulamerica', 5, 463.88999999999999, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (438, 22, '2010/12/07', '2010/12/07', 'casa', 'conta luiz', 13, 378.37, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (439, 10, '2010/12/07', '2010/12/07', 'salario', 'bb stefanini', 13, 1500.73, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (440, 40, '2010/12/06', '2010/12/06', 'salario people', 'bb people', 13, 762, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (441, 35, '2010/12/07', '2010/12/07', 'bolao', 'bb chastel', 13, 20, 35, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (442, 7, '2010/12/07', '2010/12/17', 'bisnaga + banana + ameixa + suco + goiaba + pinha + salada + melao', 'dalben barao', 8, 29.300000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (443, 8, '2010/12/08', '2010/12/08', 'almoco', 'jardim', 16, 9.1500000000000004, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (444, 8, '2010/12/09', '2010/12/09', 'almoco', 'jardim', 16, 13.289999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (445, 8, '2010/12/10', '2010/12/10', 'almoco', 'felice', 16, 12.1, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (446, 8, '2010/12/11', '2010/12/11', 'almoco', 'sapore', 5, 10, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (447, 26, '2010/12/10', '2010/12/10', 'servidor', 'integrator', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (448, 42, '2010/12/11', '2010/12/11', 'lavagem', 'casa blanca 2', 3, 20, 42, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (449, 8, '2010/12/13', '2010/12/13', 'almoco', 'fassarella', 16, 7.9699999999999998, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (450, 44, '2010/12/14', '2010/12/11', 'estacionamento', 'dom pedro', 5, 3, 44, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (451, 19, '2010/12/12', '2010/12/12', 'almoco', 'dalben barao', 5, 5.9299999999999997, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (452, 7, '2010/12/12', '2010/12/12', 'abacaxi + ameixa + pinha + melao', 'dalben barao', 5, 23.510000000000002, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (453, 8, '2010/12/14', '2010/12/14', 'almoco', 'fassarella', 16, 7.8399999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (454, 7, '2010/12/14', '2010/12/14', 'melao + salada fresh + cebola + tomate', 'dalben barao', 5, 8.2300000000000004, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (456, 42, '2010/12/15', '2010/12/15', 'alcool', 'posto barbieri', 5, 66.010000000000005, 42, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (457, 8, '2010/12/15', '2010/12/15', 'almoco', 'fassarella', 16, 11.56, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (458, 8, '2010/12/16', '2010/12/16', 'almoco', 'lagoa', 16, 7.2199999999999998, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (459, 46, '0017/12/14', '2010/12/20', 'servidor', 'integrator', 5, 111.66, 46, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (460, 46, '2010/12/17', '2010/12/17', 'design pipoca 2/4', 'samanta', 13, 258, 46, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (461, 8, '2010/12/17', '2010/12/17', 'almoco', 'bom demais', 16, 32.299999999999997, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (462, 7, '2010/12/17', '2010/12/17', 'farofa perdigao', 'dalben barao', 5, 6.4500000000000002, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (463, 26, '2010/12/16', '2010/12/16', 'cartao embrapa', 'correios', 3, 5.5, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (465, 10, '2010/12/20', '2010/12/20', 'salario adiantamento', 'bb stefanini', 13, 984.49000000000001, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (466, 10, '2010/12/20', '2010/12/20', '13 salario 2/2', 'bb stefanini', 13, 562.60000000000002, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (464, 40, '2010/12/20', '2010/12/20', '13 salario 2/2 people', 'bb people', 13, 338, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (467, 42, '2010/12/20', '2010/12/20', 'alcool', 'posto campineira', 8, 88, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (468, 8, '2010/12/21', '2010/12/21', 'almoco', 'jardim', 16, 6.6900000000000004, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (469, 8, '2010/12/20', '2010/12/20', 'almoco', 'jardim', 16, 3.52, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (470, 8, '2010/12/19', '2010/12/19', 'almoco', 'rest e pizza cintra', 5, 8.3499999999999996, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (471, 44, '2010/12/22', '2010/12/22', 'estacionamento', 'rei charles', 3, 6, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (472, 44, '2010/12/22', '2010/12/22', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (473, 8, '2010/12/22', '2010/12/22', 'almoco', 'fassarella', 16, 11.69, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (474, 8, '2010/12/23', '2010/12/23', 'almoco', 'colonial grill', 16, 35.329999999999998, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (475, 16, '2010/12/22', '2010/12/22', 'refrigerante', 'santa terezinha dom pedro', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (476, 46, '2010/12/23', '2010/12/23', 'crachas', 'bb irma ander', 13, 24, 46, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (477, 14, '2010/12/07', '2010/12/07', 'celular', 'conta sogro', 13, 119, 14, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (478, 15, '2010/12/15', '2010/12/15', 'celular tim', 'tim', 6, 32, 15, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (479, 19, '2010/12/25', '2010/12/25', 'rodizio + refri + torta holandesa', 'picanha de ouro', 5, 44.090000000000003, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (480, 44, '2010/12/25', '2010/12/25', 'estacionamneto', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (481, 8, '2010/12/24', '2010/12/24', 'almoco', 'ritorno dom pedro', 5, 8.1999999999999993, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (482, 16, '2010/12/23', '2010/12/23', 'lanche + guarana', 'ponto final', 5, 17.699999999999999, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (483, 42, '2010/12/26', '2011/01/17', 'alcool', 'posto campineira', 8, 61, 42, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (484, 44, '2010/12/26', '2010/12/26', 'estacionamento', 'campinas shopp', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (485, 7, '2010/12/26', '2010/12/26', 'agua + g4 gillet + cortador de unha', 'dalben barao', 5, 35.049999999999997, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (486, 8, '2010/12/27', '2010/12/27', 'almoco', 'macarronada shop cps', 16, 20.100000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (487, 44, '2010/12/27', '2010/12/27', 'estacionamento', 'dom pedro', 3, 3, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (488, 47, '2011/01/02', '2011/01/02', 'almoco comida japonesa', 'tomodati guaruja', 5, 164.13, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (489, 47, '2011/01/02', '2011/01/02', 'mercado refri + agua + desodorante', 'ricoy guaruja', 5, 99.629999999999995, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (490, 47, '2010/12/30', '2010/12/30', 'crepes + refris', 'crepes clovis guaruja', 5, 19, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (491, 47, '2010/12/30', '2010/12/30', 'havaiana LU', 'h space guaruja', 5, 29.989999999999998, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (492, 47, '2010/12/28', '2010/12/28', '2 aguas', 'rodoviaria campinas', 5, 5.4000000000000004, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (493, 47, '2010/12/30', '2010/12/30', 'bijus LU', 'barraquinhas guaruja', 5, 47, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (494, 47, '2010/12/29', '2010/12/29', 'estacionamento', 'shop praia mar santos', 3, 6, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (495, 47, '2010/12/28', '2010/12/28', 'refri + suco + x-americano + fresh', 'frango assado estrada sp', 5, 25, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (496, 47, '2010/12/29', '2010/12/29', 'estacionamento praia', 'praia guaiuba guaruja', 3, 10, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (497, 47, '2010/12/30', '2010/12/30', 'estacionamento praia', 'praia guaiuba guaruja', 3, 10, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (498, 47, '2010/12/30', '2010/12/30', 'estacionamento centro', 'centro pitangueiras guaruja', 3, 12, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (499, 8, '2010/12/28', '2010/12/28', '2 croasaint', 'carrinho ibm', 3, 5, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (500, 47, '2010/12/28', '2010/12/28', 'estacionamento rodoviaria', 'rodoviaria campinas', 3, 7, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (501, 42, '2010/12/28', '2010/12/28', 'alcool', 'posto anchieta', 5, 27, 42, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (502, 47, '2010/12/28', '2010/12/28', '4 pedagios', 'pedagios campinas - guaruja', 3, 32.549999999999997, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (503, 47, '2010/12/29', '2010/12/29', 'balsa guaruja - santos', 'dersa guaruja', 3, 8.1999999999999993, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (504, 47, '2011/01/04', '2011/01/04', 'alcool', 'posto ilha negra guaruja', 5, 80, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (505, 47, '2011/01/03', '2011/01/03', '2 churros', 'churrolandia guaruja', 3, 7, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (506, 47, '2011/01/03', '2011/01/03', 'bk - 3 lanches', 'bk guaruja', 5, 58.700000000000003, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (507, 47, '2011/01/04', '2011/01/04', '3 pedagios + 1 balsa', 'pedagios guaruja - campinas', 3, 22.350000000000001, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (509, 47, '2011/01/05', '2011/01/05', 'biju LU', 'tasy bijus campinas', 5, 34.399999999999999, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (510, 16, '2011/01/06', '2011/01/06', 'balas e bombom', 'carrinho ibm', 3, 2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (511, 47, '2011/01/05', '2011/01/05', 'estacionamento', 'dom pedro', 3, 4, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (512, 47, '2011/01/05', '2011/01/05', 'cebola + batata + costela + refris', 'outback dom pedro', 16, 124.15000000000001, 47, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (513, 8, '2011/01/06', '2011/01/06', 'almoco', 'jardim', 16, 6.21, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (514, 8, '2011/01/05', '2011/01/05', 'almoco', 'fassarella', 16, 13.529999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (516, 47, '2011/01/06', '2011/01/06', '4 originais greg + 4 bebidas + batata', 'gregs burguer barao', 5, 116.81999999999999, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (517, 11, '2011/01/06', '2011/01/06', '11 camisetas', 'riachuelo iguatemi', 5, 299.99000000000001, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (518, 11, '2011/01/06', '2011/01/06', '6 camisetas', 'hering iguatemi', 5, 224.40000000000001, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (519, 47, '2011/01/06', '2011/01/06', '3 blusas LU', 'hering iguatemi', 5, 109.7, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (520, 47, '2011/01/05', '2011/01/05', 'mcnifico', 'mac donald barao', 5, 11, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (521, 47, '2011/01/08', '2011/01/08', 'estacionamento', 'shop iguatemi campinas', 3, 5, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (522, 11, '2011/01/08', '2011/01/08', '3 bermudas', 'rener iguatemi campinas', 5, 79.700000000000003, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (523, 47, '2011/01/08', '2011/01/08', 'papi salim', 'papai salim campinas', 5, 59.289999999999999, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (524, 26, '2011/01/08', '2011/01/08', 'si senor - jantar lu', 'si senor campinas', 5, 95.700000000000003, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (525, 8, '2011/01/07', '2011/01/07', 'almoco', 'lagoa', 16, 11.9, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (526, 47, '2011/01/07', '2011/01/07', 'estacionamento', 'shop dom pedro campinas', 3, 4, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (527, 47, '2011/01/08', '2011/01/08', '2 cds roberto carlos LU', 'americanas iguatemi campinas', 5, 31.27, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (528, 47, '2011/01/08', '2011/01/08', '4 sobremesas + agua', 'casa da sobre iguatemi campinas', 3, 20.300000000000001, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (529, 47, '2011/01/08', '2011/01/08', 'lavagem carro', 'casa blanca campinas', 5, 25, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (508, 47, '2011/01/05', '2011/01/05', 'alcool carro', 'shell barao geraldo', 18, 74.019999999999996, 47, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (530, 47, '2011/01/08', '2011/01/08', '4 batatas + bebidas + musica', 'battataria suica campinas', 5, 134.91, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (531, 47, '2011/01/08', '2011/01/08', 'alcool carro', 'posto campineira campinas', 5, 45.009999999999998, 47, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (532, 47, '2011/01/09', '2011/01/09', 'pedagios indaiatuba', 'pedagios indaiatuba', 3, 18.300000000000001, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (533, 47, '2011/01/09', '2011/01/09', 'revista noiva + coquetel + caneta', 'rodoviaria campinas', 3, 13.800000000000001, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (534, 47, '2011/01/09', '2011/01/09', 'estacionamento', 'rodoviaria campinas', 3, 6, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (535, 9, '2011/01/09', '2011/01/09', 'alimentacao pai', 'bb campinas cheque pai', 13, 2766.6999999999998, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (536, 48, '2011/01/09', '2011/01/09', 'metade gastos viagem pai', 'bb campinas cheque pai', 13, 593.29999999999995, 48, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (537, 48, '2010/12/27', '2010/12/27', 'reembolso viagem lu', 'bb sogro', 13, 100, 48, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (538, 40, '2011/01/07', '2011/01/07', 'salario people', 'people', 13, 661, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (539, 10, '2011/01/05
', '2011/01/05', 'pagamento stefanini', 'bb stefanini', 13, 22.07, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (540, 10, '2011/01/05
', '2011/01/05
', 'pagamento stefanini', 'bb stefanini', 13, 1553.0699999999999, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (542, 15, '2011/01/10', '2011/01/10', 'celular tim', 'bb', 5, 57.890000000000001, 15, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (543, 9, '2011/01/01', '2011/01/01', 'beneficio restaurante', 'ticket', 13, 264, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (544, 9, '2011/01/01', '2011/01/01', 'beneficio car', 'ticket', 13, 269.89999999999998, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (545, 22, '2011/01/09', '2011/01/09', 'despesas', 'bb luiz', 13, 389.74000000000001, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (546, 8, '2011/01/10', '2011/01/10', 'almoco', 'jardim', 16, 10.41, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (547, 46, '2011/01/10', '2011/01/10', 'advogada renata', 'hsbc renata', 13, 408, 46, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (548, 16, '2011/01/10', '2011/01/10', 'hotdog', 'dog central barao', 3, 5.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (549, 26, '2011/01/10', '2011/01/10', 'servidor', 'integrator', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (550, 7, '2011/01/10', '2011/02/17', 'bisna + requeijao + esfihas', 'dalben barao', 8, 15.220000000000001, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (553, 43, '2011/01/11', '2011/01/11', 'ipva', 'bb barao', 5, 1089.1199999999999, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (554, 43, '2011/01/11', '2011/01/11', 'licenciamento', 'bb barao', 5, 59.329999999999998, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (555, 43, '2011/01/11', '2011/01/11', 'dpvat', 'bb barao', 5, 101.16, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (556, 43, '2011/01/11', '2011/01/11', 'despesa de postagem', 'bb barao', 5, 11, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (557, 11, '2011/01/11', '2011/01/11', '24 cabides', 'americana express', 5, 23.960000000000001, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (558, 8, '2011/01/11', '2011/01/11', 'almoco', 'fassarella', 16, 11.470000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (559, 49, '2011/01/11', '2011/01/11', 'testando', 'casa do zezinho', 19, 4, 49, 19, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (560, 8, '2011/01/12', '2011/01/12', 'almoco', 'fassarella', 16, 14.19, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (515, 47, '2011/01/06', '2011/01/06', 'estacionamento', 'shopp iguatemi', 3, 5, 47, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (561, 42, '2011/01/13', '2011/01/13', 'gasolina', 'shell barao', 18, 135.18000000000001, 42, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (562, 8, '2011/01/13', '2011/01/13', 'almoco', 'fassarella', 16, 2.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (563, 8, '2011/01/14', '2011/01/14', 'almoco', 'fassarella', 16, 10.77, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (564, 16, '2011/01/14', '2011/01/14', 'salgado', 'posto anchieta', 3, 2.7000000000000002, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (565, 19, '2011/01/16', '2011/01/16', 'almoco', 'dalben barao', 16, 15.81, 19, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (566, 7, '2011/01/16', '2011/01/16', 'pizza sadia', 'dalben barao', 5, 6.9900000000000002, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (567, 16, '2011/01/15', '2011/01/15', 'h20h + couver + estacionamento', 'almanaque', 3, 16, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (568, 8, '2011/01/17', '2011/01/17', 'almoco', 'felice', 16, 13.359999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (569, 16, '2011/01/17', '2011/01/17', 'sorvete', 'ikaza', 16, 4.5, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (570, 7, '2011/01/17', '2011/01/17', 'grampeador + grampos + durex + agulhas + linhas + pizza + doces', 'dalben barao', 5, 47.950000000000003, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (571, 8, '2011/01/18', '2011/01/18', 'almoco + sorvete', 'fassarella', 16, 13.039999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (572, 8, '2011/01/19', '2011/01/19', 'almoco', 'papai salim', 16, 17.16, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (573, 46, '2011/01/19', '2011/01/19', '3/4 pipoca site', 'samanta', 5, 250, 46, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (574, 44, '2011/01/19', '2011/01/19', 'estacionamento', 'papai salim', 3, 5, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (575, 16, '2011/01/20', '2011/01/20', 'hotdog + refri', 'dalben barao', 16, 5.9000000000000004, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (577, 8, '2011/01/20', '2011/01/20', 'almoco', 'lagoa', 16, 12.460000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (576, 7, '2011/01/20', '2011/02/17', 'sorvete + pizza + mousse', 'dalben barao', 8, 21.609999999999999, 7, 8, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (578, 19, '2011/01/23', '2011/01/23', 'almoco + refri', 'dalben barao', 5, 13.52, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (580, 16, '2011/01/22', '2011/01/22', 'salgado + suco', 'japones esquina people', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (579, 8, '2011/01/21', '2011/01/21', 'almoco', 'pizza hut norte sul', 5, 24.550000000000001, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (581, 16, '2011/01/21', '2011/01/21', '2 salgados + 1 del vale', 'posto anchieta', 5, 8.9000000000000004, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (582, 8, '2011/01/22', '2011/01/22', 'almoco', 'posto anchieta', 5, 5.4500000000000002, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (583, 42, '2011/01/23', '2011/01/23', 'gasolina', 'posto barao', 18, 60, 42, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (584, 42, '2011/01/23', '2011/01/23', 'gasolina', 'posto barao', 5, 64.909999999999997, 42, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (585, 10, '2011/01/20', '2011/01/20', 'salario adiantamento', 'stefanini bb', 13, 961.63, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (586, 26, '2011/01/24', '2011/01/24', 'viagem SP - entrevista concrete e gonow', 'posto do rafa', 5, 63.07, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (587, 16, '2011/01/25', '2011/01/25', 'salgado + refri', 'ritaza', 5, 5.7000000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (588, 8, '2011/01/25', '2011/01/25', 'almoco', 'jardim', 5, 8.5999999999999996, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (589, 8, '2011/01/26', '2011/01/26', 'almoco', 'fassarella', 5, 13.619999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (590, 26, '2011/01/24', '2011/01/24', 'viagem SP - entrevista concrete e gonow', 'frango assado', 5, 11.9, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (591, 16, '2011/01/26', '2011/01/26', 'dog + refri', 'dalben barao', 5, 5.5599999999999996, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (592, 7, '2011/01/26', '2011/01/26', 'coca + bis + 2 tortinha d limao', 'dalben barao', 5, 11.23, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (593, 26, '2011/01/24', '2011/01/24', 'viagem SP - entrevista concrete e gonow', 'pizza hut eldorado', 5, 24.550000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (594, 39, '2011/01/24', '2011/01/24', 'incsoft', 'bb rodrigo', 13, 1065, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (595, 43, '2011/01/27', '2011/01/27', 'vidro frente carro', 'auto vidro santo antonio', 5, 100, 43, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (596, 8, '2011/01/27', '2011/01/27', 'lanche + batata + coca', 'bk campinas shopp', 5, 16.899999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (597, 26, '2011/01/28', '2011/01/28', '2 pedagios - stefanini entrevista', 'jaguariuna stefanini', 3, 16.399999999999999, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (598, 16, '2011/01/28', '2011/01/28', 'salgado', 'esquina people', 3, 2.3999999999999999, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (599, 16, '2011/01/28', '2011/01/28', 'sorvete + trident', 'posto anchieta', 5, 4.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (600, 8, '2011/01/28', '2011/01/28', 'almoco', 'bom demais', 5, 23, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (601, 8, '2011/01/31', '2011/02/15', 'almoco', 'colonial grill', 6, 30.52, 8, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (602, 16, '2011/01/31', '2011/01/31', 'dog', 'dalben barao', 3, 3.3999999999999999, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (603, 8, '2011/01/29', '2011/01/29', 'almoco', 'posto anchieta', 5, 8.4000000000000004, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (604, 44, '2011/01/29', '2011/01/29', 'estacionamento', 'shop iguatemi', 3, 4, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (605, 8, '2011/02/01', '2011/02/01', 'almoco', 'fassarella', 16, 12.24, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (606, 7, '2011/02/01', '2011/02/01', 'bis + amendoin + limao + cebola + bisteca', 'dalben barao', 5, 21.010000000000002, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (607, 16, '2011/01/28', '2011/01/28', 'suco', 'academia ibm', 3, 3.7999999999999998, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (608, 7, '2011/01/30', '2011/02/15', 'torta limao + sucos + pizza + mousse + refri', 'dalben barao', 6, 23.460000000000001, 7, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (610, 16, '2011/02/05', '2011/03/15', '2 espihas + 2 kibes + 2 espihas fechadas', 'papai salim', 6, 16.399999999999999, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (611, 16, '2011/02/05', '2011/02/05', 'sorvete', 'posto anchieta', 5, 4, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (613, 16, '2011/02/01', '2011/02/01', 'dog mineiro', 'mineiro', 3, 5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (614, 16, '2011/02/04', '2011/02/04', 'sorvete', 'posto anchieta', 5, 2.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (615, 16, '2011/02/04', '2011/02/04', '2 salgados + 1 refri', 'japones esquina people', 3, 7.5999999999999996, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (616, 44, '2011/02/02', '2011/02/02', 'estacionamento', 'campinas shopp', 3, 2, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (617, 8, '2011/02/03', '2011/02/03', 'almoco', 'fassarella', 16, 2.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (618, 8, '2011/02/04', '2011/02/04', 'almoco', 'bk campinas shopp', 16, 22.899999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (619, 16, '2011/02/02', '2011/02/02', 'niver raoni', 'ponto 1', 5, 35.520000000000003, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (620, 8, '2011/02/02', '2011/02/02', 'almoco', 'fassarella', 16, 12.789999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (621, 8, '2011/02/05', '2011/03/15', 'almoco', 'posto anchieta', 6, 7.9000000000000004, 8, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (622, 42, '2011/02/04', '2011/03/15', 'alcool', 'posto carolina florence', 6, 101.06999999999999, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (623, 16, '2011/02/03', '2011/02/03', '2 espihas + 1 kibe + 1 espiha fechada + 1 refri', 'papai salim', 16, 14.199999999999999, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (624, 7, '2011/02/06', '2011/03/15', 'pizza + sabonete', 'dalben barao', 6, 9.8599999999999994, 7, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (625, 8, '2011/02/07', '2011/02/07', 'almoco', 'fassarella', 16, 10.6, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (626, 35, '2011/02/05', '2011/02/05', 'barzinho', 'sao bento taquaral', 5, 39, 35, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (627, 19, '2011/02/06', '2011/02/06', '2 pedaco pizza + 1 copo refri', 'ritorno dom pedro', 16, 9.8000000000000007, 19, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (628, 10, '2011/02/07', '2011/02/07', 'salario', 'bb stefanini', 13, 1551.9300000000001, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (629, 40, '2011/02/07', '2011/02/07', 'salario people', 'bb people', 13, 275, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (630, 22, '2011/02/08', '2011/02/08', 'casa', 'luiz bb', 13, 297.69999999999999, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (631, 16, '2011/02/07', '2011/02/07', 'dog + coca 2l', 'dalben barao', 16, 7.3600000000000003, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (632, 26, '2011/02/10', '2011/02/10', 'pedagios sp', 'viagem sp', 3, 29.649999999999999, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (633, 44, '2011/02/10', '2011/02/10', 'estacionamento', 'extra sp', 3, 11, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (634, 42, '2011/02/10', '2011/03/15', 'alcool', 'patelosa sp', 6, 59.990000000000002, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (635, 8, '2011/02/09', '2011/02/09', 'almoco', 'fassarella', 16, 12.289999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (636, 16, '2011/02/08', '2011/03/15', 'lanche + refri', 'ponto final', 6, 17.699999999999999, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (637, 16, '2011/02/10', '2011/02/10', 'pizza', 'barao das pizzas', 3, 14.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (639, 16, '2011/02/09', '2011/03/15', 'picanha peixe', 'peixe urbano', 6, 12, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (641, 8, '2011/02/11', '2011/02/11', 'almoco', 'jones bar primos', 5, 11.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (642, 8, '2011/02/11', '2011/02/11', 'almoco', 'fassarella', 16, 12.029999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (643, 8, '2011/02/08', '2011/02/08', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (644, 23, '2011/02/11', '2011/02/11', 'remedios', 'drogaria sao paulo', 5, 40.229999999999997, 23, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (645, 8, '2011/02/12', '2011/02/12', '2 salgados + suco de laranja', 'japones people', 3, 7.4000000000000004, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (646, 16, '2011/02/11', '2011/02/11', '2 salgados + suco de laranja', 'japones people', 3, 7.9000000000000004, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (647, 16, '2011/02/12', '2011/02/12', '2 pao de queijo', 'japones people', 3, 1.2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (648, 16, '2011/02/15', '2011/02/15', '2 salgados + 1 suco', 'japones people', 3, 7.2000000000000002, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (649, 26, '2011/02/15', '2011/02/15', 'servidor', 'integrator', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (650, 16, '2011/02/14', '2011/02/14', 'subway peixe', 'subway barao', 5, 5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (651, 8, '2011/02/15', '2011/02/15', 'almoco', 'fassarela', 16, 13.25, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (652, 7, '2011/02/14', '2011/02/14', '2 coca + fabitos + amendoin + queijo branco', 'dalben barao', 5, 18.469999999999999, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (653, 26, '2011/02/14', '2011/02/14', 'bolao cristiano', 'ibm', 3, 5, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (654, 42, '2011/02/15', '2011/02/15', 'gasolina', 'posto carolina', 18, 73.629999999999995, 42, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (655, 8, '2011/02/16', '2011/02/16', 'almoco', 'fassarella', 16, 14.59, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (656, 50, '2011/01/13', '2011/01/13', 'voucher java', 'oracle', 5, 317.19999999999999, 50, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (657, 16, '2011/02/13', '2011/02/13', '2 salgados + 1 suco', 'caminho floripa', 5, 11, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (658, 44, '2011/02/17', '2011/02/17', 'estacionamento', 'claro sp', 3, 5, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (659, 8, '2011/02/19', '2011/02/19', '2 salgados + 1 refri', 'japones people', 3, 5.7999999999999998, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (660, 16, '2011/02/19', '2011/02/19', '2 pao d queijo', 'japones people', 3, 1.2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (661, 16, '2011/02/19', '2011/02/19', 'suco', 'posto anchieta', 3, 2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (662, 16, '2011/02/18', '2011/02/18', '2 salgados + refri', 'japones people', 3, 5.7999999999999998, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (663, 8, '2011/02/14', '2011/02/14', 'almoco', 'fassarella', 16, 15.5, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (664, 44, '2011/02/17', '2011/02/17', 'estacionamento', 'tecsinapse', 3, 13, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (665, 26, '2011/02/17', '2011/02/17', 'pedagios', 'pedagios sp', 3, 25.399999999999999, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (666, 16, '2011/02/14', '2011/02/14', 'salgado + suco', 'sao paulo', 5, 5.1799999999999997, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (667, 42, '2011/02/18', '2011/02/18', 'alcool', 'posto carolina', 18, 71.859999999999999, 42, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (668, 16, '2011/02/18', '2011/02/18', 'sorvete + trident', 'posto anchieta', 5, 5.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (670, 16, '2011/02/17', '2011/02/17', 'habibs', 'habibs brasil', 5, 11, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (671, 8, '2011/02/17', '2011/02/17', '3 salgados + 1 suco de acerola', 'lanches beselga tecsinapse', 5, 12.5, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (672, 8, '2011/02/18', '2011/02/18', 'almoco', 'fassarella', 16, 15.19, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (673, 16, '2011/02/19', '2011/02/19', 'sorvete', 'ponto anchieta', 5, 2.75, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (674, 11, '2011/02/20', '2011/02/20', 'cuecas + bermuda', 'riachuelo iguatemi', 5, 39.700000000000003, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (677, 7, '2011/02/20', '2011/02/20', 'compras', 'carefour dom pedro', 6, 14.279999999999999, 7, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (678, 51, '2011/02/20', '2011/02/20', 'pizza hut', 'shopp iguatemi', 21, 20.5, 51, 21, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (679, 52, '2011/02/20', '2011/02/20', 'lencol', 'shopp iguatemi', 21, 39.899999999999999, 52, 21, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (680, 54, '2011/02/20', '2011/02/20', 'sucrilhos,leite,gilett,pinca', 'carrefur', 21, 19, 54, 21, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (681, 19, '2011/02/20', '2011/02/20', 'pizza + batata + refri', 'pizza hut shop iguatemi', 5, 18.399999999999999, 19, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (682, 8, '2011/02/21', '2011/02/21', 'almoco', 'rancho do frango', 16, 25.309999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (683, 16, '2011/02/21', '2011/02/21', 'lanche + guarana', 'ponto final', 5, 17.699999999999999, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (684, 16, '2011/02/22', '2011/02/22', 'sorvete', 'sergel', 3, 2, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (685, 8, '2011/02/22', '2011/02/22', 'almoco', '1 de abril', 3, 13.5, 8, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (686, 26, '2011/02/20', '2011/03/15', 'ar condicionado 1/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (687, 26, '2011/02/20', '2011/04/15', 'ar condicionado 2/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (688, 26, '2011/02/20', '2011/05/15', 'ar condicionado 3/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (689, 26, '2011/02/20', '2011/06/15', 'ar condicionado 4/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (690, 26, '2011/02/20', '2011/07/15', 'ar condicionado 5/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (691, 26, '2011/02/20', '2011/08/15', 'ar condicionado 6/6', 'comprafacil', 6, 158.31, 26, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (692, 59, '2011/02/21', '2011/02/21', 'alianca', 'infinity aliancas', 5, 771, 59, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (693, 60, '2011/02/21', '2011/03/15', 'viagem dourados carnaval 1/3', 'trip', 6, 295.07999999999998, 60, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (694, 60, '2011/02/21', '2011/04/15', 'viagem dourados carnaval 2/3', 'trip', 6, 295.07999999999998, 60, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (695, 60, '2011/02/21', '2011/05/15', 'viagem dourados carnaval 3/3', 'trip', 6, 295.07999999999998, 60, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (696, 39, '2011/02/21', '2011/02/21', 'admweb free', 'rodrigo', 13, 472.5, 39, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (697, 10, '2011/02/21', '2011/02/21', 'salario adantamento', 'stefanini', 13, 965.86000000000001, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (698, 58, '2011/02/21', '2011/02/21', 'cerveja', 'ponto final', 21, 7.7000000000000002, 58, 21, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (699, 61, '2011/02/21', '2011/02/21', 'lanche', 'ponto final', 21, 13.1, 61, 21, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (701, 12, '2011/02/23', '2011/02/23', 'cabelo', 'giovani', 3, 15, 12, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (702, 8, '2011/02/23', '2011/02/23', 'combo1', 'bk cmp shopp', 5, 17.899999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (703, 16, '2011/02/23', '2011/02/23', 'salgado + suco', 'gr', 16, 5.1799999999999997, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (704, 16, '2011/02/22', '2011/02/22', 'salgado + suco', 'gr', 16, 5.1799999999999997, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (706, 51, '2011/02/23', '2011/02/23', 'almoço', 'unicamp', 20, 2, 51, 20, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (710, 62, '2011/02/24', '2011/02/24', 'peixe urbano', 'churrascaria', 20, 12, 62, 20, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (713, 16, '2011/02/25', '2011/02/25', 'hot dog', 'dalben barao', 16, 2.8199999999999998, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (714, 8, '2011/02/25', '2011/02/25', 'combo1', 'bk camp shopp', 5, 17.899999999999999, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (715, 7, '2011/02/25', '2011/02/25', 'mercado', 'dalben barao', 5, 9.2799999999999994, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (718, 26, '2010/12/07', '2011/02/15', 'notebook 3/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (719, 26, '2010/12/07', '2011/03/15', 'notebook 4/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (720, 26, '2010/12/07', '2011/04/15', 'notebook 5/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (721, 26, '2010/12/07', '2011/05/15', 'notebook 6/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (722, 26, '2010/12/07', '2011/06/15', 'notebook 7/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (723, 26, '2010/12/07', '2011/07/15', 'notebook 8/10', 'fnac', 5, 216.11000000000001, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (726, 8, '2011/02/25', '2011/02/25', 'almoco', 'fortaleza', 16, 12, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (551, 26, '2010/12/07', '2011/01/15', 'notebook 2/10', 'fnac', 17, 216.11000000000001, 26, 17, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (455, 26, '2010/12/07', '2011/02/15', 'notebook 1/10', 'fnac dom pedro', 17, 216.11000000000001, 26, 17, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (727, 42, '2011/02/25', '2011/03/15', 'gasolina', 'posto rodoviaria br itapura', 6, 132, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (728, 16, '2011/02/25', '2011/02/25', 'sorvete + trident', 'posto anchieta', 5, 4.25, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (729, 16, '2011/02/25', '2011/02/25', '2 espiha ab + 1 espiha + 1 kibe cat + 1 coca lata', 'papai salim', 5, 13.31, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (725, 26, '2010/12/07', '2011/09/15', 'notebook 10/10', 'fnac', 17, 216.11000000000001, 26, 17, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (724, 26, '2010/12/07', '2011/08/15', 'notebook 9/10', 'fnac', 17, 216.11000000000001, 26, 17, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (730, 16, '2011/02/26', '2011/02/26', 'salgado + suco', 'japones people', 3, 5.4000000000000004, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (731, 16, '2011/02/26', '2011/02/26', 'salgado + chocolate', 'posto anchieta', 5, 6.2000000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (733, 19, '2011/02/24', '2011/03/15', 'almoco peixe', 'peixe', 6, 12, 19, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (734, 8, '2011/02/26', '2011/02/26', '2 salgados + refri', 'posto anchieta', 5, 7.9000000000000004, 8, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (735, 19, '2011/02/26', '2011/02/26', 'refri + servico', 'fazendao grill', 3, 6, 19, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (739, 16, '2011/03/01', '2011/03/01', 'pizza', 'dalben barao', 5, 6.9500000000000002, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (740, 8, '2011/03/01', '2011/03/01', 'almoco', 'casa das massas', 16, 17.390000000000001, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (743, 16, '2011/02/28', '2011/02/28', 'compras', 'dalben barao', 5, 28.850000000000001, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (744, 8, '2011/02/28', '2011/02/28', 'almoco', 'fassarella', 16, 9.9199999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (745, 16, '2011/02/28', '2011/02/28', 'lance + refri', 'subway', 5, 5.5, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (746, 21, '2011/02/28', '2011/02/28', 'ventilador', 'casas bahia', 5, 89.900000000000006, 21, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (747, 44, '2011/02/28', '2011/02/28', 'estacionamento', 'dom pedro', 3, 4, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (748, 16, '2011/02/27', '2011/03/15', 'batata', 'batataria suica peixe', 6, 8.9900000000000002, 16, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (750, 8, '2011/03/02', '2011/03/02', 'almoco', 'jardim', 16, 15.52, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (751, 26, '2011/03/02', '2011/03/02', 'servidor', 'integrator', 3, 20, 26, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (752, 7, '2011/03/02', '2011/03/02', 'calabresa + batata + 2 cocas', 'dalben barao', 5, 5.04, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (754, 42, '2011/03/04', '2011/04/16', 'gasolina', 'posto viracopos', 6, 80, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (755, 16, '2011/03/03', '2011/03/03', 'batataria + refri', 'battataria suica barao', 5, 8.1799999999999997, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (756, 16, '2011/03/04', '2011/03/04', '2 salgados', 'bar esquina stefanini jagua', 3, 4, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (757, 8, '2011/03/03', '2011/03/03', 'almoco', 'colonial grill', 16, 28, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (758, 42, '2011/03/04', '2011/03/04', 'pedagios', 'jagua stefanini', 3, 16.399999999999999, 42, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (759, 8, '2011/03/04', '2011/03/04', 'almoco', 'solar dos pampas', 16, 26.949999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (760, 17, '2011/03/04', '2011/03/04', 'vinda aeroporto', 'fabiano', 3, 20, 17, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (765, 60, '2011/03/07', '2011/03/07', 'gasolina', 'posto terere', 5, 105.01000000000001, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (766, 60, '2011/03/05', '2011/03/05', 'combo 7 + agua', 'bk shop china', 3, 14, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (767, 60, '2011/03/05', '2011/03/05', '2 lanches + suco + trident', 'dog e cia', 5, 23, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (768, 60, '2011/03/06', '2011/03/06', 'almoco retiro', 'retiro pib', 3, 8, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (769, 60, '2011/03/06', '2011/03/06', 'almoco retiro lu SOGRO', 'retiro pib', 3, 8, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (771, 40, '2011/03/04', '2011/03/04', 'salario', 'people', 13, 1188, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (772, 10, '2011/03/04', '2011/03/04', 'recisao stefanini', 'stefanini', 13, 1884.2, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (776, 65, '2011/03/10', '2011/03/10', 'gasolina', 'posto dourados', 23, 20, 65, 23, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (777, 65, '2011/03/10', '2011/03/10', 'dsadsa', 'ffasasd', 23, 23, 65, 23, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (778, 60, '2011/03/10', '2011/03/10', 'gasolina', 'posto cg', 18, 125.01000000000001, 60, 18, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (779, 60, '2011/03/08', '2011/03/08', 'estacionamento', 'shop ddos', 3, 3.5, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (780, 60, '2011/03/08', '2011/03/08', 'churrasco + refri', 'guapore', 5, 48, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (781, 60, '2011/03/08', '2011/03/08', 'cinema meu e lu', 'shop ddos', 3, 21, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (782, 60, '2011/03/10', '2011/03/10', '2 baurus + suco', 'padaria cg', 3, 16.399999999999999, 60, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (783, 60, '2011/03/10', '2011/03/10', 'almoco', 'bom almoco cg', 16, 11.199999999999999, 60, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (784, 60, '2011/03/10', '2011/03/10', 'escondidinho + limonada suica', 'agua doce ddos', 5, 42.240000000000002, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (785, 11, '2011/03/11', '2011/03/11', '2 camisas + 2 gravatas + 1 calca', 'dienda dourados', 3, 189, 11, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (786, 11, '2011/03/11', '2011/03/11', 'terno', 'mr kitsch ddos', 5, 250, 11, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (787, 60, '2011/03/11', '2011/03/11', 'mercado para domingo', 'abeve shop ddos', 15, 92.75, 60, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (788, 10, '2011/03/09', '2011/03/09', 'salario', 'stefanini', 13, 1671.5899999999999, 10, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (789, 59, '2011/03/09', '2011/03/09', 'filmagem', 'pro video', 5, 1480, 59, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (790, 9, '2011/03/09', '2011/03/09', 'alimentacao pai', 'pai', 13, 1480, 9, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (791, 22, '2011/03/11', '2011/03/11', 'despesas', 'luiz', 13, 272.80000000000001, 22, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (792, 60, '2011/03/12', '2011/03/12', '2 rodizios + bebidas', 'dio santo dourados', 5, 60, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (793, 60, '2011/03/11', '2011/03/11', 'delicias do cerrado', 'delicias do cerrado dourados', 5, 2.5, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (794, 60, '2011/03/11', '2011/03/11', 'contra file + bebidas', 'bistro dourados', 5, 60.5, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (795, 60, '2011/03/12', '2011/03/12', 'refri lata', 'abeve sto antonio dourados', 5, 1.7, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (796, 60, '2011/03/12', '2011/03/12', 'mercado para hamburguer', 'abeve sto antonio dourados', 5, 100, 60, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (797, 40, '2011/03/17', '2011/03/17', 'rescisao people', 'people', 13, 965.10000000000002, 40, 13, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (798, 16, '2011/03/17', '2011/03/17', 'dog + coca', 'dog central barao', 3, 8.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (799, 42, '2011/03/16', '2011/04/15', 'gasolina', 'posto campineira', 6, 80.030000000000001, 42, 6, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (800, 16, '2011/03/16', '2011/03/16', 'guarana 600', 'star clean', 5, 3.6000000000000001, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (801, 16, '2011/03/17', '2011/03/17', 'guarana 600 RAONI', 'star clean', 5, 3.6000000000000001, 16, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (802, 44, '2011/03/14', '2011/03/14', 'estacionamento', 'iguatemi', 3, 5, 44, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (803, 26, '2011/03/14', '2011/03/14', 'headset', 'kalunga iguatemi', 5, 19.699999999999999, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (804, 7, '2011/03/14', '2011/03/14', 'mercado', 'carefour iguatemi', 5, 55.630000000000003, 7, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (805, 16, '2011/03/15', '2011/03/15', 'dog + coca', 'dalben barao', 16, 7.71, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (806, 8, '2011/03/18', '2011/03/18', 'almoco', 'colonial grill', 16, 29.109999999999999, 8, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (808, 16, '2011/03/19', '2011/03/19', 'dog', 'dalben barao', 16, 2.4100000000000001, 16, 16, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (809, 26, '2011/03/19', '2011/03/19', 'munhequeira', 'decathlon', 5, 9.9499999999999993, 26, 5, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (810, 7, '2011/03/20', '2011/03/20', 'mercado', 'dalben barao', 15, 26.07, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (807, 7, '2011/03/19', '2011/03/19', 'mercado', 'dalben barao', 15, 40.530000000000001, 7, 15, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (811, 16, '2011/03/21', '2011/03/21', 'dog + coca', 'dog central', 3, 8.5, 16, 3, NULL);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (812, 22, '2011/03/22', '2011/03/22', 'gas de cozinha', 'liquigaz', 3, 44, 22, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (813, 22, '2011/03/22', '2011/03/22', 'agua', 'pingo dagua', 3, 5.5, 22, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (814, 26, '2011/03/23', '2011/03/23', 'trocar corda', 'gallitennis', 3, 10, 26, 3, false);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (817, 7, '2011/03/24', '2011/03/24', 'mercado', 'dalben barao', 15, 44.100000000000001, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (818, 22, '2011/03/23', '2011/03/23', '3 oleos', 'dalben barao', 15, 8.8499999999999996, 22, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (820, 16, '2011/03/23', '2011/04/15', 'metade 2 lanches + 4 chops', 'achoulevou', 6, 8.3800000000000008, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (822, 16, '2011/03/23', '2011/04/15', 'lanche + batata', 'ofertaprime', 6, 9.9900000000000002, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (823, 42, '2011/03/24', '2011/03/24', 'gasolina (falta 190.46)', 'shell barao', 18, 79.540000000000006, 42, 18, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (824, 7, '2011/03/24', '2011/03/24', '3 sucos + 1 shampoo', 'walmart dom pedro', 15, 22.949999999999999, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (825, 19, '2011/03/26', '2011/03/26', 'churrasco', 'dalben', 15, 20, 19, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (827, 26, '2011/03/24', '2011/03/24', 'fone + cabo', 'fnac dom pedro', 5, 11.890000000000001, 26, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (828, 16, '2011/03/29', '2011/03/29', '1 salgado + 1 suco', 'lanc lado tecsinpase', 3, 5.5, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (829, 16, '2011/03/30', '2011/03/30', '2 salgados + 1l suco del vale', 'lanc lado tecsinpase', 3, 9.1999999999999993, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (830, 8, '2011/03/30', '2011/03/30', 'almoco', 'portal de santana', 16, 11.119999999999999, 8, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (831, 8, '2011/03/29', '2011/03/29', 'almoco', 'amara', 16, 13.949999999999999, 8, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (832, 16, '2011/03/28', '2011/03/28', 'pizza com primos', 'pizzaria estrela', 16, 51.299999999999997, 16, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (833, 8, '2011/03/28', '2011/03/28', 'almoco + sorvete', 'portal de santana', 16, 18.440000000000001, 8, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (834, 70, '2011/03/23', '2011/04/15', 'passagens dourados pascoa', 'trip', 6, 636.02999999999997, 70, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (835, 71, '2011/04/01', '2011/04/01', 'copia chave escritorio', 'chaveiro jaguaribe', 3, 4, 71, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (836, 19, '2011/04/02', '2011/04/02', 'almoco + sorvete', 'jones', 5, 15.25, 19, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (837, 8, '2011/04/01', '2011/04/01', 'almoco', 'nova parente', 5, 11.5, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (838, 16, '2011/03/31', '2011/03/31', 'bife + 6 refri', 'badaro  shopp d e d', 16, 25, 16, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (839, 8, '2011/03/31', '2011/03/31', 'almoco', 'nova parente', 5, 12, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (840, 16, '2011/04/02', '2011/04/02', '2 espiha + beirute', 'espiha chique', 3, 10, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (841, 7, '2011/04/03', '2011/04/03', 'sorvete + 3 ana marias', 'econ', 15, 15.859999999999999, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (842, 19, '2011/04/03', '2011/04/03', 'almoco', 'jones', 16, 14, 19, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (843, 16, '2011/04/05', '2011/04/05', 'pastel + coxinha + guarana', 'clube pinheiros', 5, 6.7999999999999998, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (844, 71, '2011/04/05', '2011/04/05', 'estacionamento', 'clube pinheiros', 3, 7.5, 71, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (845, 16, '2011/04/07', '2011/04/07', 'sorvete 2l', 'econ', 5, 11.99, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (846, 8, '2011/04/06', '2011/04/06', 'almoco', 'jones', 5, 15.5, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (847, 16, '2011/04/04', '2011/04/04', 'pizza + coca', 'pizzaria estrela', 5, 14, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (848, 8, '2011/04/04', '2011/04/04', 'almoco', 'merkant', 16, 8.8599999999999994, 8, 16, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (849, 10, '2011/04/05', '2011/04/05', 'salario', 'tecsinapse', 13, 3200, 10, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (852, 16, '2011/04/08', '2011/04/08', 'hamburgues', 'rockville', 6, 15, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (853, 16, '2011/04/07', '2011/04/07', 'pizza + coca', 'pizzaria estrela', 5, 11, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (854, 71, '2011/04/08', '2011/04/08', 'estacionamento', 'wtc', 5, 12.6, 71, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (855, 15, '2011/04/09', '2011/04/09', 'tim', 'bb', 5, 24.890000000000001, 15, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (856, 16, '2011/04/08', '2011/04/08', 'trio', 'lanchao barao', 5, 16.899999999999999, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (857, 7, '2011/04/09', '2011/04/09', 'chinelo + barbeador + compras', 'carefour', 15, 84.859999999999999, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (858, 16, '2011/04/09', '2011/04/09', '2 refri + entrada', 'seo geraldo', 5, 21, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (859, 42, '2011/04/10', '2011/04/10', 'gasolina (117.88)', 'shell barao', 18, 72.579999999999998, 42, 18, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (860, 26, '2011/04/10', '2011/04/10', 'servidor', 'integrator', 3, 20, 26, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (861, 23, '2011/04/11', '2011/04/11', 'plano de saude', 'saude beneficiencia', 3, 73.659999999999997, 23, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (862, 22, '2011/04/11', '2011/04/11', 'agua', 'pingo dagua', 3, 5.5, 22, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (863, 8, '2011/04/11', '2011/04/11', 'almoco', 'tia rita', 3, 8, 8, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (864, 16, '2011/04/11', '2011/04/11', 'hot dog', 'mineiro', 3, 3.5, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (865, 16, '2011/04/11', '2011/04/11', 'sorvete + 1 bola', 'sergel', 3, 7, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (867, 8, '2011/04/12', '2011/04/12', 'almoco', 'dalben barao', 5, 8.7300000000000004, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (868, 7, '2011/04/12', '2011/04/12', 'sprite + caqui + limao + q ralado + contra filet', 'dalben barao', 15, 29.800000000000001, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (869, 42, '2011/04/13', '2011/04/13', 'gasolina (40.63)', 'shell barao', 18, 77.25, 42, 18, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (870, 16, '2011/04/13', '2011/04/13', 'hot dog + parte coca', 'dalben barao', 3, 5.25, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (871, 8, '2011/04/13', '2011/04/13', 'almoco (joe + ted)', 'jasmim rosa', 5, 31.800000000000001, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (872, 70, '2011/04/16', '2011/04/16', '2 pedacos de bolo', 'doce pastel', 3, 7.5, 70, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (873, 70, '2011/04/17', '2011/04/17', 'pizza + coca', 'bella italia', 5, 20, 70, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (874, 70, '2011/04/15', '2011/05/15', '2 salgados + coca', 'casa do pao de queijo viracopos', 6, 14, 70, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (875, 23, '2011/04/15', '2011/04/15', 'remedio dor d cabeca', 'rede getnet viracopos', 5, 6.4000000000000004, 23, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (876, 8, '2011/04/15', '2011/04/15', 'almoco', 'dalben barao', 5, 11.66, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (877, 10, '2011/04/15', '2011/04/15', 'metas + 2 dias', 'tecsinapse', 13, 1258.0699999999999, 10, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (878, 72, '2011/04/18', '2011/04/18', 'viagens + estadia primos', 'tecsinapse', 13, 762.50999999999999, 72, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (879, 22, '2011/04/06', '2011/04/06', 'despesas', 'luiz', 13, 289.83999999999997, 22, 13, false);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (880, 59, '2011/04/25', '2011/04/25', 'fotos', 'claudio', 5, 2650.5, 59, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (881, 70, '2011/04/25', '2011/04/25', 'almoco + lu', 'fogao mineiro', 5, 40.270000000000003, 70, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (882, 70, '2011/04/25', '2011/04/25', 'janta com pais', 'grilos', 5, 58.890000000000001, 70, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (883, 70, '2011/04/27', '2011/04/27', 'taxi aeroporto - campinas', 'viracopos', 5, 70, 70, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (884, 70, '2011/04/26', '2011/04/26', '2 lanches + suco + refri', 'dog e cia', 5, 25, 70, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (885, 7, '2011/04/27', '2011/04/27', 'sucos + macarrao + bisna + caqui + molho', 'carefour', 15, 33.859999999999999, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (887, 19, '2011/04/26', '2011/05/15', 'rodizio', 'fazendao grill', 6, 15, 19, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (889, 19, '2011/04/12', '2011/05/15', 'babybeef', 'steakhouse', 6, 14.949999999999999, 19, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (891, 19, '2011/04/26', '2011/05/15', 'almoco + bebida + sobremesa', 'restaurante do barao', 6, 4.4900000000000002, 19, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (893, 16, '2011/04/25', '2011/05/15', '1/2 pizza', 'don luiggi', 6, 5.9699999999999998, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (895, 23, '2011/05/01', '2011/05/01', 'plano de saude', 'saude beneficiencia', 5, 75.659999999999997, 23, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (896, 15, '2011/04/30', '2011/04/30', 'tim', 'tim', 5, 11.25, 15, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (897, 22, '2011/04/27', '2011/04/27', 'agua', 'pingo dagua', 3, 5.5, 22, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (898, 22, '2011/05/01', '2011/05/01', 'resistencia chuveiro', 'dalben barao', 15, 10.050000000000001, 22, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (899, 7, '2011/05/01', '2011/05/01', 'bisna + molho + batata', 'dalben barao', 15, 9.3000000000000007, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (902, 19, '2011/04/26', '2011/05/15', 'almoco + bebida + sobremesa (2)', 'restaurante do barao', 6, 4.4900000000000002, 19, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (904, 19, '2011/05/01', '2011/05/01', 'almoco + suco', 'dalben barao', 5, 12.199999999999999, 19, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (905, 22, '2011/05/02', '2011/05/02', 'resistencia 8t', 'walmart dom pedro', 15, 13, 22, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (906, 11, '2011/05/02', '2011/05/02', 'calca para dormir', 'walmart dom pedro', 15, 19, 11, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (907, 7, '2011/04/29', '2011/04/29', 'sucos importados + bifes + banana + caqui + limao + hidradante', 'dalben barao', 15, 30.539999999999999, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (908, 8, '2011/05/03', '2011/05/03', 'almoco', 'dalben barao', 5, 4.9900000000000002, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (909, 7, '2011/05/04', '2011/05/04', '1/2 pizza + torta holandesa + catu', 'dalben barao', 15, 10.300000000000001, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (910, 16, '2011/05/02', '2011/05/02', '5 espihas', 'habibs dom pedro', 5, 4.25, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (911, 8, '2011/05/04', '2011/05/04', 'almoco', 'dalben barao', 5, 8.4900000000000002, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (912, 22, '2011/05/07', '2011/05/07', 'despesas', 'luiz', 13, 231.87, 22, 13, false);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (913, 26, '2011/05/07', '2011/05/07', 'presente lu', 'carol', 13, 200, 26, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (914, 10, '2011/05/05', '2011/05/05', 'salario', 'tecsinapse', 13, 6000, 10, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (915, 39, '2011/05/03', '2011/05/03', 'adsense', 'google', 13, 387.11000000000001, 39, 13, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (916, 36, '2011/05/06', '2011/05/06', 'servidor', 'integrator', 3, 20, 36, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (917, 16, '2011/05/06', '2011/05/06', 'latinha del vale', 'franz cafe wtc', 3, 4.5, 16, 3, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (918, 16, '2011/05/05', '2011/06/15', '4 big jack', 'peixe urbano', 6, 52, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (919, 16, '2011/05/05', '2011/06/15', 'rodizio pizza', 'pizzaria fiducia', 6, 15, 16, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (920, 8, '2011/05/05', '2011/06/15', '2 battata + sobremesa + salada', 'clube do bixo', 6, 23.5, 8, 6, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (921, 71, '2011/05/08', '2011/05/08', 'estacionamento', 'wtc', 5, 17.5, 71, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (922, 71, '2011/05/07', '2011/05/15', 'pedagios', 'sem parar', 5, 28.100000000000001, 71, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (923, 71, '2011/05/07', '2011/05/07', 'gasolina', 'posto shell', 5, 64.040000000000006, 71, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (924, 8, '2011/05/05', '2011/05/05', 'almoco + refri', 'dalben barao', 5, 12.34, 8, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (925, 16, '2011/05/07', '2011/05/07', '2 salgados + 2 trident', 'shell barao', 5, 7.9900000000000002, 16, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (926, 19, '2011/05/07', '2011/05/07', '2 guarana + taxa de servico', 'fazendao grill', 5, 11.77, 19, 5, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (927, 68, '2011/05/08', '2011/05/08', '1/2 panetone + 1/2 picanha + 1/2 pizza + 1/2 linguica', 'carefour e pao de acucar', 15, 23.120000000000001, 68, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (928, 7, '2011/05/08', '2011/05/08', 'panetone + picanha + pizza + sucos + hagen daas + etc', 'carefour e pao de acucar', 15, 80.849999999999994, 7, 15, true);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay, sendnotification) VALUES (929, 11, '2011/05/08', '2011/05/08', 'cinto preto', 'carefour', 5, 19.899999999999999, 11, 5, true);


--
-- TOC entry 1566 (class 0 OID 39949)
-- Dependencies: 1215
-- Data for Name: typeofpay; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO typeofpay (id, name, users) VALUES (3, 'dinheiro', 1);
INSERT INTO typeofpay (id, name, users) VALUES (5, 'debito', 1);
INSERT INTO typeofpay (id, name, users) VALUES (6, 'bb visa', 1);
INSERT INTO typeofpay (id, name, users) VALUES (7, 'bb master', 1);
INSERT INTO typeofpay (id, name, users) VALUES (8, 'ibis master', 1);
INSERT INTO typeofpay (id, name, users) VALUES (9, 'BB - on-line', 4);
INSERT INTO typeofpay (id, name, users) VALUES (10, 'debito', 3);
INSERT INTO typeofpay (id, name, users) VALUES (11, 'credito', 3);
INSERT INTO typeofpay (id, name, users) VALUES (12, 'dinheiro', 3);
INSERT INTO typeofpay (id, name, users) VALUES (13, 'transferencia', 1);
INSERT INTO typeofpay (id, name, users) VALUES (15, 'alimentacao', 1);
INSERT INTO typeofpay (id, name, users) VALUES (16, 'restaurante', 1);
INSERT INTO typeofpay (id, name, users) VALUES (17, 'fnac', 1);
INSERT INTO typeofpay (id, name, users) VALUES (18, 'car', 1);
INSERT INTO typeofpay (id, name, users) VALUES (19, 'Dinheiro', 6);
INSERT INTO typeofpay (id, name, users) VALUES (20, 'dinheiro', 7);
INSERT INTO typeofpay (id, name, users) VALUES (21, 'debito', 7);
INSERT INTO typeofpay (id, name, users) VALUES (22, 'mastercard', 8);
INSERT INTO typeofpay (id, name, users) VALUES (23, 'dinheiro', 8);


--
-- TOC entry 1567 (class 0 OID 39953)
-- Dependencies: 1216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO users (id, login, pass, email) VALUES (1, 'f', 'zxc', NULL);
INSERT INTO users (id, login, pass, email) VALUES (2, 'lus2fi', 'zootecnia', NULL);
INSERT INTO users (id, login, pass, email) VALUES (3, 't', 't', NULL);
INSERT INTO users (id, login, pass, email) VALUES (4, 'dodo', '123', NULL);
INSERT INTO users (id, login, pass, email) VALUES (5, 'raoni', 'raonidomingo', NULL);
INSERT INTO users (id, login, pass, email) VALUES (6, 'carol', 'carol123', NULL);
INSERT INTO users (id, login, pass, email) VALUES (7, 'galo', 'galo123', NULL);
INSERT INTO users (id, login, pass, email) VALUES (8, 'tug', 'tug123', NULL);


--
-- TOC entry 1547 (class 2606 OID 39941)
-- Dependencies: 1213 1213
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 1557 (class 2606 OID 227733)
-- Dependencies: 1223 1223
-- Name: collectivebuy_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY collectivebuy
    ADD CONSTRAINT collectivebuy_pkey PRIMARY KEY (id);


--
-- TOC entry 1555 (class 2606 OID 40833)
-- Dependencies: 1221 1221
-- Name: investiment_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY investiment
    ADD CONSTRAINT investiment_pkey PRIMARY KEY (id);


--
-- TOC entry 1549 (class 2606 OID 39948)
-- Dependencies: 1214 1214
-- Name: move_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY move
    ADD CONSTRAINT move_pkey PRIMARY KEY (id);


--
-- TOC entry 1551 (class 2606 OID 39952)
-- Dependencies: 1215 1215
-- Name: typeofpay_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY typeofpay
    ADD CONSTRAINT typeofpay_pkey PRIMARY KEY (id);


--
-- TOC entry 1553 (class 2606 OID 39956)
-- Dependencies: 1216 1216
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: filipenevola; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1561 (class 2606 OID 39972)
-- Dependencies: 1215 1216 1552
-- Name: fk1fd02477e9808ca4; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY typeofpay
    ADD CONSTRAINT fk1fd02477e9808ca4 FOREIGN KEY (users) REFERENCES users(id);


--
-- TOC entry 1558 (class 2606 OID 39957)
-- Dependencies: 1213 1216 1552
-- Name: fk302bcfee9808ca4; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY category
    ADD CONSTRAINT fk302bcfee9808ca4 FOREIGN KEY (users) REFERENCES users(id);


--
-- TOC entry 1560 (class 2606 OID 39967)
-- Dependencies: 1214 1213 1546
-- Name: fk333bd1c1f50e8; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY move
    ADD CONSTRAINT fk333bd1c1f50e8 FOREIGN KEY (category) REFERENCES category(id);


--
-- TOC entry 1559 (class 2606 OID 39962)
-- Dependencies: 1214 1215 1550
-- Name: fk333bd1fafde742; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY move
    ADD CONSTRAINT fk333bd1fafde742 FOREIGN KEY (typeofpay) REFERENCES typeofpay(id);


--
-- TOC entry 1563 (class 2606 OID 227737)
-- Dependencies: 1223 1216 1552
-- Name: fkcf6b7058e9808ca4; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY collectivebuy
    ADD CONSTRAINT fkcf6b7058e9808ca4 FOREIGN KEY (users) REFERENCES users(id);


--
-- TOC entry 1562 (class 2606 OID 40834)
-- Dependencies: 1221 1216 1552
-- Name: fkec174a72e9808ca4; Type: FK CONSTRAINT; Schema: public; Owner: filipenevola
--

ALTER TABLE ONLY investiment
    ADD CONSTRAINT fkec174a72e9808ca4 FOREIGN KEY (users) REFERENCES users(id);


--
-- TOC entry 1573 (class 0 OID 0)
-- Dependencies: 4
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-05-08 12:26:30

--
-- PostgreSQL database dump complete
--

