package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Message;

import java.util.List;

public interface MessageDao {

    Message getMessage(Integer pId);

    List<Message> getListMessage();
}
