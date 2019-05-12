package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.SecteurManager;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;

import javax.inject.Named;
import java.util.List;

@Named
public class SecteurManagerImpl extends AbstractManagerImpl implements SecteurManager {


    @Override
    public Secteur getSecteur(Integer pId) {
        return getDaoFactory().getSecteurDao().getSecteur(pId);
    }

    @Override
    public Secteur getSecteurViaNom(String nom) {
        return getDaoFactory().getSecteurDao().getSecteurViaNom(nom);
    }

    @Override
    public List<Secteur> getListSecteur() {
        return getDaoFactory().getSecteurDao().getListSecteur();
    }

    @Override
    public List<Secteur> getListSecteurSite(Integer siteId) {
        return getDaoFactory().getSecteurDao().getListSecteurSite(siteId);
    }

    @Override
    public Integer getCountSecteurSite(Integer siteId) {
        return getDaoFactory().getSecteurDao().getCountSecteurSite(siteId);
    }

    @Override
    public void addSecteur(Secteur secteur) {
        getDaoFactory().getSecteurDao().addSecteur(secteur);
    }

    @Override
    public void deleteSecteur(Integer siteId) {
        getDaoFactory().getSecteurDao().deleteSecteur(siteId);
    }
}
