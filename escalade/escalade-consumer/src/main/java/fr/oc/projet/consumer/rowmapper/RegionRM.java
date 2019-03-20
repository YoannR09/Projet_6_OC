package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.model.bean.escalade.Region;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RegionRM implements RowMapper<Region> {

    @Override
    public Region mapRow(ResultSet resultSet, int i) throws SQLException {
        Region region = new Region();
        region.setId(resultSet.getInt("id"));
        region.setNom(resultSet.getString("nom"));
        return region;
    }
}
