package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.consumer.contract.DAOFactory;

public abstract class AbstractManagerImpl {

    private static DAOFactory daoFactory;

    public static DAOFactory getDaoFactory() {
        return daoFactory;
    }
    public static  void setDaoFactory(DAOFactory pDAOFactory){
        daoFactory = pDAOFactory;
    }
}
