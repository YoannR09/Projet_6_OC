package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Message;

import javax.inject.Inject;
import java.util.List;


/**
 * Class qui permet de gérer les données de l'applications
 * Accès au topo et site en attentes de validation.
 * Accès au messages envoyés par les utilisateurs.
 */
public class GestionSiteWebAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private List<Message> messageList;
    private List<Topo>    topoList;
    private List<Site>    siteList;
    private List<Secteur> secteurList;
    private Integer       idMessage;
    private Message       message;
    private Site          site;
    private Integer       idSite;


    /**
     * Action pour afficher la liste des messages des utilisateurs.
     * @return
     */
    public String doListMessage(){

        messageList = managerFactory.getMessageManager().getListMessage();

        return ActionSupport.SUCCESS;
    }


    /**
     * Action pour afficher deux listes.
     * Une liste pour sites non valide
     * Une autre liste pour les topos non valide.
     * @return
     */
    public String doModeration(){


        siteList = managerFactory.getSiteManager().getListSiteNonValide();
        topoList = managerFactory.getTopoManager().getListTopoNonValide();

        return ActionSupport.SUCCESS;
    }

    /**
     * Action pour afficher les détails d'un message séléctionné.
     * @return
     */
    public String doDetailMessage(){

        message = managerFactory.getMessageManager().getMessage(idMessage);

        return ActionSupport.SUCCESS;
    }

    public String doModerationSite(){

        site = managerFactory.getSiteManager().getSite(idSite);
        secteurList = managerFactory.getSecteurManager().getListSecteurSite(idSite);

        return ActionSupport.SUCCESS;
    }



    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

    public Integer getIdMessage() {
        return idMessage;
    }

    public void setIdMessage(Integer idMessage) {
        this.idMessage = idMessage;
    }
    public List<Topo> getTopoList() {
        return topoList;
    }

    public void setTopoList(List<Topo> topoList) {
        this.topoList = topoList;
    }

    public List<Site> getSiteList() {
        return siteList;
    }

    public void setSiteList(List<Site> siteList) {
        this.siteList = siteList;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
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

    public List<Secteur> getSecteurList() {
        return secteurList;
    }

    public void setSecteurList(List<Secteur> secteurList) {
        this.secteurList = secteurList;
    }
}

