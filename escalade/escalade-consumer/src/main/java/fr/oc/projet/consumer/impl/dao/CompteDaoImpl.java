package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.rowmapper.CompteRM;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;


@Named
public class CompteDaoImpl extends AbstractDaoImpl implements CompteDao {

    @Inject
    CompteRM compteRM;

    @Override
    public Compte getCompteViaPseudo(String pseudo) {
        String vSQL = "SELECT * FROM compte WHERE pseudo ="+pseudo;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Compte compte = vJdbcTemplate.queryForObject(vSQL,compteRM);
        return compte;
    }

    @Override
    public Compte getCompte(Integer pId) {
        String vSQL = "SELECT * FROM compte WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Compte compte = vJdbcTemplate.queryForObject(vSQL,compteRM);
        return compte;
    }

    @Override
    public List<Compte> getListCompte() {
        String vSQL = "SELECT * FROM compte WHERE";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Compte> vList = vJdbcTemplate.query(vSQL,compteRM);
        return vList;
    }
}
