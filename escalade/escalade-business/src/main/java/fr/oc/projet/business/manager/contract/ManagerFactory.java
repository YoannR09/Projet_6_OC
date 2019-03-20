package fr.oc.projet.business.manager.contract;

import fr.oc.projet.business.manager.contract.manager.*;
import fr.oc.projet.model.bean.escalade.Cotation;

public interface ManagerFactory {

    CompteManager getCompteManager();

    NiveauAccesManager getNiveauAccesManager();

    TypeDeRocheManager getTypeDeRocheManager();

    TopoManager getTopoManager();

    RegionManager getRegionManager();

    DepartementManager getDepartementManager();

    SiteManager getSiteManager();

    CotationManager getCotationManager();
}
