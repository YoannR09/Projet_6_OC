package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.VoieDao;
import fr.oc.projet.consumer.rowmapper.VoieRM;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Voie;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
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
    public List<Voie> getListVoie() {
        String vSQL = "SELECT * FROM voie";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Voie> vList = vJdbcTemplate.query(vSQL,voieRM);
        return vList;
    }

    @Override
    public List<Voie> getListVoieSecteur(Integer idSecteur) {
        String vSQL = "SELECT * FROM voie WHERE secteur_id = "+idSecteur;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Voie> vList = vJdbcTemplate.query(vSQL,voieRM);
        return vList;
    }


    @Override
    public List<Voie> getListVoieSite(Integer idSite) {
        String vSQL = "SELECT * FROM voie,secteur WHERE site_id = "+idSite+"" +
                " AND voie.secteur_id = secteur.id";
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

    @Override
    public void addVoie(Voie voie) {
        String vSQL = "INSERT INTO voie (nom, hauteur,secteur_id, cotation_id)" +
                " VALUES (:nom, :hauteur, :secteurId, :cotationId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(voie);
        vParams.registerSqlType("nom", Types.VARCHAR);
        vParams.registerSqlType("hauteur", Types.INTEGER);
        vParams.registerSqlType("secteurId", Types.INTEGER);
        vParams.registerSqlType("cotationId", Types.INTEGER);

        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {
        }
    }

    @Override
    public void deleteVoie(Integer siteId) {
        String vSQL = "DELETE FROM voie "+
        " WHERE secteur_id IN "+
                " ( "+
                " SELECT id "+
                " FROM secteur "+
                " WHERE site_id = "+siteId+
               " ) ";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        vJdbcTemplate.update(vSQL);
    }
}
