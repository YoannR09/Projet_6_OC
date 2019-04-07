package fr.oc.projet.model.bean.escalade;

import fr.oc.projet.model.bean.utilisateur.Compte;
import fr.oc.projet.model.bean.utilisateur.Note;

import java.util.Comparator;
import java.util.Date;


/**
 * Classe bean qui gère un site d'escalade.
 */
public class Site {

    private     Integer             id;
    private     String              nom;
    private     String              description;
    private     Boolean             valide;
    private     String              ville;
    private     Date                date;
    private     Topo                topo;
    private     Departement         departement;
    private     TypeDeRoche         typeDeRoche;
    private     Compte              editeur;
    private     Cotation            cotationMax;
    private     Cotation            cotationMin;
    private     Integer             note;
    private     Integer             nombreVoie;
    private     Integer             nombreSecteur;
    private     Integer             editeurId;
    private     Integer             typeId;
    private     Integer             departementId;
    private     Integer             topoId;

    public Site(){}

    public Site(Integer pId){id=pId;}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getValide() {
        return valide;
    }

    public void setValide(Boolean valide) {
        this.valide = valide;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }

    public TypeDeRoche getTypeDeRoche() {
        return typeDeRoche;
    }

    public void setTypeDeRoche(TypeDeRoche typeDeRoche) {
        this.typeDeRoche = typeDeRoche;
    }

    public Compte getEditeur() {
        return editeur;
    }

    public void setEditeur(Compte editeur) {
        this.editeur = editeur;
    }

    public Cotation getCotationMax() {
        return cotationMax;
    }

    public void setCotationMax(Cotation cotationMax) {
        this.cotationMax = cotationMax;
    }

    public Cotation getCotationMin() {
        return cotationMin;
    }

    public void setCotationMin(Cotation cotationMin) {
        this.cotationMin = cotationMin;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public Integer getNombreVoie() {
        return nombreVoie;
    }

    public void setNombreVoie(Integer nombreVoie) {
        this.nombreVoie = nombreVoie;
    }

    public Integer getNombreSecteur() {
        return nombreSecteur;
    }

    public void setNombreSecteur(Integer nombreSecteur) {
        this.nombreSecteur = nombreSecteur;
    }

    public Integer getEditeurId() {
        return editeurId;
    }

    public void setEditeurId(Integer editeurId) {
        this.editeurId = editeurId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getDepartementId() {
        return departementId;
    }

    public void setDepartementId(Integer departementId) {
        this.departementId = departementId;
    }

    public Integer getTopoId() {
        return topoId;
    }

    public void setTopoId(Integer topoId) {
        this.topoId = topoId;
    }

    public static Comparator<Site> ComparatorCotations = (e1, e2) -> (int) (e1.getCotationMax().getNiveau()) - e2.getCotationMax().getNiveau();
}
