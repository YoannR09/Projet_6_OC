package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Reservation;

import javax.inject.Inject;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Classe qui gère les actions des pages de topo du site web.
 */
public class GestionTopoAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Topo>            listTopo;
    private         List<Commentaire>     listCommentaire;
    private         List<Reservation>     reservationList;
    private         List<Image>           listImage;
    private         List<Site>            listSite;
    private         Topo                  topo;
    private         Integer               idTopo;
    private         Integer               lastId;
    private         Integer               nombre;
    private         String                pseudo;
    private         String                text;
    private         Integer               page;


    /**
     * Méthode pour récupèrer les détails d'un topo.
     * @return
     */
    public String doDetailTopo(){

            topo = managerFactory.getTopoManager().getTopo(idTopo);
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(idTopo);
            listSite = managerFactory.getSiteManager().getListSiteTopo(topo.getId());
            listImage = managerFactory.getImageManager().getListImageTopo(topo.getId());

        return  ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la liste des réservations du topo.
     * @return
     */
    public  String doReservationTopo(){

        topo = managerFactory.getTopoManager().getTopo(idTopo);
        reservationList = managerFactory.getReservationManager().getReservationTopo(idTopo);

        return  ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la page précedente de la liste des topos.
     * @return
     */
    public String doListSiteValidePageDown() {

            listTopo = managerFactory.getTopoManager().getListTopoValidePageDown(lastId);
            nombre = listTopo.size();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la page suivante de la liste des topos.
     * @return
     */
    public String doListSiteValidePageUp() {

        listTopo = managerFactory.getTopoManager().getListTopoValidePageUp(lastId);
        nombre = listTopo.size();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la liste des topos valides du site web.
     * @return
     */
    public String doListTopoValide() {

        listTopo = managerFactory.getTopoManager().getListTopoValide();
        nombre = listTopo.size();

        return ActionSupport.SUCCESS;
    }

    public String doListTopoValideNote() {

        listTopo = managerFactory.getTopoManager().getListTopoValide();

        Collections.sort(listTopo, Topo.ComparatorNote);
        Collections.reverse(listTopo);
        nombre = listTopo.size();


        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour rechercher un topo via un mot-clé.
     * @return
     */
    public String doRechercheTopo(){

        listTopo = managerFactory.getTopoManager().rechercheTopo(text);

        return ActionSupport.SUCCESS;
    }

    public List<Topo> getListTopo() {
        return listTopo;
    }

    public void setListTopo(List<Topo> listTopo) {
        this.listTopo = listTopo;
    }



    public List<Commentaire> getListCommentaire() {
        return listCommentaire;
    }

    public void setListCommentaire(List<Commentaire> listCommentaire) {
        this.listCommentaire = listCommentaire;
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

    public List<Reservation> getReservationList() {
        return reservationList;
    }

    public void setReservationList(List<Reservation> reservationList) {
        this.reservationList = reservationList;
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

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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
}
