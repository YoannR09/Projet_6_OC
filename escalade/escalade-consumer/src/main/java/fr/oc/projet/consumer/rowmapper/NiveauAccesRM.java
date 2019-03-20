package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.model.bean.utilisateur.NiveauAcces;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class NiveauAccesRM implements RowMapper<NiveauAcces> {
    @Override
    public NiveauAcces mapRow(ResultSet resultSet, int i) throws SQLException {

        NiveauAcces niveauAcces = new NiveauAcces();
        niveauAcces.setId(resultSet.getInt("id"));
        niveauAcces.setLabelle(resultSet.getString("labelle"));
        niveauAcces.setNiveau(resultSet.getInt("niveau"));

        return niveauAcces;
    }
}
