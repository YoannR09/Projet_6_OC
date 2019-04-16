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
    span
    {
        margin: 15px;
    }
    h4
    {
        margin: 20px;
    }
    .btn
    {
        margin: 15px;
    }
    #bloc
    {
        color: white;
        margin-top: 40px;
        background-color:rgba(0,0,0,0.7);
        text-align: center;
    }
    label
    {
        color: white;
    }


</style>


<div id="page">

    <div class="col-lg-8 col-md-8 col-sm-8" id="bloc">
        <div class="col-lg-12 col-md-12 col-sm-12" id="addSite" >
            <h3>Créer un site d'escalade</h3>
                <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                    <div class="form-group col-md-8" style="color: white">
<s:form action="addSite" id="formulaire" method="POST" style="margin-left:10%;" enctype="multipart/form-data">
                        <div class="form-group col-md-4">
                            <label for="inputNom">Nom</label>
                            <input name="nomSite" type="text" class="form-control" id="inputNom" placeholder="Nom" required>
                        </div>
                        <s:textarea id="textDescri" name="description" class="form-control" placeholder="Entrez votre description" label="Description "/>
                        <s:select id="selectType" name="typeId" label="Type de roche"
                                  list="listType" listKey="id" listValue="type"/>
                        <s:select id="selectDepartement" name="departementId" label="Departement"
                                  list="listDepartement" listKey="id" listValue="nom"/>
                        <div class="form-group col-md-4">
                            <label for="inputNom">Ville</label>
                            <input name="ville" type="text" class="form-control" id="inputVille" placeholder="Nom" required>
                        </div>
                        <s:select id="selectTopo" name="topoId" label="Topo"
                                  list="listTopo" listKey="id" listValue="nom"/>
                        <s:file id="fileProfil" name="myFile"  label="Image principale " style="color:white"/>
                    </div>
                    <s:submit value="Suivant" id="btn" class="btn btn-info"/>
                    </s:form>
                </div>

        </div>
    </div>

</div>
</body>
</html>
