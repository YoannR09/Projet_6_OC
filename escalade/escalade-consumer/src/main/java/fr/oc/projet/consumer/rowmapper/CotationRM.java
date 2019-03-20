package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.model.bean.escalade.Cotation;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class CotationRM implements RowMapper<Cotation> {

    @Override
    public Cotation mapRow(ResultSet resultSet, int i) throws SQLException {
        Cotation cotation = new Cotation();
        cotation.setId(resultSet.getInt("id"));
        cotation.setNiveau(resultSet.getInt("niveau"));
        cotation.setValeur(resultSet.getString("valeur"));
        cotation.setCouleur(resultSet.getString("couleur"));
        return cotation;
    }
}
