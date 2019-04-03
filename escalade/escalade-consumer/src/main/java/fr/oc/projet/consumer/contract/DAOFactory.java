package fr.oc.projet.consumer.contract;

import fr.oc.projet.consumer.contract.dao.*;

public interface DAOFactory {

    CompteDao getCompteDao();

    NiveauAccesDao getNiveauAccesDao();

    TypeDeRocheDao getTypeDeRocheDao();

    TopoDao getTopoDao();

    RegionDao getRegionDao();

    DepartementDao getDepartementDao();

    SiteDao getSiteDao();

    CotationDao getCotationDao();

    MessageDao getMessageDao();

    SecteurDao getSecteurDao();

    VoieDao getVoieDao();

    ReservationDao getReservationDao();

    NoteDao getNoteDao();

    CommentaireDao getCommentaireDao();

    LikesDao getLikesDao();

    ImageDao getImageDao();

}
