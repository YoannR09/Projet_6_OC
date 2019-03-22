package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Cotation;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Voie;

import javax.inject.Inject;
import java.util.List;

public class GestionSiteAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private         List<Site>      listSite;
    private         String          nomSite;
    private         Cotation        cotation;
    private         Secteur         secteur;
    private         Voie            voie;


    public List<Site> getListSite() {
        return listSite;
    }

    public void setListSite(List<Site> listSite) {
        this.listSite = listSite;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }


    public Cotation getCotation() {
        return cotation;
    }

    public void setCotation(Cotation cotation) {
        this.cotation = cotation;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public Voie getVoie() {
        return voie;
    }

    public void setVoie(Voie voie) {
        this.voie = voie;
    }

    public String doListSiteValide() {
        listSite = managerFactory.getSiteManager().getListSiteValide();

        return ActionSupport.SUCCESS;
    }
}
