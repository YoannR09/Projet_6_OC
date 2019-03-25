package fr.oc.projet.model.bean.utilisateur;

import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;

import java.util.Date;

public class Commentaire {

    private        Integer      id;
    private        String       contenu;
    private        Date         date;
    private        Site         site;
    private        Topo         topo;
    private        Secteur      secteur;
    private        Compte       auteur;
    private        Likes        likes;

    public Commentaire(){}

    public Commentaire(Integer pId){id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public Compte getAuteur() {
        return auteur;
    }

    public void setAuteur(Compte auteur) {
        this.auteur = auteur;
    }

    public Likes getLikes() {
        return likes;
    }

    public void setLikes(Likes likes) {
        this.likes = likes;
    }
}
