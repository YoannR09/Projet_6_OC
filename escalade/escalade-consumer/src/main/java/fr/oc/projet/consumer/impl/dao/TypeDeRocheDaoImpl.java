package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.TypeDeRocheDao;
import fr.oc.projet.consumer.rowmapper.TypeDeRocheRM;
import fr.oc.projet.model.bean.escalade.TypeDeRoche;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import java.util.List;

public class TypeDeRocheDaoImpl extends AbstractDaoImpl implements TypeDeRocheDao {

    @Inject
    TypeDeRocheRM typeDeRocheRM;

    @Override
    public TypeDeRoche getTypeDeRoche(Integer pId) {
        String vSQL = "SELECT * FROM type_de_roche WHERE type ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        TypeDeRoche typeDeRoche = vJdbcTemplate.queryForObject(vSQL,typeDeRocheRM);
        return typeDeRoche;
    }

    @Override
    public List<TypeDeRoche> getListTypeDeRoche() {
        String vSQL = "SELECT * FROM type_de_roche WHERE";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<TypeDeRoche> vList = vJdbcTemplate.query(vSQL,typeDeRocheRM);
        return vList;
    }
}
