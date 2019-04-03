package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.rowmapper.SiteRM;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

@Named
public class SiteDaoImpl extends AbstractDaoImpl implements SiteDao {

    @Inject
    SiteRM siteRM;


    @Override
    public Site getSite(Integer pId) {
        String vSQL = "SELECT * FROM site WHERE id = "+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Site site = vJdbcTemplate.queryForObject(vSQL,siteRM);
        return site;
    }

    @Override
    public Site getSiteViaNom(String nom) {
        List<Character> listChar = new ArrayList<>();
        nom.toCharArray();
        for(int i = 0 ; i < nom.length() ; i++) {
            listChar.add(nom.charAt(i));
            char lettre = nom.charAt(i);
            if(Character.toString(lettre).equals("'")){
                listChar.add('\'');
            }
        }
        StringBuilder sb = new StringBuilder();
        for (Character ch: listChar) {
            sb.append(ch);
        }
        String vSQL = "SELECT * FROM site WHERE nom = '"+sb.toString()+"'";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Site site = vJdbcTemplate.queryForObject(vSQL,siteRM);
        return site;
    }

    @Override
    public List<Site> getListSiteValide() {
        String vSQL = "SELECT * FROM site " +
                " WHERE valide = TRUE " +
                " ORDER BY id DESC" +
                " LIMIT 5 ";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Site> vList = vJdbcTemplate.query(vSQL,siteRM);
        return vList;
    }

    @Override
    public List<Site> getListSiteNonValide() {
        String vSQL = "SELECT * FROM site WHERE valide = FALSE";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Site> vList = vJdbcTemplate.query(vSQL,siteRM);
        return vList;
    }

    @Override
    public List<Site> getListSiteValidePageDown(Integer lastId) {
        String vSQL = "SELECT * FROM site " +
                " WHERE valide = true " +
                " AND id < "+lastId+
                " ORDER BY id DESC" +
                " LIMIT 5";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Site> vList = vJdbcTemplate.query(vSQL,siteRM);
        return vList;
    }

    @Override
    public List<Site> getListSiteValidePageUp(Integer lastId) {
        return null;
    }

    @Override
    public void addSite(Site site) {
        String vSQL = "INSERT INTO site (nom, description, topo_id, type_de_roche_id, departement_id, responsable_id, ville, valide, date_de_creation)" +
                " VALUES (:nom, :description, :topoId, :typeId, :departementId, :editeurId, :ville, :valide, :date, )";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(site);
        vParams.registerSqlType("nom", Types.VARCHAR);
        vParams.registerSqlType("topoId", Types.INTEGER);
        vParams.registerSqlType("typeId", Types.INTEGER);
        vParams.registerSqlType("departementId", Types.INTEGER);
        vParams.registerSqlType("editeurId", Types.INTEGER);
        vParams.registerSqlType("ville", Types.VARCHAR);
        vParams.registerSqlType("description", Types.VARCHAR);
        vParams.registerSqlType("valide", Types.BOOLEAN);
        vParams.registerSqlType("date", Types.DATE);


        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {
        }
    }

    @Override
    public int getCountSite() {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbrSite = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.site WHERE valide = TRUE ",
                Integer.class);
        return vNbrSite;
    }



}
