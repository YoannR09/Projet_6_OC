package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.VoieManager;
import fr.oc.projet.model.bean.escalade.Voie;

import javax.inject.Named;
import java.util.List;

@Named
public class VoieManagerImpl extends AbstractManagerImpl implements VoieManager {
    @Override
    public Voie getVoie(Integer pId) {
        return getDaoFactory().getVoieDao().getVoie(pId);
    }

    @Override
    public List<Voie> getListVoie() {
        return getDaoFactory().getVoieDao().getListVoir();
    }
}
