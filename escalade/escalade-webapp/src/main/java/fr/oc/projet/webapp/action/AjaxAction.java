package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Count;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.utilisateur.Commentaire;

import javax.inject.Inject;
import java.util.List;

public class AjaxAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private     List<Commentaire>       listCommentaire;
    private     List<Topo>              listTopo;
    private     List<Site>              listSite;
    private     Site                    site;
    private     List<Secteur>           listSecteur;
    private     String                  nomSite;
    private     String                  nomSecteur;
    private     String                  nom;
    private     Topo                    topo;
    private     String                  nomTopo;
    private     Count                   nbreSite;
    private     Count                   nbreTopo;



    /**
     * Action "AJAX" renvoyant la liste des commentaires d'un site/topo ou secteur.
     * @return success
     */
    public String doAjaxGetListCommentaire() { // throws NotFoundException, TechnicalException {
        String vResult = ActionSupport.SUCCESS;
        try {

            if(nomSite != null){
                site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSite(site.getId());
            }else{
                topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(topo.getId());
            }


        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }
    public String doAjaxGetListSecteur() { // throws NotFoundException, TechnicalException {
        String vResult = ActionSupport.SUCCESS;
        try {

            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());

        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }

    public String doAjaxAddSecteur(){
        String vResult = ActionSupport.SUCCESS;

        try {

            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);

            Secteur secteur = new Secteur();
            secteur.setNom(nom);
            secteur.setSiteId(site.getId());

            managerFactory.getSecteurManager().addSecteur(secteur);

            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());


        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
    }




    public List<Commentaire> getListCommentaire() {
        return listCommentaire;
    }

    public void setListCommentaire(List<Commentaire> listCommentaire) {
        this.listCommentaire = listCommentaire;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }

    public List<Secteur> getListSecteur() {
        return listSecteur;
    }

    public void setListSecteur(List<Secteur> listSecteur) {
        this.listSecteur = listSecteur;
    }

    public String getNomSecteur() {
        return nomSecteur;
    }

    public void setNomSecteur(String nomSecteur) {
        this.nomSecteur = nomSecteur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public String getNomTopo() {
        return nomTopo;
    }

    public void setNomTopo(String nomTopo) {
        this.nomTopo = nomTopo;
    }

    public Count getNbreSite() {
        return nbreSite;
    }

    public void setNbreSite(Count nbreSite) {
        this.nbreSite = nbreSite;
    }

    public Count getNbreTopo() {
        return nbreTopo;
    }

    public void setNbreTopo(Count nbreTopo) {
        this.nbreTopo = nbreTopo;
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
}
