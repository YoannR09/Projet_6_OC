package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.TypeDeRoche;

import javax.inject.Inject;
import java.util.List;

public class GestionParticiper extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private List<TypeDeRoche> listType;


    public String doCreate() {

        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;

        listType = managerFactory.getTypeDeRocheManager().getListTypeDeRoche();



        return vResult;
    }

    public List<TypeDeRoche> getListType() {
        return listType;
    }

    public void setListType(List<TypeDeRoche> listType) {
        this.listType = listType;
    }
}
