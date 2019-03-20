package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.rowmapper.SiteRM;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class SiteDaoImpl extends AbstractDaoImpl implements SiteDao {

    @Inject
    SiteRM siteRM;


    @Override
    public Site getSite(Integer pId) {
        String vSQL = "SELECT * FROM site WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Site site = vJdbcTemplate.queryForObject(vSQL,siteRM);
        return site;
    }

    @Override
    public Site getSiteViaNom(String nom) {
        String vSQL = "SELECT * FROM site WHERE nom ="+nom;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Site site = vJdbcTemplate.queryForObject(vSQL,siteRM);
        return site;
    }

    @Override
    public List<Site> getListSite() {
        String vSQL = "SELECT * FROM site";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Site> vList = vJdbcTemplate.query(vSQL,siteRM);
        return vList;
    }
}
