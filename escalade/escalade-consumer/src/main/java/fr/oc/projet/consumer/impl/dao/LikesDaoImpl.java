package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.LikesDao;
import fr.oc.projet.consumer.rowmapper.LikesRM;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Likes;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class LikesDaoImpl extends AbstractDaoImpl implements LikesDao {

    @Inject
    LikesRM likesRM;

    @Override
    public Likes getLikes(Integer pId) {
        String vSQL = "SELECT * FROM likes WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Likes likes = vJdbcTemplate.queryForObject(vSQL,likesRM);
        return likes;
    }

    @Override
    public Boolean getLikeStatut(Integer comId, Integer compteId) {
        String vSQL = "SELECT * FROM likes WHERE commentaire_id ="+comId+"AND compte_id ="+compteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Likes likes = vJdbcTemplate.queryForObject(vSQL,likesRM);
        return likes.getStatut();
    }
}
