package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Cotation;

import java.util.List;

public interface CotationManager {

    Cotation getCotation(Integer pId);

    List<Cotation> getListCotation();
}
