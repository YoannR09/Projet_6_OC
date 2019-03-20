package fr.oc.projet.model.bean.escalade;

public class Secteur {

    private     Integer     id;
    private     String      nom;
    private     Site        site;

    public Secteur(){}

    public Secteur(Integer pId){id=pId;}

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

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }
}
