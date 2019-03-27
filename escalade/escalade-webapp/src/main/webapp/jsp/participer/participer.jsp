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
        background-color:rgba(0,0,0,0.8);
        text-align: center;
    }
    #partieDroite
    {
        float: right;
        margin-top: 20px;
    }
    #inputNom,#inputDescri
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
            <div id="partieDroite"  class="col-lg-4 col-md-4 col-sm-4 ">
                <div class="card text-white bg-dark mb-4"  id="recherche" style="background-color:rgba(0,0,0,0.8)">
                    <div class="card-header "></div>
                    <div class="card-body" style="display: flex">
                    </div>
                </div>
            </div>
                <s:form action="" id="formulaire">
                <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around; margin-top: 20px">
                    <div class="form-group col-md-8">
                        <label for="inputNom">Nom</label>
                        <input name="nom" type="text" class="form-control" id="inputNom" placeholder="nom" required>
                        <label for="inputDescri">Description</label>
                        <textarea class="form-control" id="inputDescri" rows="3"></textarea>
                        <label for="test">Description</label>
                        <s:textfield name="contenuMessage" class="form-control" placeholder="Ecrivez votre message..."/>
                                <s:select id="selectVersion"  class="form-control" list="listType" listValue="type"/>

                    </div>
                    <div class="form-group col-md-6">
                    </div>

                    <s:submit value="Valider" id="btn" class="btn btn-info"/>
                </div>
                    </s:form>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" id="addTopo" >
                <h3>Créer un topo d'escalade</h3>
                <s:form action="newUser">
                    <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                        <div class="form-group col-md-4">
                            <label for="inputPseudo">Pseudo</label>
                            <input name="pseudo" type="pseudo" class="form-control" id="inputPseudo" placeholder="Pseudo" required>
                        </div>
                    </div>
                    <div class="form-row" id="cadreDiv" style="display: flex; justify-content: space-around" >
                        <div class="form-group col-md-5">
                            <label for="inputPass">Password</label>
                            <input name="password" type="password" class="form-control" id="inputPass" placeholder="Password" required>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="inputPassConf">Confirmer le mot de passe</label>
                            <input name="passwordConf" type="password" class="form-control" id="inputPassConf" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-row" id="cadreDiv" style="display: flex; justify-content: space-around;">
                        <div class="form-group col-md-6">
                            <label for="inputPass">Email</label>
                            <input name="email" type="text" class="form-control" id="inputEmail" placeholder="Email" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassConf">Confirmer l'email</label>
                            <input name="emailConf" type="text" class="form-control" id="inputEmailConf" placeholder="Email" required>
                        </div>
                    </div>

                    <s:submit value="Valider" id="btn" class="btn btn-info"/>
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
