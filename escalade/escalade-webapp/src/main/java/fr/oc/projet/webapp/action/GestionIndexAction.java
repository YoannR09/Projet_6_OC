package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;

import javax.inject.Inject;
import java.util.ArrayList;
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
    private         Integer               count;
    private         Integer               max;
    private         Boolean               endList;
    private         Integer               page;
    private         String                critere;


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
            List<Site> vList = managerFactory.getSiteManager().rechercheSite(text);
            page = 1;
            listSite = new ArrayList<>();
            count = page*3;
            if(count>vList.size()){
                max = vList.size();
                endList = true;
            }else {
                max = count;
                endList = false;
            }
            if(count == vList.size()){
                endList = true;
            }
            for(int i = count-3;i<max;i++){
                listSite.add(vList.get(i));
            }
            critere = "recherche";
            vResult = "Site";
        }else {
            List<Topo> vList = managerFactory.getTopoManager().rechercheTopo(text);
            page = 1;
            listTopo = new ArrayList<>();
            count = page*3;
            if(count>vList.size()){
                max = vList.size();
                endList = true;
            }else {
                max = count;
                endList = false;
            }
            if(count == vList.size()){
                endList = true;
            }
            for(int i = count-3;i<max;i++){
                listTopo.add(vList.get(i));
            }
            critere = "recherche";
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

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Boolean getEndList() {
        return endList;
    }

    public void setEndList(Boolean endList) {
        this.endList = endList;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public String getCritere() {
        return critere;
    }

    public void setCritere(String critere) {
        this.critere = critere;
    }
}
