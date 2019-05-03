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
            <h3 style="margin: 15px;">Créer un topo d'escalade</h3>
            <em style="color: yellow;"><s:actionmessage/></em>
            <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                <div class="form-group " style="color: white">
                    <s:form action="addTopo" id="formulaire" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="inputNom">Nom</label>
                        <input name="nomTopo" type="text" class="form-control" id="inputNom" placeholder="Nom du topo" required>
                    </div>
                    <div class="form-group">
                        <label for="textDescri">Description</label>
                        <textarea  name="description" class="form-control" id="textDescri" rows="4" placeholder="Ecrivez votre description..."></textarea>
                    </div>
                    <s:file id="fileProfil" name="myFile"  label="Image principale " style="color:white;margin:10px"/>
                </div>
                <s:submit value="Suivant" id="btn" class="btn btn-info"/>
                </s:form>
            </div>

        </div>
    </div>

</div>
</body>
</html>
