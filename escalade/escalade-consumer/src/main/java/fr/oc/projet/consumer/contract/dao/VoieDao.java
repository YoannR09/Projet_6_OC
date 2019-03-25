package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Voie;

import java.util.List;

public interface VoieDao {
    Voie getVoie(Integer pId);

    List<Voie> getListVoir();

    Integer getCountVoieSecteur(Integer idSecteur);

    Integer getCountVoieSite(Integer idSite);

    Integer getHauteurMaxSecteur(Integer secteurId);

    Integer getHauteurMinSecteur(Integer secteurId);
}
