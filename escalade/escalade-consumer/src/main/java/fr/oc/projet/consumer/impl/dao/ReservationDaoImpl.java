package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.ReservationDao;
import fr.oc.projet.consumer.rowmapper.ReservationRM;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class ReservationDaoImpl extends AbstractDaoImpl implements ReservationDao {

    @Inject
    ReservationRM reservationRM;

    @Override
    public Reservation getReservation(Integer pId) {
        String vSQL = "SELECT * FROM reservation WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Reservation reservation = vJdbcTemplate.queryForObject(vSQL,reservationRM);
        return reservation;
    }

    @Override
    public Reservation getReservationTopo(Integer topoId) {
        String vSQL = "SELECT * FROM reservation WHERE topo_id ="+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Reservation reservation = vJdbcTemplate.queryForObject(vSQL,reservationRM);
        return reservation;
    }

    @Override
    public List<Reservation> getListReservation() {
        String vSQL = "SELECT * FROM reservation";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Reservation> vList = vJdbcTemplate.query(vSQL,reservationRM);
        return vList;
    }
}
