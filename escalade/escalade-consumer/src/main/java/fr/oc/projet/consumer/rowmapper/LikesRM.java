package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CommentaireDao;
import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.LikesDao;
import fr.oc.projet.model.bean.utilisateur.Likes;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class LikesRM implements RowMapper<Likes> {

    @Inject
    CommentaireDao commentaireDao;
    @Inject
    CompteDao compteDao;

    @Override
    public Likes mapRow(ResultSet resultSet, int i) throws SQLException {
        Likes likes = new Likes();
        likes.setId(resultSet.getInt("id"));
        likes.setStatut(resultSet.getBoolean("statut"));
        likes.setCommentaire(commentaireDao.getCommentaire(resultSet.getInt("commentaire_id")));
        likes.setCompte(compteDao.getCompte(resultSet.getInt("compte_id")));
        return likes;
    }
}
