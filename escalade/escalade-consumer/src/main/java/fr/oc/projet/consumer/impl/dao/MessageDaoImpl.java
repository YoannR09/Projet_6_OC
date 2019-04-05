package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.MessageDao;
import fr.oc.projet.consumer.rowmapper.MessageRM;
import fr.oc.projet.model.bean.escalade.Departement;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Message;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Types;
import java.util.List;

@Named
public class MessageDaoImpl extends AbstractDaoImpl implements MessageDao {

    @Inject
    MessageRM messageRM;

    @Override
    public Message getMessage(Integer pId) {
        String vSQL = "SELECT * FROM message WHERE id ="+pId;
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        Message message = vJdbcTemplate.queryForObject(vSQL,messageRM);
        return message;
    }

    @Override
    public List<Message> getListMessage() {
        String vSQL = "SELECT * FROM message";
        JdbcTemplate vJdbcTemplate = new JdbcTemplate(getDataSource());
        List<Message> vList = vJdbcTemplate.query(vSQL,messageRM);
        return vList;
    }

    @Override
    public void addMessage(Message message) {


        String vSQL = "INSERT INTO message (compte_id, objet, contenu, date)" +
                " VALUES (:compteId, :objet, :contenu, :date)";
        NamedParameterJdbcTemplate vJdbcTemplate = new NamedParameterJdbcTemplate(getDataSource());

        BeanPropertySqlParameterSource vParams = new BeanPropertySqlParameterSource(message);
        vParams.registerSqlType("compteId", Types.INTEGER);
        vParams.registerSqlType("objet", Types.VARCHAR);
        vParams.registerSqlType("contenu", Types.VARCHAR);
        vParams.registerSqlType("password", Types.DATE);

        vJdbcTemplate.update(vSQL, vParams);

    }
}
