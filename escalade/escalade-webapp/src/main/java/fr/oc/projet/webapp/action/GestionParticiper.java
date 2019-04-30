package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.Image;
import fr.oc.projet.model.bean.escalade.*;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class GestionParticiper extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    private      List<TypeDeRoche>       listType;
    private      List<Cotation>          listCotation;
    private      List<Departement>       listDepartement;
    private      List<Region>            listRegion;
    private      List<Topo>              listTopo;
    private      List<Secteur>           listSecteur;
    private      String                  nom;
    private      String                  ville;
    private      String                  description;
    private      String                  pseudo;
    private      TypeDeRoche             type;
    private      Region                  region;
    private      Departement             departement;
    private      Topo                    topo;
    private      Site                    site;
    private      String                  nomSecteur;
    private      String                  nomSite;
    private      File                    myFile;
    private      String                  myFileContentType;
    private      String                  myFileFileName;
    private      String                  destPath;
    private      String                  nomSiteText;
    private      String                  nomTopo;
    private      Integer                 typeId;
    private      Integer                 topoId;
    private      Integer                 departementId;


    /**
     * Méthode pour afficher le fomrulaire d'ajout d'un site.
     * @return
     */
    public String doFormulaireSite(){

        listType = managerFactory.getTypeDeRocheManager().getListTypeDeRoche();
        listDepartement = managerFactory.getDepartementManager().getListDepartement();
        listTopo = managerFactory.getTopoManager().getListTopo();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour afficher la page de l'ajout de voie.
     * On récupère les informations pour les selects.
     * @return
     */
    public String doAddVoie(){

        site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
        listSecteur = managerFactory.getSecteurManager().getListSecteurSite(site.getId());
        listCotation = managerFactory.getCotationManager().getListCotation();

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour ajouter une image pendant la création d'un site.
     * @return
     */
    public String doAddImageSite(){

        String vResult = ActionSupport.INPUT;

        if(myFile != null) {
            destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/" + nomSiteText+ "/";
            try {
                File destFile = new File(destPath, myFileFileName);
                FileUtils.copyFile(myFile, destFile);
                site = managerFactory.getSiteManager().getSiteViaNom(nomSiteText);
                Image image = new Image();
                image.setUrlImage(nomSiteText + "/" + myFileFileName);
                image.setSiteId(site.getId());
                image.setDescription("Image du site : "+nomSiteText);
                image.setImageDePresentation(false);
                managerFactory.getImageManager().addImage(image);
                logger.info("Image : "+image+" a bien été ajoutée à la base de données.");

                vResult = ActionSupport.SUCCESS;

            } catch (IOException e) {
                e.printStackTrace();
                logger.error(e);
                return ERROR;
            }
        }else {
            site = managerFactory.getSiteManager().getSiteViaNom(nomSite);
        }
        return vResult;
    }

    public String doAddImageTopo(){

        String vResult = ActionSupport.INPUT;

        if(myFile != null) {
            destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/" + nomSiteText+ "/";
            try {
                File destFile = new File(destPath, myFileFileName);
                FileUtils.copyFile(myFile, destFile);
                topo = managerFactory.getTopoManager().getTopoViaNom(nomSiteText);
                Image image = new Image();
                image.setUrlImage(nomSiteText + "/" + myFileFileName);
                image.setTopoId(topo.getId());
                image.setDescription("Image du site : "+nomSiteText);
                image.setImageDePresentation(false);
                managerFactory.getImageManager().addImage(image);
                logger.info("Image : "+image+" a bien été ajoutée à la base de données.");

                vResult = ActionSupport.SUCCESS;

            } catch (IOException e) {
                e.printStackTrace();
                logger.error(e);
                return ERROR;
            }
        }else {
            topo = managerFactory.getTopoManager().getTopoViaNom(nomTopo);
        }
        return vResult;
    }

    /**
     * Méthode pour ajouter un site.
     * On récupère toutes les informations données par l'utilisateur.
     * On ajoute ensuite le site à la base de données.
     * On ajoute ensuite l'image principal ajouté par l'utilisateur.
     * @return
     */
    public String doAddSite(){

        Site site = new Site();
        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
        site.setEditeurId(managerFactory.getCompteManager().getCompteViaPseudo(pseudo).getId());
        site.setNom(nomSite);
        site.setTypeId(typeId);
        site.setDepartementId(departementId);
        site.setValide(false);
        site.setVille(ville);
        site.setDescription(description);
        site.setDate(new Date());
        site.setTopoId(topoId);
        managerFactory.getSiteManager().addSite(site);
        logger.info("Site : "+site+" a bien été ajotué à la base de données.");

        destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/"+nomSite+"/";
        try {
            File destFile  = new File(destPath, myFileFileName);
            FileUtils.copyFile(myFile, destFile);
            Image image = new Image();
            image.setSiteId(managerFactory.getSiteManager().getSiteViaNom(site.getNom()).getId());
            image.setDescription("Image de présentation du topo "+nomSite);
            image.setImageDePresentation(true);
            managerFactory.getImageManager().addImage(image);
            logger.info("Image : "+image+" a bien été ajoutée à la base de données.");

        } catch(IOException e) {
            e.printStackTrace();
            logger.error(e);
            return ERROR;
        }
        return ActionSupport.SUCCESS;
    }


    /**
     * Méthode pour créer un topo ou un site d'escalade
     * Si ville est null on sait que ce n'est pas un topo.
     * Si nom est null c'est que l'utilisateur vient d'ouvrir cette page.
     * @return
     */
    public String doAddTopo() {

        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;

            if(nomTopo != null){
                Topo topo = new Topo();
                pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
                topo.setResponsable(managerFactory.getCompteManager().getCompteViaPseudo(pseudo));
                topo.setDate(new Date());
                topo.setValide(false);
                topo.setNom(nomTopo);
                topo.setDescription(description);
                topo.setResponsableId(topo.getResponsable().getId());
                managerFactory.getTopoManager().addTopo(topo);
                logger.info("Topo : "+topo+" a bien été ajouté à la base de données.");

                destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/"+topo.getNom()+"/";
                try {
                    File destFile  = new File(destPath, myFileFileName);
                    FileUtils.copyFile(myFile, destFile);
                    Image image = new Image();
                    image.setUrlImage(topo.getNom()+"/"+myFileFileName);
                    image.setImageDePresentation(true);
                    image.setTopoId(managerFactory.getTopoManager().getTopoViaNom(topo.getNom()).getId());
                    image.setDescription("Image de présentation du topo "+topo.getNom());
                    managerFactory.getImageManager().addImage(image);
                    logger.info("Image : "+image+" a bien été ajoutée à la base de données.");

                    vResult = ActionSupport.SUCCESS;
                } catch(IOException e) {
                    e.printStackTrace();
                    logger.error(e);
                    return ERROR;
                }
            }

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

    public String getNomSecteur() {
        return nomSecteur;
    }

    public void setNomSecteur(String nomSecteur) {
        this.nomSecteur = nomSecteur;
    }

    public List<Secteur> getListSecteur() {
        return listSecteur;
    }

    public void setListSecteur(List<Secteur> listSecteur) {
        this.listSecteur = listSecteur;
    }

    public String getNomSite() {
        return nomSite;
    }

    public void setNomSite(String nomSite) {
        this.nomSite = nomSite;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getTopoId() {
        return topoId;
    }

    public void setTopoId(Integer topoId) {
        this.topoId = topoId;
    }

    public Integer getDepartementId() {
        return departementId;
    }

    public void setDepartementId(Integer departementId) {
        this.departementId = departementId;
    }

    public List<Cotation> getListCotation() {
        return listCotation;
    }

    public void setListCotation(List<Cotation> listCotation) {
        this.listCotation = listCotation;
    }

    public String getNomSiteText() {
        return nomSiteText;
    }

    public void setNomSiteText(String nomSiteText) {
        this.nomSiteText = nomSiteText;
    }

    public String getNomTopo() {
        return nomTopo;
    }

    public void setNomTopo(String nomTopo) {
        this.nomTopo = nomTopo;
    }
}
