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
    #cadreImage
    {
        height: 400px;
    }
    #cadreInfos
    {
        height: 380px;
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
        border: 2px deepskyblue solid;
        border-radius: 25px;
    }
    #spanCotaMin,#spanCotaMax
    {
        border-radius: 25px;
        border: black solid 2px;
        padding: 10px;
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
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" style="max-height: 380px">
                    <s:iterator value="listImage" status="list">
                        <s:if test="%{#list.count == 1}">
                            <s:property value="%{#list.count}"/>
                            <div class="carousel-item active" style="width: 100%;height: 100%">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="First slide">
                            </div>
                        </s:if>
                        <s:else>
                            <div class="carousel-item" style="width: 100%;height: 100%">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="Second slide">
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

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <h2 id="nomSite"><s:property value="site.nom"/></h2>
            <br/><s:property value="site.description"/>

            <h4><em>Localisation</em></h4>

            <p><span><em>Region : </em><s:property value="site.departement.region.nom"/></span>
                <span><em>Département : </em><s:property value="site.departement.nom"/> </span>
                <span><em>Ville : </em><s:property value="site.ville"/></span> </p>

            <h4><em>Détails</em></h4>
            <p><span><em>Type de roche: </em><s:property value="site.typeDeRoche.type"/></span>
                <span><em>Nombre de voies : </em><s:property value="site.nombreVoie"/> </span>
                <span><em>Nombre de secteurs : </em><s:property value="site.nombreSecteur"/></span> </p>
            <p>
          <span ><em>Cotation minimum: </em><span id="spanCotaMin" style="background-color:<s:property value="site.cotationMin.couleur"/>"><s:property value="site.cotationMin.valeur"/></span></span>
                <span><em>Cotation maximum: </em><span id="spanCotaMax" style="background-color:<s:property value="site.cotationMax.couleur"/>"><s:property value="site.cotationMax.valeur"/></span></span>
            </p>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.7);">
            <a href="#" class="btn btn-sm btn-info " id="slideTop" style="width: 100% ; margin: auto; border-radius: 10%"></a>
            <div id="listCommentaire">

            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.7);">
            <button type="button" class="btn btn-info" id="btnEnvoyer" data-toggle="modal" data-target="#votreCommentaire">Mettre un commentaire</button>
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <s:a action="listSecteur" class="btn btn-outline-info"><s:param name="idSite" value="site.id" />Liste des secteurs</s:a>
            <button type="button" class="btn btn-outline-info" id="btnEva" data-toggle="modal" data-target="#eva">Evaluer ce site</button>
        </div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="eva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" onclick="addNote()" data-dismiss="modal" class="btn btn-primary">Valider</button>
                    </div>
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
                    <button type="button" onclick="addCommentaire()"  data-dismiss="modal" class="btn btn-primary">Valider</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {
        $('#popInfos').hide();

        //  $('#carou > div:eq(0)').attr('class','active');



        if($('#pseudo').text() == ""){
            $('#btnCom').attr("disabled", true);
            $('#btnEva').attr("disabled", true);
            $('#popInfos').show();
        }
        $("#btnNon").click(function() {
            $('#popInfos').hide();
        });
    });
    reloadListCommentaire();
    $('#cadreCommentaire').hide();
    $('#cadreSecteur').hide();
    $('#btnEnvoyer').hide();

    $("#btnCom").click(function() {
        $('#cadreBouton').css('border-width','0px 1px 1px 1px');
        $("html, body").animate({ scrollTop: $('#page').height() }, 1500);
        $('#cadreCommentaire').slideDown(1500)
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
    function reloadListCommentaire() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_getListCommentaire"/>";
        var nomSite =$("#nomSite").text();
        var params = {
            nomSite: nomSite
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
    function addCommentaire() {
        // récupère le message entré par l'utilisateur
        var contenu = $("textarea[name=contenu]").val();
        var nomSite = $("#nomSite").text();
        // URL de l'action AJAX
        var url = "<s:url action="ajax_addCommentaire"/>";
        // Paramètres de la requête AJAX
        var params = {
            contenu: contenu,
            nomSite: nomSite
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
        var nomSite = $("#nomSite").text();
        // URL de l'action AJAX
        var url = "<s:url action="ajax_addNote"/>";
        // Paramètres de la requête AJAX
        var params = {
            note: note,
            nomSite: nomSite
        };
        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
            })
        $("input[name=note]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.*
    }
</script>
</body>
</html>