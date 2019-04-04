<!DOCTYPE html>
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
            display: flex;
            justify-content: space-around;
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

    </style>
</head>

<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>

<div id="page">
    <div class="card text-white mb-3" style=" ;background-color:rgba(0,0,0,0.7)"
         id="card">

        <div class="card-header"><h3>S'inscrire</h3></div>
        <div class="card-body" id="mid">
            <s:form action="newUser" method="POST" enctype="multipart/form-data">
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

                        <input type="file" name="myFile">

                </div>

                <h3 style="margin: 10px;text-decoration: underline;">Informations personnelles</h3>

                <div class="form-row"  id="cadreDiv" style="display: flex; justify-content: space-around;">
                    <div class="form-group col-md-4">
                        <label for="inputNom">Nom</label>
                        <input name="nom" type="text" class="form-control" id="inputNom" placeholder="Nom" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputPrenom">Prenom</label>
                        <input  name="prenom" type="text" class="form-control" id="inputPrenom" placeholder="Prenom" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputPassConf">Numero de telephone</label>
                        <input name="numero" type="text" class="form-control" id="inputNum" placeholder="Numero" required>
                    </div>
                </div>


                    <s:submit value="Valider" id="btn" class="btn btn-info"/>
            </s:form>
        </div>
    </div>
</div>
</body>
</html>