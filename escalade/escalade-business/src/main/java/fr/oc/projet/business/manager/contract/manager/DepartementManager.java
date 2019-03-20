package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Departement;

import java.util.List;

public interface DepartementManager {

    Departement getDepartement(Integer pId);

    List<Departement> getListDepartement();
}
