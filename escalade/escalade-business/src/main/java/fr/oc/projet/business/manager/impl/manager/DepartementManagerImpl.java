package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.DepartementManager;
import fr.oc.projet.model.bean.escalade.Departement;

import java.util.List;

public class DepartementManagerImpl extends AbstractManagerImpl implements DepartementManager {
    @Override
    public Departement getDepartement(Integer pId) {
        return getDaoFactory().getDepartementDao().getDepartement(pId);
    }

    @Override
    public List<Departement> getListDepartement() {
        return getDaoFactory().getDepartementDao().getListDepartement();
    }
}
