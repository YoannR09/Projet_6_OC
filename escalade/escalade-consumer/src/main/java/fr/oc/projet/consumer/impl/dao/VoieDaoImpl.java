package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.VoieDao;
import fr.oc.projet.consumer.rowmapper.VoieRM;
import fr.oc.projet.model.bean.escalade.Cotation;
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

    @Override
    public Integer getCountVoieSecteur(Integer idSecteur) {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbrVoie = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.voie WHERE secteur_id ="+idSecteur,
                Integer.class);
        return  vNbrVoie;
    }

    @Override
    public Integer getCountVoieSite(Integer idSite) {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbrVoie = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.voie,secteur WHERE site_id ="+idSite+
                        " AND voie.secteur_id = secteur.id ",
                Integer.class);
        return  vNbrVoie;
    }

    @Override
    public Integer getHauteurMaxSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM voie WHERE secteur_id = "+secteurId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Voie> vList = vJdbcTemplate.query(vSQL,voieRM);
        Voie voie = vList.get(0);
        return voie.getHauteur();
    }

    @Override
    public Integer getHauteurMinSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM voie WHERE secteur_id = "+secteurId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Voie> vList = vJdbcTemplate.query(vSQL,voieRM);
        int i = vList.size();
        Voie voie = vList.get(i-1);
        return voie.getHauteur();
    }
}
