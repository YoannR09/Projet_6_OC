package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.NiveauAccesManager;
import fr.oc.projet.model.bean.utilisateur.NiveauAcces;

import javax.inject.Named;
import java.util.List;


@Named
public class NiveauAccesManagerImpl extends AbstractManagerImpl implements NiveauAccesManager {
    @Override
    public NiveauAcces getNiveauAcces(Integer niveau) {
        return getDaoFactory().getNiveauAccesDao().getNiveauAcces(niveau);
    }

    @Override
    public List<NiveauAcces> getListNiveauAcces() {
        return getDaoFactory().getNiveauAccesDao().getListNiveauAcces();
    }
}
