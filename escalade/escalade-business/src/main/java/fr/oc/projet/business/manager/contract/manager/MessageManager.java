package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Message;

import java.util.List;

public interface MessageManager {

    Message getMessage(Integer pId);

    List<Message> getListMessage();

    void addMessage(Message message);
}
