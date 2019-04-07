package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.TopoManager;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Topo;

import javax.inject.Named;
import java.util.List;


@Named
public class TopoManagerImpl extends AbstractManagerImpl implements TopoManager {

    @Override
    public Topo getTopo(Integer pId) {
        return getDaoFactory().getTopoDao().getTopo(pId);
    }

    @Override
    public Topo getTopoViaNom(String nom) {
        return getDaoFactory().getTopoDao().getTopoViaNom(nom);
    }

    @Override
    public List<Topo> getListTopo() {
        return getDaoFactory().getTopoDao().getListTopo();
    }

    @Override
    public List<Topo> getListTopoValide() {
        return getDaoFactory().getTopoDao().getListTopoValide();
    }

    @Override
    public List<Topo> getListTopoNonValide() {
        return getDaoFactory().getTopoDao().getListTopoNonValide();
    }

    @Override
    public List<Topo> getListTopoValidePageDown(Integer lastId) {
        return getDaoFactory().getTopoDao().getListTopoValidePageDown(lastId);
    }

    @Override
    public List<Topo> getListTopoValidePageUp(Integer lastId) {
        return getDaoFactory().getTopoDao().getListTopoValidePageUp(lastId);
    }

    @Override
    public int getCountTopo() {
        return getDaoFactory().getTopoDao().getCountTopo();
    }

    @Override
    public void addTopo(Topo topo) {
        getDaoFactory().getTopoDao().addTopo(topo);
    }
}
