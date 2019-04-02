package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Count;

import javax.inject.Inject;

public class GestionIndexAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private Integer nbreSite;
    private Integer nbreTopo;


    public String doGetCountAction(){

        nbreTopo = managerFactory.getTopoManager().getCountTopo();
        System.out.println(nbreTopo);
        nbreSite = managerFactory.getSiteManager().getCountSite();
        System.out.println(nbreTopo);

        return ActionSupport.SUCCESS;
    }

    public Integer getNbreSite() {
        return nbreSite;
    }

    public void setNbreSite(Integer nbreSite) {
        this.nbreSite = nbreSite;
    }

    public Integer getNbreTopo() {
        return nbreTopo;
    }

    public void setNbreTopo(Integer nbreTopo) {
        this.nbreTopo = nbreTopo;
    }
}
