package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.NiveauAcces;
import javassist.NotFoundException;
import jdk.jfr.Name;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import javax.inject.Named;
import java.io.File;
import java.io.IOException;
import java.util.Map;

public class LoginAction extends ActionSupport implements SessionAware {

    @Inject
    private ManagerFactory managerFactory;

    // ==================== Attributs ====================
    private        Compte         compte;
    private        NiveauAcces    niveauAcces;
    private        String         nom;
    private        String         prenom;
    private        String         pseudo;
    private        String         password;
    private        String         passwordConf;
    private        String         email;
    private        String         emailConf;
    private        String         numero;
    private        File           myFile;
    private        String         myFileContentType;
    private        String         myFileFileName;
    private        String         destPath;

    // ----- Eléments Struts
    private Map<String, Object> session;

    /**
     * Action permettant la connexion d'un utilisateur
     * On vérifie si le compte existe.
     * Ensuite on vérifie si le mot de passe est bon.
     * @return input / success
     */
    public String doLogin() throws NotFoundException {
        String vResult = ActionSupport.INPUT;
        if (pseudo != null) {
            compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
            if(password.equals(compte.getPassword())){
                this.session.put("user", compte);
                this.session.put("pseudo", compte.getPseudo());
                this.session.put("niveau", compte.getNiveauAcces().getNiveau());
                vResult = ActionSupport.SUCCESS;
            }
        }
        return vResult;
    }

    /**
     * Action de déconnexion d'un utilisateur
     * @return success
     */
    public String doLogout() throws NotFoundException {
        this.session.remove("user");
        this.session.remove("pseudo");
        this.session.remove("niveau");
        return ActionSupport.SUCCESS;
    }

    /**
     * Action de la créatio d'un compte niveau visiteur.
     * @return
     */
    public String doCreate(){
        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;

        // Si pseudo est null c'est qu'on vient d'arriver dans le formulaire.
        if(pseudo != null) {
            // On regarde si le mot de passe est bien confirmé une deuxième fois
            if (password.equals(passwordConf)) {
                // On regarde si l'email est bien confirmé une deuxième fois
                if (email.equals(emailConf)) {


                    Compte compte = new Compte();

                    compte.setPseudo(pseudo);
                    compte.setPrenom(prenom);
                    compte.setNom(nom);
                    compte.setPassword(password);
                    compte.setEmail(email);
                    compte.setNumero(numero);
                    compte.setNiveau(1);

                    managerFactory.getCompteManager().addCompte(compte);

                    destPath = "C:/Users/El-ra/Documents/Projet_6_OC/escalade/escalade-webapp/src/main/webapp/image/"+compte.getPseudo()+"/";

                    try {

                        File destFile  = new File(destPath, myFileFileName);
                        FileUtils.copyFile(myFile, destFile);

                    } catch(IOException e) {
                        e.printStackTrace();
                        return ERROR;
                    }

                    vResult = ActionSupport.SUCCESS;
                }
            }
        }
        return vResult;

    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPasswordConf() {
        return passwordConf;
    }

    public void setPasswordConf(String passwordConf) {
        this.passwordConf = passwordConf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailConf() {
        return emailConf;
    }

    public void setEmailConf(String emailConf) {
        this.emailConf = emailConf;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
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
}
