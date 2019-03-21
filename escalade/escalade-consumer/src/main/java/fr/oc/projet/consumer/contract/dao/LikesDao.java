package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Likes;

public interface LikesDao {

    Likes getLikes(Integer pId);

    Boolean getLikeStatut(Integer comId,Integer compteId);
}
