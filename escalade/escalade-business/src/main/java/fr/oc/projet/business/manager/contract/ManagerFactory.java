package fr.oc.projet.business.manager.contract;

import fr.oc.projet.business.manager.contract.manager.CompteManager;
import fr.oc.projet.business.manager.contract.manager.NiveauAccesManager;
import fr.oc.projet.business.manager.contract.manager.TypeDeRocheManager;

public interface ManagerFactory {

    CompteManager getCompteManager();

    NiveauAccesManager getNiveauAccesManager();

    TypeDeRocheManager getTypeDeRocheManager();
}
