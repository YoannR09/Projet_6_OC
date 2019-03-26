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
    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>
<style type="text/css">
    #page {
        display: flex;
        justify-content: space-around;
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
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.8);padding-top: 10px">
            <img src="./image/toulon3.jpg"
                 width="100%" height="100%" id="img" style="border: 1px black solid;" />
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.8);">
            <h2><s:property value="site.nom"/></h2>
            <br/><s:property value="site.description"/>

            <h4>Localisation</h4>

            <p><span>Region : <s:property value="site.departement.region.nom"/></span>
                <span>Département : <s:property value="site.departement.nom"/> </span>
                <span>Ville : <s:property value="site.ville"/></span> </p>


        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire" style="background-color:rgba(0,0,0,0.8);">
            <s:iterator value="listCommentaire">
                <div id="commentaire">
                    <s:property value="auteur.pseudo"/>
                    <span class='badge badge-info' style='padding :10px;margin-bottom: 15px;'><s:property value="contenu"/></span>
                    <span id="date"><s:property value="date"/></span>
                    <s:property value="session.user"/>
                    <s:if test="%{#session.user == #likes.compte.pseudo}">Test OK</s:if>
                </div>
            </s:iterator>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton" style="background-color:rgba(0,0,0,0.8);">
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <s:a action="listSecteur" class="btn btn-outline-info"><s:param name="idSite" value="site.id" />Liste des secteurs</s:a>
            <button type="button" class="btn btn-outline-info" id="btnSecteur" data-toggle="modal" data-target="#exampleModalCenter">Evaluer ce site</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur">

        </div>

        <div id="bottom"></div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                        <button type="button" class="btn btn-primary">Valider</button>
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
    });

</script>
</body>
</html>
