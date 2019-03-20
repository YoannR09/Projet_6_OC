package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.NiveauAccesDao;
import fr.oc.projet.consumer.rowmapper.NiveauAccesRM;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.NiveauAcces;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import java.util.List;

public class NiveauAccesDaoImpl extends AbstractDaoImpl implements NiveauAccesDao {

    @Inject
    NiveauAccesRM niveauAccesRM;

    @Override
    public NiveauAcces getNiveauAcces(Integer pId) {
        String vSQL = "SELECT * FROM niveau_acces WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        NiveauAcces niveauAcces = vJdbcTemplate.queryForObject(vSQL,niveauAccesRM);
        return niveauAcces;
    }

    @Override
    public List<NiveauAcces> getListNiveauAcces() {
        String vSQL = "SELECT * FROM niveau_acces";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<NiveauAcces> vList = vJdbcTemplate.query(vSQL,niveauAccesRM);
        return vList;
    }
}
