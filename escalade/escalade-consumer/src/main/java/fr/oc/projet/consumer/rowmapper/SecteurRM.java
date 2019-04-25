package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CotationDao;
import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.contract.dao.VoieDao;
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
    @Inject
    VoieDao voieDao;
    @Inject
    CotationDao cotationDao;

    @Override
    public Secteur mapRow(ResultSet resultSet, int i) throws SQLException {
        Secteur secteur = new Secteur();
        secteur.setId(resultSet.getInt("id"));
        secteur.setNom(resultSet.getString("nom"));

        secteur.setNombreVoie(voieDao.getCountVoieSecteur(resultSet.getInt("id")));

        if(voieDao.getCountVoieSecteur(secteur.getId()) != 0) {
            secteur.setCotationMin(cotationDao.getCotationMinSecteur(resultSet.getInt("id")));
        }
        if(voieDao.getCountVoieSecteur(secteur.getId()) != 0) {
            secteur.setCotationMax(cotationDao.getCotationMaxSecteur(resultSet.getInt("id")));
        }
        if(voieDao.getCountVoieSecteur(secteur.getId()) != 0) {
            secteur.setHauteurMin(voieDao.getHauteurMinSecteur(resultSet.getInt("id")));
        }
        if(voieDao.getCountVoieSecteur(secteur.getId()) != 0) {
            secteur.setHauteurMax(voieDao.getHauteurMaxSecteur(resultSet.getInt("id")));
        }
        return secteur;
    }
}