--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 11.0

-- Started on 2019-05-11 15:51:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2981 (class 0 OID 84552)
-- Dependencies: 224
-- Data for Name: commentaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commentaire (id, contenu, date, site_id, topo_id, secteur_id, compte_id) VALUES (1, 'Salut j''espère que ce site d''escalade vous conviendra', '2019-03-15', 1, NULL, NULL, 1);
INSERT INTO public.commentaire (id, contenu, date, site_id, topo_id, secteur_id, compte_id) VALUES (2, 'Bonjour, j''ai essayé ce secteur et il vaut vraiment le détour !!', '2019-04-20', NULL, NULL, 1, 2);
INSERT INTO public.commentaire (id, contenu, date, site_id, topo_id, secteur_id, compte_id) VALUES (3, 'Nouveau commentaire', '2019-05-07', NULL, 1, NULL, 1);


--
-- TOC entry 2963 (class 0 OID 84459)
-- Dependencies: 206
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compte (id, pseudo, nom, prenom, mot_de_passe, email, numero_de_telephone, niveau_acces_id) VALUES (1, 'Yocorps', 'ROCHE', 'Yoann', '123', 'el-rambo-poto@hotmail.fr', '0605097496', 2);
INSERT INTO public.compte (id, pseudo, nom, prenom, mot_de_passe, email, numero_de_telephone, niveau_acces_id) VALUES (2, 'Esca83', 'Park', 'Kevin', '123', 'MonAdresseMail@gmail.com', '0634230193', 1);
INSERT INTO public.compte (id, pseudo, nom, prenom, mot_de_passe, email, numero_de_telephone, niveau_acces_id) VALUES (3, 'Patrice23', 'Delamo', 'Patrice', 'escalade', 'EscaladePro@gmail.com', '0784657325', 2);


--
-- TOC entry 2957 (class 0 OID 84426)
-- Dependencies: 200
-- Data for Name: cotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (1, 1, '1a', 'rgb(255,85,220)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (2, 2, '1a+', 'rgb(246,68,211)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (3, 3, '1b', 'rgb(238,51,201)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (4, 4, '1b+', 'rgb(229,34,190)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (5, 5, '1c', 'rgb(221,17,180)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (6, 6, '1c+', 'rgb(212,0,170)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (7, 7, '2a', 'rgb(134,205,222)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (8, 8, '2a+', 'rgb(119,198,218)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (9, 9, '2b', 'rgb(103,191,213)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (10, 10, '2b+', 'rgb(87,184,209)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (11, 11, '2c', 'rgb(71,178,204)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (12, 12, '2c+', 'rgb(55,170,200)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (13, 13, '3a', 'rgb(255,221,84)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (14, 14, '3a+', 'rgb(252,215,68)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (15, 15, '3b', 'rgb(249,208,51)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (16, 16, '3b+', 'rgb(246,202,34)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (17, 17, '3c', 'rgb(243,195,17)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (18, 18, '3c+', 'rgb(240,189,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (19, 19, '4a', 'rgb(255,127,42)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (20, 20, '4a+', 'rgb(246,119,34)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (21, 21, '4b', 'rgb(238,110,25)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (22, 22, '4b+', 'rgb(229,102,17)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (23, 23, '4c', 'rgb(221,93,8)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (24, 24, '4c+', 'rgb(212,85,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (25, 25, '5a', 'rgb(170,212,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (26, 26, '5a+', 'rgb(156,195,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (27, 27, '5b', 'rgb(143,178,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (28, 28, '5b+', 'rgb(129,161,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (29, 29, '5c', 'rgb(115,144,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (30, 30, '5c+', 'rgb(102,128,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (31, 31, '6a', 'rgb(0,85,212)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (32, 32, '6a+', 'rgb(0,75,186)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (33, 33, '6b', 'rgb(0,64,161)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (34, 34, '6b+', 'rgb(0,55,136)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (35, 35, '6c', 'rgb(0,44,110)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (36, 36, '6c+', 'rgb(0,34,85)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (37, 37, '7a', 'rgb(171,55,200)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (38, 38, '7a+', 'rgb(157,51,184)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (39, 39, '7b', 'rgb(144,46,168)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (40, 40, '7b+', '	rgb(130,42,152)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (41, 41, '7c', 'rgb(117,37,136)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (42, 42, '7c+', 'rgb(103,33,120)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (43, 43, '8a', 'rgb(255,59,59)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (44, 44, '8a+', 'rgb(255,42,42)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (45, 45, '8b', 'rgb(221,25,25)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (46, 46, '8b+', 'rgb(204,17,17)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (47, 47, '8c', 'rgb(187,8,8)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (48, 48, '8c+', 'rgb(170,0,0)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (49, 49, '9a', 'rgb(128,128,128)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (50, 50, '9a+', 'rgb(102,102,102)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (51, 51, '9b', 'rgb(77,77,77');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (52, 52, '9b+', 'rgb(51,51,51)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (53, 53, '9c', 'rgb(25,25,25)');
INSERT INTO public.cotation (id, niveau, valeur, couleur) VALUES (54, 54, '9c+', 'rgb(0,0,0)');


--
-- TOC entry 2955 (class 0 OID 84416)
-- Dependencies: 198
-- Data for Name: departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departement (id, numero, nom, region_id) VALUES (1, '01', 'Ain', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (2, '02', 'Aisne', 2);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (3, '03', 'Allier', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (5, '05', 'Hautes-Alpes', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (4, '04', 'Alpes-de-Haute-Provence', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (6, '06', 'Alpes-Maritimes', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (7, '07', 'Ardèche', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (8, '08', 'Ardennes', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (9, '09', 'Ariège', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (10, '10', 'Aube', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (11, '11', 'Aude', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (12, '12', 'Aveyron', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (13, '13', 'Bouches-du-Rhône', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (14, '14', 'Calvados', 4);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (15, '15', 'Cantal', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (16, '16', 'Charente', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (17, '17', 'Charente-Maritime', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (18, '18', 'Cher', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (19, '19', 'Corrèze', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (20, '20', 'Corse-du-sud', 13);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (21, '21', 'Haute-corse', 13);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (22, '21', 'Côte-d''Or', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (23, '22', 'Côtes-d''armor', 5);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (24, '23', 'Creuse', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (25, '24', 'Dordogne', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (26, '25', 'Doubs', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (27, '26', 'Drôme', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (28, '27', 'Eure', 4);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (29, '28', 'Eure-et-Loir', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (30, '29', 'Finistère', 5);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (31, '30', 'Gard', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (32, '31', 'Haute-Garonne', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (33, '32', 'Gers', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (34, '33', 'Gironde', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (35, '34', 'Hérault', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (36, '35', 'Ile-et-Vilaine', 5);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (37, '36', 'Indre', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (38, '37', 'Indre-et-Loire', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (39, '38', 'Isère', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (40, '39', 'Jura', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (41, '40', 'Landes', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (42, '41', 'Loir-et-Cher', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (43, '42', 'Loire', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (44, '43', 'Haute-Loire', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (45, '44', 'Loire-Atlantique', 6);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (46, '45', 'Loiret', 7);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (47, '46', 'Lot', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (48, '47', 'Lot-et-Garonne', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (49, '48', 'Lozère', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (50, '49', 'Maine-et-Loire', 6);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (51, '50', 'Manche', 4);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (52, '51', 'Marne', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (53, '52', 'Haute-Marne', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (54, '53', 'Mayenne', 6);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (55, '54', 'Meurthe-et-Moselle', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (56, '55', 'Meuse', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (57, '56', 'Morbihan', 5);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (58, '57', 'Moselle', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (59, '58', 'Nièvre', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (60, '59', 'Nord', 2);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (61, '60', 'Oise', 2);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (62, '61', 'Orne', 4);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (63, '62', 'Pas-de-Calais', 2);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (64, '63', 'Puy-de-Dôme', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (65, '64', 'Pyrénées-Atlantiques', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (66, '65', 'Hautes-Pyrénées', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (67, '66', 'Pyrénées-Orientales', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (68, '67', 'Bas-Rhin', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (69, '68', 'Haut-Rhin', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (70, '69', 'Rhône', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (71, '70', 'Haute-Saône', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (72, '71', 'Saône-et-Loire', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (73, '72', 'Sarthe', 6);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (74, '73', 'Savoie', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (75, '74', 'Haute-Savoie', 10);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (76, '75', 'Paris', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (77, '76', 'Seine-Maritime', 4);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (78, '77', 'Seine-et-Marne', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (79, '78', 'Yvelines', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (80, '79', 'Deux-Sèvres', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (81, '80', 'Somme', 2);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (82, '81', 'Tarn', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (83, '82', 'Tarn-et-Garonne', 11);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (84, '83', 'Var', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (85, '84', 'Vaucluse', 12);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (86, '85', 'Vendée', 6);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (87, '86', 'Vienne', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (88, '87', 'Haute-Vienne', 9);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (89, '88', 'Vosges', 1);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (90, '89', 'Yonne', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (91, '90', 'Territoire de Belfort', 8);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (92, '91', 'Essonne', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (93, '92', 'Hauts-de-Seine', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (94, '93', 'Seine-Saint-Denis', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (95, '94', 'Val-de-Marne', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (96, '95', 'Val-d''oise', 3);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (97, '976', 'Mayotte', 14);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (98, '971', 'Guadeloupe', 14);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (99, '973', 'Guyane', 14);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (100, '972', 'Martinique', 14);
INSERT INTO public.departement (id, numero, nom, region_id) VALUES (101, '974', 'Réunion', 14);


--
-- TOC entry 2975 (class 0 OID 84522)
-- Dependencies: 218
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (1, 'Site de grimpe sur Toulon/toulon3.jpg', 'image', true, 1, NULL, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (2, 'Site de grimpe sur Toulon/toulon2.jpg', 'image', false, 1, NULL, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (3, 'Topo de la region du var/topo1.jpg', 'image', true, NULL, 1, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (4, 'Topo de la region du var/4.jpg', 'image', false, NULL, 1, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (5, 'Mon site d''escalade/2.jpg', 'Image de présentation du topo Mon site d''escalade', true, 2, NULL, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (6, 'Mon site d''escalade/toulon.jpg', 'Image du site : Mon site d''escalade', false, 2, NULL, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (7, 'Mon nouveau site/7.jpg', 'Image de présentation du topo Mon nouveau site', true, 3, NULL, NULL);
INSERT INTO public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) VALUES (8, 'Mon nouveau site/3.jpg', 'Image du site : Mon nouveau site', false, 3, NULL, NULL);


--
-- TOC entry 2979 (class 0 OID 84541)
-- Dependencies: 222
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.message (id, objet, contenu, date, compte_id) VALUES (1, 'Problème', 'Bonjour j''ai un problème avec la creation d''un topo, je ne peux pas accèder à certaines actions', '2019-03-23', 2);
INSERT INTO public.message (id, objet, contenu, date, compte_id) VALUES (2, 'Mon topo en attente', 'Bonjour çela fait maintenant plusieurs jours que mon topo est en attente, j''aimerai bien que celui-ci soit accesible à la communauté', '2019-04-10', 3);


--
-- TOC entry 2961 (class 0 OID 84448)
-- Dependencies: 204
-- Data for Name: niveau_acces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.niveau_acces (id, niveau, labelle) VALUES (1, 1, 'Visiteur');
INSERT INTO public.niveau_acces (id, niveau, labelle) VALUES (2, 2, 'Administrateur');


--
-- TOC entry 2969 (class 0 OID 84492)
-- Dependencies: 212
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.note (id, note, site_id, topo_id, compte_id) VALUES (1, 9, 1, NULL, 2);
INSERT INTO public.note (id, note, site_id, topo_id, compte_id) VALUES (2, 8, NULL, 1, 3);


--
-- TOC entry 2954 (class 0 OID 84407)
-- Dependencies: 197
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.region (id, nom) VALUES (1, 'GRAND EST');
INSERT INTO public.region (id, nom) VALUES (2, 'HAUTS-DE-FRANCE');
INSERT INTO public.region (id, nom) VALUES (3, 'ÎLE-DE-FRANCE');
INSERT INTO public.region (id, nom) VALUES (4, 'NORMANDIE');
INSERT INTO public.region (id, nom) VALUES (5, 'BRETAGNE');
INSERT INTO public.region (id, nom) VALUES (6, 'PAYS DE LA LOIRE');
INSERT INTO public.region (id, nom) VALUES (7, 'CENTRE-VAL DE LOIRE');
INSERT INTO public.region (id, nom) VALUES (8, 'BOURGOGNE-FRANCHE-COMTE');
INSERT INTO public.region (id, nom) VALUES (9, 'NOUVELLE AQUITAINE');
INSERT INTO public.region (id, nom) VALUES (10, 'AUVERGNE-RHÔNE-ALPES');
INSERT INTO public.region (id, nom) VALUES (11, 'OCCITANIE');
INSERT INTO public.region (id, nom) VALUES (12, 'PROVENCE-ALPES-CÔTE D''AZUR');
INSERT INTO public.region (id, nom) VALUES (13, 'CORSE');
INSERT INTO public.region (id, nom) VALUES (14, 'FRANCE D''OUTRE-MER');


--
-- TOC entry 2977 (class 0 OID 84533)
-- Dependencies: 220
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation (id, date, matin, apres_midi, compte_id, topo_id) VALUES (1, '2019-03-16', true, false, 1, 1);
INSERT INTO public.reservation (id, date, matin, apres_midi, compte_id, topo_id) VALUES (2, '2019-03-23', true, true, 2, 1);
INSERT INTO public.reservation (id, date, matin, apres_midi, compte_id, topo_id) VALUES (3, '2019-03-02', true, false, 1, 1);
INSERT INTO public.reservation (id, date, matin, apres_midi, compte_id, topo_id) VALUES (4, '2019-03-02', false, true, 1, 1);
INSERT INTO public.reservation (id, date, matin, apres_midi, compte_id, topo_id) VALUES (5, '2019-05-11', true, true, 1, 1);


--
-- TOC entry 2971 (class 0 OID 84500)
-- Dependencies: 214
-- Data for Name: secteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.secteur (id, nom, site_id) VALUES (1, 'Secteur EST', 1);
INSERT INTO public.secteur (id, nom, site_id) VALUES (2, 'Secteur NORD', 1);
INSERT INTO public.secteur (id, nom, site_id) VALUES (3, 'Secteur SUD', 1);
INSERT INTO public.secteur (id, nom, site_id) VALUES (4, 'Secteur EST', 2);
INSERT INTO public.secteur (id, nom, site_id) VALUES (5, 'Secteur NORD', 2);
INSERT INTO public.secteur (id, nom, site_id) VALUES (6, 'Secteur EST', 3);
INSERT INTO public.secteur (id, nom, site_id) VALUES (7, 'Secteur NORD', 3);


--
-- TOC entry 2967 (class 0 OID 84481)
-- Dependencies: 210
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.site (id, nom, description, topo_id, type_de_roche_id, departement_id, ville, date_de_creation, valide, responsable_id) VALUES (1, 'Site de grimpe sur Toulon', 'Bienvenu sur mon premier site d''escalade sur Toulon, il présente le baou et ses secteurs', 1, 2, 84, 'Toulon', '2019-03-15', true, 1);
INSERT INTO public.site (id, nom, description, topo_id, type_de_roche_id, departement_id, ville, date_de_creation, valide, responsable_id) VALUES (2, 'Mon site d''escalade', 'Bienvenue sur mon nouveau site d''esalade de sanary-sur-mer', 1, 6, 84, 'SANARY SUR MER', '2019-05-04', true, 1);
INSERT INTO public.site (id, nom, description, topo_id, type_de_roche_id, departement_id, ville, date_de_creation, valide, responsable_id) VALUES (3, 'Mon nouveau site', 'Ce site est un site test !!', 1, 7, 84, 'Sanary', '2019-05-11', false, 1);


--
-- TOC entry 2965 (class 0 OID 84470)
-- Dependencies: 208
-- Data for Name: topo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.topo (id, nom, description, date_de_creation, valide, responsable_id) VALUES (1, 'Topo de la region du var', 'Voici mon premier topo qui rassemblera plusieurs sites de la region du var ', '2019-03-20', true, 1);


--
-- TOC entry 2959 (class 0 OID 84437)
-- Dependencies: 202
-- Data for Name: type_de_roche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_de_roche (id, type) VALUES (1, 'Calcaire');
INSERT INTO public.type_de_roche (id, type) VALUES (2, 'Grès');
INSERT INTO public.type_de_roche (id, type) VALUES (3, 'Granite');
INSERT INTO public.type_de_roche (id, type) VALUES (4, 'Volcanique');
INSERT INTO public.type_de_roche (id, type) VALUES (5, 'Gneiss');
INSERT INTO public.type_de_roche (id, type) VALUES (6, 'Quartzite');
INSERT INTO public.type_de_roche (id, type) VALUES (7, 'Métaphoriques');


--
-- TOC entry 2973 (class 0 OID 84511)
-- Dependencies: 216
-- Data for Name: voie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (1, NULL, 30, 1, 42);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (2, 'Voie 2', 25, 1, 23);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (3, NULL, 20, 1, 15);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (4, NULL, 25, 1, 35);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (5, 'Voie facile', 15, 2, 10);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (6, 'Voie moyenne', 20, 2, 20);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (7, 'Voie difficile', 30, 2, 35);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (8, NULL, 25, 3, 24);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (9, NULL, 15, 3, 32);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (10, 'voie1', 12, 4, 9);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (11, '', 15, 5, 20);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (12, '', 15, 5, 33);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (13, 'Voie 1', 12, 7, 1);
INSERT INTO public.voie (id, nom, hauteur, secteur_id, cotation_id) VALUES (14, '', 15, 7, 37);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 223
-- Name: commentaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaire_id_seq', 3, true);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 205
-- Name: compte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compte_id_seq', 1, false);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 199
-- Name: cotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cotation_id_seq', 54, true);


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 217
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 9, true);


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 221
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 2, true);


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 203
-- Name: niveau_acces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.niveau_acces_id_seq', 1, false);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 211
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.note_id_seq', 2, true);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 196
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 1, false);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 5, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 213
-- Name: secteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secteur_id_seq', 8, true);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 209
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_id_seq', 4, true);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 207
-- Name: topo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topo_id_seq', 1, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 201
-- Name: type_de_roche_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_de_roche_id_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 215
-- Name: voie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voie_id_seq', 14, true);


-- Completed on 2019-05-11 15:51:50

--
-- PostgreSQL database dump complete
--

