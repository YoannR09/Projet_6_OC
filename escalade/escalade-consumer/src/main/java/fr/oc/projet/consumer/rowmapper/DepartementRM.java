package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.RegionDao;
import fr.oc.projet.model.bean.escalade.Departement;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class DepartementRM implements RowMapper<Departement> {

    @Inject
    RegionDao regionDao;

    @Override
    public Departement mapRow(ResultSet resultSet, int i) throws SQLException {

        Departement departement = new Departement();
        departement.setId(resultSet.getInt("id"));
        departement.setNom(resultSet.getString("nom"));
        departement.setNumero(resultSet.getInt("numero"));
        departement.setRegion(regionDao.getRegion(resultSet.getInt("region_id")));

        return departement;
    }
}
