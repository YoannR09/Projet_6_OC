<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 05/02/2019
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("/image/qbkls.png");
        }
        #page
        {
            background-image: url("/image/qbkls.png");
            display: flex;
            justify-content: center;
        }
        #bloc
        {
            margin: 20px;
            width: 500px;
        }
        #divImage
        {
            height: 100%;
            background-color: white;
        }
        #partieDroite
        {
            margin: 20px;
            height: 500px;
        }
        #divCota
        {
            text-align: center;
        }
        #editeur
        {
            float: right;
            font-size: 0.7em;
        }
        span
        {
            width: 10px ;
            border-radius: 25px;
            border: 1px black solid;
            padding: 15px;
        }

    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div id="page" class="col-lg-12 col-md-12 col-sm-12">

<div id="partieGauche"  class="col-lg-7 col-md-7 col-sm-7">
        <s:iterator value="listSite">
                <div class="card text-white bg-dark mb-4"  id="bloc">
                    <div class="card-header "><s:property value="nom"/><p id="editeur">Editeur : <s:property value="editeur.pseudo"/></p></div>
                    <div class="card-body" style="display: flex;">
                        <div id="divImage" class="col-lg-4 col-md-4 col-sm-4"></div>
                        <div id="divInfos" class="col-lg-5 col-md-5 col-sm-5">

                            <p><s:property value="ville"/></p>
                            <p><s:property value="departement.nom"/></p>
                            <p>Roche : <s:property value="typeDeRoche.type"/></p>
                            <p>Note : <s:property value="note"/> / 10</p>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4" id="divCota">
                            <div >
                            Min : <span style="background-color:<s:property value="cotationMin.couleur"/>;" ><s:property value="cotationMin.valeur"/></span>
                            </div>
                            <div style="margin-top: 30px;">
                            Max : <span style="background-color:<s:property value="cotationMax.couleur"/>;"><s:property value="cotationMax.valeur"/></span>
                            </div>
                            <s:a action="site_valide_list" class="btn btn-info" style="margin-top:40px;"><s:param name="nomSite" value="nom" /> Voir </s:a>
                        </div>
                    </div>
                </div>
        </s:iterator>
</div>
    <div id="partieDroite"  class="col-lg-3 col-md-3 col-sm-3">
        <div class="card text-white bg-dark mb-4"  id="Recherche">
            <div class="card-header "></div>
            <div class="card-body" style="display: flex">
            </div>
        </div>
    </div>
</div>
</body>
</html>
