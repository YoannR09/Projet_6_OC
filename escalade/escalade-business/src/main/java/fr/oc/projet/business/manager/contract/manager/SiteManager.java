package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;

import java.util.List;

public interface SiteManager {

    Site getSite(Integer pId);

    Site getSiteViaNom(String nom);

    List<Site> getListSiteValide();

    List<Site> getListSiteNonValide();

    List<Site> getListSiteValidePageDown(Integer lastId);

    List<Site> getListSiteValidePageUp(Integer lastId);

    List<Site> rechercheSite(String text);

    void addSite(Site site);

    int getCountSite();

    void updateSite(Site site);


}
