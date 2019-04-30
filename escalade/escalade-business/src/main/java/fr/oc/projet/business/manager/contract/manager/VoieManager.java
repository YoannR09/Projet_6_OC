package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Voie;

import java.util.List;

public interface VoieManager {
    Voie getVoie(Integer pId);

    List<Voie> getListVoie();

    List<Voie> getListVoieSecteur(Integer secteurId);

    List<Voie> getListVoieSite(Integer siteId);

    void addVoie(Voie voie);

    void deleteVoie(Integer siteId);
}
