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




    public String doAddMessage(){

        fr.oc.projet.model.bean.utilisateur.Message message = new fr.oc.projet.model.bean.utilisateur.Message();

        pseudo = (String) ActionContext.getContext().getSession().get("pseudo");

        message.setCompteId(managerFactory.getCompteManager().getCompteViaPseudo(pseudo).getId());
        message.setDate(new Date());
        message.setContenu(contenu);
        message.setObjet(objet);

        managerFactory.getMessageManager().addMessage(message);

        sendMessage(objet,contenu,null,null);

        this.addActionMessage("Message bien envoyé.");

        return ActionSupport.SUCCESS;
    }



    public static void sendMessage(String subject, String text, String destinataire, String copyDest) {

        // 1 -> Création de la session
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.smtp.host", "smtp.live.com");
        properties.setProperty("mail.smtp.user", "applimail09@gmail.com");
        properties.setProperty("mail.from", "imap.gmail.com");
        Session session = Session.getInstance(properties);

        // 2 -> Création du message
        MimeMessage message = new MimeMessage(session);
        try {
            message.setText(text);
            message.setSubject(subject);
            message.addRecipients(Message.RecipientType.TO, destinataire);
            message.addRecipients(Message.RecipientType.CC, copyDest);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        // 3 -> Envoi du message
        Transport transport = null;
        try {
            transport = session.getTransport("smtp");
            transport.connect("applimail09@gmail.com", "Yocorps17");
            transport.sendMessage(message, new Address[] { new InternetAddress(destinataire),
                    new InternetAddress(copyDest) });
        } catch (MessagingException e) {
            e.printStackTrace();
        } finally {
            try {
                if (transport != null) {
                    transport.close();
                }
            } catch (MessagingException e) {
                e.printStackTrace();
            }
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
}

