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
            <button type="button" class="btn btn-outline-info" id="btnSite">Créer un site</button>
            <button type="button" class="btn btn-outline-info" id="btnTopo">Créer un topo</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="addSite" >
            <h3>Créer un site d'escalade</h3>
                <s:form action="addSite" id="formulaire" style="margin-left:10%;" enctype="multipart/form-data">
                <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                    <div class="form-group col-md-8" style="color: white">
                        <s:textfield id="textNom" name="nom" class="form-control" placeholder="Nom du site" label="Nom du site "/>
                        <s:textarea id="textDescri" name="description" class="form-control" placeholder="Entrez votre description" label="Description "/>
                        <s:select id="selectType" name="type" class="form-control" list="listType" listValue="type" label="Type de roche" listKey="id"/>
                        <s:select id="selectDepartement" name="departement" class="form-control" list="listDepartement" listValue="nom" listKey="id" label="Departement "/>
                        <s:textfield id="textVille" name="ville" class="form-control" placeholder="Nom de la ville" label="Ville "/>
                        <s:select id="selectTopo" name="topo" class="form-control" list="listTopo" listValue="nom" label="Topo " listKey="id"/>
                       <!-- <s:file id="fileProfil" name="photoPrincipale"  label="Image principale " style="color:white"/> -->
                    </div>
                    <s:submit value="Suivant" id="btn" class="btn btn-info"/>
                </div>
                    </s:form>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" id="addTopo" >
                <h3>Créer un topo d'escalade</h3>
                <s:form action="addTopo" id="formulaire" style="margin-left:10%;" enctype="multipart/form-data">
                    <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                        <div class="form-group col-md-8">
                            <s:textfield id="textNomTopo" name="nom" class="form-control" placeholder="Nom du topo" label="Nom "/>
                            <s:textarea id="textDescriTopo" name="description"  class="form-control" placeholder="Entrez votre description" label="Description "/>
                            <s:file id="fileProfilTopo" name="photoPrincipale"  label="Image principale " style="color:white"/>
                            <s:param name="pseudo" value="#session.user"/>
                        </div>
                        <div class="form-group col-md-6">
                        </div>

                        <s:submit value="Suivant" id="btn" class="btn btn-info"/>
                    </div>
                </s:form>
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
