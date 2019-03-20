package fr.oc.projet.model.bean.escalade;

public class Departement {

    private     Integer     id;
    private     Integer     numero;
    private     String      nom;
    private     Region      region;

    public Departement(){}

    public Departement(Integer pId){id=pId;}


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
}
