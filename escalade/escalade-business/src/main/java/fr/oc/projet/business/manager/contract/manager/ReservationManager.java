package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Reservation;

import java.util.List;

public interface ReservationManager {

    Reservation getReservation(Integer pId);

    List<Reservation> getReservationTopo(Integer topoId);

    List<Reservation> getListReservation();

}
