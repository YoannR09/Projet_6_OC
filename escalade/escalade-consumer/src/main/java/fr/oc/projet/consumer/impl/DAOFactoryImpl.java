package fr.oc.projet.consumer.impl;

import fr.oc.projet.consumer.contract.DAOFactory;
import fr.oc.projet.consumer.contract.dao.*;

import javax.inject.Inject;
import javax.inject.Named;

@Named("daoFactoryImpl")
public class DAOFactoryImpl implements DAOFactory {

    @Inject
    private CompteDao compteDao;
    @Inject
    private NiveauAccesDao niveauAccesDao;
    @Inject
    private TypeDeRocheDao typeDeRocheDao;
    @Inject
    private TopoDao topoDao;
    @Inject
    private RegionDao regionDao;
    @Inject
    private DepartementDao departementDao;
    @Inject
    private SiteDao siteDao;
    @Inject
    private CotationDao cotationDao;



    @Override
    public CompteDao getCompteDao() {
        return this.compteDao;
    }

    @Override
    public NiveauAccesDao getNiveauAccesDao() {
        return this.niveauAccesDao;
    }

    @Override
    public TypeDeRocheDao getTypeDeRocheDao() {
        return this.typeDeRocheDao;
    }

    @Override
    public TopoDao getTopoDao() {
        return this.topoDao;
    }

    @Override
    public RegionDao getRegionDao() {
        return this.regionDao;
    }

    @Override
    public DepartementDao getDepartementDao() {
        return this.departementDao;
    }

    @Override
    public SiteDao getSiteDao() {
        return this.siteDao;
    }

    @Override
    public CotationDao getCotationDao() {
        return this.cotationDao;
    }
}
