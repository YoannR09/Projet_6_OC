package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.*;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.apache.commons.io.FileUtils;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Classe qui gère les actions en ajax de l'application en général.
 */
public class AjaxAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private     List<Commentaire>       listCommentaire;
    private     List<Topo>              listTopo;
    private     List<Site>              listSite;
    private     List<Image>             listImage;
    private     List<Reservation>       listReservation;
    private     List<Voie>              listVoie;
    private     Site                    site;
    private     Secteur                 secteur;
    private     Compte                  compte;
    private     Commentaire             commentaire;
    private     List<Secteur>           listSecteur;
    private     String                  nomSite;
    private     String                  nomSecteur;
    private     String                  nom;
    private     String                  contenu;
    private     Topo                    topo;
    private     String                  nomTopo;
    private     String                  pseudo;
    private     Integer                 mois;
    private     Integer                 hauteur;
    private     Integer                 secteurId;
    private     Integer                 cotationId;



    /**
     * Action "AJAX" renvoyant la liste des commentaires d'un site/topo ou secteur.
     * @return success
     */
    public String doAjaxGetListCommentaire() { // throws NotFoundException, TechnicalException {
        String vResult = ActionSupport.SUCCESS;
        try {

            if(nomSite != null){
                site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(site.getId());
            }else if(nomTopo != null){
                topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(topo.getId());
            }else if(nomSecteur != null){
                secteur = managerFactory.getSecteurManager().getSecteurViaNom(nomSecteur);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSecteur(secteur.getId());
            }


        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }

    /**
     * Méthode pour récupèrer la liste des secteurs d'un site.
     * On récupère le site avec le nom dans la page.
     * On récupère ensuite la liste avec l'id du site.
     * @return
     */
    public String doAjaxGetListSecteur() {
        String vResult = ActionSupport.SUCCESS;
        try {

            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }

    public String doAjaxGetListImageTopo() {
        String vResult = ActionSupport.SUCCESS;
        try {

            topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

            listImage = managerFactory.getImageManager()
                    .getListImageTopo(topo.getId());

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }

    /**
     * Méthode pour ajouter un secteur dans un site en cours de création.
     * @return
     */
    public String doAjaxAddSecteur(){
        String vResult = ActionSupport.SUCCESS;

        try {
            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);

            Secteur secteur = new Secteur();
            secteur.setNom(nomSecteur);
            secteur.setSiteId(site.getId());

            managerFactory.getSecteurManager().addSecteur(secteur);

            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }

    /**
     * Mé
     * @return
     */
    public String doAjaxAddVoie(){
        String vResult = ActionSupport.SUCCESS;

        try {
            site =  managerFactory.getSiteManager().getSiteViaNom(nomSite);

            Voie voie = new Voie();
            voie.setSecteurId(secteurId);
            voie.setHauteur(hauteur);
            voie.setNom(nom);
            voie.setCotationId(cotationId);

            managerFactory.getVoieManager().addVoie(voie);

            listVoie = managerFactory.getVoieManager().getListVoieSite(site.getId());


        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }


    /**
     * Méthode pour afficher une liste de réservation du mois séléctionné.
     * @return
     */
    public String doAjaxDetailResa(){
        String vResult = ActionSupport.SUCCESS;

        topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

        List<Reservation> vList = managerFactory.getReservationManager().getReservationTopo(topo.getId());

        listReservation = new ArrayList<>();


        for( int i = 0; i<vList.size();i++){

            if ((mois-1) == (vList.get(i).getDate().getMonth())){
                listReservation.add(vList.get(i));
            }
        }

        return vResult;
    }

    /**
     * Méthode pour afficher la liste de toutes les réservations de ce topo
     * @return
     */
    public String doAjaxDetailResaTopo(){

        String vResult = ActionSupport.SUCCESS;

        topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

        listReservation = managerFactory.getReservationManager().getReservationTopo(topo.getId());


        return vResult;
    }

    /**
     * Méthode pour créer un commentaire dans un site/topo/secteur
     * On récupère le nom en haut de la page et en focntion de celui-ci on s'est
     * si on est sur un site/topo ou secteur.
     * @return
     */
    public String doAjaxAddCommentaire(){

        Commentaire commentaire = new Commentaire();

        commentaire.setContenu(contenu);
        commentaire.setDate(new Date());
        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
        compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
        commentaire.setAuteurId(compte.getId());



        if(nomTopo != null){
            topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
            commentaire.setTopoId(topo.getId());
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(topo.getId());

        }else if(nomSite != null){
            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
            commentaire.setSiteId(site.getId());
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(site.getId());

        }else if(nomSecteur != null){
            secteur = managerFactory.getSecteurManager().getSecteurViaNom(nomSecteur);
            commentaire.setSecteurId(secteur.getId());
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSecteur(secteur.getId());
        }

        managerFactory.getCommentaireManager().addCommentaire(commentaire);
        return ActionSupport.SUCCESS;
    }

    public List<Commentaire> getListCommentaire() {
        return listCommentaire;
    }

    public void setListCommentaire(List<Commentaire> listCommentaire) {
        this.listCommentaire = listCommentaire;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }

    public List<Secteur> getListSecteur() {
        return listSecteur;
    }

    public void setListSecteur(List<Secteur> listSecteur) {
        this.listSecteur = listSecteur;
    }

    public String getNomSecteur() {
        return nomSecteur;
    }

    public void setNomSecteur(String nomSecteur) {
        this.nomSecteur = nomSecteur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public String getNomTopo() {
        return nomTopo;
    }

    public void setNomTopo(String nomTopo) {
        this.nomTopo = nomTopo;
    }

    public List<Topo> getListTopo() {
        return listTopo;
    }

    public void setListTopo(List<Topo> listTopo) {
        this.listTopo = listTopo;
    }

    public List<Site> getListSite() {
        return listSite;
    }

    public void setListSite(List<Site> listSite) {
        this.listSite = listSite;
    }

    public List<Image> getListImage() {
        return listImage;
    }

    public void setListImage(List<Image> listImage) {
        this.listImage = listImage;
    }

    public List<Reservation> getListReservation() {
        return listReservation;
    }

    public void setListReservation(List<Reservation> listReservation) {
        this.listReservation = listReservation;
    }

    public Integer getMois() {
        return mois;
    }

    public void setMois(Integer mois) {
        this.mois = mois;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public Commentaire getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(Commentaire commentaire) {
        this.commentaire = commentaire;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public Integer getHauteur() {
        return hauteur;
    }

    public void setHauteur(Integer hauteur) {
        this.hauteur = hauteur;
    }

    public Integer getSecteurId() {
        return secteurId;
    }

    public void setSecteurId(Integer secteurId) {
        this.secteurId = secteurId;
    }

    public Integer getCotationId() {
        return cotationId;
    }

    public void setCotationId(Integer cotationId) {
        this.cotationId = cotationId;
    }
}
