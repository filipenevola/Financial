--
-- PostgreSQL database dump
--

-- Started on 2011-01-09 19:35:03

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1561 (class 0 OID 0)
-- Dependencies: 1212
-- Name: seqcategory; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqcategory', 48, true);


--
-- TOC entry 1562 (class 0 OID 0)
-- Dependencies: 1217
-- Name: seqinvestiment; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqinvestiment', 20, true);


--
-- TOC entry 1563 (class 0 OID 0)
-- Dependencies: 1213
-- Name: seqmove; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqmove', 536, true);


--
-- TOC entry 1564 (class 0 OID 0)
-- Dependencies: 1214
-- Name: seqtypeofpay; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('seqtypeofpay', 18, true);


--
-- TOC entry 1565 (class 0 OID 0)
-- Dependencies: 1215
-- Name: sequser; Type: SEQUENCE SET; Schema: public; Owner: filipenevola
--

SELECT pg_catalog.setval('sequser', 1, false);


--
-- TOC entry 1557 (class 0 OID 39953)
-- Dependencies: 1211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO users (id, login, pass) VALUES (1, 'f', 'zxc');
INSERT INTO users (id, login, pass) VALUES (2, 'lus2fi', 'zootecnia');
INSERT INTO users (id, login, pass) VALUES (3, 't', 't');
INSERT INTO users (id, login, pass) VALUES (4, 'dodo', '123');
INSERT INTO users (id, login, pass) VALUES (5, 'raoni', 'raonidomingo');


--
-- TOC entry 1554 (class 0 OID 39938)
-- Dependencies: 1208 1557
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO category (id, name, pay, value, users) VALUES (7, 'mercado', true, 200, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (8, 'almoco trabalho', true, 230, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (11, 'roupas', true, 100, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (12, 'cabelereiro', true, 15, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (14, 'celular vivo', true, 143.90000000000001, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (15, 'celular tim', true, 25, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (16, 'lanches', true, 100, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (17, 'transporte', true, 26, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (18, 'jogos', true, 15, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (19, 'fds comida', true, 80, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (9, 'beneficios', false, 1258, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (20, 'taxas trabalho', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (21, 'moveis', true, 50, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (22, 'casa', true, 400, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (23, 'saude', true, 60, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (26, 'diversos', true, 30, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (28, 'energia', true, 123, 4);
INSERT INTO category (id, name, pay, value, users) VALUES (29, 'alimentacao', true, 300, 3);
INSERT INTO category (id, name, pay, value, users) VALUES (30, 'casa', true, 500, 3);
INSERT INTO category (id, name, pay, value, users) VALUES (24, 'tecnologia', true, 202, 3);
INSERT INTO category (id, name, pay, value, users) VALUES (31, 'coaching', false, 288, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (34, 'New Category', true, 76, 3);
INSERT INTO category (id, name, pay, value, users) VALUES (35, 'diversao', true, 100, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (36, 'servidor', true, 20, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (37, 'ingles', true, 100, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (13, 'bancos', true, 5.5, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (40, 'salario people', false, 480, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (10, 'salario', false, 2296, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (42, 'carro', true, 300, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (43, 'carro extra', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (44, 'estacionamento', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (45, 'igreja', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (39, 'freelancers', false, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (46, 'Pipoca Ofertas', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (38, 'viagem dourados setembro/2010', true, 0, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (47, 'viagem pais e amor 2010/2011', true, 1000, 1);
INSERT INTO category (id, name, pay, value, users) VALUES (48, 'reembolsos', false, 0, 1);


--
-- TOC entry 1558 (class 0 OID 40827)
-- Dependencies: 1216 1557
-- Data for Name: investiment; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (1, '05/01/2010', '4398.76', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (2, '06/01/2010', '810', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (3, '07/01/2010', '9.38', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (4, '06/01/2010', '24.46', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (5, '07/01/2010', '2000', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (7, '07/28/2010', '21.32', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (8, '08/06/2010', '12.89', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (9, '08/07/2010', '6.17', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (10, '08/12/2010', '0.36', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (11, '08/10/2010', '2.96', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (13, '08/23/2010', '800', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (6, '07/27/2010', '300', NULL);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (14, '08/28/2010', '23.3', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (15, '08/27/2010', '6.12', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (16, '08/27/2010', '300', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (18, '09/07/2010', '5.04', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (19, '09/06/2010', '10.37', 1);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (17, '09/09/2010', '360', NULL);
INSERT INTO investiment (id, dateofinvestiment, value, users) VALUES (20, '09/05/2010', '360', 1);


--
-- TOC entry 1556 (class 0 OID 39949)
-- Dependencies: 1210 1557
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


--
-- TOC entry 1555 (class 0 OID 39942)
-- Dependencies: 1209 1556 1554
-- Data for Name: move; Type: TABLE DATA; Schema: public; Owner: filipenevola
--

INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (2, 8, '07/02/2010', '07/02/2010', 'almoco jogo br', 'casa alessandra', 3, 7, 8, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (8, 26, '07/05/2010', '07/05/2010', 'xerox docs ibm', 'lan barao', 3, 3.6000000000000001, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (12, 26, '07/05/2010', '07/05/2010', '9 fotos 3x4', 'galeria glicerio', 3, 7, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (13, 28, '07/05/2010', '07/05/2010', 'New move', '', 9, 123, 28, 9);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (17, 16, '07/06/2010', '07/06/2010', 'coca + povilho', 'barao', 3, 5.5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (18, 17, '07/06/2010', '07/06/2010', 'onibus jaguariuna', 'onibus campinas', 3, 8, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (19, 17, '07/06/2010', '07/06/2010', 'onibus jaguariuna', 'onibus campinas', 3, 8, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (24, 24, '07/06/2010', '07/06/2010', 'celular', 'vivo', 11, 100, 24, 11);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (25, 17, '07/07/2010', '07/07/2010', 'onibus hortolandi', 'onibus campinas', 3, 2.8999999999999999, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (27, 8, '07/07/2010', '07/07/2010', 'almoco', 'gr ibm', 5, 8.9299999999999997, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (28, 16, '07/07/2010', '07/07/2010', 'salgado + coxinha', 'lanchonete ibm', 3, 5.2000000000000002, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (29, 8, '07/08/2010', '07/08/2010', 'almoco', 'joe e leos', 5, 49.850000000000001, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (31, 15, '07/09/2010', '07/09/2010', 'conta tim', 'bb', 5, 24.890000000000001, 15, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (32, 7, '07/10/2010', '08/17/2010', 'pernil + bisn + banana + tampico', 'barao', 8, 19.850000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (3, 7, '07/03/2010', '08/17/2010', 'carnes, bisnag, sorvete, etc', 'barao', 8, 56.270000000000003, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (7, 8, '07/05/2010', '08/17/2010', 'almoco', 'barao', 8, 10.6, 8, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (14, 7, '07/05/2010', '08/15/2010', 'requeijao e clube social', 'barao', 7, 7.8600000000000003, 7, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (16, 8, '07/06/2010', '08/15/2010', 'almoco', 'premium bar jaguariuna', 7, 10.52, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (30, 31, '07/07/2010', '07/07/2010', 'coaching', 'transf flavio', 13, 288, 31, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (20, 10, '07/06/2010', '07/06/2010', 'salario', 'progonos', 13, 2296, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (22, 22, '07/06/2010', '07/06/2010', 'despesas', 'luiz', 13, 329.36000000000001, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (21, 22, '07/06/2010', '07/06/2010', 'cleo', 'casa', 13, 50, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (36, 35, '07/11/2010', '08/17/2010', 'boliche', 'dom pedro - star bowling', 8, 29.260000000000002, 35, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (11, 36, '07/05/2010', '07/05/2010', 'servidor integrator', 'integrator', 3, 20, 36, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (37, 8, '07/12/2010', '07/12/2010', 'almoco', 'gr', 5, 8.3399999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (38, 7, '07/12/2010', '08/17/2010', '2 club social + pao + manga + morango', 'barao', 8, 14.460000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (39, 8, '07/13/2010', '08/15/2010', 'almoco', 'subway campinas shopp', 7, 16.149999999999999, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (40, 7, '07/13/2010', '08/17/2010', 'pao + pto peru + queijo + salgadinho', 'barao', 8, 11.74, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (41, 37, '07/13/2010', '07/13/2010', 'ingles', 'casa gracinda', 3, 100, 37, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (42, 8, '07/14/2010', '07/14/2010', 'almoco', 'gr', 5, 10.300000000000001, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (43, 16, '07/14/2010', '07/14/2010', 'chocolate', 'maquina medco', 5, 1.75, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (44, 13, '07/14/2010', '07/14/2010', 'bb', 'bb', 5, 4.8499999999999996, 13, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (45, 8, '07/15/2010', '07/15/2010', 'almoco', 'gr', 5, 14.85, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (46, 7, '07/16/2010', '07/16/2010', 'pao + pres + queij + torta + bisn + lasanha + contra filet', 'barao', 5, 31.66, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (47, 8, '07/16/2010', '07/17/2010', 'almoco', 'restaurante da lagoa (horto)', 5, 12.44, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (48, 35, '07/18/2010', '08/17/2010', 'LU cine', 'kinoplex dom pedro', 8, 21.399999999999999, 35, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (49, 16, '07/18/2010', '08/17/2010', 'lanche mac', 'mac donald', 8, 26.25, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (50, 35, '07/18/2010', '08/17/2010', 'cinema', 'kinoplex dom pedro', 8, 11.9, 35, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (51, 17, '07/18/2010', '07/18/2010', 'busao dom pedro', 'busao d pedro', 3, 7.7999999999999998, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (52, 16, '07/18/2010', '08/17/2010', 'milk shake', 'bobs dom pedro', 8, 9.3000000000000007, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (53, 16, '07/19/2010', '07/19/2010', 'dog mineiro', 'dog do mineiro', 3, 10, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (55, 19, '07/18/2010', '08/15/2010', 'batata recheada', 'iguatemi backed potato', 7, 37, 19, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (56, 11, '07/18/2010', '08/17/2010', 'tenis adidas', 'iguatemi world tennis', 8, 299.99000000000001, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (54, 11, '07/18/2010', '08/17/2010', '2 calcas + 2 camisa + 1 camiseta', 'iguatemi riachuelo', 8, 165.5, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (57, 8, '07/19/2010', '07/19/2010', 'almoco', 'rest jardim', 5, 12.68, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (58, 11, '07/18/2010', '08/17/2010', 'casaco', 'iguatemi colombo', 8, 100, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (59, 17, '07/18/2010', '07/18/2010', 'taxi', 'iguatemi - barao', 3, 25, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (61, 11, '07/18/2010', '07/18/2010', 'SOGRA casaco', 'iguatemi - colombo', 3, 75, 11, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (60, 26, '07/18/2010', '08/17/2010', 'headset + papel + trident', 'iguatemi - kalunga', 8, 37.600000000000001, 26, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (62, 11, '03/19/2010', '07/17/2010', 'roupa social', 'dom pedro - colombo', 8, 60, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (63, 11, '03/19/2010', '08/17/2010', 'roupa social', 'dom pedro - colombo', 8, 60, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (66, 8, '07/21/2010', '07/21/2010', 'almoco', 'necos', 5, 11.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (68, 16, '07/21/2010', '07/21/2010', 'batata-frita media', 'bobs rodoviaria campinas', 3, 4.7999999999999998, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (69, 19, '07/17/2010', '07/21/2010', 'milk shake morango grande', 'bobs dom pedro', 8, 9.3000000000000007, 19, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (70, 8, '07/22/2010', '08/15/2010', 'almoco', 'la piedra', 7, 17.5, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (72, 26, '07/23/2010', '07/23/2010', 'coleira, ioio e protecao cracha', 'ibm', 5, 19, 26, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (73, 8, '07/27/2010', '07/27/2010', 'almoco', 'padoca pinheiro', 5, 13.949999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (74, 26, '07/25/2010', '08/17/2010', 'SOGRA niver', 'floricultura cambui', 8, 59.899999999999999, 26, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (75, 35, '07/27/2010', '07/27/2010', 'bolao', 'chastel conta', 13, 22, 35, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (76, 8, '07/26/2010', '08/15/2010', 'almoco', 'montana grill campinas shopp', 7, 24.300000000000001, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (77, 8, '07/23/2010', '07/23/2010', 'almoco', 'subway campinas shopp', 5, 15.65, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (78, 16, '07/26/2010', '07/26/2010', 'bolo e beijinho', 'casa da sobremesa campinas shopp', 5, 6.3600000000000003, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (79, 16, '07/24/2010', '07/24/2010', '2 donuts e suco de laranja', 'graal congonhas', 5, 11.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (80, 16, '07/25/2010', '07/25/2010', 'del vale', 'graal congonhas', 5, 3.7000000000000002, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (81, 8, '07/20/2010', '07/20/2010', 'almoco', 'gr', 5, 20.879999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (71, 16, '07/22/2010', '08/15/2010', 'janta outback', 'outback dom pedro', 7, 127.90000000000001, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (82, 35, '03/16/2010', '08/15/2010', 'mesa botao 5/8', 'shop time', 6, 14.869999999999999, 35, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (83, 8, '07/28/2010', '07/28/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (87, 8, '07/30/2010', '07/30/2010', 'almoco', 'churras garcia', 5, 38.359999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (88, 16, '07/30/2010', '07/30/2010', 'pastel de belem', 'grill garcia', 3, 2, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (90, 7, '07/28/2010', '07/28/2010', 'catupir + banana + etc', 'barao', 5, 11.43, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (91, 8, '07/29/2010', '07/29/2010', 'almoco', 'jardim', 5, 14.699999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (92, 17, '07/30/2010', '07/30/2010', 'metro', 'metro sta cecilia', 3, 7.9500000000000002, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (95, 8, '08/02/2010', '08/02/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (93, 16, '08/02/2010', '08/02/2010', '2 pao d queijo + 1 suco d laranja', 'lanchonete barra funda', 5, 5.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (96, 17, '07/30/2010', '07/30/2010', 'passagem sp', 'ibm - seu garcia', 3, 20, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (97, 8, '08/05/2010', '08/05/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (98, 16, '08/06/2010', '08/06/2010', 'hot dog + coca', 'dog do gil', 3, 7, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (99, 8, '08/03/2010', '08/03/2010', 'almoco', 'gr', 5, 8.3399999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (101, 8, '08/04/2010', '08/04/2010', 'almoco', 'jardim', 5, 12.42, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (102, 8, '08/06/2010', '08/06/2010', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (103, 7, '08/02/2010', '08/02/2010', 'refri + queijo', 'barao', 5, 9.4199999999999999, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (104, 7, '08/06/2010', '08/06/2010', 'bomba+carolina+morang+pao+banana', 'barao', 15, 15.359999999999999, 7, 15);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (105, 7, '08/07/2010', '08/07/2010', 'nuggets+lasanha+chocotone+salgadinhos', 'barao', 15, 19.809999999999999, 7, 15);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (107, 26, '08/07/2010', '08/07/2010', 'presente pai', 'conta bb mana', 13, 54, 26, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (108, 9, '08/04/2010', '08/04/2010', 'beneficio', 'bb stefanini', 13, 83.329999999999998, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (109, 10, '08/05/2010', '08/05/2010', 'salario', 'bb stefanini', 13, 1026.4100000000001, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (110, 8, '08/09/2010', '08/09/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (111, 26, '08/11/2010', '08/11/2010', 'servidor', 'itau', 13, 20, 26, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (112, 16, '08/09/2010', '08/09/2010', 'batata suica', 'battataria suica', 5, 33.810000000000002, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (113, 16, '08/10/2010', '08/10/2010', 'coxinhas + entrada + cocas', 'bar do jair', 5, 32.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (114, 8, '08/10/2010', '08/10/2010', 'almoco', 'gr', 16, 9.6699999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (115, 8, '08/11/2010', '08/11/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (116, 16, '08/11/2010', '08/11/2010', 'hot dog', 'dog central', 3, 5.75, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (117, 8, '08/12/2010', '08/12/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (118, 9, '08/01/2010', '08/01/2010', 'beneficio restaurante', 'ticket', 13, 106.45, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (120, 7, '08/12/2010', '08/12/2010', 'mercado', 'super barao', 15, 27.82, 7, 15);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (121, 8, '08/13/2010', '08/13/2010', 'almoco', 'jardim', 5, 11.4, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (122, 7, '08/13/2010', '08/13/2010', 'super compras', 'wall mart', 15, 167.59999999999999, 7, 15);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (123, 17, '08/13/2010', '08/13/2010', 'taxi', 'taxi dom pedro', 3, 10, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (124, 19, '08/13/2010', '08/13/2010', 'cebola + costela + coca', 'outback dom pedro', 16, 32.700000000000003, 19, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (125, 13, '08/13/2010', '08/13/2010', 'taxas', 'bb', 5, 3.7999999999999998, 13, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (126, 16, '08/14/2010', '08/14/2010', 'pao', 'super barao', 3, 1.95, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (127, 8, '08/16/2010', '08/16/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (129, 8, '08/17/2010', '08/17/2010', 'almoco', 'lagoa', 5, 20.93, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (130, 7, '08/17/2010', '09/17/2010', 'bolo + lombo + mussarela + baguete', 'barao', 8, 10.66, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (131, 17, '08/23/2010', '08/23/2010', 'taxi', 'campinas shopp', 3, 28, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (128, 35, '08/16/2010', '08/16/2010', 'ingressos palmeiras', 'brindo de ouro', 13, 40, 35, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (134, 17, '08/22/2010', '08/22/2010', 'onibus palmeiras', 'busao', 3, 7.7999999999999998, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (135, 16, '08/22/2010', '08/22/2010', 'comida estadio', 'brinco de ouro', 3, 6, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (136, 8, '08/23/2010', '08/23/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (137, 8, '08/24/2010', '08/24/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (138, 16, '08/23/2010', '08/23/2010', '6 espihas + 1L suco laranja', 'habibs av brasil', 5, 10.35, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (140, 37, '08/05/2010', '08/05/2010', 'ingles', 'vizinha', 3, 100, 37, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (142, 8, '08/20/2010', '08/20/2010', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (143, 8, '08/19/2010', '08/19/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (145, 8, '08/18/2010', '08/18/2010', 'almoco', 'jardim', 16, 13.15, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (147, 16, '08/20/2010', '08/20/2010', 'hot dog', 'gil', 3, 7, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (149, 11, '08/20/2010', '09/17/2010', '2 bermudas para tenis', 'pro spin', 8, 66.799999999999997, 11, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (141, 19, '08/22/2010', '09/15/2010', 'coca + whopper', 'burguer king dom pedro', 7, 18.899999999999999, 19, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (139, 7, '08/21/2010', '09/17/2010', 'bacon+lombo+queijo+calabresa+pao+bala+hamb+maionese+limao+cebola', 'barao', 8, 36.670000000000002, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (144, 16, '08/19/2010', '09/17/2010', 'cafe da manha IBM', 'barao', 8, 12.01, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (89, 9, '07/29/2010', '08/01/2010', 'beneficio', 'bb stefanini', 13, 222, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (119, 9, '08/01/2010', '08/01/2010', 'beneficio alimentacao', 'ticket', 13, 463.52999999999997, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (150, 8, '08/26/2010', '08/26/2010', 'almoco', 'gr', 5, 7.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (151, 8, '08/27/2010', '08/27/2010', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (152, 8, '08/28/2010', '08/28/2010', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (153, 17, '08/28/2010', '08/28/2010', 'busao hortolandia + campinas', 'busao', 3, 10.6, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (154, 8, '08/25/2010', '08/25/2010', 'almoco', 'gr', 5, 9.6699999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (155, 13, '08/25/2010', '08/25/2010', 'tarifa sms', 'bb', 5, 2.5, 13, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (156, 16, '08/26/2010', '09/17/2010', 'lanche + refri joes', 'clube urbano', 8, 15.9, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (157, 7, '08/27/2010', '09/15/2010', 'lasa + faixa azul + rocombole +sorvete', 'pao de acucar barao', 7, 22.710000000000001, 7, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (158, 7, '08/26/2010', '09/17/2010', 'nuggets + pao de queijo + baguete + queijo branco + torta', 'barao', 8, 20.239999999999998, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (159, 7, '08/29/2010', '09/17/2010', 'refri + tomate + cebola + linguica + pao frances + carvao', 'barao', 8, 20.309999999999999, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (160, 22, '08/05/2010', '08/05/2010', 'despesas', 'luiz', 13, 345.63, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (161, 16, '08/31/2010', '08/31/2010', '2 cocas + bolinhos + batata + salsicha', 'rei do joelho', 5, 14.58, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (162, 8, '08/31/2010', '08/31/2010', 'almoco', 'gr', 16, 8.3399999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (163, 8, '08/30/2010', '08/30/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (164, 38, '09/08/2010', '09/08/2010', 'taxi volta aeroporto', 'maxxima transp', 3, 65, 38, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (165, 38, '09/03/2010', '09/03/2010', 'taxi ida aeroporto', 'maxxima transp', 3, 65, 38, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (167, 38, '09/06/2010', '09/15/2010', 'almoco com a lu', 'fogao mineiro', 7, 31.5, 38, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (168, 38, '09/06/2010', '09/15/2010', '2 rodizio pizza + 2 coca + suco', 'dio santo', 7, 50.600000000000001, 38, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (166, 38, '09/05/2010', '09/15/2010', '2 catu salada + coca  + suco', 'dog e cia', 7, 26, 38, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (169, 38, '09/07/2010', '09/15/2010', 'pizza + coca + suco', 'bella italia', 7, 31.350000000000001, 38, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (170, 8, '09/08/2010', '09/08/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (171, 8, '09/03/2010', '09/03/2010', 'almoco', 'casa das massas', 16, 9.9900000000000002, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (172, 9, '09/03/2010', '09/03/2010', 'ingles', 'bb stefanini', 13, 100, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (173, 10, '09/06/2010', '09/06/2010', 'salario', 'bb stefanini', 13, 1404, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (175, 9, '09/01/2010', '09/01/2010', 'beneficio restaurante', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (176, 17, '09/02/2010', '09/02/2010', 'cartao transurc', 'term barao geraldo', 3, 20, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (177, 8, '09/01/2010', '09/01/2010', 'almoco', 'lagoa', 16, 16.420000000000002, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (178, 16, '09/01/2010', '09/01/2010', '2 salgados + sorvete', 'posto anchieta', 5, 8.25, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (179, 8, '09/02/2010', '09/02/2010', 'almoco', 'casa das massas', 16, 14.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (181, 22, '09/08/2010', '09/08/2010', 'despesas casa', 'conta luiz', 13, 338.94, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (180, 35, '09/08/2010', '09/08/2010', 'bolao', 'chastel bb', 13, 20, 35, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (182, 38, '09/09/2010', '09/09/2010', 'churrasco ddos', 'conta sogro', 13, 100, 38, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (183, 14, '09/09/2010', '09/09/2010', 'celular vivo', 'conta sogro', 13, 101.18000000000001, 14, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (184, 15, '09/15/2010', '09/15/2010', 'celular tim', 'bb', 7, 24.890000000000001, 15, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (185, 8, '09/10/2010', '09/15/2010', 'almoco', 'colonial grill', 7, 23, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (186, 16, '09/10/2010', '09/10/2010', 'sorvete', 'sorvete artesanal', 5, 5.3499999999999996, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (187, 7, '09/12/2010', '10/17/2010', 'sorvete + coca + pingo de ouro + chocotone', 'pao de acucar barao', 8, 26.780000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (188, 26, '09/11/2010', '09/11/2010', 'servidor', 'itau', 3, 20, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (189, 8, '09/09/2010', '09/09/2010', 'almoco', 'fassarella', 16, 7.75, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (190, 19, '09/11/2010', '10/17/2010', 'subway + coca + 2 cookies', 'shop dom pedro', 8, 21.800000000000001, 19, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (191, 7, '09/11/2010', '10/15/2010', 'carne + 4 salgados pulman', 'barao', 7, 11.19, 7, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (192, 16, '09/11/2010', '09/11/2010', 'sorvete', 'posto anchieta', 5, 4, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (193, 16, '09/11/2010', '09/11/2010', 'coca-cola', 'pingo dagua', 3, 5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (194, 35, '09/11/2010', '09/11/2010', 'cinema', 'kinoplex dom pedro', 5, 19, 35, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (195, 39, '09/13/2010', '09/13/2010', 'poc debora (5horas)', 'bb', 13, 150, 39, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (196, 37, '09/14/2010', '09/14/2010', 'ingles', 'vizinha', 3, 100, 37, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (197, 35, '09/15/2010', '09/15/2010', 'bolinha tenis + corda + cushion grip', 'bb sogro', 13, 84.189999999999998, 35, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (198, 7, '09/15/2010', '09/15/2010', '6 desodorantes', 'bb sogro', 13, 30, 7, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (199, 13, '09/15/2010', '09/15/2010', 'tarifa ibis', 'ibis', 5, 3.5, 13, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (200, 16, '09/15/2010', '10/17/2010', 'steakhouse cambui', 'clube urbano', 8, 11.94, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (201, 16, '09/15/2010', '10/15/2010', 'lanche + coca + fatia de bolo', 'pizzaria de capri', 7, 11.75, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (202, 8, '09/14/2010', '09/14/2010', 'almoco', 'lagoa', 16, 14.800000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (203, 8, '09/13/2010', '09/15/2010', 'almoco', 'sport bar', 16, 11.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (204, 16, '09/15/2010', '09/15/2010', 'corneto', 'gr ikasa', 5, 3.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (205, 8, '09/15/2010', '09/15/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (206, 16, '09/17/2010', '09/17/2010', 'dog + coca', 'dog do gil', 3, 8, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (207, 17, '09/18/2010', '09/18/2010', 'credito onibus', 'terminal barao', 3, 22, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (208, 26, '09/18/2010', '09/18/2010', 'seringa + agulha', 'farmaestro dom pedro', 5, 3.7999999999999998, 26, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (209, 8, '09/16/2010', '09/16/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (211, 8, '09/17/2010', '09/17/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (212, 19, '09/18/2010', '10/15/2010', 'lanche + batata + coca', 'burguer king dom pedro', 7, 17.899999999999999, 19, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (210, 16, '09/18/2010', '09/18/2010', 'pretzel', 'mr pretzels', 5, 5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (148, 10, '08/20/2010', '08/20/2010', 'adiantamento clt', 'stefanini', 13, 1026.5699999999999, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (85, 10, '07/20/2010', '07/20/2010', 'adiantamento clt', 'bb stefanini', 13, 870.97000000000003, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (213, 38, '09/03/2010', '09/03/2010', 'passagens aviao', 'trip / pai', 15, 645, 38, 15);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (214, 9, '09/03/2010', '09/03/2010', 'beneficio alimentacao', 'ticket', 13, 645, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (215, 8, '09/20/2010', '09/20/2010', 'almoco', 'gr', 16, 7.5, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (216, 35, '03/15/2010', '09/15/2010', 'mesa botao 6/8', 'shop time', 6, 14.869999999999999, 35, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (217, 14, '08/15/2010', '09/15/2010', 'celular vivo', 'bb sogro', 13, 120, 14, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (218, 8, '09/21/2010', '09/21/2010', 'almoco', 'gr', 16, 9.6699999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (219, 8, '09/22/2010', '09/22/2010', 'almoco', 'jardim', 16, 15.199999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (220, 10, '09/20/2010', '09/20/2010', 'adiantamento clt', 'bb stefanini', 13, 1000.49, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (221, 8, '09/23/2010', '09/23/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (222, 8, '09/24/2010', '09/24/2010', 'almoco', 'bom d+', 16, 23.100000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (223, 7, '09/25/2010', '10/15/2010', '2salgadinho + banana + limao + batata + 3 cocas', 'barao', 7, 14.550000000000001, 7, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (225, 16, '09/24/2010', '10/15/2010', 'lanche + coca', 'ponto final', 7, 16.350000000000001, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (226, 19, '09/25/2010', '09/25/2010', 'almoco barao', 'barao', 5, 14.82, 19, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (227, 7, '09/25/2010', '10/17/2010', 'carne moida + carne churras + bomba chocolate', 'dalben', 8, 18.399999999999999, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (229, 16, '09/26/2010', '10/15/2010', 'bolo de morango', 'casa da sobremesa iguatemi', 7, 7.7999999999999998, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (228, 7, '09/26/2010', '10/16/2010', '4 bolacha + 2 salgadinhos + lasanha + qjo + pao + etc', 'pao de acucar barao', 8, 55.100000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (230, 8, '09/28/2010', '09/28/2010', 'almoco', 'lagoa', 16, 12.66, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (231, 9, '09/27/2010', '09/27/2010', 'beneficio resturante clt', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (174, 9, '08/27/2010', '08/27/2010', 'beneficio restaurante clt', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (235, 8, '09/29/2010', '09/29/2010', 'almooco', 'lagoa', 16, 15.369999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (236, 8, '09/30/2010', '09/30/2010', 'almoco', 'lagoa', 16, 18.390000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (237, 16, '09/30/2010', '09/30/2010', 'dog + del vale', 'dog do gil', 3, 7.5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (238, 16, '10/01/2010', '10/01/2010', 'sorvete', 'artesanal', 5, 5.7000000000000002, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (239, 8, '10/01/2010', '10/01/2010', 'almoco', 'colonial grill', 16, 28.27, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (240, 17, '10/02/2010', '10/02/2010', 'onibus people', 'busao', 3, 5.2000000000000002, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (241, 35, '10/03/2010', '10/03/2010', 'voucher kinoplex e cinemark', 'conta lincard', 3, 40, 35, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (243, 19, '10/03/2010', '10/15/2010', 'almoco', 'sapore', 7, 11.74, 19, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (242, 7, '10/03/2010', '10/03/2010', 'panetone + chocolate + donut + pao hotdog', 'pao de acucar barao', 5, 19.32, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (244, 9, '10/01/2010', '10/01/2010', 'beneficio restaurante', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (245, 9, '10/04/2010', '10/04/2010', 'beneficio alimentacao', 'ticket pai', 13, 500, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (246, 8, '10/04/2010', '10/04/2010', 'almoco', 'ticket', 16, 5.5800000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (247, 8, '10/05/2010', '10/05/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (248, 9, '10/04/2010', '10/04/2010', 'reembolso ingles', 'bb stefanini', 13, 100, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (249, 40, '10/05/2010', '10/05/2010', 'salario', 'bb people', 13, 324, 40, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (250, 10, '10/05/2010', '10/05/2010', 'salario', 'bb stefanini', 13, 1296, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (251, 43, '10/06/2010', '10/06/2010', 'seguro 1/4', 'bb', 13, 463.88999999999999, 43, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (252, 22, '10/06/2010', '10/06/2010', 'despesas casa', 'bb', 13, 373.52999999999997, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (253, 16, '10/06/2010', '10/06/2010', 'hamburguer + coca', 'big jack', 5, 24, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (254, 42, '10/06/2010', '10/06/2010', 'alcool', 'ipiranga orozimbro', 5, 84.019999999999996, 42, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (255, 16, '10/06/2010', '10/06/2010', '2 yourgut', 'showgourt - peixe urbano', 5, 4, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (256, 43, '10/06/2010', '10/06/2010', 'insulfilm', 'nova concorde', 5, 160, 43, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (257, 17, '10/06/2010', '10/06/2010', 'onibus para campinas', 'onibus', 3, 2.7000000000000002, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (258, 17, '10/06/2010', '10/06/2010', 'taxi para nova concorde', 'taxi', 3, 15, 17, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (259, 8, '10/06/2010', '10/06/2010', 'almoco', 'fassarella', 16, 5.5099999999999998, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (260, 8, '10/07/2010', '10/07/2010', 'almoco', 'fassarella', 16, 9.8900000000000006, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (262, 8, '10/08/2010', '10/08/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (263, 7, '10/07/2010', '11/17/2010', 'frutas + coca', 'pao de acucar barao', 8, 14.43, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (264, 16, '10/07/2010', '11/17/2010', 'lanhce + coca lata', 'ponto final', 8, 16.199999999999999, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (265, 26, '10/09/2010', '10/09/2010', 'servidor', 'itau integrator', 13, 20, 26, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (266, 26, '10/09/2010', '10/09/2010', '2 resfenol', 'droga raia', 5, 11.9, 26, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (267, 7, '10/09/2010', '10/09/2010', '1/2 picanha + cds + 1/2 coca', 'walmart dom pedro', 5, 35.82, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (268, 16, '10/08/2010', '10/08/2010', '1 pastel + 1 salgado + 1 suco laranja', 'opostel', 5, 11.300000000000001, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (269, 19, '10/09/2010', '10/09/2010', 'parmegiana + 1/2 coca', 'alamanda', 5, 9.9000000000000004, 19, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (270, 44, '10/09/2010', '10/09/2010', 'estacionamento d pedro', 'shopp dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (272, 7, '10/10/2010', '10/10/2010', 'frutas + panetone + req + 1/2 lombo', 'pao de acucar barao', 5, 38.460000000000001, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (273, 19, '10/11/2010', '10/11/2010', 'rodizio + coca', 'picanha de ouro', 5, 20.780000000000001, 19, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (274, 26, '10/11/2010', '10/11/2010', 'chave', 'chaveiro barao', 3, 3.5, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (275, 26, '10/11/2010', '10/11/2010', '3 tabuas cama', 'marcenaria barao', 3, 25, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (276, 16, '10/12/2010', '10/12/2010', 'yorgut', 'thutugurt', 5, 7.25, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (277, 8, '10/13/2010', '10/13/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (279, 8, '10/14/2010', '10/14/2010', 'almoco', 'lagoa', 16, 16.16, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (280, 26, '10/15/2010', '10/15/2010', 'acerto raoni', 'raoni', 3, 33, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (281, 16, '10/15/2010', '11/17/2010', '3 espihas + 1 kibe + 1 suco', 'papai salim', 8, 11.220000000000001, 16, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (282, 8, '10/15/2010', '10/15/2010', 'almoco', 'lagoa', 16, 17.039999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (283, 42, '10/15/2010', '10/15/2010', 'lavagem carro', 'lava-rapido horto', 3, 15, 42, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (284, 16, '10/15/2010', '10/15/2010', '4 subways + 8 cookies', 'peixe urbano bb', 5, 22, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (285, 8, '10/19/2010', '10/19/2010', 'almoco', 'lagoa', 16, 14.06, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (286, 8, '10/18/2010', '10/18/2010', 'almoco', 'jardim', 16, 8.9399999999999995, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (287, 8, '10/16/2010', '10/16/2010', 'almoco', 'posto anchieta', 5, 8.5, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (288, 16, '10/18/2010', '10/18/2010', 'hot dog + coca 2L', 'dog central barao', 3, 10.75, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (290, 15, '10/16/2010', '10/16/2010', 'celular', 'bb', 7, 24.890000000000001, 15, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (291, 43, '10/19/2010', '10/19/2010', 'fm transmitter', 'paulo akira bb', 13, 53.340000000000003, 43, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (293, 16, '10/21/2010', '10/21/2010', 'sorvete', 'artesanal', 5, 4.4000000000000004, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (294, 8, '10/20/2010', '10/20/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (295, 8, '10/21/2010', '10/21/2010', 'almoco', 'colonial grill', 16, 25.800000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (296, 14, '10/21/2010', '10/21/2010', 'conta', 'bb sogro', 13, 119, 14, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (297, 26, '10/21/2010', '10/21/2010', 'presente lu', 'bb sogro', 13, 121, 26, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (298, 10, '10/20/2010', '10/20/2010', 'salario adiantamento clt', 'bb stefanini', 13, 1000.49, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (292, 35, '10/20/2010', '11/15/2010', 'x-tudo + guarana + pepsi + 1/2 porcao batata', 'star clean', 7, 19.649999999999999, 35, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (299, 24, '10/13/2010', '10/05/2010', 'New move', 'dsad', 10, 12.5, 24, 10);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (300, 16, '10/23/2010', '10/23/2010', 'pao d queijo + del vale', 'lanchonete anchieta', 3, 4.2000000000000002, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (301, 16, '10/19/2010', '10/19/2010', 'salgado', 'posto anchieta', 3, 2.5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (302, 16, '10/26/2010', '10/26/2010', 'doce ibm', 'carrinho do lanche', 3, 2.6000000000000001, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (303, 8, '10/18/2010', '10/18/2010', 'almoco', 'jardim', 16, 8.9399999999999995, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (304, 8, '10/19/2010', '10/19/2010', 'almoco', 'lagoa', 16, 14.06, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (305, 8, '10/20/2010', '10/20/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (306, 8, '10/21/2010', '10/21/2010', 'almoco', 'colonial grill', 16, 25.800000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (307, 8, '10/22/2010', '10/22/2010', 'almoco', 'lagoa', 16, 14.06, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (308, 8, '10/25/2010', '10/25/2010', 'almoco', 'jardim', 16, 10.4, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (309, 8, '10/26/2010', '10/26/2010', 'almoco', 'casa das massas', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (310, 8, '10/27/2010', '10/27/2010', 'almoco', 'fassarella', 16, 13.49, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (311, 8, '10/28/2010', '10/28/2010', 'almoco', 'jardim', 16, 16.75, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (312, 8, '10/29/2010', '10/29/2010', 'almoco', 'garcia', 16, 40.560000000000002, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (313, 42, '10/13/2010', '11/17/2010', 'alcool', 'posto campineira', 8, 73.010000000000005, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (261, 43, '10/08/2010', '10/08/2010', 'suporte gps', 'ML', 5, 33.899999999999999, 43, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (314, 42, '10/21/2010', '11/17/2010', 'alcool', 'posto campineira', 8, 54.030000000000001, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (315, 16, '10/20/2010', '11/15/2010', 'lanche + coca + batata', 'star clean', 7, 19.649999999999999, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (316, 16, '10/27/2010', '10/27/2010', 'lanche + guarana', 'star clean', 7, 9.5999999999999996, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (317, 16, '10/16/2010', '10/16/2010', '2 salgados + refrigerante', 'posto anchieta', 5, 8.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (318, 16, '10/22/2010', '10/22/2010', '3 espihas', 'papai salim', 5, 5.5999999999999996, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (319, 16, '10/29/2010', '11/15/2010', 'salgado + sorvete', 'posto anchieta', 7, 6.5, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (320, 16, '10/23/2010', '11/15/2010', '2 salgado + refrigerante', 'posto anchieta', 7, 7.2000000000000002, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (321, 16, '10/21/2010', '10/21/2010', 'sorvete', 'artesanal', 5, 4.4000000000000004, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (322, 44, '10/25/2010', '10/25/2010', 'estacionamento', 'shop dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (323, 42, '10/29/2010', '10/29/2010', 'lavagem carro', 'lava-rapido horto', 3, 15, 42, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (324, 7, '10/26/2010', '11/17/2010', 'contra file + lasanha + bisnaga', 'pao de acucar barao', 8, 17.649999999999999, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (325, 7, '10/23/2010', '11/17/2010', 'coca 2L + pao hamb + chedar + presunto + contra file', 'pao de acucar barao', 8, 19.289999999999999, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (326, 16, '10/30/2010', '10/30/2010', 'salgado + suco + chiclete', 'esquina people', 3, 5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (327, 8, '10/30/2010', '10/30/2010', '2 salgados + del vale', 'posto anchieta', 7, 8.5, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (328, 16, '10/30/2010', '11/15/2010', 'sorvete', 'posto anchieta', 7, 3.75, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (329, 7, '10/30/2010', '11/17/2010', 'cat + batata palha + pao + cheddar + peito de', 'pao d acucar barao', 8, 46.030000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (330, 42, '10/30/2010', '11/17/2010', 'alcool', 'posto campineira', 8, 64, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (331, 9, '11/04/2010', '11/04/2010', 'reembolso ingles', 'stefanini bb', 13, 100, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (332, 10, '11/05/2010', '11/05/2010', 'salario', 'stefanini bb', 13, 1294, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (333, 16, '11/05/2010', '11/05/2010', 'comida arabe', 'peixe urbano', 5, 10, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (334, 16, '11/06/2010', '11/06/2010', 'sorvete', 'posto anchieta', 3, 2.75, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (335, 19, '11/07/2010', '11/07/2010', 'servico + coca', 'tenda arabe', 3, 5, 19, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (336, 16, '11/06/2010', '11/06/2010', '2 pao de queijo', 'esquina people', 3, 1.2, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (337, 40, '11/08/2010', '11/08/2010', 'salario people', 'bb people', 13, 716, 40, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (338, 22, '11/08/2010', '11/08/2010', 'despesas', 'conta luiz', 13, 275.31999999999999, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (339, 43, '11/08/2010', '11/08/2010', 'seguro carro', 'sulamerica', 5, 463.88999999999999, 43, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (341, 13, '11/08/2010', '11/17/2010', 'tarifa cartao ibis', 'ibis', 8, 3.5, 13, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (342, 7, '11/07/2010', '12/17/2010', '1 pizza + 1/2 coca', 'dalben barao', 8, 8.2799999999999994, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (343, 7, '11/07/2010', '12/17/2010', '1 pizza + 1/2 coca RAONI', 'dalben barao', 8, 8.2799999999999994, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (344, 8, '11/02/2010', '11/17/2010', 'lanche + refri + batata', 'subway campinas shopp', 8, 15.35, 8, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (345, 7, '11/02/2010', '11/17/2010', 'piraque + coca + cocada + alface+ carne', 'pao de acucar barao', 8, 20.190000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (346, 7, '11/03/2010', '12/17/2010', 'suco + saboneteira + papel + etc', 'dalben barao', 8, 51.090000000000003, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (347, 16, '11/05/2010', '12/15/2010', 'sorvete', 'posto anchieta', 7, 3.75, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (349, 8, '11/06/2010', '12/15/2010', '2 salgados + 1 del vale + 1 trident', 'posto anchieta', 7, 9.9000000000000004, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (348, 16, '11/05/2010', '12/15/2010', '2 salgados + 1 del vale', 'posto anchieta', 7, 8.5, 16, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (350, 42, '11/07/2010', '12/17/2010', 'alcool', 'posto campineira', 8, 57, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (351, 8, '11/08/2010', '11/08/2010', 'almoco', 'jardim', 16, 9.2599999999999998, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (352, 8, '11/03/2010', '11/03/2010', 'almoco', 'fassarella', 16, 14.19, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (353, 8, '11/01/2010', '11/01/2010', 'almoco', 'bom demais', 16, 22, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (354, 8, '11/04/2010', '11/04/2010', 'almoco', 'lagoa', 16, 13.619999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (355, 8, '11/05/2010', '11/05/2010', 'almoco', 'bom demais', 16, 32.289999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (356, 8, '11/09/2010', '11/09/2010', 'almoco', 'lagoa', 16, 13.31, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (357, 26, '11/09/2010', '11/09/2010', 'servidor', 'integrator', 3, 20, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (358, 8, '11/11/2010', '11/11/2010', 'almoco', 'lagoa', 16, 11.65, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (359, 8, '11/10/2010', '11/10/2010', 'almoco', 'macarronada campinas shopp', 16, 31.199999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (360, 16, '11/10/2010', '11/10/2010', 'bolo', 'casa da sobremesa campinas shopp', 16, 7.4800000000000004, 16, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (361, 16, '11/10/2010', '12/15/2010', 'lance + 1/2 batata + guarana 600ml', 'star clean', 6, 11.1, 16, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (362, 8, '11/12/2010', '12/15/2010', 'almoco', 'burguer king brasil', 6, 18.899999999999999, 8, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (363, 7, '11/13/2010', '11/13/2010', '1 pizza RAONI', 'dalben barao', 5, 8.1500000000000004, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (364, 7, '11/13/2010', '11/13/2010', 'mercado + 1 pizza', 'dalben barao', 5, 48.130000000000003, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (365, 44, '11/14/2010', '11/14/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (366, 8, '11/15/2010', '11/15/2010', 'almoco', 'gr', 16, 8.5800000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (233, 43, '09/29/2010', '10/16/2010', 'documentos e placa 1/3', 'ouro verde despachante', 8, 244.22, 43, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (232, 43, '09/29/2010', '11/17/2010', 'documentos e placa 2/3', 'ouro verde despachante', 8, 244.22, 43, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (234, 43, '09/29/2010', '12/17/2010', 'documentos e placa 3/3', 'ouro verde despachante', 8, 244.22, 43, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (367, 19, '11/11/2010', '11/11/2010', 'cebola + batata + frango + coca', 'outback dom pedro', 16, 27.850000000000001, 19, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (368, 7, '11/17/2010', '11/17/2010', 'bolacha + pipoca + frutas + sabonetes + pizza', 'dalben barao', 5, 37.060000000000002, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (369, 8, '11/17/2010', '11/17/2010', 'almoco', 'fassarella', 16, 16.25, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (370, 8, '11/16/2010', '11/16/2010', 'almoco', 'jardim', 16, 14.039999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (371, 42, '11/15/2010', '11/15/2010', 'alcool', 'posto campineira', 5, 56, 42, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (372, 16, '11/14/2010', '11/14/2010', 'burguer + batata + coca', 'gregs burguer', 5, 26.620000000000001, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (373, 16, '11/15/2010', '11/15/2010', 'pizza + coca', 'casa da vo', 5, 17.48, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (374, 16, '11/12/2010', '12/15/2010', '2 salgados + refri + sorvete', 'posto anchieta', 6, 10.5, 16, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (375, 19, '11/14/2010', '12/15/2010', 'batata + coca', 'roasted potato dom pedro', 6, 16.800000000000001, 19, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (376, 8, '11/18/2010', '11/18/2010', 'almoco', 'fassarella', 5, 13.880000000000001, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (378, 45, '11/14/2010', '11/14/2010', 'oferta', 'ibcu', 3, 20, 45, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (377, 16, '11/13/2010', '11/13/2010', 'sorvete + refri', 'posto anchieta', 3, 6, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (379, 37, '11/18/2010', '11/18/2010', 'ingles', 'gracinda', 3, 100, 37, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (380, 19, '11/20/2010', '11/20/2010', 'pizza + almoco', 'anderson', 3, 20, 19, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (382, 39, '11/20/2010', '11/20/2010', 'freelancer jefferson lima heranca', 'bb', 13, 100, 39, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (383, 16, '11/19/2010', '11/19/2010', '2 espihas + 1 espiha fechada + 1 kibe + 1 suco', 'posto anchieta', 5, 12.9, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (381, 8, '11/19/2010', '11/19/2010', 'almoco', 'lagoa', 5, 14.119999999999999, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (384, 9, '11/01/2010', '11/01/2010', 'restaurante', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (385, 9, '11/01/2010', '11/01/2010', 'restaurante clt', 'ticket', 13, 132, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (386, 46, '11/20/2010', '12/15/2010', '2 dominios .com.br', 'registro br', 7, 60, 46, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (387, 14, '11/21/2010', '11/21/2010', 'celular', 'bb', 13, 119, 14, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (388, 8, '11/22/2010', '11/22/2010', 'almoco', 'lagoa', 3, 10, 8, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (389, 10, '11/22/2010', '11/22/2010', 'salario adiantamento', 'bb stefanini', 13, 1000.59, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (390, 8, '11/23/2010', '11/23/2010', 'almoco', 'fassarella', 5, 14.91, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (391, 7, '11/23/2010', '11/23/2010', 'pizza + guarana + ovo', 'dalben barao', 8, 36.119999999999997, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (392, 8, '11/24/2010', '12/17/2010', 'almoco', 'subway cmp shopp', 8, 13.85, 8, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (393, 7, '11/24/2010', '11/24/2010', '2 panetones', 'nestle ibm', 5, 21.98, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (394, 7, '11/26/2010', '11/26/2010', '3 panetones', 'nestle ibm', 5, 32.969999999999999, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (395, 8, '11/26/2010', '11/26/2010', 'almoco', 'fassarella', 5, 14.1, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (396, 16, '11/26/2010', '12/15/2010', '2 salgados + 1 sorvete + 1 trident', 'posto anchieta', 6, 8.4000000000000004, 16, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (398, 8, '11/27/2010', '12/15/2010', 'almoco', 'posto anchieta', 7, 11.699999999999999, 8, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (399, 16, '11/26/2010', '12/15/2010', '2 salgados + 1 sorvete', 'posto anchieta', 6, 8.4000000000000004, 16, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (400, 16, '11/26/2010', '11/26/2010', 'sorvete', 'posto anchieta', 5, 3.5, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (401, 19, '11/27/2010', '12/15/2010', 'porcoes + coca + limonada suica', 'fogao mineiro jq egidio', 6, 28.579999999999998, 19, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (402, 16, '11/27/2010', '11/27/2010', 'sorvete', 'posto anchieta', 5, 2.75, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (403, 42, '11/26/2010', '12/15/2010', 'alcool', 'posto futuro', 6, 80, 42, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (404, 39, '11/24/2010', '11/24/2010', 'freelance campo minado', 'francisca', 13, 391.5, 39, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (405, 15, '11/15/2010', '11/15/2010', 'celular tim', 'tim', 7, 32, 15, 7);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (406, 7, '11/28/2010', '12/17/2010', 'pizza + coca + sucos', 'dalben barao', 8, 15.49, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (407, 8, '11/29/2010', '12/15/2010', 'lanche + coca + batata', 'bk brasil', 6, 22.399999999999999, 8, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (408, 16, '11/30/2010', '11/30/2010', 'coxinha', 'ikasa', 3, 2.5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (409, 8, '11/30/2010', '12/15/2010', 'almoco', 'lagoa', 6, 13.359999999999999, 8, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (410, 10, '11/30/2010', '11/30/2010', '13 salario 1 parcela', 'bb stefanini', 13, 675, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (411, 40, '11/30/2010', '11/30/2010', '13 salario people', 'bb people', 13, 294, 40, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (412, 16, '11/30/2010', '11/30/2010', 'dog + coca', 'dog do gil', 3, 9.5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (397, 8, '11/25/2010', '11/25/2010', 'almoco', '1 de abril', 3, 12.1, 8, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (413, 16, '11/30/2010', '11/30/2010', 'sundae', 'mac donalds', 3, 5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (414, 7, '12/01/2010', '12/17/2010', 'bolachas + pipoca + pizza', 'dalben barao', 8, 21.75, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (415, 44, '12/01/2010', '12/01/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (416, 44, '11/29/2010', '11/29/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (417, 16, '12/01/2010', '12/01/2010', '6 espiha + pepsi', 'habibs dom pedro', 5, 9.3200000000000003, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (418, 26, '12/01/2010', '12/01/2010', 'amigo secreto havaiana', 'havaianas dom pedro', 5, 32.899999999999999, 26, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (419, 8, '12/01/2010', '12/01/2010', 'almoco', 'fassarella', 16, 14.98, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (422, 39, '12/02/2010', '12/02/2010', 'free graficos francisca', 'bb franscisca', 13, 700, 39, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (423, 26, '11/29/2010', '11/29/2010', 'adaptador tomada', 'fnac dom pedro', 3, 9.9000000000000004, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (424, 8, '12/02/2010', '12/02/2010', 'almoco', 'fassarella', 16, 12.890000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (425, 8, '12/03/2010', '12/03/2010', 'almoco', 'lagoa', 16, 13.02, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (426, 8, '12/04/2010', '12/04/2010', '2 salgados + refri', 'esquina da people', 3, 6.5999999999999996, 8, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (427, 16, '12/04/2010', '12/04/2010', 'sorvete', 'posto anchieta', 5, 3.75, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (428, 42, '12/04/2010', '12/17/2010', 'alcool', 'posto vinhedo', 8, 47.020000000000003, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (429, 7, '12/04/2010', '12/17/2010', 'coca + limao + ameixa + laranja', 'dalben barao', 8, 14.67, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (430, 26, '12/04/2010', '12/04/2010', 'remedio lisador', 'droga raia barao', 3, 2.9300000000000002, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (431, 19, '12/05/2010', '12/17/2010', 'almoco + coca', 'sapore barao', 8, 13.65, 19, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (432, 16, '12/04/2010', '12/15/2010', 'lanche + batata + coca', 'lanchao barao', 6, 15.9, 16, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (433, 44, '12/04/2010', '12/04/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (434, 8, '12/06/2010', '12/06/2010', 'almoco', 'jardim', 16, 5.4800000000000004, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (435, 26, '12/07/2010', '12/07/2010', '1/4 panetone + papel de presente', 'gustavo', 3, 7, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (436, 8, '12/07/2010', '12/07/2010', 'almoco', 'fassarella', 16, 6.7800000000000002, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (437, 43, '12/07/2010', '12/07/2010', 'seguro 3/4', 'sulamerica', 5, 463.88999999999999, 43, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (438, 22, '12/07/2010', '12/07/2010', 'casa', 'conta luiz', 13, 378.37, 22, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (439, 10, '12/07/2010', '12/07/2010', 'salario', 'bb stefanini', 13, 1500.73, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (440, 40, '12/06/2010', '12/06/2010', 'salario people', 'bb people', 13, 762, 40, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (441, 35, '12/07/2010', '12/07/2010', 'bolao', 'bb chastel', 13, 20, 35, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (442, 7, '12/07/2010', '12/17/2010', 'bisnaga + banana + ameixa + suco + goiaba + pinha + salada + melao', 'dalben barao', 8, 29.300000000000001, 7, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (443, 8, '12/08/2010', '12/08/2010', 'almoco', 'jardim', 16, 9.1500000000000004, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (444, 8, '12/09/2010', '12/09/2010', 'almoco', 'jardim', 16, 13.289999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (445, 8, '12/10/2010', '12/10/2010', 'almoco', 'felice', 16, 12.1, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (446, 8, '12/11/2010', '12/11/2010', 'almoco', 'sapore', 5, 10, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (447, 26, '12/10/2010', '12/10/2010', 'servidor', 'integrator', 3, 20, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (448, 42, '12/11/2010', '12/11/2010', 'lavagem', 'casa blanca 2', 3, 20, 42, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (449, 8, '12/13/2010', '12/13/2010', 'almoco', 'fassarella', 16, 7.9699999999999998, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (450, 44, '12/14/2010', '12/11/2010', 'estacionamento', 'dom pedro', 5, 3, 44, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (451, 19, '12/12/2010', '12/12/2010', 'almoco', 'dalben barao', 5, 5.9299999999999997, 19, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (452, 7, '12/12/2010', '12/12/2010', 'abacaxi + ameixa + pinha + melao', 'dalben barao', 5, 23.510000000000002, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (453, 8, '12/14/2010', '12/14/2010', 'almoco', 'fassarella', 16, 7.8399999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (454, 7, '12/14/2010', '12/14/2010', 'melao + salada fresh + cebola + tomate', 'dalben barao', 5, 8.2300000000000004, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (455, 26, '12/15/2010', '12/15/2010', 'notebook 1/10', 'fnac dom pedro', 17, 216.11000000000001, 26, 17);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (456, 42, '12/15/2010', '12/15/2010', 'alcool', 'posto barbieri', 5, 66.010000000000005, 42, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (457, 8, '12/15/2010', '12/15/2010', 'almoco', 'fassarella', 16, 11.56, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (458, 8, '12/16/2010', '12/16/2010', 'almoco', 'lagoa', 16, 7.2199999999999998, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (459, 46, '12/14/0017', '12/20/2010', 'servidor', 'integrator', 5, 111.66, 46, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (460, 46, '12/17/2010', '12/17/2010', 'design pipoca 2/4', 'samanta', 13, 258, 46, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (461, 8, '12/17/2010', '12/17/2010', 'almoco', 'bom demais', 16, 32.299999999999997, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (462, 7, '12/17/2010', '12/17/2010', 'farofa perdigao', 'dalben barao', 5, 6.4500000000000002, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (463, 26, '12/16/2010', '12/16/2010', 'cartao embrapa', 'correios', 3, 5.5, 26, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (465, 10, '12/20/2010', '12/20/2010', 'salario adiantamento', 'bb stefanini', 13, 984.49000000000001, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (466, 10, '12/20/2010', '12/20/2010', '13 salario 2/2', 'bb stefanini', 13, 562.60000000000002, 10, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (464, 40, '12/20/2010', '12/20/2010', '13 salario 2/2 people', 'bb people', 13, 338, 40, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (467, 42, '12/20/2010', '12/20/2010', 'alcool', 'posto campineira', 8, 88, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (468, 8, '12/21/2010', '12/21/2010', 'almoco', 'jardim', 16, 6.6900000000000004, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (469, 8, '12/20/2010', '12/20/2010', 'almoco', 'jardim', 16, 3.52, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (470, 8, '12/19/2010', '12/19/2010', 'almoco', 'rest e pizza cintra', 5, 8.3499999999999996, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (471, 44, '12/22/2010', '12/22/2010', 'estacionamento', 'rei charles', 3, 6, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (472, 44, '12/22/2010', '12/22/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (473, 8, '12/22/2010', '12/22/2010', 'almoco', 'fassarella', 16, 11.69, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (474, 8, '12/23/2010', '12/23/2010', 'almoco', 'colonial grill', 16, 35.329999999999998, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (475, 16, '12/22/2010', '12/22/2010', 'refrigerante', 'santa terezinha dom pedro', 3, 5, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (476, 46, '12/23/2010', '12/23/2010', 'crachas', 'bb irma ander', 13, 24, 46, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (477, 14, '12/07/2010', '12/07/2010', 'celular', 'conta sogro', 13, 119, 14, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (478, 15, '12/15/2010', '12/15/2010', 'celular tim', 'tim', 6, 32, 15, 6);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (479, 19, '12/25/2010', '12/25/2010', 'rodizio + refri + torta holandesa', 'picanha de ouro', 5, 44.090000000000003, 19, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (480, 44, '12/25/2010', '12/25/2010', 'estacionamneto', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (481, 8, '12/24/2010', '12/24/2010', 'almoco', 'ritorno dom pedro', 5, 8.1999999999999993, 8, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (482, 16, '12/23/2010', '12/23/2010', 'lanche + guarana', 'ponto final', 5, 17.699999999999999, 16, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (483, 42, '12/26/2010', '01/17/2011', 'alcool', 'posto campineira', 8, 61, 42, 8);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (484, 44, '12/26/2010', '12/26/2010', 'estacionamento', 'campinas shopp', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (485, 7, '12/26/2010', '12/26/2010', 'agua + g4 gillet + cortador de unha', 'dalben barao', 5, 35.049999999999997, 7, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (486, 8, '12/27/2010', '12/27/2010', 'almoco', 'macarronada shop cps', 16, 20.100000000000001, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (487, 44, '12/27/2010', '12/27/2010', 'estacionamento', 'dom pedro', 3, 3, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (488, 47, '01/02/2011', '01/02/2011', 'almoco comida japonesa', 'tomodati guaruja', 5, 164.13, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (489, 47, '01/02/2011', '01/02/2011', 'mercado refri + agua + desodorante', 'ricoy guaruja', 5, 99.629999999999995, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (490, 47, '12/30/2010', '12/30/2010', 'crepes + refris', 'crepes clovis guaruja', 5, 19, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (491, 47, '12/30/2010', '12/30/2010', 'havaiana LU', 'h space guaruja', 5, 29.989999999999998, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (492, 47, '12/28/2010', '12/28/2010', '2 aguas', 'rodoviaria campinas', 5, 5.4000000000000004, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (493, 47, '12/30/2010', '12/30/2010', 'bijus LU', 'barraquinhas guaruja', 5, 47, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (494, 47, '12/29/2010', '12/29/2010', 'estacionamento', 'shop praia mar santos', 3, 6, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (495, 47, '12/28/2010', '12/28/2010', 'refri + suco + x-americano + fresh', 'frango assado estrada sp', 5, 25, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (496, 47, '12/29/2010', '12/29/2010', 'estacionamento praia', 'praia guaiuba guaruja', 3, 10, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (497, 47, '12/30/2010', '12/30/2010', 'estacionamento praia', 'praia guaiuba guaruja', 3, 10, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (498, 47, '12/30/2010', '12/30/2010', 'estacionamento centro', 'centro pitangueiras guaruja', 3, 12, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (499, 8, '12/28/2010', '12/28/2010', '2 croasaint', 'carrinho ibm', 3, 5, 8, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (500, 47, '12/28/2010', '12/28/2010', 'estacionamento rodoviaria', 'rodoviaria campinas', 3, 7, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (501, 42, '12/28/2010', '12/28/2010', 'alcool', 'posto anchieta', 5, 27, 42, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (502, 47, '12/28/2010', '12/28/2010', '4 pedagios', 'pedagios campinas - guaruja', 3, 32.549999999999997, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (503, 47, '12/29/2010', '12/29/2010', 'balsa guaruja - santos', 'dersa guaruja', 3, 8.1999999999999993, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (504, 47, '01/04/2011', '01/04/2011', 'alcool', 'posto ilha negra guaruja', 5, 80, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (505, 47, '01/03/2011', '01/03/2011', '2 churros', 'churrolandia guaruja', 3, 7, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (506, 47, '01/03/2011', '01/03/2011', 'bk - 3 lanches', 'bk guaruja', 5, 58.700000000000003, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (507, 47, '01/04/2011', '01/04/2011', '3 pedagios + 1 balsa', 'pedagios guaruja - campinas', 3, 22.350000000000001, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (509, 47, '01/05/2011', '01/05/2011', 'biju LU', 'tasy bijus campinas', 5, 34.399999999999999, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (510, 16, '01/06/2011', '01/06/2011', 'balas e bombom', 'carrinho ibm', 3, 2, 16, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (511, 47, '01/05/2011', '01/05/2011', 'estacionamento', 'dom pedro', 3, 4, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (512, 47, '01/05/2011', '01/05/2011', 'cebola + batata + costela + refris', 'outback dom pedro', 16, 124.15000000000001, 47, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (513, 8, '01/06/2011', '01/06/2011', 'almoco', 'jardim', 16, 6.21, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (514, 8, '01/05/2011', '01/05/2011', 'almoco', 'fassarella', 16, 13.529999999999999, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (515, 44, '01/06/2011', '01/06/2011', 'estacionamento', 'shopp iguatemi', 3, 5, 44, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (516, 47, '01/06/2011', '01/06/2011', '4 originais greg + 4 bebidas + batata', 'gregs burguer barao', 5, 116.81999999999999, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (517, 11, '01/06/2011', '01/06/2011', '11 camisetas', 'riachuelo iguatemi', 5, 299.99000000000001, 11, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (518, 11, '01/06/2011', '01/06/2011', '6 camisetas', 'hering iguatemi', 5, 224.40000000000001, 11, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (519, 47, '01/06/2011', '01/06/2011', '3 blusas LU', 'hering iguatemi', 5, 109.7, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (520, 47, '01/05/2011', '01/05/2011', 'mcnifico', 'mac donald barao', 5, 11, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (521, 47, '01/08/2011', '01/08/2011', 'estacionamento', 'shop iguatemi campinas', 3, 5, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (522, 11, '01/08/2011', '01/08/2011', '3 bermudas', 'rener iguatemi campinas', 5, 79.700000000000003, 11, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (523, 47, '01/08/2011', '01/08/2011', 'papi salim', 'papai salim campinas', 5, 59.289999999999999, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (524, 26, '01/08/2011', '01/08/2011', 'si senor - jantar lu', 'si senor campinas', 5, 95.700000000000003, 26, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (525, 8, '01/07/2011', '01/07/2011', 'almoco', 'lagoa', 16, 11.9, 8, 16);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (526, 47, '01/07/2011', '01/07/2011', 'estacionamento', 'shop dom pedro campinas', 3, 4, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (527, 47, '01/08/2011', '01/08/2011', '2 cds roberto carlos LU', 'americanas iguatemi campinas', 5, 31.27, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (528, 47, '01/08/2011', '01/08/2011', '4 sobremesas + agua', 'casa da sobre iguatemi campinas', 3, 20.300000000000001, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (529, 47, '01/08/2011', '01/08/2011', 'lavagem carro', 'casa blanca campinas', 5, 25, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (508, 47, '01/05/2011', '01/05/2011', 'alcool carro', 'shell barao geraldo', 18, 74.019999999999996, 47, 18);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (530, 47, '01/08/2011', '01/08/2011', '4 batatas + bebidas + musica', 'battataria suica campinas', 5, 134.91, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (531, 47, '01/08/2011', '01/08/2011', 'alcool carro', 'posto campineira campinas', 5, 45.009999999999998, 47, 5);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (532, 47, '01/09/2011', '01/09/2011', 'pedagios indaiatuba', 'pedagios indaiatuba', 3, 18.300000000000001, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (533, 47, '01/09/2011', '01/09/2011', 'revista noiva + coquetel + caneta', 'rodoviaria campinas', 3, 13.800000000000001, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (534, 47, '01/09/2011', '01/09/2011', 'estacionamento', 'rodoviaria campinas', 3, 6, 47, 3);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (535, 9, '01/09/2011', '01/09/2011', 'alimentacao pai', 'bb campinas cheque pai', 13, 2766.6999999999998, 9, 13);
INSERT INTO move (id, categoryid, dateofmove, dateofpay, name, place, typeofpayid, value, category, typeofpay) VALUES (536, 48, '01/09/2011', '01/09/2011', 'metade gastos viagem pai', 'bb campinas cheque pai', 13, 593.29999999999995, 48, 13);


-- Completed on 2011-01-09 19:35:36

--
-- PostgreSQL database dump complete
--

