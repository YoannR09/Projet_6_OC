package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.NiveauAccesDao;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class CompteRM implements RowMapper<Compte> {

    @Inject
    NiveauAccesDao niveauAccesDaoImpl;


    @Override
    public Compte mapRow(ResultSet resultSet, int i) throws SQLException {

        Compte compte = new Compte();
        compte.setId(resultSet.getInt("id"));
        compte.setPseudo(resultSet.getString("pseudo"));
        compte.setNom(resultSet.getString("nom"));
        compte.setPrenom(resultSet.getString("prenom"));
        compte.setEmail(resultSet.getString("email"));
        compte.setMotDePasse(resultSet.getString("mot_de_passe"));
        compte.setNumeroDeTelephone(resultSet.getString("numero_de_telephone"));
        compte.setNiveauAcces(niveauAccesDaoImpl.getNiveauAcces(resultSet.getInt("niveau_acces_id")));
        return compte;
    }
}
