package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.utilisateur.Compte;
import javassist.NotFoundException;
import org.apache.struts2.interceptor.SessionAware;

import javax.inject.Inject;
import java.util.Map;

public class LoginAction extends ActionSupport implements SessionAware {


    @Inject
    private ManagerFactory managerFactory;

    // ==================== Attributs ====================
    // ----- Paramètres en entrée
    private        Compte         compte;
    private        String         pseudo;
    private        String         password;

    // ----- Eléments Struts
    private Map<String, Object> session;

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
            System.out.println(pseudo);
            if(password.equals(compte.getMotDePasse())){
                this.session.put("user", compte);
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
        return ActionSupport.SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public Map<String, Object> getSession() {
        return session;
    }
}
