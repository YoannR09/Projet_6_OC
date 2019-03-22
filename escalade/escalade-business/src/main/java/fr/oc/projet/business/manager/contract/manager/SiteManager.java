package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Site;

import java.util.List;

public interface SiteManager {

    Site getSite(Integer pId);

    Site getSiteViaNom(String nom);

    List<Site> getListSiteValide();

    List<Site> getListSiteNonValide();
}
