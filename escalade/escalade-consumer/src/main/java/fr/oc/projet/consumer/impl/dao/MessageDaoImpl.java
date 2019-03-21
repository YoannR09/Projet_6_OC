package fr.oc.projet.consumer.impl.dao;

import fr.oc.projet.consumer.contract.dao.MessageDao;
import fr.oc.projet.consumer.rowmapper.MessageRM;
import fr.oc.projet.model.bean.escalade.Departement;
import fr.oc.projet.model.bean.utilisateur.Message;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.inject.Inject;
import javax.inject.Named;
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
}
