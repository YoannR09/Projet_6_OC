package fr.oc.projet.model.bean.utilisateur;

public class NiveauAcces {

    private     Integer     id;
    private     Integer     niveau;
    private     String      labelle;

    public NiveauAcces(){}




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

    public String getLabelle() {
        return labelle;
    }

    public void setLabelle(String labelle) {
        this.labelle = labelle;
    }

}
