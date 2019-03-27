package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.utilisateur.Compte;

import java.util.List;

public interface CompteDao {

    Compte getCompteViaPseudo(String pseudo);

    Compte getCompte(Integer pId);

    List<Compte> getListCompte();

    void addCompte(Compte compte);
}
