package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Note;

public interface NoteDao {

    Note getNote(Integer pId);

    float getNoteTopo(Integer topoId);

    float getNoteSite(Integer siteId);
}
