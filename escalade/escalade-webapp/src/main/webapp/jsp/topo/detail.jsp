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
            height: 450px;

        }
        #cadre
        {
            height: 300px;
            text-align: center;
            border-color: black;
            border-style: solid;
            border-width: 0px 1px 0px 1px;

        }
        em
        {
            color : darkgray;
        }
        #cadreGauche
        {
            text-align: center;
            border-color: white;
            border-style: solid;
            border-width: 1px 1px 1px 1px;
            border-radius: 15px;
            margin-top: 10px;
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

    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>


<div id="page">

    <div id="popInfos">
        Se connecter pour plus de fonctionnalité
        <div style="display: flex;justify-content: space-around">
            <s:a action="login"  class="btn btn-outline-info">Oui</s:a>
            <button type="button" class="btn btn-outline-info" id=btnNon>Non</button>
        </div>
    </div>

    <div class="col-lg-8 col-md-8 col-sm-8" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" style="max-height: 380px">
                    <s:iterator value="listImage" status="list">
                        <s:if test="%{#list.count == 1}">
                            <s:property value="%{#list.count}"/>
                            <div class="carousel-item active" style="width: 100%;height: 100%;">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="First slide" style="height: 400px;">
                            </div>
                        </s:if>
                        <s:else>
                            <div class="carousel-item" style="width: 100%;height: 100%;">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="Second slide" style="height: 400px;">
                            </div>
                        </s:else>
                    </s:iterator>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadre" style="background-color:rgba(0,0,0,0.7);display: flex;justify-content: space-around">
            <div class="col-lg-4 col-md-4 col-sm-4 overflow-auto" id="cadreGauche">
                <div class="card-header "><em>Liste des sites contenu dans ce topo</em></div>
                <div class="card-body"style="text-align: center" >
                    <s:iterator value="listSite">
                        <s:a action="site_detail" style="font-size:0.7em;color:white"><s:property value="nom"/><s:param name="idSite" value="id" /></s:a>
                        <br/>
                    </s:iterator>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-8" id="cadreInfos">
                <h2 id="nomTopo"><s:property value="topo.nom"/></h2>
                <br/><div style="word-wrap: break-word;"><s:property value="topo.description"/></div>
            </div>

        </div>


        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.7);">
            <a href="#" class="btn btn-sm btn-info " id="slideTop" style="width: 100% ; margin: auto; border-radius: 10%"></a>
            <div id="listCommentaire">

            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.7);">
            <button type="button" class="btn btn-info" id="btnEnvoyer" data-toggle="modal" data-target="#votreCommentaire">Mettre un commentaire</button>
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <button type="button" class="btn btn-outline-info" id="btnFake">Voir les créneaux disponibles</button>
            <s:a action="reservationTopo" class="btn btn-outline-info" id="btnResa"><s:param name="idTopo" value="topo.id" />Voir les créneaux disponibles</s:a>
            <s:if test="!noted">
                <button type="button" class="btn btn-outline-info" id="btnEva" data-toggle="modal" data-target="#eva">Evaluer ce site</button>
            </s:if>
            <s:else>
                <button type="button" class="btn btn-outline-info"  disabled> Evaluer ce site </button>
            </s:else>
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
                        <input type="number" id="tentacles" name="note" style="margin: 5px"
                               min="1" max="10">  <span>/ 10</span>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-info" onclick="addNote()" data-dismiss="modal">Valider</button>
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
                        <textarea  name="contenu" class="form-control" id="inputContenu" rows="4" placeholder="Ecrivez votre message..."></textarea>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" onclick="addCommentaire()" class="btn btn-info" data-dismiss="modal">Envoyer</button>
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
        $('#btnFake').hide();

        if($('#pseudo').text() == ""){
            $('#btnCom').attr("disabled", true);
            $('#btnEva').attr("disabled", true);
            $('#btnResa').hide();
            $('#btnFake').show();
            $('#btnFake').attr("disabled", true);
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
     * Méthode pour récupèrer la liste des commentaires du topo à jours.
     */
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
     * Méthode pour ajouter un commentaire au topo.
     * On récupère les informations du commentaire entrés dans la pop-up.
     * On ajoute le commentaire en bdd.
     * On affiche la liste des commentaires mis à jours.
     */
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
    function addNote() {
        // récupère le message entré par l'utilisateur
        var note = $("input[name=note]").val();
        var nomTopo = $("#nomTopo").text();
        // URL de l'action AJAX
        var url = "<s:url action="ajax_addNote_topo"/>";
        // Paramètres de la requête AJAX
        var params = {
            note: note,
            nomTopo: nomTopo
        };
        // Action AJAX en POST
        if(note < 10) {
            jQuery.post(
                url,
                params,
                function (data) {
                })
            $("input[name=note]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.*
        }else {
            alert("Le note doit être entre 1 et 10")
        }
    }
</script>
</body>
</html>
