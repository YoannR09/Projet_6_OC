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
        return getDaoFactory().getVoieDao().getListVoie();
    }

    @Override
    public List<Voie> getListVoieSecteur(Integer secteurId) {
        return getDaoFactory().getVoieDao().getListVoieSecteur(secteurId);
    }

    @Override
    public List<Voie> getListVoieSite(Integer siteId) {
        return getDaoFactory().getVoieDao().getListVoieSite(siteId);
    }

    @Override
    public void addVoie(Voie voie) {
        getDaoFactory().getVoieDao().addVoie(voie);
    }

    @Override
    public void deleteVoie(Integer siteId) {
        getDaoFactory().getVoieDao().deleteVoie(siteId);
    }
}
