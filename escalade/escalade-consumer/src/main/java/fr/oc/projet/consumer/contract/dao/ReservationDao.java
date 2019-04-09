package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Reservation;

import java.util.List;

public interface ReservationDao {

    Reservation getReservation(Integer pId);

    List<Reservation> getReservationTopo(Integer topoId);

    List<Reservation> getListReservation();

    void addReservation(Reservation reservation);

}
