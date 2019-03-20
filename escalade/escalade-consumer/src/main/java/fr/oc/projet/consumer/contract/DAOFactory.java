package fr.oc.projet.consumer.contract;

import fr.oc.projet.consumer.contract.dao.CompteDao;
import fr.oc.projet.consumer.contract.dao.NiveauAccesDao;
import fr.oc.projet.consumer.contract.dao.TypeDeRocheDao;

public interface DAOFactory {

    CompteDao getCompteDao();

    NiveauAccesDao getNiveauAccesDao();

    TypeDeRocheDao getTypeDeRocheDao();

}
