package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.RegionDao;
import fr.oc.projet.consumer.rowmapper.RegionRM;
import fr.oc.projet.model.bean.escalade.Region;
import fr.oc.projet.model.bean.escalade.TypeDeRoche;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;


@Named
public class RegionDaoImpl extends AbstractDaoImpl implements RegionDao {

    @Inject
    RegionRM regionRM;

    @Override
    public Region getRegion(Integer pId) {
        String vSQL = "SELECT * FROM region WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Region region = vJdbcTemplate.queryForObject(vSQL,regionRM);
        return region;
    }

    @Override
    public List<Region> getListRegion() {
        String vSQL = "SELECT * FROM region";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Region> vList = vJdbcTemplate.query(vSQL,regionRM);
        return vList;
    }
}
