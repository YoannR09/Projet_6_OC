package fr.oc.projet.business.manager.impl.manager;

import fr.oc.projet.business.manager.contract.manager.TopoManager;
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
}
