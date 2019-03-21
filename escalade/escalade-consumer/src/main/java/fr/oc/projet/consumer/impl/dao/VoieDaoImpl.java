package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.VoieDao;
import fr.oc.projet.consumer.rowmapper.VoieRM;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Voie;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;


@Named
public class VoieDaoImpl extends AbstractDaoImpl implements VoieDao {

    @Inject
    VoieRM voieRM;

    @Override
    public Voie getVoie(Integer pId) {
        String vSQL = "SELECT * FROM voie WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Voie voie = vJdbcTemplate.queryForObject(vSQL,voieRM);
        return voie;
    }

    @Override
    public List<Voie> getListVoir() {
        String vSQL = "SELECT * FROM voie";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Voie> vList = vJdbcTemplate.query(vSQL,voieRM);
        return vList;
    }
}
