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

/**
 * Classe qui gère les requêtes SQL de la table commentaire
 * Celle-ci permet de récupèrer un commentaire via id
 * Ou alors via l'id d'un site/topo/secteur.
 * Ou alors d'ajouter un commentaire.
 */
@Named
public class CommentaireDaoImpl extends AbstractDaoImpl implements CommentaireDao {

    @Inject
    CommentaireRM commentaireRM;

    /**
     * Méthode pour récupèrer un commentaire via un id
     * @param pId
     * @return
     */
    @Override
    public Commentaire getCommentaire(Integer pId) {
        String vSQL = "SELECT * FROM commentaire WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Commentaire commentaire = vJdbcTemplate.queryForObject(vSQL,commentaireRM);
        return commentaire;
    }

    /**
     * Méthode pour récupèrer une liste de commentaires contenu dans un secteur.
     * On récupère la liste avec l'id du secteur.
     * @param secteurId
     * @return
     */
    @Override
    public List<Commentaire> getListCommentaireSecteur(Integer secteurId) {
        String vSQL = "SELECT * FROM commentaire WHERE secteur_id ="+secteurId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }

    /**
     * Méthode pour récupèrer une liste de commentaires contenu dans un topo
     * On récupère la liste avec l'id du topo.
     * @param topoId
     * @return
     */
    @Override
    public List<Commentaire> getListCommentaireTopo(Integer topoId) {
        String vSQL = "SELECT * FROM commentaire WHERE topo_id ="+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }

    /**
     * Méthode pour récupèrer une liste de commentaires contenu dans un site
     * On récupère la liste avec l'id du site.
     * @param siteId
     * @return
     */
    @Override
    public List<Commentaire> getListCommentaireSite(Integer siteId) {
        String vSQL = "SELECT * FROM commentaire WHERE site_id = "+siteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Commentaire> vList = vJdbcTemplate.query(vSQL,commentaireRM);
        return vList;
    }

    /**
     * Méthode pour ajouter un commentaire.
     * Ajoute ce commentaire dans un topo/secteur/site si l'id reçu n'est pas null.
     * @param commentaire
     */
    @Override
    public void addCommentaire(Commentaire commentaire) {
        String vSQL = "INSERT INTO commentaire (contenu, date, site_id, topo_id, secteur_id, compte_id)" +
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
