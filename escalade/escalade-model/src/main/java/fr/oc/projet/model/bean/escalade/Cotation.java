package fr.oc.projet.model.bean.escalade;

public class Cotation {

    private     Integer     id;
    private     Integer     niveau;
    private     String      valeur;
    private     String      couleur;

    public Cotation(){}

    public Cotation(Integer pId){id=pId;}


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNiveau() {
        return niveau;
    }

    public void setNiveau(Integer niveau) {
        this.niveau = niveau;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public String getCouleur() {
        return couleur;
    }

    public void setCouleur(String couleur) {
        this.couleur = couleur;
    }
}
