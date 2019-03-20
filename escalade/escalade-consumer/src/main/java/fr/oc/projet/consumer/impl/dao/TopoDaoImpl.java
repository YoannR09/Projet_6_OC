package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.consumer.rowmapper.TopoRM;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.NiveauAcces;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class TopoDaoImpl extends AbstractDaoImpl implements TopoDao {

    @Inject
    TopoRM topoRM;

    @Override
    public Topo getTopo(Integer pId) {
        String vSQL = "SELECT * FROM topo WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Topo topo = vJdbcTemplate.queryForObject(vSQL,topoRM);
        return topo;
    }

    @Override
    public Topo getTopoViaNom(String nom) {
        String vSQL = "SELECT * FROM topo WHERE nom ="+nom;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Topo topo = vJdbcTemplate.queryForObject(vSQL,topoRM);
        return topo;
    }

    @Override
    public List<Topo> getListTopo() {
        String vSQL = "SELECT * FROM topo";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList;
    }
}
