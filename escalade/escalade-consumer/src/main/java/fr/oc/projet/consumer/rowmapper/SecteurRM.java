package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class SecteurRM implements RowMapper<Secteur> {

    @Inject
    SiteDao siteDao;

    @Override
    public Secteur mapRow(ResultSet resultSet, int i) throws SQLException {
        Secteur secteur = new Secteur();
        secteur.setId(resultSet.getInt("id"));
        secteur.setNom(resultSet.getString("nom"));
        secteur.setSite(siteDao.getSite(resultSet.getInt("site_id")));
        return secteur;
    }
}
