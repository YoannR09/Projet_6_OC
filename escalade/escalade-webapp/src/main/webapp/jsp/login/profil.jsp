<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>
    <style type="text/css">

        #btn
        {
            margin: 10px;
        }
        #card
        {
            margin-top: 30px;
        }

        #mid {
            text-align: center;
        }
        #page {
            display: flex;
            justify-content: space-around;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }
        #cadreDiv
        {
            margin: 20px;
        }
        span
        {
            margin-bottom: 10px;
        }
        label
        {
            margin-top: 15px;
        }
        em
        {
            color : darkgray;
        }

    </style>
</head>

<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>

<div id="page">
    <div class="card text-white mb-3" style=" ;background-color:rgba(0,0,0,0.7)"
         id="card">

        <div class="card-header"><h3>Mon profil</h3></div>
        <div class="card-body" id="mid">
            <span><em>Pseudo : </em><s:property value="compte.pseudo"/></span>
            <br/><br/>
            <span><em>Nom : </em><s:property value="compte.nom"/></span>
            <br/><br/>
            <span><em>Prénom : </em><s:property value="compte.prenom"/></span>
            <br/><br/>
            <span><em>Email : </em><s:property value="compte.email"/></span>
            <br/><br/>
            <span><em>Numéro : </em><s:property value="compte.numero"/></span>
            <br/><br/>
            <div style="height: 100px">
            <button type="button" class="btn btn-outline-info" id="btnMdp" data-toggle="modal" data-target="#mdp">Changer de mot de passe</button>
            <button type="button" class="btn btn-outline-info" id="btnMail" data-toggle="modal" data-target="#mail">Changer l'adresse mail</button>
            </div>
        </div>

        <div class="modal fade" id="mdp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 350px">
                <div class="modal-content bg-dark" style="color:white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Changer de mot de passe</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="display: flex;justify-content: center;text-align: center">
                        <s:form action="update_mdp" >
                            <label for="inputVerif">Mot de passe actuel</label>
                            <input name="verif" type="password" class="form-control" id="inputVerif" required>
                            <label for="inputNew">Nouveau mot de passe</label>
                            <input name="nouveau" type="password" class="form-control" id="inputNew"  required>
                            <label for="inputVerifNew">Vérification du nouveau mot de passe</label>
                            <input name="verifNouveau" type="password" class="form-control" id="inputVerifNew"  required>
                            <s:submit value="Changer" id="btn" class="btn btn-info"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="mail" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 350px">
                <div class="modal-content bg-dark" style="color:white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModal">Changer d'adresse mail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="display: flex;justify-content: center;text-align: center">
                        <s:form action="update_mail" >
                            <label for="inputNewMail">Nouvelle adresse mail</label>
                            <input name="nouveau" type="text" class="form-control" id="inputNewMail" required>
                            <label for="inputVerifNewMail">Vérification du nouveau mail</label>
                            <input name="verifNouveau" type="text" class="form-control" id="inputVerifNewMail" required>
                            <s:submit value="Changer" id="btn" class="btn btn-info"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</body>
</html>