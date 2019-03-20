package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.DepartementDao;
import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.consumer.contract.dao.TypeDeRocheDao;
import fr.oc.projet.model.bean.escalade.Site;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class SiteRM implements RowMapper<Site> {

    @Inject
    TopoDao topoDao;
    @Inject
    TypeDeRocheDao typeDeRocheDao;
    @Inject
    DepartementDao departementDao;
    @Inject
    CompteDao compteDao;



    @Override
    public Site mapRow(ResultSet resultSet, int i) throws SQLException {
        Site site = new Site();
        site.setId(resultSet.getInt("id"));
        site.setNom(resultSet.getString("nom"));
        site.setDescription(resultSet.getString("description"));
        site.setDate(resultSet.getDate("date_de_creation"));
        site.setValide(resultSet.getBoolean("valide"));
        site.setVille(resultSet.getString("ville"));
        site.setDepartement(departementDao.getDepartement(resultSet.getInt("departement_id")));
        site.setEditeur(compteDao.getCompte(resultSet.getInt("responsable_id")));
        site.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));
        site.setTypeDeRoche(typeDeRocheDao.getTypeDeRoche(resultSet.getInt("type_de_roche_id")));

        return site;
    }
}
