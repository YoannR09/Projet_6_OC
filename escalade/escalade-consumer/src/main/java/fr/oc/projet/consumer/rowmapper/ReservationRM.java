package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class ReservationRM implements RowMapper<Reservation> {


    @Inject
    CompteDao compteDao;
    @Inject
    TopoDao topoDao;

    @Override
    public Reservation mapRow(ResultSet resultSet, int i) throws SQLException {
        Reservation reservation = new Reservation();
        reservation.setId(resultSet.getInt("id"));
        reservation.setMatin(resultSet.getBoolean("matin"));
        reservation.setApresMidi(resultSet.getBoolean("apres_midi"));
        reservation.setDate(resultSet.getDate("date"));
        reservation.setCompte(compteDao.getCompte(resultSet.getInt("compte_id")));
        reservation.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));

        return reservation;
    }
}
