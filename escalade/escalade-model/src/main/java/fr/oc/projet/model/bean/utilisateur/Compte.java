package fr.oc.projet.model.bean.utilisateur;

public class Compte {

    private     Integer         id;
    private     String          pseudo;
    private     String          nom;
    private     String          prenom;
    private     String          password;
    private     String          email;
    private     String          numero;
    private     Integer         niveau;
    private     NiveauAcces     niveauAcces;

    public Compte(){}


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public NiveauAcces getNiveauAcces() {
        return niveauAcces;
    }

    public void setNiveauAcces(NiveauAcces niveauAcces) {
        this.niveauAcces = niveauAcces;
    }

    public Integer getNiveau() {
        return niveau;
    }

    public void setNiveau(Integer niveau) {
        this.niveau = niveau;
    }
}
