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
        #bloc
        {
            margin: 20px;
        }
        #divImage
        {
            height: 100%;
            background-color: white;
        }
        #partieDroite
        {
            float: right;
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
            border-radius: 25px;
            border: 1px black solid;
            padding: 15px;
        }
        #vil,#dep,#typ,#not,#nvo,#nse
        {
            font-size: 0.6em;
        }

    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div id="page">
    <div id="partieDroite"  class="col-lg-3 col-md-3 col-sm-3">
        <div class="card text-white bg-dark mb-4"  id="recherche">
            <div class="card-header "></div>
            <div class="card-body" style="display: flex">
            </div>
        </div>
    </div>

<div id="partieGauche"  class="col-lg-7 col-md-7 col-sm-12">
        <s:iterator value="listSite">
                <div class="card text-white bg-dark "  id="bloc">
                    <div class="card-header "><s:property value="nom"/><p id="editeur">Editeur : <s:property value="editeur.pseudo"/></p></div>
                    <div class="card-body" style="display: flex;">
                        <div id="divImage" class="col-lg-4 col-md-4 col-sm-0 col-xs-0">


                        </div>
                        <div id="divInfos" class="col-lg-3 col-md-3 col-sm-4">

                            <br/>
                            <p id="vil">Ville : <s:property value="ville"/></p>
                            <p id="dep">Departement : <s:property value="departement.nom"/></p>
                            <p id="typ">Roche : <s:property value="typeDeRoche.type"/></p>
                            <p id="not">Note : <s:property value="note"/> / 10</p>

                        </div>
                        <div  class="col-lg-3 col-md-3 col-sm-4">

                            <br/>
                            <p id="nvo">Nombre de voie : <s:property value="nombreVoie"/></p>
                            <p id="nse">Nombre de secteur : <s:property value="nombreSecteur"/></p>

                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-4 col-xs-4" id="divCota">
                            <div >
                            <span style="background-color:<s:property value="cotationMin.couleur"/>;font-size: 0.7em;" ><s:property value="cotationMin.valeur"/></span>
                            </div>
                            <div style="margin-top: 30px;">
                            <span style="background-color:<s:property value="cotationMax.couleur"/>;font-size: 0.7em;"><s:property value="cotationMax.valeur"/></span>
                            </div>
                            <s:a action="site_detail" class="btn btn-info" style="margin-top:40px;"><s:param name="idSite" value="id" /> Voir </s:a>
                        </div>
                    </div>
                </div>
        </s:iterator>
</div>

</div>
</body>
</html>
