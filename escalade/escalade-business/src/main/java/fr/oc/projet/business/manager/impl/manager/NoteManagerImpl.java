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
    public float getNoteTopo(Integer topoId) {
        return getDaoFactory().getNoteDao().getNoteTopo(topoId);
    }

    @Override
    public float getNoteSite(Integer siteId) {
        return getDaoFactory().getNoteDao().getNoteSite(siteId);
    }
}
