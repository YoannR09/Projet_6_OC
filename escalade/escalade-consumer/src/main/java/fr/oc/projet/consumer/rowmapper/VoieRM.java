package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CotationDao;
import fr.oc.projet.consumer.contract.dao.SecteurDao;
import fr.oc.projet.model.bean.escalade.Voie;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class VoieRM implements RowMapper<Voie> {

    @Inject
    SecteurDao secteurDao;
    @Inject
    CotationDao cotationDao;

    @Override
    public Voie mapRow(ResultSet resultSet, int i) throws SQLException {
        Voie voie = new Voie();
        voie.setId(resultSet.getInt("id"));
        voie.setNom(resultSet.getString("nom"));
        voie.setHauteur(resultSet.getInt("hauteur"));
        voie.setCotation(cotationDao.getCotation(resultSet.getInt("cotation_id")));
        voie.setSecteur(secteurDao.getSecteur(resultSet.getInt("secteur_id")));
        return voie;
    }
}
