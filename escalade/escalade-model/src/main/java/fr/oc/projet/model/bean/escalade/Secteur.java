package fr.oc.projet.model.bean.escalade;

public class Secteur {

    private     Integer     id;
    private     String      nom;
    private     Site        site;
    private     Integer     nombreVoie;
    private     Cotation    cotationMax;
    private     Cotation    cotationMin;
    private     Integer     hauteurMin;
    private     Integer     hauteurMax;

    public Secteur(){}

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

    public Integer getNombreVoie() {
        return nombreVoie;
    }

    public void setNombreVoie(Integer nombreVoie) {
        this.nombreVoie = nombreVoie;
    }

    public Cotation getCotationMax() {
        return cotationMax;
    }

    public void setCotationMax(Cotation cotationMax) {
        this.cotationMax = cotationMax;
    }

    public Cotation getCotationMin() {
        return cotationMin;
    }

    public void setCotationMin(Cotation cotationMin) {
        this.cotationMin = cotationMin;
    }

    public Integer getHauteurMin() {
        return hauteurMin;
    }

    public void setHauteurMin(Integer hauteurMin) {
        this.hauteurMin = hauteurMin;
    }

    public Integer getHauteurMax() {
        return hauteurMax;
    }

    public void setHauteurMax(Integer hauteurMax) {
        this.hauteurMax = hauteurMax;
    }
}
