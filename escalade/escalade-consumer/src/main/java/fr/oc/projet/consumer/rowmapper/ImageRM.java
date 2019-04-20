package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.SiteDao;
import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.model.bean.Image;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class ImageRM implements RowMapper<Image> {

    @Inject
    CompteDao compteDao;
    @Inject
    SiteDao siteDao;
    @Inject
    TopoDao topoDao;

    @Override
    public Image mapRow(ResultSet resultSet, int i) throws SQLException {

        Image image = new Image();
        image.setId(resultSet.getInt("id"));
        image.setUrlImage(resultSet.getString("url"));
        image.setDescription(resultSet.getString("description"));
        image.setImageDePresentation(resultSet.getBoolean("image_de_presentation"));
        if(resultSet.getInt("compte_id") != 0) {
            image.setCompte(compteDao.getCompte(resultSet.getInt("compte_id")));
        }
        if(resultSet.getInt("site_id") != 0) {
            image.setSite(siteDao.getSite(resultSet.getInt("site_id")));
        }

        if(resultSet.getInt("topo_id") != 0) {
            image.setTopo(topoDao.getTopo(resultSet.getInt("topo_id")));
        }
        return image;
    }
}
