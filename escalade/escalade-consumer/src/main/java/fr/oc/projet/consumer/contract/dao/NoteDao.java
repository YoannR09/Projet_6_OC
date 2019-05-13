package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteDao {

    Note getNote(Integer pId);

    Double getNoteTopo(Integer topoId);

    Double getNoteSite(Integer siteId);

    Integer getCheckNoteSite(Integer compteId, Integer siteId);

    Integer getCheckNoteTopo(Integer compteId, Integer topoId);

    void addNote(Note note);
}
