package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CotationDao;
import fr.oc.projet.consumer.rowmapper.CompteRM;
import fr.oc.projet.consumer.rowmapper.CotationRM;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Departement;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class CotationDaoImpl extends AbstractDaoImpl implements CotationDao {

    @Inject
    CotationRM cotationRM;

    @Override
    public Cotation getCotation(Integer pId) {
        String vSQL = "SELECT * FROM cotation WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Cotation cotation = vJdbcTemplate.queryForObject(vSQL,cotationRM);
        return cotation;
    }

    @Override
    public List<Cotation> getListCotation() {
        String vSQL = "SELECT * FROM cotation";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Cotation> vList = vJdbcTemplate.query(vSQL,cotationRM);
        return vList;
    }
}
