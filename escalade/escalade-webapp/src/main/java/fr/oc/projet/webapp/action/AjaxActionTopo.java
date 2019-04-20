package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Reservation;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AjaxActionTopo extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Reservation>    listReservation;
    private         Topo                 topo;
    private         String               pseudo;
    private         String               nomTopo;
    private         Date                 date;
    private         Boolean              matin;
    private         Boolean              apresMidi;
    private         Boolean              occupe;
    private         String               messageAjax;


    /**
     * Méthode pour enregistrer un réservation dans la base de données.
     * En premier on vérifie que les un créneau a était séléctionné.
     * On récupère ensuite les informations de la réservation.
     * Vérification de la disponibilité du créneau.
     * Si il est disponible on ajoute celui-ci dans la bdd.
     * On récupère ensuite la liste de réservation
     * pour ensuite récupèrer celles du mois.
     * @return
     */
    public  String doReservation(){

        String vResult ;


        if(matin == false && apresMidi == false){
            this.addActionMessage("Vous devez choisir un créneau.");
            vResult = ActionSupport.ERROR;
        }else {
            topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

            pseudo = (String) ActionContext.getContext().getSession().get("pseudo");

            Reservation reservation = new Reservation();
            reservation.setDate(date);
            if(matin == true) {
                reservation.setMatin(true);
            }else {
                reservation.setMatin(false);
            }
            if(apresMidi == true){
                reservation.setApresMidi(true);
            }else {
                reservation.setApresMidi(false);
            }
            reservation.setCompteId(managerFactory.getCompteManager().getCompteViaPseudo(pseudo).getId());
            reservation.setTopoId(topo.getId());

            List<Reservation> vList = managerFactory.getReservationManager().getReservationTopo(topo.getId());

            for (int i = 0; i<vList.size(); i++){
                if(reservation.getDate().equals(vList.get(i).getDate())){
                    if(reservation.getMatin() && vList.get(i).getMatin()){
                        messageAjax = "Créneau déjà reservé.";
                        occupe = true;
                        break;
                    }else {
                        if(reservation.getApresMidi() && vList.get(i).getApresMidi()){
                            messageAjax = "Créneau déjà reservé.";
                            occupe = true;
                            break;
                        }else {
                            occupe = false;
                        }
                    }
                }else {
                    occupe = false;
                }
            }

            if(!occupe){
                managerFactory.getReservationManager().addReservation(reservation);
            }

            vList = managerFactory.getReservationManager().getReservationTopo(topo.getId());

            listReservation = new ArrayList<>();

            for (int i = 0; i < vList.size(); i++) {

                if ((date.getMonth()) == (vList.get(i).getDate().getMonth())) {
                    listReservation.add(vList.get(i));
                }
            }
            messageAjax = "Réservation bien validée";
            vResult = ActionSupport.SUCCESS;
        }
            return vResult;
        }


    public List<Reservation> getListReservation() {
        return listReservation;
    }

    public void setListReservation(List<Reservation> listReservation) {
        this.listReservation = listReservation;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getNomTopo() {
        return nomTopo;
    }

    public void setNomTopo(String nomTopo) {
        this.nomTopo = nomTopo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Boolean getMatin() {
        return matin;
    }

    public void setMatin(Boolean matin) {
        this.matin = matin;
    }

    public Boolean getApresMidi() {
        return apresMidi;
    }

    public void setApresMidi(Boolean apresMidi) {
        this.apresMidi = apresMidi;
    }

    public String getMessageAjax() {
        return messageAjax;
    }

    public void setMessageAjax(String messageAjax) {
        this.messageAjax = messageAjax;
    }
}

