package fr.oc.projet.business.manager.contract;

import fr.oc.projet.business.manager.contract.manager.*;

public interface ManagerFactory {

    CompteManager getCompteManager();

    NiveauAccesManager getNiveauAccesManager();

    TypeDeRocheManager getTypeDeRocheManager();

    TopoManager getTopoManager();

    RegionManager getRegionManager();

    DepartementManager getDepartementManager();

    SiteManager getSiteManager();

    CotationManager getCotationManager();

    MessageManager getMessageManager();

    SecteurManager getSecteurManager();

    VoieManager getVoieManager();

    ReservationManager getReservationManager();

    NoteManager getNoteManager();

    CommentaireManager getCommentaireManager();

    LikesManager getLikesManager();
}
