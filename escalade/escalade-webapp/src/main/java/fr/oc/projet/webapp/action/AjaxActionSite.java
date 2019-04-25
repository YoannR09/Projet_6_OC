package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Note;

import javax.inject.Inject;

public class AjaxActionSite extends ActionSupport {


    @Inject
    private ManagerFactory managerFactory;

    private         Double      note;
    private         String      nomSite;
    private         String      pseudo;
    private         Compte      compte;
    private         Site        site;
    private         String      nomSecteur;
    private         Integer     idSecteur;
    private         Secteur     secteur;



    public String doAjaxAddNote(){

        if(note != null){

            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);

            Note pNote = new Note();
            pNote.setSiteId(site.getId());
            pNote.setNote(note);

            pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
            compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);

            pNote.setCompteId(compte.getId());

            managerFactory.getNoteManager().addNote(pNote);
        }

        return ActionSupport.SUCCESS;
    }

    public String doGetSecteur(){

        secteur = managerFactory.getSecteurManager().getSecteur(idSecteur);
        nomSecteur = secteur.getNom();

        return ActionSupport.SUCCESS;
    }

    public Double getNote() {
        return note;
    }

    public void setNote(Double note) {
        this.note = note;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public String getNomSecteur() {
        return nomSecteur;
    }

    public void setNomSecteur(String nomSecteur) {
        this.nomSecteur = nomSecteur;
    }

    public Integer getIdSecteur() {
        return idSecteur;
    }

    public void setIdSecteur(Integer idSecteur) {
        this.idSecteur = idSecteur;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }
}
