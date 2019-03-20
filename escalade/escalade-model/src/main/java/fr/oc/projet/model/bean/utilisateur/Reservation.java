package fr.oc.projet.model.bean.utilisateur;

import fr.oc.projet.model.bean.escalade.Topo;

import java.util.Date;

public class Reservation {

    private     Integer     id;
    private     Date        date;
    private     Boolean     matin;
    private     Boolean     apresMidi;
    private     Compte      compte;
    private     Topo        topo;

    public Reservation(){}

    public Reservation(Integer pId){id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Boolean getMatin() {
        return matin;
    }

    public void setMatin(Boolean matin) {
        this.matin = matin;
    }

    public Boolean getApresMidi() {
        return apresMidi;
    }

    public void setApresMidi(Boolean apresMidi) {
        this.apresMidi = apresMidi;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }
}
