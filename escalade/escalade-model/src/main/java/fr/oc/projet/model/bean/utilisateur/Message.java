package fr.oc.projet.model.bean.utilisateur;

import java.util.Date;

public class Message {

    private     Integer     id;
    private     Integer     objet;
    private     String      contenu;
    private     Date        date;
    private     Compte      auteur;

    public Message(){}

    public Message(Integer pId){ id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getObjet() {
        return objet;
    }

    public void setObjet(Integer objet) {
        this.objet = objet;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Compte getAuteur() {
        return auteur;
    }

    public void setAuteur(Compte auteur) {
        this.auteur = auteur;
    }
}
