package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;

import java.util.List;

public interface SiteDao {

    Site getSite(Integer pId);

    Site getSiteViaNom(String nom);

    List<Site> getListSiteValide();

    List<Site> getListSiteNonValide();

    void addSite(Site site);

    int getCountSite();
}
