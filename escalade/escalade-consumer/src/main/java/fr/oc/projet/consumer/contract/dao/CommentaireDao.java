package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Commentaire;

import java.util.List;

public interface CommentaireDao {

    Commentaire getCommentaire(Integer pId);

    List<Commentaire> getListCommentaireSecteur(Integer secteurId);

    List<Commentaire> getListCommentaireTopo(Integer topoId);

    List<Commentaire> getListCommentaireSite(Integer siteId);
}
