package fr.oc.projet.webapp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import fr.oc.projet.business.manager.contract.ManagerFactory;

import javax.inject.Inject;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class GestionMessageAction  extends ActionSupport {

    @Inject
    private ManagerFactory managerFactory;

    private      String                  contenu;
    private      String                  objet;
    private      String                  pseudo;
    private      String                  email;




    public String doAddMessage(){

        fr.oc.projet.model.bean.utilisateur.Message message = new fr.oc.projet.model.bean.utilisateur.Message();

        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");

        message.setCompteId(managerFactory.getCompteManager().getCompteViaPseudo(pseudo).getId());
        message.setDate(new Date());
        message.setContenu(contenu);
        message.setObjet(objet);

        managerFactory.getMessageManager().addMessage(message);

        sendMessage(objet,contenu,email);

        this.addActionMessage("Message bien envoyé.");

        return ActionSupport.SUCCESS;
    }



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

