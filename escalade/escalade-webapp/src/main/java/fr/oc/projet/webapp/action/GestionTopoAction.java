package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Reservation;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

public class GestionTopoAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Topo>            listTopo;
    private         List<Commentaire>     listCommentaire;
    private         List<Reservation>     reservationList;
    private         Topo                  topo;
    private         Integer               idTopo;
    private         Integer               lastId;
    private         Integer               nombre;
    private         String                pseudo;
    private         Boolean               firstPage;


    public String doDetailTopo(){

        if (this.idTopo == null) {
            this.addActionError("Vous devez indiquer un id de channel");
        } else {
            topo = managerFactory.getTopoManager().getTopo(idTopo);
            listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(idTopo);

        }
        return  ActionSupport.SUCCESS;
    }

    public  String doReservationTopo(){

        topo = managerFactory.getTopoManager().getTopo(idTopo);

        reservationList = managerFactory.getReservationManager().getReservationTopo(idTopo);

        return  ActionSupport.SUCCESS;
    }



    public String doListSiteValidePageDown() {

        listTopo = managerFactory.getTopoManager().getListTopoValidePageDown(lastId);

        nombre = listTopo.size();
        Topo topo = listTopo.get(nombre-1);
        lastId = topo.getId();

        return ActionSupport.SUCCESS;
    }
    public String doListSiteValidePageUp() {

        listTopo = managerFactory.getTopoManager().getListTopoValidePageUp(lastId);

        nombre = listTopo.size();
        Topo topo = listTopo.get(nombre-1);
        lastId = topo.getId();

        return ActionSupport.SUCCESS;
    }
    public String doListTopoValide() {
        listTopo = managerFactory.getTopoManager().getListTopoValide();


        nombre = listTopo.size();
        Topo topo = listTopo.get(nombre-1);
        lastId = topo.getId();

        firstPage = true;

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

    public Boolean getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(Boolean firstPage) {
        this.firstPage = firstPage;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
}
