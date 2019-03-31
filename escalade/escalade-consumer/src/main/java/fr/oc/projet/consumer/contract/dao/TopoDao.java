package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.escalade.Topo;

import java.util.List;

public interface TopoDao {

    Topo getTopo(Integer pId);

    Topo getTopoViaNom(String nom);

    List<Topo> getListTopo();

    List<Topo> getListTopoValide();

    List<Topo> getListTopoNonValide();

    void addTopo(Topo topo);
}
