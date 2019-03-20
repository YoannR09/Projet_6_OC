package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Departement;

import java.util.List;

public interface DepartementDao {

    Departement getDepartement(Integer pId);

    List<Departement> getListDepartement();
}
