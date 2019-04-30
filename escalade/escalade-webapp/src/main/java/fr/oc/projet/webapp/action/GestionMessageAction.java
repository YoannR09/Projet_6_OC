package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;
import fr.oc.projet.model.bean.utilisateur.Compte;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.inject.Inject;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Classe qui gère la fonction nous contacter pour les visiteurs.
 * Celle-ci enregistre un message en bdd et l'envoie un email.
 */
public class GestionMessageAction  extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    static final Logger logger	= LogManager.getLogger();

    private      String                  contenu;
    private      String                  objet;
    private      String                  pseudo;
    private      String                  email;
    private      Compte                  compte;


    /**
     * Méthode pour créer le message de l'utilisateur dans la base de données.
     * On appel la méthode sendMessage pour passer les variables récupéré
     * et envoyer le mail.
     * @return
     */
    public String doAddMessage(){

        fr.oc.projet.model.bean.utilisateur.Message message = new fr.oc.projet.model.bean.utilisateur.Message();
        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");
        compte = managerFactory.getCompteManager().getCompteViaPseudo(pseudo);
        message.setCompteId(compte.getId());
        message.setDate(new Date());
        message.setContenu(contenu);
        message.setObjet(objet);
        managerFactory.getMessageManager().addMessage(message);
        logger.info("Message : "+message+" a bien été ajouté dans la base de données.");
        sendMessage(objet,contenu,compte.getEmail()); // Le message est transmit à la boite mail.
        this.addActionMessage("Message bien envoyé.");

        return ActionSupport.SUCCESS;
    }


    /**
     * Méthode pour envoyer le mail à la boîte mail dédié à l'application
     * @param objet
     * @param contenu
     * @param email
     */
    public static void sendMessage(String objet,String contenu,String email) {

        final String username = "applimail09@gmail.com";
        final String password = "Yocorps17";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("applimail09@gmail.com")
            );
            message.setSubject(objet);
            message.setText(contenu);
            Transport.send(message);

            logger.info("Message : "+message+" a bien été envoyé vers la boite email de l'application");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

