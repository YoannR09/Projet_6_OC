package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;

import javax.inject.Inject;
import java.util.List;

/**
 * Classe qui gère les actions de la page d'index du site web.
 */
public class GestionIndexAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         Integer               nbreSite;
    private         Integer               nbreTopo;
    private         String                select;
    private         String                text;
    private         Integer               lastId;
    private         Integer               nombre;
    private         List<Topo>            listTopo;
    private         List<Site>            listSite;
    private         Boolean               firstPage;


    /**
     * Méthode pour compter le nombre de topo valide du site web.
     * @return
     */
    public String doGetCountNbreTopoAction(){

        nbreTopo = managerFactory.getTopoManager().getCountTopo();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour compter le nombre de site valide du site web.
     * @return
     */
    public String doGetCountNbreSiteAction(){

        nbreSite = managerFactory.getSiteManager().getCountSite();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour effectuer une recherche avec un mot-clé.
     * On récupère l'information du select pour savoir si on cherche un site ou un topo.
     * @return
     */
    public String doRecherche(){

        String vResult;

        if(select.equals("Site")){
            listSite = managerFactory.getSiteManager().rechercheSite(text);

            nombre = listSite.size();
            if(nombre != 0) {
                Site site = listSite.get(nombre - 1);
                lastId = site.getId();
            }
            firstPage = true;
            vResult = "Site";
        }else {
            listTopo = managerFactory.getTopoManager().rechercheTopo(text);
            nombre = listTopo.size();
            if(nombre != 0) {
                Topo topo = listTopo.get(nombre - 1);
                lastId = topo.getId();
            }
            firstPage = true;

            vResult = "Topo";
        }

        return vResult ;
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

    public String getSelect() {
        return select;
    }

    public void setSelect(String select) {
        this.select = select;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getLastId() {
        return lastId;
    }

    public void setLastId(Integer lastId) {
        this.lastId = lastId;
    }

    public Integer getNombre() {
        return nombre;
    }

    public void setNombre(Integer nombre) {
        this.nombre = nombre;
    }

    public List<Topo> getListTopo() {
        return listTopo;
    }

    public void setListTopo(List<Topo> listTopo) {
        this.listTopo = listTopo;
    }

    public List<Site> getListSite() {
        return listSite;
    }

    public void setListSite(List<Site> listSite) {
        this.listSite = listSite;
    }

    public Boolean getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(Boolean firstPage) {
        this.firstPage = firstPage;
    }
}
