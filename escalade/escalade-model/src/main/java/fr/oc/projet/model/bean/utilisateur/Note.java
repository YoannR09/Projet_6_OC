package fr.oc.projet.model.bean.utilisateur;

import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;

public class Note {

    private     Integer     id;
    private     Float       note;
    private     Site        site;
    private     Topo        topo;
    private     Compte      editeur;

    public Note(){}

    public Note(Integer pId){id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getNote() {
        return note;
    }

    public void setNote(Float note) {
        this.note = note;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public Compte getEditeur() {
        return editeur;
    }

    public void setEditeur(Compte editeur) {
        this.editeur = editeur;
    }
}
