package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;

import java.util.List;

public interface SecteurManager {

    Secteur getSecteur(Integer pId);

    List<Secteur> getListSecteur();

    List<Secteur> getListSecteurSite(Integer siteId);

    void addSecteur(Secteur secteur);
}
