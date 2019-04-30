package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Voie;

import java.util.List;

public interface VoieDao {
    Voie getVoie(Integer pId);

    List<Voie> getListVoie();

    List<Voie> getListVoieSite(Integer idSite);

    List<Voie> getListVoieSecteur(Integer idSecteur);

    Integer getCountVoieSecteur(Integer idSecteur);

    Integer getCountVoieSite(Integer idSite);

    Integer getHauteurMaxSecteur(Integer secteurId);

    Integer getHauteurMinSecteur(Integer secteurId);

    void addVoie(Voie voie);

    void deleteVoie(Integer siteId);
}
