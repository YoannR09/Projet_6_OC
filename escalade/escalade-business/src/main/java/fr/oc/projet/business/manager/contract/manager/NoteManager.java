package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteManager {

    Note getNote(Integer pId);

    float getNoteTopo(Integer topoId);

    float getNoteSite(Integer siteId);
}
