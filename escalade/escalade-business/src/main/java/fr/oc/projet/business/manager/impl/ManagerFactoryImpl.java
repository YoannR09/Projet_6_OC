package fr.oc.projet.business.manager.impl;

import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.business.manager.contract.manager.*;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class ManagerFactoryImpl implements ManagerFactory {

    @Inject
    private CompteManager compteManager;
    @Inject
    private NiveauAccesManager niveauAccesManager;
    @Inject
    private TypeDeRocheManager typeDeRocheManager;
    @Inject
    private TopoManager topoManager;
    @Inject
    private RegionManager regionManager;
    @Inject
    private DepartementManager departementManager;
    @Inject
    private SiteManager siteManager;
    @Inject
    private CotationManager cotationManager;


    @Override
    public CompteManager getCompteManager() {
        return this.compteManager;
    }

    @Override
    public NiveauAccesManager getNiveauAccesManager() {
        return this.niveauAccesManager;
    }

    @Override
    public TypeDeRocheManager getTypeDeRocheManager() {
        return this.typeDeRocheManager;
    }

    @Override
    public TopoManager getTopoManager() {
        return this.topoManager;
    }

    @Override
    public RegionManager getRegionManager() {
        return this.regionManager;
    }

    @Override
    public DepartementManager getDepartementManager() {
        return this.departementManager;
    }

    @Override
    public SiteManager getSiteManager() {
        return this.siteManager;
    }

    @Override
    public CotationManager getCotationManager() {
        return this.cotationManager;
    }
}
