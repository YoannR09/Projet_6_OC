package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Note;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Classe qui gère les actions ajax des topos d'escalade.
 */
public class AjaxActionTopo extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    private         List<Reservation>    listReservation;
    private         Topo                 topo;
    private         Compte               compte;
    private         String               pseudo;
    private         String               nomTopo;
    private         Date                 date;
    private         Boolean              matin;
    private         Boolean              apresMidi;
    private         Boolean              occupe;
    private         Integer              nbreResa;
    private         Double               note;


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
                        occupe = true;
                        break;
                    }else {
                        if(reservation.getApresMidi() && vList.get(i).getApresMidi()){
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
                logger.info("Reservation : "+reservation+" a bien été ajoutée à la base de données.");
            }
            vList = managerFactory.getReservationManager().getReservationTopo(topo.getId());
            listReservation = new ArrayList<>();

            for (int i = 0; i < vList.size(); i++) {

                if ((date.getMonth()) == (vList.get(i).getDate().getMonth())) {
                    listReservation.add(vList.get(i));
                }
            }
            vResult = ActionSupport.SUCCESS;
        }
        return vResult;
    }

    /**
     * Méthode pour compter le nombre de réservation du topo.
     * On utilise cette méthode pour comparer si le nombre de réservation à changé.
     * @return
     */
    public String doAjaxCountResa(){

        topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
        nbreResa = managerFactory.getReservationManager().getCountResa(topo.getId());

        return ActionSupport.SUCCESS;
    }


    public String doAjaxAddNote(){

        if(note != null){
            if(note instanceof Double) {
                topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
                Note pNote = new Note();
                pNote.setTopoId(topo.getId());
                pNote.setNote(note);
                pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
                compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
                pNote.setCompteId(compte.getId());
                managerFactory.getNoteManager().addNote(pNote);
                logger.info("Note : " + note + " a bien été ajoutée à la base de données.");
            }
        }
        return ActionSupport.SUCCESS;
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

    public Integer getNbreResa() {
        return nbreResa;
    }

    public void setNbreResa(Integer nbreResa) {
        this.nbreResa = nbreResa;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public Double getNote() {
        return note;
    }

    public void setNote(Double note) {
        this.note = note;
    }
}

