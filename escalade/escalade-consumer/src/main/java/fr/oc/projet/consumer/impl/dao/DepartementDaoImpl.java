package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.DepartementDao;
import fr.oc.projet.consumer.rowmapper.DepartementRM;
import fr.oc.projet.model.bean.escalade.Departement;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class DepartementDaoImpl extends AbstractDaoImpl implements DepartementDao {

    @Inject
    DepartementRM departementRM;

    @Override
    public Departement getDepartement(Integer pId) {
        String vSQL = "SELECT * FROM departement WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Departement departement = vJdbcTemplate.queryForObject(vSQL,departementRM);
        return departement;
    }

    @Override
    public List<Departement> getListDepartement() {
        String vSQL = "SELECT * FROM departement";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Departement> vList = vJdbcTemplate.query(vSQL,departementRM);
        return vList;
    }
}
