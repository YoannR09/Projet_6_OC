package fr.oc.projet.model.bean.escalade;

public class Voie {

    private     Integer     id;
    private     String      nom;
    private     Integer     hauteur;
    private     Secteur     secteur;
    private     Cotation    cotation;

    public Voie(){}

    public Voie(Integer pId){id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getHauteur() {
        return hauteur;
    }

    public void setHauteur(Integer hauteur) {
        this.hauteur = hauteur;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public Cotation getCotation() {
        return cotation;
    }

    public void setCotation(Cotation cotation) {
        this.cotation = cotation;
    }
}