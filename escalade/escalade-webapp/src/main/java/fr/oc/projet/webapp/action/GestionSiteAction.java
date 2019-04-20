package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import javassist.NotFoundException;

import javax.inject.Inject;
import java.util.Collections;
import java.util.List;

/**
 * Classe qui gère les actions pour les sites d'escalades du site web.
 * On peut récupèrer la liste des sites valides,
 * afficher leurs secteurs et leurs voies
 */
public class GestionSiteAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Site>            listSite;
    private         String                nomSite;
    private         String                text;
    private         Cotation              cotation;
    private         Secteur               secteur;
    private         Voie                  voie;
    private         Site                  site;
    private         Integer               idSite;
    private         Integer               idSecteur;
    private         List<Commentaire>     listCommentaire;
    private         List<Secteur>         listSecteur;
    private         List<Voie>            listVoie;
    private         List<Image>           listImage;
    private         Integer               lastId;
    private         Integer               nombre;
    private         Boolean               firstPage;
    private         Integer               note;

    /**
     * Méthode pour afficher la liste des sites qui sont validés par un administrateur.
     * La variable valide du bean Site doit être TRUE.
     * Plusieurs détails du site sont affichés.
     * @return
     */
    public String doListSiteValide() {

        listSite = managerFactory.getSiteManager().getListSiteValide();

        nombre = listSite.size();
        Site site = listSite.get(nombre-1);
        lastId = site.getId();

        firstPage = true;

        return ActionSupport.SUCCESS;
    }

    public String doListSiteValideCotaMax() {

        listSite = managerFactory.getSiteManager().getListSiteValide();

        Collections.sort(listSite, Site.ComparatorCotations);

        firstPage = true;

        nombre = listSite.size();
        Site site = listSite.get(nombre-1);
        lastId = site.getId();



        return ActionSupport.SUCCESS;
    }
    public String doListSiteValideCotaMin() {

        listSite = managerFactory.getSiteManager().getListSiteValide();

        firstPage = true;

        Collections.sort(listSite, Site.ComparatorCotations);


        nombre = listSite.size();
        Site site = listSite.get(nombre-1);
        lastId = site.getId();



        return ActionSupport.SUCCESS;
    }
    public String doListSiteValidePageDown() {

        listSite = managerFactory.getSiteManager().getListSiteValidePageDown(lastId);

        nombre = listSite.size();
        Site site = listSite.get(nombre-1);
        lastId = site.getId();

        return ActionSupport.SUCCESS;
    }
    public String doListSiteValidePageUp() {

        listSite = managerFactory.getSiteManager().getListSiteValidePageUp(lastId);

        nombre = listSite.size();
        Site site = listSite.get(nombre-1);
        lastId = site.getId();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour voir les détails de la page.
     * Elle affiche les images, le nom du site, la description et la localisation.
     * Il y un bouton pour voir les commentaires, un autre pour accéder à une page qui donne sur les secteurs
     * Et un bouton pour évaluer le site.
     * @return
     */
    public String doDetailSite(){

        if (this.idSite == null) {
            this.addActionError("Vous devez indiquer un id de site");
        } else {
            site = managerFactory.getSiteManager().getSite(idSite);
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(idSite);
            listImage = managerFactory.getImageManager().getListImageSite(site.getId());
        }
        return  ActionSupport.SUCCESS;
    }

    public String doDetailSecteur(){

        if (this.idSecteur == null) {
            this.addActionError("Vous devez indiquer un id de secteur");
        } else {

            secteur = managerFactory.getSecteurManager().getSecteur(idSecteur);

            listVoie = managerFactory.getVoieManager().getListVoieSecteur(idSecteur);
        }
        return  ActionSupport.SUCCESS;
    }

    public String doSecteurList(){

            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(idSite);

        return ActionSupport.SUCCESS;
    }

    public String doRechercheSite(){


        listSite = managerFactory.getSiteManager().rechercheSite(text);

        nombre = listSite.size();
        firstPage = true;
        Site site = listSite.get(nombre-1);
        lastId = site.getId();

        return ActionSupport.SUCCESS;
    }

    //--------------- Les getters/setters--------------------------//

    public List<Site> getListSite() {
        return listSite;
    }

    public void setListSite(List<Site> listSite) {
        this.listSite = listSite;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }


    public Cotation getCotation() {
        return cotation;
    }

    public void setCotation(Cotation cotation) {
        this.cotation = cotation;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public Voie getVoie() {
        return voie;
    }

    public void setVoie(Voie voie) {
        this.voie = voie;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public Integer getIdSite() {
        return idSite;
    }

    public void setIdSite(Integer idSite) {
        this.idSite = idSite;
    }

    public List<Commentaire> getListCommentaire() {
        return listCommentaire;
    }

    public void setListCommentaire(List<Commentaire> listCommentaire) {
        this.listCommentaire = listCommentaire;
    }

    public List<Secteur> getListSecteur() {
        return listSecteur;
    }

    public void setListSecteur(List<Secteur> listSecteur) {
        this.listSecteur = listSecteur;
    }

    public Integer getIdSecteur() {
        return idSecteur;
    }

    public void setIdSecteur(Integer idSecteur) {
        this.idSecteur = idSecteur;
    }

    public Integer getLastId() {
        return lastId;
    }

    public void setLastId(Integer lastId) {
        this.lastId = lastId;
    }

    public Integer getNombre() {
        return nombre;
    }

    public void setNombre(Integer nombre) {
        this.nombre = nombre;
    }

    public Boolean getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(Boolean firstPage) {
        this.firstPage = firstPage;
    }

    public List<Voie> getListVoie() {
        return listVoie;
    }

    public void setListVoie(List<Voie> listVoie) {
        this.listVoie = listVoie;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<Image> getListImage() {
        return listImage;
    }

    public void setListImage(List<Image> listImage) {
        this.listImage = listImage;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }
}
