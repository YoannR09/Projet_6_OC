package fr.oc.projet.consumer.rowmapper;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.model.bean.utilisateur.Message;
import org.springframework.jdbc.core.RowMapper;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.ResultSet;
import java.sql.SQLException;

@Named
public class MessageRM implements RowMapper<Message> {

    @Inject
    CompteDao compteDao;

    @Override
    public Message mapRow(ResultSet resultSet, int i) throws SQLException {


        Message message = new Message();
        message.setId(resultSet.getInt("id"));
        message.setObjet(resultSet.getString("objet"));
        message.setContenu(resultSet.getString("contenu"));
        message.setDate(resultSet.getDate("date"));
        message.setAuteur(compteDao.getCompte(resultSet.getInt("compte_id")));
        return message;
    }
}
