package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteManager {

    Note getNote(Integer pId);

    Double getNoteTopo(Integer topoId);

    Double getNoteSite(Integer siteId);

    Integer getCheckNoteSite(Integer compteId, Integer siteId);

    Integer getCheckNoteTopo(Integer compteId, Integer topoId);

    void addNote(Note note);
}
