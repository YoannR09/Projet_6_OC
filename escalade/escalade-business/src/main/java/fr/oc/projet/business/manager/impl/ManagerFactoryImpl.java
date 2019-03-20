package fr.oc.projet.business.manager.impl;

import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.business.manager.contract.manager.CompteManager;
import fr.oc.projet.business.manager.contract.manager.NiveauAccesManager;
import fr.oc.projet.business.manager.contract.manager.TypeDeRocheManager;

import javax.inject.Inject;

public class ManagerFactoryImpl implements ManagerFactory {

    @Inject
    private CompteManager compteManager;
    @Inject
    private NiveauAccesManager niveauAccesManager;
    @Inject
    private TypeDeRocheManager typeDeRocheManager;


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
}
