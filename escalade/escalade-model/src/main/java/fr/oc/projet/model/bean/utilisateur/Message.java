package fr.oc.projet.model.bean.utilisateur;

import java.util.Date;

public class Message {

    private     Integer     id;
    private     String      objet;
    private     String      contenu;
    private     Date        date;
    private     Compte      auteur;
    private     Integer     compteId;

    public Message(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
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

    public Integer getCompteId() {
        return compteId;
    }

    public void setCompteId(Integer compteId) {
        this.compteId = compteId;
    }
}
