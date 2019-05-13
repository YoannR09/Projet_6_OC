package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.utilisateur.Compte;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;


/**
 * Classe qui gère les actions de la gestion d'un compte.
 */
public class LoginAction extends ActionSupport implements SessionAware {

    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    // ==================== Attributs ====================
    private        Compte         compte;
    private        String         nom;
    private        String         prenom;
    private        String         pseudo;
    private        String         password;
    private        String         passwordConf;
    private        String         email;
    private        String         emailConf;
    private        String         numero;
    private        String         verif;
    private        String         nouveau;
    private        String         verifNouveau;

    // ----- Eléments Struts
    private Map<String, Object> session;

    /**
     * Action permettant la connexion d'un utilisateur
     * On vérifie si le compte existe.
     * Ensuite on vérifie si le mot de passe est bon.
     * @return input / success
     */
    public String doLogin(){
        String vResult = ActionSupport.INPUT;
        if (pseudo != null) {
            List<Compte> vList;
            vList = managerFactory.getCompteManager().getListCompte();
            for(int i = 0;i<vList.size();i++){
                if(vList.get(i).getPseudo().equals(pseudo)){
                    compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
                    if(password.equals(compte.getPassword())){
                        this.session.put("user", compte);
                        this.session.put("pseudo", compte.getPseudo());
                        this.session.put("niveau", compte.getNiveauAcces().getNiveau());
                        vResult = ActionSupport.SUCCESS;
                    }else {
                        this.addActionMessage("Mot de passe invalide");
                    }
                }
            }
            if(compte == null){
                this.addActionMessage("Identifiant inconnu");
            }
        }
        return vResult;
    }

    /**
     * Action de déconnexion d'un utilisateur
     * @return success
     */
    public String doLogout() {
        this.session.remove("user");
        this.session.remove("pseudo");
        this.session.remove("niveau");
        return ActionSupport.SUCCESS;
    }

    /**
     * Action de la créatio d'un compte niveau visiteur.
     * On récupère toutes les informations rentrées par l'utilisateur.
     * On regarde si la confirmations du mot de passe est bonne.
     * On regarde si la confirmation de l'email est bonne
     * @return
     */
    public String doCreate(){
        // Par défaut, le result est "input"
        String vResult = ActionSupport.INPUT;
        // Si pseudo est null c'est qu'on vient d'arriver dans le formulaire.
        if(pseudo != null) {
            List<Compte> vList = managerFactory.getCompteManager().getListCompte();
            for (int i = 0; i < vList.size(); i++) {
                if (pseudo.equals(vList.get(i).getPseudo())) {
                    vResult = ActionSupport.ERROR;
                    this.addActionMessage(" Pseudo déjà existant");
                    break;
                }
            }
            if(vResult != ActionSupport.ERROR) {
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
                        logger.info("Compte " + compte + " a bien été ajouté à la base de données.");
                        vResult = ActionSupport.SUCCESS;
                    }else {
                        this.addActionMessage(" Email différent");
                        vResult = ActionSupport.ERROR;
                    }
                }else {
                    this.addActionMessage(" Mot de passe différent");
                    vResult = ActionSupport.ERROR;
                }
            }
        }
        return vResult;
    }

    /**
     * Méthode pour afficher les détails d'un compte d'utilisateur.
     * @return
     */
    public String doDetailProfil(){

        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
        compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);

        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour changer le mot de passe de l'utilisateur.
     * @return
     */
    public String updateMdp(){

        if(nouveau.equals(verifNouveau)){
            pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
            compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
            compte.setPassword(nouveau);
            logger.info("Compte "+compte+" a bien été modifié dans la base de données.");
        }
        return ActionSupport.SUCCESS;
    }

    /**
     * Méthode pour changer le d'adresse email de l'utilisateur.
     * @return
     */
    public String updateMail(){

        if(nouveau.equals(verifNouveau)){
            pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
            compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
            compte.setEmail(nouveau);
            logger.info("Compte "+compte+" a bien été modifié dans la base de données.");
        }

        return ActionSupport.SUCCESS;
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

    public String getVerif() {
        return verif;
    }

    public void setVerif(String verif) {
        this.verif = verif;
    }

    public String getNouveau() {
        return nouveau;
    }

    public void setNouveau(String nouveau) {
        this.nouveau = nouveau;
    }

    public String getVerifNouveau() {
        return verifNouveau;
    }

    public void setVerifNouveau(String verifNouveau) {
        this.verifNouveau = verifNouveau;
    }
}
