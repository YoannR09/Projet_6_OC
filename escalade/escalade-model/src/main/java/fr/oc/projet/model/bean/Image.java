package fr.oc.projet.model.bean;

import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Compte;

public class  Image {

    private        Integer      id;
    private        String       urlImage;
    private        String       description;
    private        Boolean      imageDePresentation;
    private        Integer      compteId;
    private        Integer      topoId;
    private        Integer      siteId;

    public Image(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getImageDePresentation() {
        return imageDePresentation;
    }

    public void setImageDePresentation(Boolean imageDePresentation) {
        this.imageDePresentation = imageDePresentation;
    }

    public Integer getCompteId() {
        return compteId;
    }

    public void setCompteId(Integer compteId) {
        this.compteId = compteId;
    }

    public Integer getTopoId() {
        return topoId;
    }

    public void setTopoId(Integer topoId) {
        this.topoId = topoId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }
}
