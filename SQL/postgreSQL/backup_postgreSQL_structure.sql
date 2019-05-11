--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 11.0

-- Started on 2019-05-08 08:41:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 224 (class 1259 OID 84552)
-- Name: commentaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commentaire (
    id integer NOT NULL,
    contenu character varying NOT NULL,
    date date NOT NULL,
    site_id integer,
    topo_id integer,
    secteur_id integer,
    compte_id integer NOT NULL
);


ALTER TABLE public.commentaire OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 84550)
-- Name: commentaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commentaire_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 223
-- Name: commentaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commentaire_id_seq OWNED BY public.commentaire.id;


--
-- TOC entry 206 (class 1259 OID 84459)
-- Name: compte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compte (
    id integer NOT NULL,
    pseudo character varying NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    mot_de_passe character varying NOT NULL,
    email character varying NOT NULL,
    numero_de_telephone character varying NOT NULL,
    niveau_acces_id integer NOT NULL
);


ALTER TABLE public.compte OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 84457)
-- Name: compte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compte_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 205
-- Name: compte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;


--
-- TOC entry 200 (class 1259 OID 84426)
-- Name: cotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotation (
    id integer NOT NULL,
    niveau integer NOT NULL,
    valeur character varying NOT NULL,
    couleur character varying NOT NULL
);


ALTER TABLE public.cotation OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 84424)
-- Name: cotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cotation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cotation_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 199
-- Name: cotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cotation_id_seq OWNED BY public.cotation.id;


--
-- TOC entry 198 (class 1259 OID 84416)
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departement (
    id integer NOT NULL,
    numero character varying NOT NULL,
    nom character varying NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.departement OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 84522)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    url character varying NOT NULL,
    description character varying NOT NULL,
    image_de_presentation boolean NOT NULL,
    site_id integer,
    topo_id integer,
    compte_id integer
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 84520)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 217
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 222 (class 1259 OID 84541)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id integer NOT NULL,
    objet character varying NOT NULL,
    contenu character varying NOT NULL,
    date date NOT NULL,
    compte_id integer NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 84539)
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 221
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- TOC entry 204 (class 1259 OID 84448)
-- Name: niveau_acces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveau_acces (
    id integer NOT NULL,
    niveau integer NOT NULL,
    labelle character varying NOT NULL
);


ALTER TABLE public.niveau_acces OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 84446)
-- Name: niveau_acces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.niveau_acces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveau_acces_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 203
-- Name: niveau_acces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.niveau_acces_id_seq OWNED BY public.niveau_acces.id;


--
-- TOC entry 212 (class 1259 OID 84492)
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    id integer NOT NULL,
    note double precision NOT NULL,
    site_id integer,
    topo_id integer,
    compte_id integer
);


ALTER TABLE public.note OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 84490)
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 211
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;


--
-- TOC entry 197 (class 1259 OID 84407)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 84405)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 196
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 220 (class 1259 OID 84533)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    date date NOT NULL,
    matin boolean NOT NULL,
    apres_midi boolean NOT NULL,
    compte_id integer NOT NULL,
    topo_id integer NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 84531)
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- TOC entry 214 (class 1259 OID 84500)
-- Name: secteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secteur (
    id integer NOT NULL,
    nom character varying NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.secteur OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 84498)
-- Name: secteur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secteur_id_seq OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 213
-- Name: secteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.secteur_id_seq OWNED BY public.secteur.id;


--
-- TOC entry 210 (class 1259 OID 84481)
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site (
    id integer NOT NULL,
    nom character varying NOT NULL,
    description character varying NOT NULL,
    topo_id integer,
    type_de_roche_id integer NOT NULL,
    departement_id integer NOT NULL,
    ville character varying NOT NULL,
    date_de_creation date NOT NULL,
    valide boolean NOT NULL,
    responsable_id integer NOT NULL
);


ALTER TABLE public.site OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 84479)
-- Name: site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_id_seq OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 209
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_id_seq OWNED BY public.site.id;


--
-- TOC entry 208 (class 1259 OID 84470)
-- Name: topo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topo (
    id integer NOT NULL,
    nom character varying NOT NULL,
    description character varying NOT NULL,
    date_de_creation date NOT NULL,
    valide boolean NOT NULL,
    responsable_id integer NOT NULL
);


ALTER TABLE public.topo OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 84468)
-- Name: topo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topo_id_seq OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 207
-- Name: topo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topo_id_seq OWNED BY public.topo.id;


--
-- TOC entry 202 (class 1259 OID 84437)
-- Name: type_de_roche; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_de_roche (
    id integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.type_de_roche OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 84435)
-- Name: type_de_roche_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_de_roche_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_de_roche_id_seq OWNER TO postgres;

--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 201
-- Name: type_de_roche_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_de_roche_id_seq OWNED BY public.type_de_roche.id;


--
-- TOC entry 216 (class 1259 OID 84511)
-- Name: voie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voie (
    id integer NOT NULL,
    nom character varying,
    hauteur integer NOT NULL,
    secteur_id integer NOT NULL,
    cotation_id integer NOT NULL
);


ALTER TABLE public.voie OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 84509)
-- Name: voie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voie_id_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 215
-- Name: voie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voie_id_seq OWNED BY public.voie.id;


--
-- TOC entry 2778 (class 2604 OID 84555)
-- Name: commentaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire ALTER COLUMN id SET DEFAULT nextval('public.commentaire_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 84462)
-- Name: compte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte ALTER COLUMN id SET DEFAULT nextval('public.compte_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 84429)
-- Name: cotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotation ALTER COLUMN id SET DEFAULT nextval('public.cotation_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 84525)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 84544)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 84451)
-- Name: niveau_acces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_acces ALTER COLUMN id SET DEFAULT nextval('public.niveau_acces_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 84495)
-- Name: note id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 84410)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 84536)
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 84503)
-- Name: secteur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur ALTER COLUMN id SET DEFAULT nextval('public.secteur_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 84484)
-- Name: site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site ALTER COLUMN id SET DEFAULT nextval('public.site_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 84473)
-- Name: topo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo ALTER COLUMN id SET DEFAULT nextval('public.topo_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 84440)
-- Name: type_de_roche id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_de_roche ALTER COLUMN id SET DEFAULT nextval('public.type_de_roche_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 84514)
-- Name: voie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie ALTER COLUMN id SET DEFAULT nextval('public.voie_id_seq'::regclass);


--
-- TOC entry 2808 (class 2606 OID 84560)
-- Name: commentaire commentaire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pk PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 84467)
-- Name: compte compte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pk PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 84434)
-- Name: cotation cotation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotation
    ADD CONSTRAINT cotation_pk PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 84423)
-- Name: departement departement_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departement
    ADD CONSTRAINT departement_pk PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 84530)
-- Name: image image_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pk PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 84549)
-- Name: message message_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pk PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 84456)
-- Name: niveau_acces niveau_acces_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_acces
    ADD CONSTRAINT niveau_acces_pk PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 84497)
-- Name: note note_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pk PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 84415)
-- Name: region region_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pk PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 84538)
-- Name: reservation reservation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 84508)
-- Name: secteur secteur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT secteur_pk PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 84489)
-- Name: site site_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pk PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 84478)
-- Name: topo topo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT topo_pk PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 84445)
-- Name: type_de_roche type_de_roche_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_de_roche
    ADD CONSTRAINT type_de_roche_pk PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 84519)
-- Name: voie voie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie
    ADD CONSTRAINT voie_pk PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 84616)
-- Name: image compte_image_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT compte_image_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);


--
-- TOC entry 2820 (class 2606 OID 84571)
-- Name: voie cotation_voie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie
    ADD CONSTRAINT cotation_voie_fk FOREIGN KEY (cotation_id) REFERENCES public.cotation(id);


--
-- TOC entry 2812 (class 2606 OID 84566)
-- Name: site departement_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT departement_site_fk FOREIGN KEY (departement_id) REFERENCES public.departement(id);


--
-- TOC entry 2810 (class 2606 OID 84581)
-- Name: compte niveau_acces_utilisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT niveau_acces_utilisateur_fk FOREIGN KEY (niveau_acces_id) REFERENCES public.niveau_acces(id);


--
-- TOC entry 2809 (class 2606 OID 84561)
-- Name: departement region_departement_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departement
    ADD CONSTRAINT region_departement_fk FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- TOC entry 2831 (class 2606 OID 84671)
-- Name: commentaire secteur_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT secteur_commentaire_fk FOREIGN KEY (secteur_id) REFERENCES public.secteur(id);


--
-- TOC entry 2821 (class 2606 OID 84666)
-- Name: voie secteur_voie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie
    ADD CONSTRAINT secteur_voie_fk FOREIGN KEY (secteur_id) REFERENCES public.secteur(id);


--
-- TOC entry 2818 (class 2606 OID 84661)
-- Name: note site_note_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT site_note_fk FOREIGN KEY (site_id) REFERENCES public.site(id);


--
-- TOC entry 2819 (class 2606 OID 84656)
-- Name: secteur site_secteur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT site_secteur_fk FOREIGN KEY (site_id) REFERENCES public.site(id);


--
-- TOC entry 2830 (class 2606 OID 84651)
-- Name: commentaire spot_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT spot_commentaire_fk FOREIGN KEY (site_id) REFERENCES public.site(id);


--
-- TOC entry 2824 (class 2606 OID 84646)
-- Name: image spot_image_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT spot_image_fk FOREIGN KEY (site_id) REFERENCES public.site(id);


--
-- TOC entry 2829 (class 2606 OID 84626)
-- Name: commentaire topo_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT topo_commentaire_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);


--
-- TOC entry 2823 (class 2606 OID 84641)
-- Name: image topo_image_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT topo_image_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);


--
-- TOC entry 2817 (class 2606 OID 84636)
-- Name: note topo_note_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT topo_note_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);


--
-- TOC entry 2826 (class 2606 OID 84631)
-- Name: reservation topo_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT topo_reservation_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);


--
-- TOC entry 2815 (class 2606 OID 84621)
-- Name: site topo_spot_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT topo_spot_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);


--
-- TOC entry 2813 (class 2606 OID 84576)
-- Name: site type_de_roche_spot_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT type_de_roche_spot_fk FOREIGN KEY (type_de_roche_id) REFERENCES public.type_de_roche(id);


--
-- TOC entry 2828 (class 2606 OID 84586)
-- Name: commentaire utilisateur_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT utilisateur_commentaire_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);


--
-- TOC entry 2827 (class 2606 OID 84591)
-- Name: message utilisateur_message_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT utilisateur_message_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);


--
-- TOC entry 2816 (class 2606 OID 84606)
-- Name: note utilisateur_note_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT utilisateur_note_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);


--
-- TOC entry 2825 (class 2606 OID 84596)
-- Name: reservation utilisateur_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT utilisateur_reservation_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);


--
-- TOC entry 2814 (class 2606 OID 84611)
-- Name: site utilisateur_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT utilisateur_site_fk FOREIGN KEY (responsable_id) REFERENCES public.compte(id);


--
-- TOC entry 2811 (class 2606 OID 84601)
-- Name: topo utilisateur_topo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT utilisateur_topo_fk FOREIGN KEY (responsable_id) REFERENCES public.compte(id);


-- Completed on 2019-05-08 08:41:07

--
-- PostgreSQL database dump complete
--

