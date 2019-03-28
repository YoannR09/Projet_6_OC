package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import javassist.NotFoundException;

import javax.inject.Inject;
import java.util.List;

public class AjaxAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private List<Commentaire>   listCommentaire;
    private Site                site;
    private String              nomSite;

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

    /**
     * Action "AJAX" renvoyant la liste des messages d'un channel.
     * @return success
     */
    public String doAjaxGetListCommentaire() { // throws NotFoundException, TechnicalException {
        String vResult = ActionSupport.SUCCESS;
        try {

            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(site.getId());

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }
}
