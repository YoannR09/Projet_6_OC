package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Cotation;

import java.util.List;

public interface CotationDao {

    Cotation getCotation(Integer pId);

    List<Cotation> getListCotation();
}
