package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CommentaireDao;
import fr.oc.projet.consumer.rowmapper.CommentaireRM;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
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

    @Override
    public void addCommentaire(Commentaire commentaire) {
        String vSQL = "INSERT INTO commentaire (contenu, date, spot_id, topo_id, secteur_id, compte_id)" +
                " VALUES (:contenu, :date, :siteId, :topoId, :secteurId, :auteurId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(commentaire);
        vParams.registerSqlType("contenu", Types.VARCHAR);
        vParams.registerSqlType("date", Types.DATE);
        vParams.registerSqlType("siteId", Types.INTEGER);
        vParams.registerSqlType("topoId", Types.INTEGER);
        vParams.registerSqlType("secteurId", Types.INTEGER);
        vParams.registerSqlType("auteurId", Types.INTEGER);


        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {
        }
    }
}
