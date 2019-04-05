package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.Secteur;
import fr.oc.projet.model.bean.escalade.Site;
import fr.oc.projet.model.bean.escalade.Topo;
import fr.oc.projet.model.bean.escalade.Voie;
import fr.oc.projet.model.bean.utilisateur.Commentaire;
import fr.oc.projet.model.bean.utilisateur.Reservation;
import org.apache.commons.io.FileUtils;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AjaxAction extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private     List<Commentaire>       listCommentaire;
    private     List<Topo>              listTopo;
    private     List<Site>              listSite;
    private     List<Image>             listImage;
    private     List<Reservation>       listReservation;
    private     Site                    site;
    private     Secteur                 secteur;
    private     List<Secteur>           listSecteur;
    private     String                  nomSite;
    private     String                  nomSecteur;
    private     String                  nom;
    private     Topo                    topo;
    private     String                  nomTopo;
    private     String                  description;
    private     File                    myFile;
    private     String                  myFileContentType;
    private     String                  myFileFileName;
    private     String                  destPath;
    private     Integer                 mois;



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
            }else if(nomTopo != null){
                topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireTopo(topo.getId());
            }else if(nomSecteur != null){
                secteur = managerFactory.getSecteurManager().getSecteurViaNom(nomSecteur);
                listCommentaire = managerFactory.getCommentaireManager().getListCommentaireSecteur(secteur.getId());
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

    public String doAjaxGetListImageTopo() {
        String vResult = ActionSupport.SUCCESS;
        try {

            listImage = managerFactory.getImageManager()
                    .getListImageTopo(managerFactory.getTopoManager()
                            .getTopoViaNom(nomTopo).getId());

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

    public String doAjaxAddImageTopo(){
        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;

        topo = managerFactory.getTopoManager().getTopoViaNom(nom);

        destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/"+nom+"/";

        if(description != null) {

            try {

                File destFile = new File(destPath, myFileFileName);
                FileUtils.copyFile(myFile, destFile);

                Image image = new Image();
                image.setUrlImage(nom + "/" + myFileFileName);
                image.setImageDePresentation(false);
                image.setCompteId(1); // à changer !!
                image.setTopoId(topo.getId());
                image.setSiteId(null);
                image.setDescription(description);

                managerFactory.getImageManager().addImage(image);

                vResult = ActionSupport.SUCCESS;

            } catch (IOException e) {
                e.printStackTrace();
                return ERROR;
            }
        }

        listImage = managerFactory.getImageManager().getListImageTopo(topo.getId());

        return vResult;
    }

    public String doAjaxDetailResa(){
        String vResult = ActionSupport.SUCCESS;

        topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

        List<Reservation> vList = managerFactory.getReservationManager().getReservationTopo(topo.getId());

        listReservation = new ArrayList<>();


        for( int i = 0; i<vList.size();i++){

            if ((mois-1) == (vList.get(i).getDate().getMonth())){
                listReservation.add(vList.get(i));
            }
        }

        return vResult;
    }
    public String doAjaxDetailResaTopo(){

        String vResult = ActionSupport.SUCCESS;

        topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);

        listReservation = managerFactory.getReservationManager().getReservationTopo(topo.getId());


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

    public List<Image> getListImage() {
        return listImage;
    }

    public void setListImage(List<Image> listImage) {
        this.listImage = listImage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String myFileContentType) {
        this.myFileContentType = myFileContentType;
    }

    public String getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public List<Reservation> getListReservation() {
        return listReservation;
    }

    public void setListReservation(List<Reservation> listReservation) {
        this.listReservation = listReservation;
    }

    public Integer getMois() {
        return mois;
    }

    public void setMois(Integer mois) {
        this.mois = mois;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }
}
