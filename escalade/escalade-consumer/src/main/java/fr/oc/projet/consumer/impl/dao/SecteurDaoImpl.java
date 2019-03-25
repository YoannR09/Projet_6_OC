package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.SecteurDao;
import fr.oc.projet.consumer.rowmapper.SecteurRM;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.utilisateur.Message;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class SecteurDaoImpl extends AbstractDaoImpl implements SecteurDao {


    @Inject
    SecteurRM secteurRM;

    @Override
    public Secteur getSecteur(Integer pId) {
        String vSQL = "SELECT * FROM secteur WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Secteur secteur = vJdbcTemplate.queryForObject(vSQL,secteurRM);
        return secteur;
    }

    @Override
    public List<Secteur> getListSecteur() {
        String vSQL = "SELECT * FROM secteur";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Secteur> vList = vJdbcTemplate.query(vSQL,secteurRM);
        return vList;
    }

    @Override
    public List<Secteur> getListSecteurSite(Integer siteId) {
        String vSQL = "SELECT * FROM secteur WHERE site_id ="+siteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Secteur> vList = vJdbcTemplate.query(vSQL,secteurRM);
        return vList;
    }

    @Override
    public Integer getCountSecteurSite(Integer siteId) {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbrSecteur = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.secteur WHERE site_id ="+siteId,
                Integer.class);
        return vNbrSecteur;
    }
}
