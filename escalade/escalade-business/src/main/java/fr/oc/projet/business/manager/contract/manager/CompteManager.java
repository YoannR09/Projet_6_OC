package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.utilisateur.Compte;

import java.util.List;

public interface CompteManager {

    Compte getCompteViaPseudo(String pseudo);

    Compte getCompte(Integer pId);

    List<Compte> getListCompte();

    void addCompte(Compte compte);
}
