package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Voie;

import java.util.List;

public interface VoieManager {
    Voie getVoie(Integer pId);

    List<Voie> getListVoie();
}
