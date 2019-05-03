PGDMP                         w           escalade    10.4    11.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    84404    escalade    DATABASE     �   CREATE DATABASE escalade WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE escalade;
             postgres    false            �            1259    84552    commentaire    TABLE     �   CREATE TABLE public.commentaire (
    id integer NOT NULL,
    contenu character varying NOT NULL,
    date date NOT NULL,
    site_id integer,
    topo_id integer,
    secteur_id integer,
    compte_id integer NOT NULL
);
    DROP TABLE public.commentaire;
       public         postgres    false            �            1259    84550    commentaire_id_seq    SEQUENCE     {   CREATE SEQUENCE public.commentaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.commentaire_id_seq;
       public       postgres    false    224            �           0    0    commentaire_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.commentaire_id_seq OWNED BY public.commentaire.id;
            public       postgres    false    223            �            1259    84459    compte    TABLE     W  CREATE TABLE public.compte (
    id integer NOT NULL,
    pseudo character varying NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    mot_de_passe character varying NOT NULL,
    email character varying NOT NULL,
    numero_de_telephone character varying NOT NULL,
    niveau_acces_id integer NOT NULL
);
    DROP TABLE public.compte;
       public         postgres    false            �            1259    84457    compte_id_seq    SEQUENCE     v   CREATE SEQUENCE public.compte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.compte_id_seq;
       public       postgres    false    206            �           0    0    compte_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;
            public       postgres    false    205            �            1259    84426    cotation    TABLE     �   CREATE TABLE public.cotation (
    id integer NOT NULL,
    niveau integer NOT NULL,
    valeur character varying NOT NULL,
    couleur character varying NOT NULL
);
    DROP TABLE public.cotation;
       public         postgres    false            �            1259    84424    cotation_id_seq    SEQUENCE     x   CREATE SEQUENCE public.cotation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cotation_id_seq;
       public       postgres    false    200            �           0    0    cotation_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cotation_id_seq OWNED BY public.cotation.id;
            public       postgres    false    199            �            1259    84416    departement    TABLE     �   CREATE TABLE public.departement (
    id integer NOT NULL,
    numero character varying NOT NULL,
    nom character varying NOT NULL,
    region_id integer NOT NULL
);
    DROP TABLE public.departement;
       public         postgres    false            �            1259    84522    image    TABLE     �   CREATE TABLE public.image (
    id integer NOT NULL,
    url character varying NOT NULL,
    description character varying NOT NULL,
    image_de_presentation boolean NOT NULL,
    site_id integer,
    topo_id integer,
    compte_id integer
);
    DROP TABLE public.image;
       public         postgres    false            �            1259    84520    image_id_seq    SEQUENCE     u   CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public       postgres    false    218            �           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
            public       postgres    false    217            �            1259    84541    message    TABLE     �   CREATE TABLE public.message (
    id integer NOT NULL,
    objet character varying NOT NULL,
    contenu character varying NOT NULL,
    date date NOT NULL,
    compte_id integer NOT NULL
);
    DROP TABLE public.message;
       public         postgres    false            �            1259    84539    message_id_seq    SEQUENCE     w   CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.message_id_seq;
       public       postgres    false    222            �           0    0    message_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;
            public       postgres    false    221            �            1259    84448    niveau_acces    TABLE     �   CREATE TABLE public.niveau_acces (
    id integer NOT NULL,
    niveau integer NOT NULL,
    labelle character varying NOT NULL
);
     DROP TABLE public.niveau_acces;
       public         postgres    false            �            1259    84446    niveau_acces_id_seq    SEQUENCE     |   CREATE SEQUENCE public.niveau_acces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.niveau_acces_id_seq;
       public       postgres    false    204            �           0    0    niveau_acces_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.niveau_acces_id_seq OWNED BY public.niveau_acces.id;
            public       postgres    false    203            �            1259    84492    note    TABLE     �   CREATE TABLE public.note (
    id integer NOT NULL,
    note double precision NOT NULL,
    site_id integer,
    topo_id integer,
    compte_id integer
);
    DROP TABLE public.note;
       public         postgres    false            �            1259    84490    note_id_seq    SEQUENCE     t   CREATE SEQUENCE public.note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.note_id_seq;
       public       postgres    false    212            �           0    0    note_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;
            public       postgres    false    211            �            1259    84407    region    TABLE     \   CREATE TABLE public.region (
    id integer NOT NULL,
    nom character varying NOT NULL
);
    DROP TABLE public.region;
       public         postgres    false            �            1259    84405    region_id_seq    SEQUENCE     v   CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.region_id_seq;
       public       postgres    false    197            �           0    0    region_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;
            public       postgres    false    196            �            1259    84533    reservation    TABLE     �   CREATE TABLE public.reservation (
    id integer NOT NULL,
    date date NOT NULL,
    matin boolean NOT NULL,
    apres_midi boolean NOT NULL,
    compte_id integer NOT NULL,
    topo_id integer NOT NULL
);
    DROP TABLE public.reservation;
       public         postgres    false            �            1259    84531    reservation_id_seq    SEQUENCE     {   CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reservation_id_seq;
       public       postgres    false    220            �           0    0    reservation_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;
            public       postgres    false    219            �            1259    84500    secteur    TABLE     {   CREATE TABLE public.secteur (
    id integer NOT NULL,
    nom character varying NOT NULL,
    site_id integer NOT NULL
);
    DROP TABLE public.secteur;
       public         postgres    false            �            1259    84498    secteur_id_seq    SEQUENCE     w   CREATE SEQUENCE public.secteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.secteur_id_seq;
       public       postgres    false    214            �           0    0    secteur_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.secteur_id_seq OWNED BY public.secteur.id;
            public       postgres    false    213            �            1259    84481    site    TABLE     s  CREATE TABLE public.site (
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
    DROP TABLE public.site;
       public         postgres    false            �            1259    84479    site_id_seq    SEQUENCE     t   CREATE SEQUENCE public.site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.site_id_seq;
       public       postgres    false    210            �           0    0    site_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.site_id_seq OWNED BY public.site.id;
            public       postgres    false    209            �            1259    84470    topo    TABLE     �   CREATE TABLE public.topo (
    id integer NOT NULL,
    nom character varying NOT NULL,
    description character varying NOT NULL,
    date_de_creation date NOT NULL,
    valide boolean NOT NULL,
    responsable_id integer NOT NULL
);
    DROP TABLE public.topo;
       public         postgres    false            �            1259    84468    topo_id_seq    SEQUENCE     t   CREATE SEQUENCE public.topo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.topo_id_seq;
       public       postgres    false    208            �           0    0    topo_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.topo_id_seq OWNED BY public.topo.id;
            public       postgres    false    207            �            1259    84437    type_de_roche    TABLE     d   CREATE TABLE public.type_de_roche (
    id integer NOT NULL,
    type character varying NOT NULL
);
 !   DROP TABLE public.type_de_roche;
       public         postgres    false            �            1259    84435    type_de_roche_id_seq    SEQUENCE     }   CREATE SEQUENCE public.type_de_roche_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.type_de_roche_id_seq;
       public       postgres    false    202            �           0    0    type_de_roche_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.type_de_roche_id_seq OWNED BY public.type_de_roche.id;
            public       postgres    false    201            �            1259    84511    voie    TABLE     �   CREATE TABLE public.voie (
    id integer NOT NULL,
    nom character varying,
    hauteur integer NOT NULL,
    secteur_id integer NOT NULL,
    cotation_id integer NOT NULL
);
    DROP TABLE public.voie;
       public         postgres    false            �            1259    84509    voie_id_seq    SEQUENCE     t   CREATE SEQUENCE public.voie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.voie_id_seq;
       public       postgres    false    216            �           0    0    voie_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.voie_id_seq OWNED BY public.voie.id;
            public       postgres    false    215            �
           2604    84555    commentaire id    DEFAULT     p   ALTER TABLE ONLY public.commentaire ALTER COLUMN id SET DEFAULT nextval('public.commentaire_id_seq'::regclass);
 =   ALTER TABLE public.commentaire ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    224    224            �
           2604    84462 	   compte id    DEFAULT     f   ALTER TABLE ONLY public.compte ALTER COLUMN id SET DEFAULT nextval('public.compte_id_seq'::regclass);
 8   ALTER TABLE public.compte ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    206    206            �
           2604    84429    cotation id    DEFAULT     j   ALTER TABLE ONLY public.cotation ALTER COLUMN id SET DEFAULT nextval('public.cotation_id_seq'::regclass);
 :   ALTER TABLE public.cotation ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    84525    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    218    218            �
           2604    84544 
   message id    DEFAULT     h   ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);
 9   ALTER TABLE public.message ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221    222            �
           2604    84451    niveau_acces id    DEFAULT     r   ALTER TABLE ONLY public.niveau_acces ALTER COLUMN id SET DEFAULT nextval('public.niveau_acces_id_seq'::regclass);
 >   ALTER TABLE public.niveau_acces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    204    204            �
           2604    84495    note id    DEFAULT     b   ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);
 6   ALTER TABLE public.note ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    212    212            �
           2604    84410 	   region id    DEFAULT     f   ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);
 8   ALTER TABLE public.region ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    84536    reservation id    DEFAULT     p   ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);
 =   ALTER TABLE public.reservation ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219    220            �
           2604    84503 
   secteur id    DEFAULT     h   ALTER TABLE ONLY public.secteur ALTER COLUMN id SET DEFAULT nextval('public.secteur_id_seq'::regclass);
 9   ALTER TABLE public.secteur ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213    214            �
           2604    84484    site id    DEFAULT     b   ALTER TABLE ONLY public.site ALTER COLUMN id SET DEFAULT nextval('public.site_id_seq'::regclass);
 6   ALTER TABLE public.site ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    210    210            �
           2604    84473    topo id    DEFAULT     b   ALTER TABLE ONLY public.topo ALTER COLUMN id SET DEFAULT nextval('public.topo_id_seq'::regclass);
 6   ALTER TABLE public.topo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    208    208            �
           2604    84440    type_de_roche id    DEFAULT     t   ALTER TABLE ONLY public.type_de_roche ALTER COLUMN id SET DEFAULT nextval('public.type_de_roche_id_seq'::regclass);
 ?   ALTER TABLE public.type_de_roche ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    84514    voie id    DEFAULT     b   ALTER TABLE ONLY public.voie ALTER COLUMN id SET DEFAULT nextval('public.voie_id_seq'::regclass);
 6   ALTER TABLE public.voie ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    216    216            �          0    84552    commentaire 
   TABLE DATA               a   COPY public.commentaire (id, contenu, date, site_id, topo_id, secteur_id, compte_id) FROM stdin;
    public       postgres    false    224   =�       �          0    84459    compte 
   TABLE DATA               t   COPY public.compte (id, pseudo, nom, prenom, mot_de_passe, email, numero_de_telephone, niveau_acces_id) FROM stdin;
    public       postgres    false    206   �       �          0    84426    cotation 
   TABLE DATA               ?   COPY public.cotation (id, niveau, valeur, couleur) FROM stdin;
    public       postgres    false    200   ��       �          0    84416    departement 
   TABLE DATA               A   COPY public.departement (id, numero, nom, region_id) FROM stdin;
    public       postgres    false    198   �       �          0    84522    image 
   TABLE DATA               i   COPY public.image (id, url, description, image_de_presentation, site_id, topo_id, compte_id) FROM stdin;
    public       postgres    false    218   �       �          0    84541    message 
   TABLE DATA               F   COPY public.message (id, objet, contenu, date, compte_id) FROM stdin;
    public       postgres    false    222   l�       �          0    84448    niveau_acces 
   TABLE DATA               ;   COPY public.niveau_acces (id, niveau, labelle) FROM stdin;
    public       postgres    false    204   P�       �          0    84492    note 
   TABLE DATA               E   COPY public.note (id, note, site_id, topo_id, compte_id) FROM stdin;
    public       postgres    false    212   ��       �          0    84407    region 
   TABLE DATA               )   COPY public.region (id, nom) FROM stdin;
    public       postgres    false    197   ��       �          0    84533    reservation 
   TABLE DATA               V   COPY public.reservation (id, date, matin, apres_midi, compte_id, topo_id) FROM stdin;
    public       postgres    false    220   ��       �          0    84500    secteur 
   TABLE DATA               3   COPY public.secteur (id, nom, site_id) FROM stdin;
    public       postgres    false    214   ʘ       �          0    84481    site 
   TABLE DATA               �   COPY public.site (id, nom, description, topo_id, type_de_roche_id, departement_id, ville, date_de_creation, valide, responsable_id) FROM stdin;
    public       postgres    false    210   �       �          0    84470    topo 
   TABLE DATA               ^   COPY public.topo (id, nom, description, date_de_creation, valide, responsable_id) FROM stdin;
    public       postgres    false    208   ��       �          0    84437    type_de_roche 
   TABLE DATA               1   COPY public.type_de_roche (id, type) FROM stdin;
    public       postgres    false    202   �       �          0    84511    voie 
   TABLE DATA               I   COPY public.voie (id, nom, hauteur, secteur_id, cotation_id) FROM stdin;
    public       postgres    false    216   x�       �           0    0    commentaire_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.commentaire_id_seq', 2, true);
            public       postgres    false    223            �           0    0    compte_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.compte_id_seq', 1, false);
            public       postgres    false    205            �           0    0    cotation_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cotation_id_seq', 54, true);
            public       postgres    false    199            �           0    0    image_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.image_id_seq', 4, true);
            public       postgres    false    217            �           0    0    message_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.message_id_seq', 2, true);
            public       postgres    false    221            �           0    0    niveau_acces_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.niveau_acces_id_seq', 1, false);
            public       postgres    false    203            �           0    0    note_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.note_id_seq', 2, true);
            public       postgres    false    211            �           0    0    region_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.region_id_seq', 1, false);
            public       postgres    false    196            �           0    0    reservation_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.reservation_id_seq', 2, true);
            public       postgres    false    219            �           0    0    secteur_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.secteur_id_seq', 3, true);
            public       postgres    false    213            �           0    0    site_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.site_id_seq', 1, false);
            public       postgres    false    209            �           0    0    topo_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.topo_id_seq', 1, false);
            public       postgres    false    207            �           0    0    type_de_roche_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.type_de_roche_id_seq', 1, false);
            public       postgres    false    201            �           0    0    voie_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.voie_id_seq', 9, true);
            public       postgres    false    215            �
           2606    84560    commentaire commentaire_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT commentaire_pk;
       public         postgres    false    224            �
           2606    84467    compte compte_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.compte DROP CONSTRAINT compte_pk;
       public         postgres    false    206            �
           2606    84434    cotation cotation_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.cotation
    ADD CONSTRAINT cotation_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cotation DROP CONSTRAINT cotation_pk;
       public         postgres    false    200            �
           2606    84423    departement departement_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.departement
    ADD CONSTRAINT departement_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.departement DROP CONSTRAINT departement_pk;
       public         postgres    false    198            �
           2606    84530    image image_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pk;
       public         postgres    false    218            �
           2606    84549    message message_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.message DROP CONSTRAINT message_pk;
       public         postgres    false    222            �
           2606    84456    niveau_acces niveau_acces_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.niveau_acces
    ADD CONSTRAINT niveau_acces_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.niveau_acces DROP CONSTRAINT niveau_acces_pk;
       public         postgres    false    204            �
           2606    84497    note note_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.note DROP CONSTRAINT note_pk;
       public         postgres    false    212            �
           2606    84415    region region_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pk;
       public         postgres    false    197            �
           2606    84538    reservation reservation_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pk;
       public         postgres    false    220            �
           2606    84508    secteur secteur_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT secteur_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.secteur DROP CONSTRAINT secteur_pk;
       public         postgres    false    214            �
           2606    84489    site site_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.site DROP CONSTRAINT site_pk;
       public         postgres    false    210            �
           2606    84478    topo topo_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.topo
    ADD CONSTRAINT topo_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.topo DROP CONSTRAINT topo_pk;
       public         postgres    false    208            �
           2606    84445    type_de_roche type_de_roche_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.type_de_roche
    ADD CONSTRAINT type_de_roche_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.type_de_roche DROP CONSTRAINT type_de_roche_pk;
       public         postgres    false    202            �
           2606    84519    voie voie_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.voie
    ADD CONSTRAINT voie_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.voie DROP CONSTRAINT voie_pk;
       public         postgres    false    216                       2606    84616    image compte_image_fk    FK CONSTRAINT     w   ALTER TABLE ONLY public.image
    ADD CONSTRAINT compte_image_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 ?   ALTER TABLE ONLY public.image DROP CONSTRAINT compte_image_fk;
       public       postgres    false    206    2790    218                       2606    84571    voie cotation_voie_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.voie
    ADD CONSTRAINT cotation_voie_fk FOREIGN KEY (cotation_id) REFERENCES public.cotation(id);
 ?   ALTER TABLE ONLY public.voie DROP CONSTRAINT cotation_voie_fk;
       public       postgres    false    2784    200    216            �
           2606    84566    site departement_site_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.site
    ADD CONSTRAINT departement_site_fk FOREIGN KEY (departement_id) REFERENCES public.departement(id);
 B   ALTER TABLE ONLY public.site DROP CONSTRAINT departement_site_fk;
       public       postgres    false    2782    198    210            �
           2606    84581 "   compte niveau_acces_utilisateur_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT niveau_acces_utilisateur_fk FOREIGN KEY (niveau_acces_id) REFERENCES public.niveau_acces(id);
 L   ALTER TABLE ONLY public.compte DROP CONSTRAINT niveau_acces_utilisateur_fk;
       public       postgres    false    204    206    2788            �
           2606    84561 !   departement region_departement_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.departement
    ADD CONSTRAINT region_departement_fk FOREIGN KEY (region_id) REFERENCES public.region(id);
 K   ALTER TABLE ONLY public.departement DROP CONSTRAINT region_departement_fk;
       public       postgres    false    2780    198    197                       2606    84671 "   commentaire secteur_commentaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT secteur_commentaire_fk FOREIGN KEY (secteur_id) REFERENCES public.secteur(id);
 L   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT secteur_commentaire_fk;
       public       postgres    false    2798    224    214                       2606    84666    voie secteur_voie_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.voie
    ADD CONSTRAINT secteur_voie_fk FOREIGN KEY (secteur_id) REFERENCES public.secteur(id);
 >   ALTER TABLE ONLY public.voie DROP CONSTRAINT secteur_voie_fk;
       public       postgres    false    214    216    2798                       2606    84661    note site_note_fk    FK CONSTRAINT     o   ALTER TABLE ONLY public.note
    ADD CONSTRAINT site_note_fk FOREIGN KEY (site_id) REFERENCES public.site(id);
 ;   ALTER TABLE ONLY public.note DROP CONSTRAINT site_note_fk;
       public       postgres    false    210    212    2794                       2606    84656    secteur site_secteur_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT site_secteur_fk FOREIGN KEY (site_id) REFERENCES public.site(id);
 A   ALTER TABLE ONLY public.secteur DROP CONSTRAINT site_secteur_fk;
       public       postgres    false    2794    214    210                       2606    84651    commentaire spot_commentaire_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT spot_commentaire_fk FOREIGN KEY (site_id) REFERENCES public.site(id);
 I   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT spot_commentaire_fk;
       public       postgres    false    224    210    2794                       2606    84646    image spot_image_fk    FK CONSTRAINT     q   ALTER TABLE ONLY public.image
    ADD CONSTRAINT spot_image_fk FOREIGN KEY (site_id) REFERENCES public.site(id);
 =   ALTER TABLE ONLY public.image DROP CONSTRAINT spot_image_fk;
       public       postgres    false    2794    210    218                       2606    84626    commentaire topo_commentaire_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT topo_commentaire_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);
 I   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT topo_commentaire_fk;
       public       postgres    false    2792    224    208                       2606    84641    image topo_image_fk    FK CONSTRAINT     q   ALTER TABLE ONLY public.image
    ADD CONSTRAINT topo_image_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);
 =   ALTER TABLE ONLY public.image DROP CONSTRAINT topo_image_fk;
       public       postgres    false    218    208    2792                       2606    84636    note topo_note_fk    FK CONSTRAINT     o   ALTER TABLE ONLY public.note
    ADD CONSTRAINT topo_note_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);
 ;   ALTER TABLE ONLY public.note DROP CONSTRAINT topo_note_fk;
       public       postgres    false    208    2792    212            
           2606    84631    reservation topo_reservation_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT topo_reservation_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);
 I   ALTER TABLE ONLY public.reservation DROP CONSTRAINT topo_reservation_fk;
       public       postgres    false    208    220    2792            �
           2606    84621    site topo_spot_fk    FK CONSTRAINT     o   ALTER TABLE ONLY public.site
    ADD CONSTRAINT topo_spot_fk FOREIGN KEY (topo_id) REFERENCES public.topo(id);
 ;   ALTER TABLE ONLY public.site DROP CONSTRAINT topo_spot_fk;
       public       postgres    false    2792    208    210            �
           2606    84576    site type_de_roche_spot_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.site
    ADD CONSTRAINT type_de_roche_spot_fk FOREIGN KEY (type_de_roche_id) REFERENCES public.type_de_roche(id);
 D   ALTER TABLE ONLY public.site DROP CONSTRAINT type_de_roche_spot_fk;
       public       postgres    false    2786    202    210                       2606    84586 &   commentaire utilisateur_commentaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT utilisateur_commentaire_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 P   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT utilisateur_commentaire_fk;
       public       postgres    false    2790    224    206                       2606    84591    message utilisateur_message_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT utilisateur_message_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 H   ALTER TABLE ONLY public.message DROP CONSTRAINT utilisateur_message_fk;
       public       postgres    false    2790    222    206                        2606    84606    note utilisateur_note_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.note
    ADD CONSTRAINT utilisateur_note_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 B   ALTER TABLE ONLY public.note DROP CONSTRAINT utilisateur_note_fk;
       public       postgres    false    206    2790    212            	           2606    84596 &   reservation utilisateur_reservation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT utilisateur_reservation_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 P   ALTER TABLE ONLY public.reservation DROP CONSTRAINT utilisateur_reservation_fk;
       public       postgres    false    220    206    2790            �
           2606    84611    site utilisateur_site_fk    FK CONSTRAINT        ALTER TABLE ONLY public.site
    ADD CONSTRAINT utilisateur_site_fk FOREIGN KEY (responsable_id) REFERENCES public.compte(id);
 B   ALTER TABLE ONLY public.site DROP CONSTRAINT utilisateur_site_fk;
       public       postgres    false    206    210    2790            �
           2606    84601    topo utilisateur_topo_fk    FK CONSTRAINT        ALTER TABLE ONLY public.topo
    ADD CONSTRAINT utilisateur_topo_fk FOREIGN KEY (responsable_id) REFERENCES public.compte(id);
 B   ALTER TABLE ONLY public.topo DROP CONSTRAINT utilisateur_topo_fk;
       public       postgres    false    208    206    2790            �   �   x�5ͽ�0�ڞ�R�(h��6͓�
G��IlD��b�U'�wJ\ɕ�y�龾"�Q��lfL�5�hb�PL�ղ�"	=�S?�{uJ��O����J�6�,8%z���c��Dp�u��>k${c���Ӻ�C���C���+�wR�7~5�      �   �   x�M�M�0��s�_���m�A�Û�vQ��2��﷛ޒ��2� �����M�#� ��kw��D3�O��lr��s��H�$���K��/8�{���m�1l#�+6�V�T\T
[���Q��jG�`�Z���_����(�<+���ׄ1��;�      �   E  x�M�K�1D��İ����l�^d��ȣZ��zS��be���^���4j2ˏ�Ġ�'�-��L�q)���.#UM��]z���'���REߛ֤=�nҠ�q���@w�b����c�cȀ?��NZ���8�L�S���-�C� ۂF��&�U�SRE��N�yz��	QA�21c��$#~��Na�Q��+NQa�*e��F��nnc-nQ����c��@a(�[�Wc��5��K�'�.c�L�$L�K��U��O�!+F7
w����ފ �3�%1�� ��!�{S�bX��7�
��5_��K�!��$<����P�t�|J}�m`l��KP��%�V���))�W\*&�mE9u:�O�E�k���bh�v��x�]�89Wi�M�O�I�-_�Y�υ�����6k�

�?=��Ɩ�)�_y�<cɜ�3��|�;��3ue8'e�~��S�\'e���<����❔��{�������O�Kbͼ
��fX]��M��v)�z���wc��U��$ƥ��ɑ���<��I��R�T~}~�T�<%���j����.�^�z�.`~�[r�~��t�	�      �   �  x�M�Mn�8�׏��]V���t�tq'��qb��CIƤO��s]l^Q����JŪ"Yֈ4�u�Q��}��Q�e��΋�"J�͎�����cekQ�EPw�;��щ�!�>���P?���r,}5�>�D/\ۊ�*�������V:���-�5�j�bF���^|�����y�����ކ|���6[u=��)�V�l#y�\����J�sp��
Q
p��lO�t	�U����[�8A�$�~����5��>=�`,p5�V�����
.��<RPYy7�a�$��W�S@�u7>�$��O�ϡ�q���w,<.A[��7]-U$L�ğu[���J�T%�W�W��$Fr̟�k�pI*W���2 ��)W�U���������#�u��Ս�۰W*�mŝ�L�`S���>�ǪL��FoY�Ѡ}c�qϝM�R"|�I@>���H��0y0ˡ����2e2P� �r��t�*S�6���&Q��M�{�X�4�F�>��T��ƶ�$�Jc��I�U��`����7�E�HA�q��!��]��T7����A���C��-� ��^��;_߁�*�@���s!Ӡ}[�2$��o%!����l|d���ŀ���"t}��Y

w/~zk�7�)�6��e�Ӹ9{I��T?}y�k'��C.@�K&q�����d�H��ǩ�\�hn��Z�<�l���<���&�����z�����D3P���葨<���8��Tf,����%��<���٘�"�ڍ�-�ᄤa���{~�c)b�`iI��@��7Sj;�e6)h���؄kB��p�ڊ}f�E�]��] �K=�仮��x��a�B�?�g���/��r�:?��_�>x'�LP�w>\���T�6m����ڵ��e�R*h��ؾ2y��\Z�%�/�8�QeA�q5��5��k�%!��b� t���(�H���*����6�����J��c.��      �   s   x���1
�0��99EN�T=���.c��)���VA�A�o��460�L���1��S+q�%����Y� 
�:�_W<�p�Zqr�I�gce�>Ҧ}bN�+����Fիr�.C�uD      �   �   x�M�;N1Dc��m���CBJ��Hz���?��Fg�]��a�O��_WM�1��իgu�K�v ���8�W6p���ƀӡ��x�����v� c���	��I��j?�j��a\�yQ���C���H�����n��
|�4��`w%[.)��2^
��R��#?�xNm�j�޳�]���ȱ�[Y�vu���}���H}��z;L�Z�Ӎ����i�      �   *   x�3�4��,�,I--�2�4�tL����,.)J��qqq �#
�      �       x�3��4���4�2� 19��b���� 9��      �   �   x�M�=n�0�g��:����od�Wۀl��d�A��)7����K'���c�^e�J��j����>�����h�:Y`��YQ���o��Oq\���w���¯�~�97�����>橂?���H	N��Xe���BbP�v��I
�@9Fs�6$hѼ�ۭ�uOri��H1k1߉�7L���m������  EB      �   -   x�3�420��50�54�,�L�4�4�2�K8���1z\\\ �-�      �   ,   x�3�NM.I--Rp�4�2�����\��p��P?F��� �3"      �   �   x�M�1�0��+��!( A�HIc��d�#�͟xG>�QPl3��Z�������֚yL5$����!uc1	/�#�n�:����f�>4m�(�9�t�2
+�m*�Y��@��~��^����3��q0�|�1�      �   h   x�m�1� F�ٜ� $S�u�B+�����ٳ>}z���*vFNP>����I�Ye�h�EX�/�Mf\ޙ5��a�C&��n�B\|���St��s�a�'�      �   W   x�3�tN�IN�,J�2�t/:����H'�e��r�p��%�2KS�L9��R3����8K�J�@*�9}�,I,��/)*����� ���      �   p   x�-�;1Ck�� e<	�KPRm� �"�n���l(��m�r�'�(ܷ^�����
k�y�0^Xf�=��]��`���~�o]���x������/���C�� pq9���6 L     