package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.CommentaireManager;
import fr.oc.projet.model.bean.utilisateur.Commentaire;

import javax.inject.Named;
import java.util.List;

@Named
public class CommentaireManagerImpl extends AbstractManagerImpl implements CommentaireManager {

    @Override
    public Commentaire getCommentaire(Integer pId) {
        return getDaoFactory().getCommentaireDao().getCommentaire(pId);
    }

    @Override
    public List<Commentaire> getListCommentaireSecteur(Integer secteurId) {
        return getDaoFactory().getCommentaireDao().getListCommentaireSecteur(secteurId);
    }

    @Override
    public List<Commentaire> getListCommentaireTopo(Integer topoId) {
        return getDaoFactory().getCommentaireDao().getListCommentaireTopo(topoId);
    }

    @Override
    public List<Commentaire> getListCommentaireSite(Integer siteId) {
        return getDaoFactory().getCommentaireDao().getListCommentaireSite(siteId);
    }
}
