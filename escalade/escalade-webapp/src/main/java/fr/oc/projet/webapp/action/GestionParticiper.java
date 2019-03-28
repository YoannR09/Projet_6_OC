package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.*;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

public class GestionParticiper extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private      List<TypeDeRoche>       listType;
    private      List<Departement>       listDepartement;
    private      List<Region>            listRegion;
    private      List<Topo>              listTopo;
    private      String                  nom;
    private      String                  ville;
    private      String                  description;
    private      String                  pseudo;
    private      TypeDeRoche             type;
    private      Region                  region;
    private      Departement             departement;
    private      Topo                    topo;


    public String doCreate() {

        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;

        if(ville == null){
            if(nom != null){
                Topo topo = new Topo();
                topo.setResponsable(managerFactory.getCompteManager().getCompteViaPseudo(pseudo));
                topo.setDate(new Date());
                topo.setValide(false);
                topo.setNom(nom);
                topo.setDescription(description);
                topo.setResponsableId(topo.getResponsable().getId());
            }
        }else {
            Site site = new Site();
            site.setEditeur(managerFactory.getCompteManager().getCompteViaPseudo(pseudo));
            site.setNom(nom);
            site.setTypeId(type.getId());
            site.setDepartementId(departement.getId());
            site.setValide(false);
            site.setVille(ville);
            site.setDescription(description);
            site.setDate(new Date());
            site.setTopoId(topo.getId());

        }

        listType = managerFactory.getTypeDeRocheManager().getListTypeDeRoche();
        listDepartement = managerFactory.getDepartementManager().getListDepartement();
        listTopo = managerFactory.getTopoManager().getListTopo();


        return vResult;
    }

    public List<TypeDeRoche> getListType() {
        return listType;
    }

    public void setListType(List<TypeDeRoche> listType) {
        this.listType = listType;
    }

    public List<Departement> getListDepartement() {
        return listDepartement;
    }

    public void setListDepartement(List<Departement> listDepartement) {
        this.listDepartement = listDepartement;
    }

    public List<Region> getListRegion() {
        return listRegion;
    }

    public void setListRegion(List<Region> listRegion) {
        this.listRegion = listRegion;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public TypeDeRoche getType() {
        return type;
    }

    public void setType(TypeDeRoche type) {
        this.type = type;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }

    public List<Topo> getListTopo() {
        return listTopo;
    }

    public void setListTopo(List<Topo> listTopo) {
        this.listTopo = listTopo;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }
}
