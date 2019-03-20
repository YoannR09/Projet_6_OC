package fr.oc.projet.consumer.impl;

import fr.oc.projet.consumer.contract.DAOFactory;
import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.NiveauAccesDao;
import fr.oc.projet.consumer.contract.dao.TypeDeRocheDao;

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
}
