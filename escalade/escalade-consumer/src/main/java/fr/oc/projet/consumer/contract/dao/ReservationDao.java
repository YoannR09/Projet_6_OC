package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Reservation;

import java.util.List;

public interface ReservationDao {

    Reservation getReservation(Integer pId);

    Reservation getReservationTopo(Integer topoId);

    List<Reservation> getListReservation();
}
