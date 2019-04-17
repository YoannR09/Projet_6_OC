package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.*;
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
    @Inject
    LikesDao likesDao;


    @Override
    public Commentaire mapRow(ResultSet resultSet, int i) throws SQLException {
        Commentaire commentaire = new Commentaire();
        commentaire.setId(resultSet.getInt("id"));
        commentaire.setContenu(resultSet.getString("contenu"));
        commentaire.setDate(resultSet.getDate("date"));
        commentaire.setAuteur(compteDao.getCompte(resultSet.getInt("compte_id")));
        if(resultSet.getInt("secteur_id") != 0){
            commentaire.setSecteur(secteurDao.getSecteur(resultSet.getInt("secteur_id")));
        }
        if(resultSet.getInt("site_id") != 0){
            commentaire.setSite(siteDao.getSite(resultSet.getInt("site_id")));
        }
        if(resultSet.getInt("topo_id") != 0){
            commentaire.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));
        }
        return commentaire;
    }
}
