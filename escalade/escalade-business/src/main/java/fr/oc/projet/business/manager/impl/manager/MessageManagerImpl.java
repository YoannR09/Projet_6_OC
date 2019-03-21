package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.MessageManager;
import fr.oc.projet.model.bean.utilisateur.Message;

import javax.inject.Named;
import java.util.List;

@Named
public class MessageManagerImpl extends AbstractManagerImpl implements MessageManager {
    @Override
    public Message getMessage(Integer pId) {
        return getDaoFactory().getMessageDao().getMessage(pId);
    }

    @Override
    public List<Message> getListMessage() {
        return getDaoFactory().getMessageDao().getListMessage();
    }
}
