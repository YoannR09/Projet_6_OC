package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.ReservationManager;
import fr.oc.projet.model.bean.utilisateur.Reservation;

import javax.inject.Named;
import java.util.List;

@Named
public class  ReservationManagerImpl extends AbstractManagerImpl implements ReservationManager {
    @Override
    public Reservation getReservation(Integer pId) {
        return getDaoFactory().getReservationDao().getReservation(pId);
    }

    @Override
    public List<Reservation> getReservationTopo(Integer topoId) {
        return getDaoFactory().getReservationDao().getReservationTopo(topoId);
    }

    @Override
    public List<Reservation> getListReservation() {
        return getDaoFactory().getReservationDao().getListReservation();
    }

    @Override
    public void addReservation(Reservation reservation) {
        getDaoFactory().getReservationDao().addReservation(reservation);
    }

    @Override
    public int getCountResa(Integer topoId) {
        return getDaoFactory().getReservationDao().getCountResa(topoId);
    }

}
