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
    #bloc
    {
        color: white;
        margin-top: 40px;
        background-color:rgba(0,0,0,0.7);
        text-align: center;
    }
    #partieDroite
    {
        float: right;
        margin-top: 30px;
    }
    #inputNom,#inputDescri
    {
        margin: 10px;
    }
    label
    {
        color: white;
    }
    #selectTopo,#selectType,#selectDepartement,#textNom,#textDescri,#textVille,
    #textDescriTopo,#textNomTopo,#fileProfil,#fileProfilTopo
    {
        margin: 10px;
    }


</style>


<div id="page">

    <div class="col-lg-8 col-md-8 col-sm-8" id="bloc">

        <div class="col-lg-12 col-md-12 col-sm-12" style="display: flex; justify-content: space-around">
            <button type="button" class="btn btn-outline-info" id="btnSite">Modérer un site</button>
            <button type="button" class="btn btn-outline-info" id="btnTopo">Modérer un topo</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="addSite" >
            <s:iterator value="siteList">

                <br/>
                <div  style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='padding-top:11px; width: 200px'> <s:property value="nom"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'><s:property value="nombreVoie"/> Voies</span>
                    <span class='badge badge-light' style='padding-top:11px;'><s:property value="nombreSecteur"/> Secteurs</span>
                    <span class='badge badge-light' style='padding-top:11px;'>Cotations : <s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'><s:property value="date"/></span>
                    <span class='badge badge-light' style='padding-top:11px; width: 200px'><s:property value="editeur.pseudo"/></span>
                    <s:a action="moderer_site" class="btn btn-outline-info" style="float:right;margin-top:13px"><s:param name="idSite" value="id" /> Voir </s:a>

                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="addTopo" >
            <s:iterator value="topoList">

                <br/>
                <div  style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='padding-top:11px; width: 200px'><s:property value="nom"/></span>
                    <span class='badge badge-light' style='padding-top:11px; width: 200px'><s:property value="date"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'><s:property value="responsable.pseudo"/></span>
                    <s:a action="moderer_topo" class="btn btn-outline-info" style="float:right;margin-top:13px"><s:param name="idTopo" value="id" /> Voir </s:a>

                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

        $('#addSite').hide();
        $('#addTopo').hide();

        $("#btnSite").click(function() {

            $('#addSite').show();
            $('#addTopo').hide();

        });

        $("#btnTopo").click(function() {

            $('#addTopo').show();
            $('#addSite').hide();

        });
    });
</script>
</body>
</html>
