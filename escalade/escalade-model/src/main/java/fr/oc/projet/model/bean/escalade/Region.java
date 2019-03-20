package fr.oc.projet.model.bean.escalade;

public class Region {

    private     Integer     id;
    private     String      nom;

    public Region(){}

    Region(Integer pId){id=pId;}

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

}
