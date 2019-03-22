package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Topo;

import javax.inject.Inject;
import java.util.List;

public class GestionTopoAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private List<Topo> listTopo;

    public List<Topo> getListTopo() {
        return listTopo;
    }

    public void setListTopo(List<Topo> listTopo) {
        this.listTopo = listTopo;
    }

    public String doListTopoValide() {
        listTopo = managerFactory.getTopoManager().getListTopo();

        return ActionSupport.SUCCESS;
    }
}
