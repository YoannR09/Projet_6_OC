package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.escalade.Region;

import java.util.List;

public interface RegionManager {

    Region getRegion(Integer pId);

    List<Region> getListRegion();
}
