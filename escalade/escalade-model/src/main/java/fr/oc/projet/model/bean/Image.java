package fr.oc.projet.model.bean;

import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Compte;

public class Image {

    private        Integer      id;
    private        String       url;
    private        Boolean      imageDePresentation;
    private        Topo         topo;
    private        Site         site;
    private        Compte       compte;

    private Image(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getImageDePresentation() {
        return imageDePresentation;
    }

    public void setImageDePresentation(Boolean imageDePresentation) {
        this.imageDePresentation = imageDePresentation;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }
}
