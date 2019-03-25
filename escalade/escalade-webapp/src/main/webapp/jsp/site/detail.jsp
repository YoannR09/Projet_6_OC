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
        height: 300px;
        background-color: gray;
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 1px 1px;
    }
    #cadreInfos
    {
        height: 300px;
        text-align: center;
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 0px 1px;

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

    <div class="col-lg-9 col-md-9 col-sm-9">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage">

        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos">
            <h2><s:property value="site.nom"/></h2>
            <br/><s:property value="site.description"/>

            <h4>Localisation</h4>

            <p><span>Region : <s:property value="site.departement.region.nom"/></span>
                <span> Département : <s:property value="site.departement.nom"/> </span>
                <span>Ville : <s:property value="site.ville"/></span> </p>


        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreCommentaire">
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
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBouton">
            <button type="button" class="btn btn-outline-info" id="btnCom">Voir les commentaires</button>
            <s:a action="listSecteur" class="btn btn-outline-info"><s:param name="idSite" value="site.id" />Liste des secteurs</s:a>
            <button type="button" class="btn btn-outline-info" id="btnSecteur">Evaluer ce site</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur">

        </div>

        <div id="bottom"></div>
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
