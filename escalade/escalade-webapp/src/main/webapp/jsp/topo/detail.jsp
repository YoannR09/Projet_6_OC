<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 22/03/2019
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("./image/gplay.png");
        }
        #page {
            display: flex;
            justify-content: space-around;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }
        #cadreImage
        {
            height: 400px;

        }
        #cadreInfos
        {
            height: 300px;
            text-align: center;
            border-color: black;
            border-style: solid;
            border-width: 0px 0px 0px 1px;

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
        #date
        {
            float: right;
            font-style: italic;
            font-size: 0.7em;
        }


    </style>

    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>


<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <img src="./image/toulon3.jpg"
                 width="100%" height="100%" id="img" style="border: 1px black solid;" />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);">
            <h2 id="nomTopo"><s:property value="topo.nom"/></h2>
            <br/><s:property value="topo.description"/>

        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.7);">
            <a href="#" class="btn btn-sm btn-info " id="slideTop" style="width: 100% ; margin: auto; border-radius: 10%"></a>
            <div id="listCommentaire">

            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.7);">
            <button type="button" class="btn btn-info" id="btnEnvoyer" data-toggle="modal" data-target="#votreCommentaire">Mettre un commentaire</button>
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <s:a action="reservationTopo" class="btn btn-outline-info"><s:param name="idTopo" value="topo.id" />Voir les créneaux disponibles</s:a>
            <button type="button" class="btn btn-outline-info" id="btnSecteur" data-toggle="modal" data-target="#exampleModalCenter">Evaluer ce site</button>
        </div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 20%">
                <div class="modal-content bg-dark" style="color:white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Evaluer le site</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="display: flex;justify-content: center">
                        <input type="number" id="tentacles" name="tentacles" style="margin: 5px"
                               min="1" max="10">  <span>/ 10</span>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary">Valider</button>
                    </div>
                </div>
            </div>
        </div>
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
                            <textarea  name="contenu" class="form-control" id="inputContenu" rows="4" placeholder="Ecrivez votre message..."></textarea>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" onclick="addCommentaire()" class="btn btn-primary" data-dismiss="modal">Valider</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

        reloadListCommentaire();
        setInterval(reloadListCommentaire, 5000);

        $('#cadreCommentaire').hide();
        $('#cadreSecteur').hide();
        $('#btnEnvoyer').hide();

        $("#btnCom").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');

            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);

            $('#cadreCommentaire').slideDown(1500);

            $('#btnEnvoyer').show();

            $('#btnCom').hide();

        });

        $("#slideTop").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');

            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);

            $('#cadreCommentaire').slideUp(1500);

            $('#btnEnvoyer').hide();

            $('#btnCom').show();

        });
    });
    function reloadListCommentaire() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_getListCommentaire"/>";

        var nomTopo =$("#nomTopo").text();

        var params = {

            nomTopo: nomTopo
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listCommentaire = jQuery("#listCommentaire");
                $listCommentaire.empty();
                jQuery.each(data, function (key, val) {
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
                            .append(val.date)
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
    function addCommentaire() {

        // récupère le message entré par l'utilisateur
        var contenu = $("textarea[name=contenu]").val();

        var nomTopo =$("#nomTopo").text();

        // URL de l'action AJAX
        var url = "<s:url action="ajax_addCommentaire"/>";

        // Paramètres de la requête AJAX
        var params = {
            contenu: contenu,
            nomTopo: nomTopo
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listCommentaire = jQuery("#listCommentaire");
                $listCommentaire.empty();
                jQuery.each(data, function (key, val) {
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
                            .append(val.date)
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
