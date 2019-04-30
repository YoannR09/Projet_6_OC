package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Message;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.List;


/**
 * Class qui permet de gérer les données de l'applications
 * Accès au topo et site en attentes de validation.
 * Accès au messages envoyés par les utilisateurs.
 * Modération des sites et topos.
 */
public class GestionSiteWebAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    private         List<Message>       messageList;
    private         List<Topo>          topoList;
    private         List<Site>          siteList;
    private         List<Secteur>       secteurList;
    private         List<Voie>          listVoie;
    private         List<Image>         listImage;
    private         Integer             idMessage;
    private         Message             message;
    private         Site                site;
    private         Topo                topo;
    private         Integer             idSite;
    private         Integer             idTopo;


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

    /**
     * Méthode pour afficher les détails d'un site à moderer.
     * @return
     */
    public String doModerationSite(){

        site = managerFactory.getSiteManager().getSite(idSite);
        secteurList = managerFactory.getSecteurManager().getListSecteurSite(site.getId());
        listVoie = managerFactory.getVoieManager().getListVoieSite(site.getId());
        listImage = managerFactory.getImageManager().getListImageSite(site.getId());

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher les détails d'un topo à moderer.
     * @return
     */
    public String doModerationTopo(){

        topo = managerFactory.getTopoManager().getTopo(idTopo);
        listImage = managerFactory.getImageManager().getListImageTopo(topo.getId());

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour valider un site/topo qui était en attente de validation.
     * @return
     */
    public String doValide(){

        if(idSite != null){
            site = managerFactory.getSiteManager().getSite(idSite);
            site.setValide(true);
            managerFactory.getSiteManager().updateSite(site);
            this.addActionMessage("Le site est maintenant disponible.");
        }else if(idTopo != null){
            topo = managerFactory.getTopoManager().getTopo(idTopo);
            topo.setValide(true);
            managerFactory.getTopoManager().update(topo);
            logger.info("Topo : "+topo+" a bien été modifié dans la base de données.");
            this.addActionMessage("Le topo est maintenant disponible.");
        }
        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour supprimer un site/topo de la base de données.
     * @return
     */
    public String doDelete(){

        if(idSite != null){
            site = managerFactory.getSiteManager().getSite(idSite);
            managerFactory.getImageManager().deleteImageSite(site.getId());
            managerFactory.getVoieManager().deleteVoie(site.getId());
            managerFactory.getSecteurManager().deleteSecteur(site.getId());
            managerFactory.getSiteManager().deleteSite(site.getId());
            logger.info("Site : "+site+" a bien été supprimé dans la base de données.");
        }else if(idTopo != null){
            topo = managerFactory.getTopoManager().getTopo(idTopo);
            managerFactory.getImageManager().deleteImageTopo(topo.getId());
            managerFactory.getTopoManager().deleteTopo(topo.getId());
            logger.info("Topo : "+topo+" a bien été supprimé dans la base de données.");
        }
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

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public Integer getIdTopo() {
        return idTopo;
    }

    public void setIdTopo(Integer idTopo) {
        this.idTopo = idTopo;
    }

    public List<Voie> getListVoie() {
        return listVoie;
    }

    public void setListVoie(List<Voie> listVoie) {
        this.listVoie = listVoie;
    }

    public List<Image> getListImage() {
        return listImage;
    }

    public void setListImage(List<Image> listImage) {
        this.listImage = listImage;
    }
}

