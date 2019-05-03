package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Note;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.util.List;

/**
 * Classe qui gère les actions en ajax pour les pages des sites d'escalades.
 */
public class AjaxActionSite extends ActionSupport {


    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    private         Double          note;
    private         String          nomSite;
    private         String          pseudo;
    private         Compte          compte;
    private         Site            site;
    private         String          nomSecteur;
    private         Integer         idSecteur;
    private         Secteur         secteur;
    private         List<Secteur>   listSecteur;


    /**
     * Méthode pour ajouter une note à un site.
     * On récupère la note entré par l'utilisateur pour ensuite l'ajouter à la bdd.
     * @return
     */
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
            logger.info("Note : "+note+" a bien été ajoutée à la base de données.");
        }
        return ActionSupport.SUCCESS;
    }

    public String doGetSecteur(){

        secteur = managerFactory.getSecteurManager().getSecteur(idSecteur);
        nomSecteur = secteur.getNom();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour ajouter un secteur dans un site en cours de création.
     * Si le nom est déjà utilisé on rajoute le nom du site derrière.
     * @return
     */
    public String doAjaxAddSecteur(){
        String vResult = ActionSupport.SUCCESS;
        try {
            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
            Secteur secteur = new Secteur();
            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());
            for(int i = 0;i<listSecteur.size();i++){
                if (nomSecteur.equals(listSecteur.get(i).getNom())){
                    nomSecteur = nomSecteur+" "+site.getNom();
                    break;
                }
            }
            secteur.setNom(nomSecteur);
            secteur.setSiteId(site.getId());
            managerFactory.getSecteurManager().addSecteur(secteur);
            logger.info("Secteur : "+secteur+" a bien été ajouté à la base de données.");
            listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());
        }  catch (Exception e) {
            e.printStackTrace();
        }
        return vResult;
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

    public List<Secteur> getListSecteur() {
        return listSecteur;
    }

    public void setListSecteur(List<Secteur> listSecteur) {
        this.listSecteur = listSecteur;
    }
}
