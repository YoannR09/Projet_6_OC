package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.rowmapper.CompteRM;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

/**
 * Class qui gère les données des comptes.
 * On peut récupérer un compte via pseudo/id,
 * Récupérer la liste des comptes dans la base de données,
 * Ajouter un compte dans la base de données.
 */
@Named
public class CompteDaoImpl extends AbstractDaoImpl implements CompteDao {

    @Inject
    CompteRM compteRM;

    /**
     * Méthode pour récupérer un compte via un pseudo.
     * @param pseudo
     * @return
     */
    @Override
    public Compte getCompteViaPseudo(String pseudo) {
        String vSQL = "SELECT * FROM compte WHERE pseudo = '"+pseudo+"'";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Compte compte = vJdbcTemplate.queryForObject(vSQL,compteRM);
        return compte;
    }

    /**
     * Méthode qui récupére un compte avec un id.
     * @param pId
     * @return
     */
    @Override
    public Compte getCompte(Integer pId) {
        String vSQL = "SELECT * FROM compte WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Compte compte = vJdbcTemplate.queryForObject(vSQL,compteRM);
        return compte;
    }

    /**
     * Méthode pour récupérer la liste des comptes dans la base de données.
     * @return
     */
    @Override
    public List<Compte> getListCompte() {
        String vSQL = "SELECT * FROM compte ";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Compte> vList = vJdbcTemplate.query(vSQL,compteRM);
        return vList;
    }

    /**
     * Méthode pour ajouter un compte.
     * Le niveau d'accès est automatiquement mis en visiteur (1).
     *
     * @param compte
     */
    @Override
    public void addCompte(Compte compte) {
        /*
        String vSQL = "INSERT INTO compte (pseudo, nom, prenom, mot_de_passe, email, numero_de_telephone, niveau_acces_id)" +
                " VALUES (:pseudo, :nom, :prenom, :password, :email, :numero, :niveau)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(compte);
        vParams.registerSqlType("pseudo", Types.VARCHAR);
        vParams.registerSqlType("nom", Types.VARCHAR);
        vParams.registerSqlType("prenom", Types.VARCHAR);
        vParams.registerSqlType("password", Types.VARCHAR);
        vParams.registerSqlType("email", Types.VARCHAR);
        vParams.registerSqlType("numero", Types.VARCHAR);
        vParams.registerSqlType("niveau", Types.INTEGER);

        try {
            vJdbcTemplate.update(vSQL, vParams);
            System.out.println("Compte ajouté : "+vParams.getValue("pseudo"));
            System.out.println("Le mot de passe est : "+vParams.getValue("password"));
        } catch (DuplicateKeyException vEx) {
        }
         */
    }

}
