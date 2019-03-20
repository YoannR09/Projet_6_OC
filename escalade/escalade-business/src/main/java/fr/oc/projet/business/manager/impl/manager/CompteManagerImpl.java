package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.CompteManager;
import fr.oc.projet.model.bean.utilisateur.Compte;

import java.util.List;

public class CompteManagerImpl extends AbstractManagerImpl implements CompteManager {

    @Override
    public Compte getCompte(Integer pId) {
        return getDaoFactory().getCompteDao().getCompte(pId);
    }


    @Override
    public Compte getCompteViaPseudo(String pseudo) {
        return getDaoFactory().getCompteDao().getCompteViaPseudo(pseudo);
    }

    @Override
    public List<Compte> getListCompte() {
        return getDaoFactory().getCompteDao().getListCompte();
    }
}
