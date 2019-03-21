package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Likes;

public interface LikesManager {

    Likes getLikes(Integer pId);

    Boolean getLikeStatut(Integer comId,Integer compteId);
}
