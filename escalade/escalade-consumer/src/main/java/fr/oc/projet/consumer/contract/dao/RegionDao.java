package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Region;

import java.util.List;

public interface RegionDao {

    Region getRegion(Integer pId);

    List<Region> getListRegion();
}
