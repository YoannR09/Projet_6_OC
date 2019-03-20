package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.TypeDeRoche;

import java.util.List;

public interface TypeDeRocheManager {

    TypeDeRoche getTypeDeRoche(Integer pId);

    List<TypeDeRoche> getListTypeDeRoche();
}
