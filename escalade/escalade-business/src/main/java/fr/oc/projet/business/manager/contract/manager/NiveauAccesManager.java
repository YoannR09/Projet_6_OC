package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.NiveauAcces;

import java.util.List;

public interface NiveauAccesManager {

    NiveauAcces getNiveauAcces(Integer pId);

    List<NiveauAcces> getListNiveauAcces();
}
