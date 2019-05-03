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
import java.util.ArrayList;
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
    private         Integer               count;
    private         Integer               max;
    private         Boolean               endList;
    private         String                critere;


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

    public String doListSiteValidePageDownRecherche() {

        List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
        page = page-1;
        pagination(vList,page);
        critere = "recherche";

        return ActionSupport.SUCCESS;
    }
    public String doListSiteValidePageUpRecherche() {

        List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
        page = page+1;
        pagination(vList,page);
        critere = "recherche";

        return ActionSupport.SUCCESS;
    }

    public String doListSiteValidePageUpNote() {

        List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
        Collections.sort(vList, Topo.ComparatorNote);
        Collections.reverse(vList);
        page = page+1;
        pagination(vList,page);
        critere = "note";

        return ActionSupport.SUCCESS;
    }

    public String doListSiteValidePageDownNote() {

        List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
        Collections.sort(vList, Topo.ComparatorNote);
        Collections.reverse(vList);
        page = page-1;
        pagination(vList,page);
        critere = "note";

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la page précedente de la liste des topos.
     * @return
     */
    public String doListSiteValidePageDown() {

        List<Topo> vList = managerFactory.getTopoManager().getListTopoValide();
        page = page-1;
        pagination(vList,page);
        critere = "valide";

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la page suivante de la liste des topos.
     * @return
     */
    public String doListSiteValidePageUp() {

        List<Topo> vList = managerFactory.getTopoManager().getListTopoValide();
        page = page+1;
        pagination(vList,page);
        critere = "valide";

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la liste des topos valides du site web.
     * @return
     */
    public String doListTopoValide() {

        List<Topo> vList = managerFactory.getTopoManager().getListTopoValide();
        page = 1;
        pagination(vList,page);
        critere = "valide";

        return ActionSupport.SUCCESS;
    }

    public String doListTopoValideNote() {

        List<Topo> vList = managerFactory.getTopoManager().getListTopoValide();
        Collections.sort(vList, Topo.ComparatorNote);
        Collections.reverse(vList);
        page = 1;
        pagination(vList,page);
        critere = "note";

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour rechercher un topo via un mot-clé.
     * @return
     */
    public String doRechercheTopo(){

        List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
        page = 1;
        pagination(vList,page);
        critere = "recherche";

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour récupèrer les trois objets de la page
     * @param vList
     * @param page
     */
    public void pagination(List<Topo> vList,Integer page){
        listTopo = new ArrayList<>();
        count = page*3;
        if(count>vList.size()){
            max = vList.size();
            endList = true;
        }else {
            max = count;
            endList = false;
        }
        if(count == vList.size()){
            endList = true;
        }
        for(int i = count-3;i<max;i++){
            listTopo.add(vList.get(i));
        }
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

    public Boolean getEndList() {
        return endList;
    }

    public void setEndList(Boolean endList) {
        this.endList = endList;
    }

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public String getCritere() {
        return critere;
    }

    public void setCritere(String critere) {
        this.critere = critere;
    }
}
