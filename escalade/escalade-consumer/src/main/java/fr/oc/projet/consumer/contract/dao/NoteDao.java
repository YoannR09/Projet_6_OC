package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteDao {

    Note getNote(Integer pId);

    Double getNoteTopo(Integer topoId);

    Double getNoteSite(Integer siteId);

    void addNote(Note note);
}
