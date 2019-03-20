package fr.oc.projet.model.bean.escalade;

import fr.oc.projet.model.bean.utilisateur.Compte;

import java.util.Date;

public class Topo {

    private     Integer     id;
    private     String      nom;
    private     String      description;
    private     Date        date;
    private     Boolean     valide;
    private     Compte      responsable;

    public Topo(){}

    public Topo(Integer pId){id=pId;}

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Boolean getValide() {
        return valide;
    }

    public void setValide(Boolean valide) {
        this.valide = valide;
    }

    public Compte getResponsable() {
        return responsable;
    }

    public void setResponsable(Compte responsable) {
        this.responsable = responsable;
    }
}
