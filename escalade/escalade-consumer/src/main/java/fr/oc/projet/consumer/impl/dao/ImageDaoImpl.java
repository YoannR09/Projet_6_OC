package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.ImageDao;
import fr.oc.projet.consumer.rowmapper.ImageRM;
import fr.oc.projet.model.bean.Image;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
import java.util.List;

@Named
public class ImageDaoImpl extends AbstractDaoImpl implements ImageDao {

    @Inject
    ImageRM imageRM;


    @Override
    public Image getImage(Integer pId) {
        String vSQL = "SELECT * FROM image WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Image image = vJdbcTemplate.queryForObject(vSQL,imageRM);
        return image;
    }

    @Override
    public List<Image> getListImage() {
        String vSQL = "SELECT * FROM image ";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Image> vList = vJdbcTemplate.query(vSQL,imageRM);
        return vList;
    }

    @Override
    public List<Image> getListImageSite(Integer siteId) {
        String vSQL = "SELECT * FROM image WHERE spot_id ="+siteId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Image> vList = vJdbcTemplate.query(vSQL,imageRM);
        return vList;
    }

    @Override
    public List<Image> getListImageTopo(Integer topoId) {
        String vSQL = "SELECT * FROM image WHERE topo_id = "+topoId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Image> vList = vJdbcTemplate.query(vSQL,imageRM);
        return vList;
    }

    @Override
    public void addImage(Image image) {

        String vSQL = "INSERT INTO image (url, image_de_presentation, topo_id, spot_id, compte_id)" +
                " VALUES (:url, :imageDePresentation, :topoId, :siteId, :compteId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(image);
        vParams.registerSqlType("url", Types.VARCHAR);
        vParams.registerSqlType("imageDepresentation", Types.BOOLEAN);
        vParams.registerSqlType("topoId", Types.INTEGER);
        vParams.registerSqlType("siteId", Types.INTEGER);
        vParams.registerSqlType("compteId", Types.INTEGER);
        vJdbcTemplate.update(vSQL, vParams);

    }
}
