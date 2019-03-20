package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.SiteManager;
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
    public List<Site> getListSite() {
        return getDaoFactory().getSiteDao().getListSite();
    }
}
