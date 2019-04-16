
CREATE SEQUENCE public.region_id_seq;

CREATE TABLE public.region (
                id INTEGER NOT NULL DEFAULT nextval('public.region_id_seq'),
                nom VARCHAR NOT NULL,
                CONSTRAINT region_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;

CREATE TABLE public.departement (
                id INTEGER NOT NULL,
                numero VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                region_id INTEGER NOT NULL,
                CONSTRAINT departement_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.cotation_id_seq;

CREATE TABLE public.cotation (
                id INTEGER NOT NULL DEFAULT nextval('public.cotation_id_seq'),
                niveau INTEGER NOT NULL,
                valeur VARCHAR NOT NULL,
                couleur VARCHAR NOT NULL,
                CONSTRAINT cotation_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.cotation_id_seq OWNED BY public.cotation.id;

CREATE SEQUENCE public.type_de_roche_id_seq;

CREATE TABLE public.type_de_roche (
                id INTEGER NOT NULL DEFAULT nextval('public.type_de_roche_id_seq'),
                type VARCHAR NOT NULL,
                CONSTRAINT type_de_roche_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.type_de_roche_id_seq OWNED BY public.type_de_roche.id;

CREATE SEQUENCE public.niveau_acces_id_seq;

CREATE TABLE public.niveau_acces (
                id INTEGER NOT NULL DEFAULT nextval('public.niveau_acces_id_seq'),
                niveau INTEGER NOT NULL,
                labelle VARCHAR NOT NULL,
                CONSTRAINT niveau_acces_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.niveau_acces_id_seq OWNED BY public.niveau_acces.id;

CREATE SEQUENCE public.compte_id_seq;

CREATE TABLE public.compte (
                id INTEGER NOT NULL DEFAULT nextval('public.compte_id_seq'),
                pseudo VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                prenom VARCHAR NOT NULL,
                mot_de_passe VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                numero_de_telephone VARCHAR NOT NULL,
                niveau_acces_id INTEGER NOT NULL,
                CONSTRAINT compte_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;

CREATE SEQUENCE public.topo_id_seq;

CREATE TABLE public.topo (
                id INTEGER NOT NULL DEFAULT nextval('public.topo_id_seq'),
                nom VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                date_de_creation DATE NOT NULL,
                valide BOOLEAN NOT NULL,
                responsable_id INTEGER NOT NULL,
                CONSTRAINT topo_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.topo_id_seq OWNED BY public.topo.id;

CREATE SEQUENCE public.site_id_seq;

CREATE TABLE public.site (
                id INTEGER NOT NULL DEFAULT nextval('public.site_id_seq'),
                nom VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                topo_id INTEGER,
                type_de_roche_id INTEGER NOT NULL,
                departement_id INTEGER NOT NULL,
                ville VARCHAR NOT NULL,
                date_de_creation DATE NOT NULL,
                valide BOOLEAN NOT NULL,
                responsable_id INTEGER NOT NULL,
                CONSTRAINT site_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.site_id_seq OWNED BY public.site.id;

CREATE SEQUENCE public.note_id_seq;

CREATE TABLE public.note (
                id INTEGER NOT NULL DEFAULT nextval('public.note_id_seq'),
                note DOUBLE PRECISION NOT NULL,
                site_id INTEGER,
                topo_id INTEGER,
                compte_id INTEGER,
                CONSTRAINT note_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;

CREATE SEQUENCE public.secteur_id_seq;

CREATE TABLE public.secteur (
                id INTEGER NOT NULL DEFAULT nextval('public.secteur_id_seq'),
                nom VARCHAR NOT NULL,
                site_id INTEGER NOT NULL,
                CONSTRAINT secteur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.secteur_id_seq OWNED BY public.secteur.id;

CREATE SEQUENCE public.voie_id_seq;

CREATE TABLE public.voie (
                id INTEGER NOT NULL DEFAULT nextval('public.voie_id_seq'),
                nom VARCHAR,
                hauteur INTEGER NOT NULL,
                secteur_id INTEGER NOT NULL,
                cotation_id INTEGER NOT NULL,
                CONSTRAINT voie_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.voie_id_seq OWNED BY public.voie.id;

CREATE SEQUENCE public.image_id_seq;

CREATE TABLE public.image (
                id INTEGER NOT NULL DEFAULT nextval('public.image_id_seq'),
                url VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                image_de_presentation BOOLEAN NOT NULL,
                site_id INTEGER,
                topo_id INTEGER,
                compte_id INTEGER,
                CONSTRAINT image_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;

CREATE SEQUENCE public.reservation_id_seq;

CREATE TABLE public.reservation (
                id INTEGER NOT NULL DEFAULT nextval('public.reservation_id_seq'),
                date DATE NOT NULL,
                matin BOOLEAN NOT NULL,
                apres_midi BOOLEAN NOT NULL,
                compte_id INTEGER NOT NULL,
                topo_id INTEGER NOT NULL,
                CONSTRAINT reservation_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;

CREATE SEQUENCE public.message_id_seq;

CREATE TABLE public.message (
                id INTEGER NOT NULL DEFAULT nextval('public.message_id_seq'),
                objet VARCHAR NOT NULL,
                contenu VARCHAR NOT NULL,
                date DATE NOT NULL,
                compte_id INTEGER NOT NULL,
                CONSTRAINT message_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;

CREATE SEQUENCE public.commentaire_id_seq;

CREATE TABLE public.commentaire (
                id INTEGER NOT NULL DEFAULT nextval('public.commentaire_id_seq'),
                contenu VARCHAR NOT NULL,
                date DATE NOT NULL,
                site_id INTEGER,
                topo_id INTEGER,
                secteur_id INTEGER,
                compte_id INTEGER NOT NULL,
                CONSTRAINT commentaire_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commentaire_id_seq OWNED BY public.commentaire.id;

ALTER TABLE public.departement ADD CONSTRAINT region_departement_fk
FOREIGN KEY (region_id)
REFERENCES public.region (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.site ADD CONSTRAINT departement_site_fk
FOREIGN KEY (departement_id)
REFERENCES public.departement (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.voie ADD CONSTRAINT cotation_voie_fk
FOREIGN KEY (cotation_id)
REFERENCES public.cotation (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.site ADD CONSTRAINT type_de_roche_spot_fk
FOREIGN KEY (type_de_roche_id)
REFERENCES public.type_de_roche (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compte ADD CONSTRAINT niveau_acces_utilisateur_fk
FOREIGN KEY (niveau_acces_id)
REFERENCES public.niveau_acces (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT utilisateur_commentaire_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.message ADD CONSTRAINT utilisateur_message_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservation ADD CONSTRAINT utilisateur_reservation_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.topo ADD CONSTRAINT utilisateur_topo_fk
FOREIGN KEY (responsable_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.note ADD CONSTRAINT utilisateur_note_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.site ADD CONSTRAINT utilisateur_site_fk
FOREIGN KEY (responsable_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.image ADD CONSTRAINT compte_image_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.site ADD CONSTRAINT topo_spot_fk
FOREIGN KEY (topo_id)
REFERENCES public.topo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT topo_commentaire_fk
FOREIGN KEY (topo_id)
REFERENCES public.topo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservation ADD CONSTRAINT topo_reservation_fk
FOREIGN KEY (topo_id)
REFERENCES public.topo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.note ADD CONSTRAINT topo_note_fk
FOREIGN KEY (topo_id)
REFERENCES public.topo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.image ADD CONSTRAINT topo_image_fk
FOREIGN KEY (topo_id)
REFERENCES public.topo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.image ADD CONSTRAINT spot_image_fk
FOREIGN KEY (site_id)
REFERENCES public.site (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT spot_commentaire_fk
FOREIGN KEY (site_id)
REFERENCES public.site (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.secteur ADD CONSTRAINT site_secteur_fk
FOREIGN KEY (site_id)
REFERENCES public.site (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.note ADD CONSTRAINT site_note_fk
FOREIGN KEY (site_id)
REFERENCES public.site (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.voie ADD CONSTRAINT secteur_voie_fk
FOREIGN KEY (secteur_id)
REFERENCES public.secteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT secteur_commentaire_fk
FOREIGN KEY (secteur_id)
REFERENCES public.secteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;