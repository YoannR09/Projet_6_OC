package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.TypeDeRoche;

import java.util.List;

public interface TypeDeRocheDao {

    TypeDeRoche getTypeDeRoche(Integer pId);

    List<TypeDeRoche> getListTypeDeRoche();
}
