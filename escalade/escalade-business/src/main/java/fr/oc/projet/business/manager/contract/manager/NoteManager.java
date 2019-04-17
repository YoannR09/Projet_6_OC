package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteManager {

    Note getNote(Integer pId);

    Double getNoteTopo(Integer topoId);

    Double getNoteSite(Integer siteId);

    void addNote(Note note);
}
