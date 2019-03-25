package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import javassist.NotFoundException;

import javax.inject.Inject;
import java.util.List;

public class GestionSiteAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Site>            listSite;
    private         String                nomSite;
    private         Cotation              cotation;
    private         Secteur               secteur;
    private         Voie                  voie;
    private         Site                  site;
    private         Integer               idSite;
    private         Integer               idSecteur;
    private         List<Commentaire>     listCommentaire;
    private         List<Secteur>         listSecteur;

    /**
     * Méthode pour afficher la liste des sites qui sont validés par un administrateur.
     * La variable valide du bean Site doit être TRUE.
     * Plusieurs détails du site sont affichés.
     * @return
     */
    public String doListSiteValide() {

        listSite = managerFactory.getSiteManager().getListSiteValide();

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
            this.addActionError("Vous devez indiquer un id de channel");
        } else {
            site = managerFactory.getSiteManager().getSite(idSite);
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(idSite);

        }
        return  ActionSupport.SUCCESS;
    }

    public String doSecteurList(){

        System.out.println(idSite);
            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(idSite);

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
}
