package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.model.bean.escalade.Topo;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TopoRM implements RowMapper<Topo> {

    @Inject
    CompteDao compteDaoImpl;

    @Override
    public Topo mapRow(ResultSet resultSet, int i) throws SQLException {

        Topo topo = new Topo();
        topo.setId(resultSet.getInt("id"));
        topo.setNom(resultSet.getString("nom"));
        topo.setDescription(resultSet.getString("description"));
        topo.setValide(resultSet.getBoolean("valide"));
        topo.setDate(resultSet.getDate("date_de_creation"));
        topo.setResponsable(compteDaoImpl.getCompte(resultSet.getInt("responsable_id")));
        return topo;
    }
}