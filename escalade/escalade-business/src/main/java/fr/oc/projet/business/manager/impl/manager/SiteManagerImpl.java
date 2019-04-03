package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.SiteManager;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;

import javax.inject.Named;
import java.util.List;

@Named
public class SiteManagerImpl extends AbstractManagerImpl implements SiteManager {


    @Override
    public Site getSite(Integer pId) {
        return getDaoFactory().getSiteDao().getSite(pId);
    }

    @Override
    public Site getSiteViaNom(String nom) {
        return getDaoFactory().getSiteDao().getSiteViaNom(nom);
    }

    @Override
    public List<Site> getListSiteValide() {
        return getDaoFactory().getSiteDao().getListSiteValide();
    }

    @Override
    public List<Site> getListSiteNonValide() {
        return getDaoFactory().getSiteDao().getListSiteNonValide();
    }

    @Override
    public List<Site> getListSiteValidePageDown(Integer lastId) {
        return getDaoFactory().getSiteDao().getListSiteValidePageDown(lastId);
    }

    @Override
    public List<Site> getListSiteValidePageUp(Integer lastId) {
        return getDaoFactory().getSiteDao().getListSiteValidePageUp(lastId);
    }

    @Override
    public void addSite(Site site) {
        getDaoFactory().getSiteDao().addSite(site);
    }

    @Override
    public int getCountSite() {
        return getDaoFactory().getSiteDao().getCountSite();
    }
}
