package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CotationDao;
import fr.oc.projet.consumer.rowmapper.CompteRM;
import fr.oc.projet.consumer.rowmapper.CotationRM;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Departement;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

/**
 * Classe qui gère les requêtes SQL de la table cotation.
 */
@Named
public class CotationDaoImpl extends AbstractDaoImpl implements CotationDao {

    @Inject
    CotationRM cotationRM;

    /**
     * Méthode pour récupèrer une cotation via un id.
     * @param pId
     * @return
     */
    @Override
    public Cotation getCotation(Integer pId) {
        String vSQL = "SELECT * FROM cotation WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Cotation cotation = vJdbcTemplate.queryForObject(vSQL,cotationRM);
        return cotation;
    }

    /**
     * Méthode pour récupèrer la liste des cotations disponibles dans la BDD.
     * @return
     */
    @Override
    public List<Cotation> getListCotation() {
        String vSQL = "SELECT * FROM cotation";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        return vList;
    }

    /**
     * Méthode pour récupèrer la cotation maximum d'un site.
     * On récupère en premier la liste des cotations 
     * @param siteId
     * @return
     */
    @Override
    public Cotation getCotationMaxSite(Integer siteId) {
        String vSQL = "SELECT * FROM secteur,voie,cotation" +
                " WHERE site_id = "+siteId+
                "  AND secteur.site_id = site_id"+
                "  AND voie.secteur_id = secteur.id"+
                "  AND cotation.id = voie.cotation_id" +
                " ORDER BY niveau ASC";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        int i = vList.size();
        Cotation cotation = vList.get(i-1);
        return cotation;
    }

    @Override
    public Cotation getCotationMinSite(Integer siteId) {
        String vSQL = "SELECT * FROM secteur,voie,cotation" +
                " WHERE site_id = "+siteId+
                "  AND secteur.site_id = site_id"+
                "  AND voie.secteur_id = secteur.id"+
                "  AND cotation.id = voie.cotation_id" +
                " ORDER BY niveau ASC";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        Cotation cotation = vList.get(0);
        return cotation;
    }

    @Override
    public Cotation getCotationMaxSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM voie,cotation" +
                " WHERE secteur_id = "+secteurId+
                "  AND voie.secteur_id = secteur_id"+
                "  AND cotation.id = voie.cotation_id" +
                " ORDER BY niveau ASC";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        int i = vList.size();
        Cotation cotation = vList.get(i-1);
        return cotation;
    }

    @Override
    public Cotation getCotationMinSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM voie,cotation" +
                " WHERE secteur_id = "+secteurId+
                "  AND voie.secteur_id = secteur_id"+
                "  AND cotation.id = voie.cotation_id" +
                " ORDER BY niveau ASC";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        Cotation cotation = vList.get(0);
        return cotation;
    }
}
