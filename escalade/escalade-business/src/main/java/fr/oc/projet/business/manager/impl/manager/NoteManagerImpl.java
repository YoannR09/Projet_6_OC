package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.NoteManager;
import fr.oc.projet.model.bean.utilisateur.Note;

import javax.inject.Named;

@Named
public class NoteManagerImpl extends AbstractManagerImpl implements NoteManager {
    @Override
    public Note getNote(Integer pId) {
        return getDaoFactory().getNoteDao().getNote(pId);
    }

    @Override
    public Double getNoteTopo(Integer topoId) {
        return getDaoFactory().getNoteDao().getNoteTopo(topoId);
    }

    @Override
    public Double getNoteSite(Integer siteId) {
        return getDaoFactory().getNoteDao().getNoteSite(siteId);
    }

    @Override
    public Integer getCheckNoteSite(Integer compteId, Integer siteId) {
        return getDaoFactory().getNoteDao().getCheckNoteSite(compteId,siteId);
    }

    @Override
    public Integer getCheckNoteTopo(Integer compteId, Integer topoId) {
        return getDaoFactory().getNoteDao().getCheckNoteTopo(compteId,topoId);
    }

    @Override
    public void addNote(Note note) {
        getDaoFactory().getNoteDao().addNote(note);
    }
}
