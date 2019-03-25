package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CommentaireDao;
import fr.oc.projet.consumer.rowmapper.CommentaireRM;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class CommentaireDaoImpl extends AbstractDaoImpl implements CommentaireDao {

    @Inject
    CommentaireRM commentaireRM;

    @Override
    public Commentaire getCommentaire(Integer pId) {
        String vSQL = "SELECT * FROM commentaire WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Commentaire commentaire = vJdbcTemplate.queryForObject(vSQL,commentaireRM);
        return commentaire;
    }

    @Override
    public List<Commentaire> getListCommentaireSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM commentaire WHERE secteur_id ="+secteurId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }

    @Override
    public List<Commentaire> getListCommentaireTopo(Integer topoId) {
        String vSQL = "SELECT * FROM commentaire WHERE topo_id ="+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }

    @Override
    public List<Commentaire> getListCommentaireSite(Integer siteId) {
        String vSQL = "SELECT * FROM commentaire WHERE spot_id = "+siteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }
}
