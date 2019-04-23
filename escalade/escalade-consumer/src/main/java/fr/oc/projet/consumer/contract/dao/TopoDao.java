package fr.oc.projet.consumer.contract.dao;

import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;

import java.util.List;

public interface TopoDao {

    Topo getTopo(Integer pId);

    Topo getTopoViaNom(String nom);

    List<Topo> getListTopo();

    List<Topo> getListTopoValide();

    List<Topo> getListTopoNonValide();

    List<Topo> getListTopoValidePageDown(Integer lastId);

    List<Topo> getListTopoValidePageUp(Integer lastId);

    List<Topo> rechercheTopo(String text);

    void addTopo(Topo topo);

    int getCountTopo();

    void update(Topo topo);
}
