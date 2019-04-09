package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.TopoDao;
import fr.oc.projet.consumer.rowmapper.TopoRM;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.NiveauAcces;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameterValue;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
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
        String vSQL = "SELECT * FROM topo WHERE nom = '"+nom+"'";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Topo topo = vJdbcTemplate.queryForObject(vSQL,topoRM);
        return topo;
    }

    @Override
    public List<Topo> getListTopo() {
        String vSQL = "SELECT * FROM topo LIMIT 3";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList;
    }

    @Override
    public List<Topo> getListTopoValide() {
        String vSQL = "SELECT * FROM topo WHERE valide = TRUE";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList;
    }

    @Override
    public List<Topo> getListTopoNonValide() {
        String vSQL = "SELECT * FROM topo WHERE valide = FALSE";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList;
    }

    @Override
    public List<Topo> getListTopoValidePageDown(Integer lastId) {
        String vSQL = "SELECT * FROM topo " +
                " WHERE valide = true " +
                " AND id > "+(lastId-3)+
                " ORDER BY id DESC" +
                " LIMIT 5";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList ;
    }

    @Override
    public List<Topo> getListTopoValidePageUp(Integer lastId) {
        String vSQL = "SELECT * FROM topo " +
                " WHERE valide = true " +
                " AND id < "+lastId+
                " ORDER BY id DESC" +
                " LIMIT 5";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Topo> vList = vJdbcTemplate.query(vSQL,topoRM);
        return vList ;
    }

    @Override
    public void addTopo(Topo topo) {
        String vSQL = "INSERT INTO topo (nom, description, date_de_creation, valide, responsable_id)" +
                " VALUES (:nom, :description, :date, :valide, :responsableId)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(topo);
        vParams.registerSqlType("nom", Types.VARCHAR);
        vParams.registerSqlType("description", Types.VARCHAR);
        vParams.registerSqlType("date", Types.DATE);
        vParams.registerSqlType("valide", Types.BOOLEAN);
        vParams.registerSqlType("responsableId", Types.INTEGER);


        try {
            vJdbcTemplate.update(vSQL, vParams);
        } catch (DuplicateKeyException vEx) {
        }
    }

    @Override
    public int getCountTopo() {
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        int vNbrTopo = vJdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM public.topo",
                Integer.class);
        return vNbrTopo;
    }

    @Override
    public void update(Topo topo) {
        String vSQL = "UPDATE topo SET valide = ? WHERE id = ?";

        Object[] vParams = {
                new SqlParameterValue(Types.BOOLEAN, topo.getValide()),
                new SqlParameterValue(Types.INTEGER, topo.getId()),

        };

        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        vJdbcTemplate.update(vSQL, vParams);
    }
}
