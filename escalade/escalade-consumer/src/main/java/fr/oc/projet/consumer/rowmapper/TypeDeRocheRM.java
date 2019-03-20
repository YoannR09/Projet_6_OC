package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.model.bean.escalade.TypeDeRoche;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TypeDeRocheRM implements RowMapper<TypeDeRoche> {

    @Override
    public TypeDeRoche mapRow(ResultSet resultSet, int i) throws SQLException {

        TypeDeRoche typeDeRoche = new TypeDeRoche();

        typeDeRoche.setId(resultSet.getInt("id"));
        typeDeRoche.setType(resultSet.getString("type"));
        return typeDeRoche;
    }
}
