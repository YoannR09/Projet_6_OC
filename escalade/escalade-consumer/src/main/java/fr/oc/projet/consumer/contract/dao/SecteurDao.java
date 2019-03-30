package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;

import java.util.List;

public interface SecteurDao {

    Secteur getSecteur(Integer pId);

    List<Secteur> getListSecteur();

    List<Secteur> getListSecteurSite(Integer siteId);

    Integer getCountSecteurSite(Integer siteId);

    void addSecteur(Secteur secteur);
}
