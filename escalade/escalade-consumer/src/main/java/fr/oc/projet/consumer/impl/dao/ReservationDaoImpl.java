package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.ReservationDao;
import fr.oc.projet.consumer.rowmapper.ReservationRM;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
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
    public List<Reservation> getReservationTopo(Integer topoId) {
        String vSQL = "SELECT * FROM reservation WHERE topo_id = "+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Reservation> reservation = vJdbcTemplate.query(vSQL,reservationRM);
        return reservation;
    }

    @Override
    public List<Reservation> getListReservation() {
        String vSQL = "SELECT * FROM reservation";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Reservation> vList = vJdbcTemplate.query(vSQL,reservationRM);
        return vList;
    }

    @Override
    public void addReservation(Reservation reservation) {
        String vSQL = "INSERT INTO reservation (date, matin, apres_midi, compte_id, topo_id) VALUES (:date, :matin, :apresMidi, :compteId, :topoId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(reservation);
        vParams.registerSqlType("date", Types.DATE);
        vParams.registerSqlType("matin", Types.BOOLEAN);
        vParams.registerSqlType("apresMidi", Types.BOOLEAN);
        vParams.registerSqlType("topoId", Types.INTEGER);
        vParams.registerSqlType("compteId", Types.INTEGER);

        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {

        }
    }

}
