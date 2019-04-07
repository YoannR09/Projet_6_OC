package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Commentaire;

import java.util.List;

public interface CommentaireManager {

    Commentaire getCommentaire(Integer pId);

    List<Commentaire> getListCommentaireSecteur(Integer secteurId);

    List<Commentaire> getListCommentaireTopo(Integer topoId);

    List<Commentaire> getListCommentaireSite(Integer siteId);

    void addCommentaire(Commentaire commentaire);
}
