package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.SecteurDao;
import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class CommentaireRM implements RowMapper<Commentaire> {

    @Inject
    SiteDao siteDao;
    @Inject
    TopoDao topoDao;
    @Inject
    SecteurDao secteurDao;
    @Inject
    CompteDao compteDao;


    @Override
    public Commentaire mapRow(ResultSet resultSet, int i) throws SQLException {
        Commentaire commentaire = new Commentaire();
        commentaire.setId(resultSet.getInt("id"));
        commentaire.setContenu(resultSet.getString("contenu"));
        commentaire.setDate(resultSet.getDate("date"));
        commentaire.setAuteur(compteDao.getCompte(resultSet.getInt("compte_id")));
        commentaire.setSecteur(secteurDao.getSecteur(resultSet.getInt("secteur_id")));
        commentaire.setSite(siteDao.getSite(resultSet.getInt("site_id")));
        commentaire.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));
        return commentaire;
    }
}
