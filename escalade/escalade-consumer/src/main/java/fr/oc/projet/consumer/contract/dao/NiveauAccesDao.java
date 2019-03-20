package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.NiveauAcces;

import java.util.List;

public interface NiveauAccesDao {

    NiveauAcces getNiveauAcces(Integer pId);

    List<NiveauAcces> getListNiveauAcces();
}
