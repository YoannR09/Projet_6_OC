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


<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <img src="./image/toulon3.jpg"
                 width="100%" height="100%" id="img" style="border: 1px black solid;" />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);">
            <h2 id="nomSite"><s:property value="site.nom"/></h2>
            <br/><s:property value="site.description"/>

            <h4>Localisation</h4>

            <p><span>Region : <s:property value="site.departement.region.nom"/></span>
                <span>Département : <s:property value="site.departement.nom"/> </span>
                <span>Ville : <s:property value="site.ville"/></span> </p>


        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.7);">
            <a href="#" class="btn btn-sm btn-info " id="slideTop" style="width: 100% ; margin: auto; border-radius: 10%"></a>
            <div id="listCommentaire">
                <s:iterator value="secteurList">

                    <br/>
                    <div  style="display: flex;justify-content: space-around">
                        <span class='badge badge-info' style='padding-top:11px; width: 200px'> <s:property value="nom"/></span>
                        <span class='badge badge-light' style='padding-top:11px;'> Nombre de voies : <s:property value="nombreVoie"/></span>
                        <span class='badge badge-light' style='padding-top:11px;'> Cotations : <s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/></span>
                        <span class='badge badge-light' style='padding-top:11px;'>- Hauteur : <s:property value="hauteurMin"/> à <s:property value="hauteurMax"/></span>

                    </div>
                    <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                    </div>
                </s:iterator>

            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.7);">
            <s:a action="" class="btn btn-outline-danger"><s:param name="idSite" value="site.id" />Refuser</s:a>
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les secteurs</button>
            <s:a action="valider" class="btn btn-outline-info"><s:param name="idSite" value="site.id" /> Valider </s:a>
        </div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 20%">
                <div class="modal-content">
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

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

        $('#cadreCommentaire').hide();
        $('#cadreSecteur').hide();

        $("#btnCom").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');

            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);

            $('#cadreCommentaire').slideDown(1500);

        });

        $("#slideTop").click(function() {

            $('#cadreBouton').css('border-width','0px 1px 1px 1px');

            $("html, body").animate({ scrollTop: $('#page').height() }, 1500);

            $('#cadreCommentaire').slideUp(1500);

        });
    });
</script>
</body>
</html>
