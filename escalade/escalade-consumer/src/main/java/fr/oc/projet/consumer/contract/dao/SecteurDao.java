package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Secteur;

import java.util.List;

public interface SecteurDao {

    Secteur getSecteur(Integer pId);

    List<Secteur> getListSecteur();
}
