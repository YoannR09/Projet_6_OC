package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.LikesManager;
import fr.oc.projet.model.bean.utilisateur.Likes;

public class LikesManagerImpl extends AbstractManagerImpl implements LikesManager {
    @Override
    public Likes getLikes(Integer pId) {
        return getDaoFactory().getLikesDao().getLikes(pId);
    }

    @Override
    public Boolean getLikeStatut(Integer comId, Integer compteId) {
        return getDaoFactory().getLikesDao().getLikeStatut(comId,compteId);
    }
}
