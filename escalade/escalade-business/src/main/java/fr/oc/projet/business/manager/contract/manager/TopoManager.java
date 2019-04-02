package fr.oc.projet.business.manager.contract.manager;

import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Topo;

import java.util.List;

public interface TopoManager {

    Topo getTopo(Integer pId);

    Topo getTopoViaNom(String nom);

    List<Topo> getListTopo();

    List<Topo> getListTopoValide();

    List<Topo> getListTopoNonValide();

    int getCountTopo();
}
