<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 22/03/2019
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>
<style type="text/css">
    #page {
        display: flex;
        justify-content: space-around;
        text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
    }
    #cadreInfos
    {
        text-align: center;
        border-color: black;
        border-style: solid;
        border-width: 0px 0px 0px 1px;

    }
    em
    {
        color : darkgray;
    }

    span
    {
        margin: 15px;
    }
    h4
    {
        margin: 20px;
    }
    #cadreBouton
    {
        display: flex;
        justify-content: space-around;
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 1px 1px;
    }
    .btn
    {
        margin: 15px;
    }
    #cadreCommentaire
    {
        background-color: white;
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 0px 1px;
    }
    #popInfos
    {
        position: fixed;
        bottom: 30px;
        right: 30px;
        z-index: 1;
        background-color: rgba(255,255,255,0.7);
        padding: 20px;
        border: 1px lightcyan solid;
        border-radius: 25px;
    }
</style>

<div id="page">
    <div id="popInfos">
        Se connecter pour plus de fonctionnalité
        <div style="display: flex;justify-content: space-around">
            <s:a action="login"  class="btn btn-outline-info">Oui</s:a>
            <button type="button" class="btn btn-outline-info" id=btnNon>Non</button>
        </div>
    </div>
    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);">
            <h2 id="nomSecteur" style="padding: 15px"><s:property value="secteur.nom"/></h2>
            <h4 style="padding: 20px;text-align: left"><em>Liste des voies</em></h4>
            <div  style="display: flex;justify-content: space-around">
                <span style='width: 200px'>Nom</span>
                <span style='width: 100px'>Hauteur</span>
                <span style='width: 100px'>Cotation</span>
            </div>
            <s:iterator value="listVoie">
                <div  id="listVoie" style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='width: 200px'> <s:property value="nom"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="hauteur"/></span>
                    <span class='badge badge-light' style='color: white;width: 100px;background-color:<s:property value="cotation.couleur"/>'><s:property value="cotation.valeur"/></span>
                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.7); padding-top: 30px;">
            <a href="#" class="btn btn-sm btn-info " id="slideTop" style="width: 100% ; margin: auto; border-radius: 10%"></a>
            <div id="listCommentaire">
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.7);padding-top: 30px">
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <button type="button" class="btn btn-info" id="btnEnvoyer" data-toggle="modal" data-target="#votreCommentaire">Mettre un commentaire</button>
        </div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="votreCommentaire" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 50%">
                <div class="modal-content bg-dark" style="color:white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tittle">Votre commentaire</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="display: flex;justify-content: center">
                            <label for="inputContenu">Message</label>
                            <textarea  name="contenu"class="form-control" id="inputContenu" rows="4" placeholder="Ecrivez votre message..."></textarea>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-info" onclick="addCommentaire()"  data-dismiss="modal">Envoyer</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {
        $('#popInfos').hide();
        if($('#pseudo').text() == ""){
            $('#btnCom').attr("disabled", true);
            $('#popInfos').show();
        }
        $("#btnNon").click(function() {
            $('#popInfos').hide();
        });

        reloadListCommentaire();

        $('#cadreCommentaire').hide();
        $('#cadreSecteur').hide();
        $('#btnEnvoyer').hide();
        /**
         * Affiche le cadre des commentaires.
         */
        $("#btnCom").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');
            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);
            $('#cadreCommentaire').slideDown(1500);
            $('#btnEnvoyer').show();
            $('#btnCom').hide();
        });

        /**
         * Rentre le cadre des commentaires.
         */
        $("#slideTop").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');
            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);
            $('#cadreCommentaire').slideUp(1500);
            $('#btnEnvoyer').hide();
            $('#btnCom').show();
        });
    });

    /**
     * Méthode pour récupèrer la liste des commentaires du secteurs à jours.
     */
    function reloadListCommentaire() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_getListCommentaire"/>";
        var nomSecteur =$("#nomSecteur").text();
        var params = {
            nomSecteur: nomSecteur
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listCommentaire = jQuery("#listCommentaire");
                $listCommentaire.empty();
                jQuery.each(data, function (key, val) {
                    var dates = new Date(val.date);

                    $listCommentaire.append(
                        jQuery("<span class='badge badge-info' style='padding :10px;margin-bottom: 15px;width: 15%;'>")
                            .append(val.auteur.pseudo)
                    );
                    $listCommentaire.append(
                        jQuery("<span class='badge badge-light' style='padding :10px;margin-bottom: 15px;width: 60%;height: 70px;text-align: left'>")
                            .append(val.contenu)
                    );
                    $listCommentaire.append(
                        jQuery("<span class='badge badge-light' style='margin-bottom: 15px;'>")
                            .append(dates.getDate(),'/',(dates.getMonth()+1),'/',dates.getFullYear())
                    );
                    $listCommentaire.append(
                        jQuery("<div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>")
                    );
                });
            })
            .fail(function () {
                alert("Erreur !!");
            });
    }

    /**
     * Méthode pour ajouter un commentaire au secteur.
     * On récupère les informations du commentaire entrés dans la pop-up.
     * On ajoute le commentaire en bdd.
     * On affiche la liste des commentaires mis à jours.
     */
    function addCommentaire() {

        // récupère le message entré par l'utilisateur
        var contenu = $("textarea[name=contenu]").val();
        var nomSecteur = $("#nomSecteur").text();
        // URL de l'action AJAX
        var url = "<s:url action="ajax_addCommentaire"/>";
        // Paramètres de la requête AJAX
        var params = {
            contenu: contenu,
            nomSecteur: nomSecteur
        };
        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listCommentaire = jQuery("#listCommentaire");
                $listCommentaire.empty();
                jQuery.each(data, function (key, val) {
                    var dates = new Date(val.date);

                    $listCommentaire.append(
                        jQuery("<span class='badge badge-info' style='padding :10px;margin-bottom: 15px;width: 15%;'>")
                            .append(val.auteur.pseudo)
                    );
                    $listCommentaire.append(
                        jQuery("<span class='badge badge-light' style='padding :10px;margin-bottom: 15px;width: 60%;height: 70px;text-align: left'>")
                            .append(val.contenu)
                    );
                    $listCommentaire.append(
                        jQuery("<span class='badge badge-light' style='margin-bottom: 15px;'>")
                            .append(dates.getDate(),'/',(dates.getMonth()+1),'/',dates.getFullYear())
                    );
                    $listCommentaire.append(
                        jQuery("<div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>")
                    );
                });
            })
        $("textarea[name=contenu]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.*
    }
</script>
</body>
</html>
