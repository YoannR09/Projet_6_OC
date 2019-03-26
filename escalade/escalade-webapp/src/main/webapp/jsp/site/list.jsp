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
            background-image: url("./image/gplay.png");
        }
        #bloc
        {
            margin: 20px;
            background-color:rgba(0,0,0,0.8);
        }
        #divImage
        {
            height: 100%;
        }
        #partieDroite
        {
            float: right;
        }
        #divCota
        {
            text-align: left;
        }
        #editeur
        {
            float: right;
            font-size: 0.7em;
        }
        .cota
        {
            border-radius: 25px;
            border: 1px black solid;
            padding: 10px;
        }
        #vil,#dep,#typ,#not,#nvo,#nse,#cotaMax,#cotaMin
        {
            font-size: 0.7em;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }

    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div id="page">
    <div id="partieDroite"  class="col-lg-3 col-md-3 col-sm-3">
        <div class="card text-white mb-4"  id="recherche" style="background-color:rgba(0,0,0,0.8)">
            <div class="card-header "></div>
            <div class="card-body" style="display: flex">
            </div>
        </div>
    </div>

<div id="partieGauche"  class="col-lg-7 col-md-7 col-sm-12">
        <s:iterator value="listSite">
                <div class="card text-white "  id="bloc">
                    <div class="card-header "><s:property value="nom"/><p id="editeur">Editeur : <s:property value="editeur.pseudo"/></p></div>
                    <div class="card-body" style="display: flex;">
                        <div id="divImage" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">

                            <img src="./image/toulon2.jpg"
                                    width="100%" height="100%" id="img" style="border: 1px black solid;" />

                        </div>
                        <div id="divInfos" class="col-lg-4 col-md-4 col-sm-4">


                            <p id="vil">Ville : <s:property value="ville"/></p>
                            <p id="dep">Departement : <s:property value="departement.nom"/></p>
                            <p id="typ">Roche : <s:property value="typeDeRoche.type"/></p>
                            <p id="not">Note : <s:property value="note"/> / 10</p>

                        </div>
                        <div  class="col-lg-3 col-md-3 col-sm-3">

                            <p id="nvo"><s:property value="nombreVoie"/> voies</p>
                            <p id="nse"><s:property value="nombreSecteur"/> secteurs</p>
                            <div >
                                <p id="cotaMin">Min : <span class="cota" style="background-color:<s:property value="cotationMin.couleur"/>" ><s:property value="cotationMin.valeur"/></span></p>
                            </div>
                            <div style="margin-top: 30px;">
                                <p id="cotaMax">Max : <span class="cota" style="background-color:<s:property value="cotationMax.couleur"/>"><s:property value="cotationMax.valeur"/></span></p>
                            </div>

                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" id="divCota">
                            <s:a action="site_detail" class="btn btn-info" style="font-size:0.5em;"><s:param name="idSite" value="id" /> Voir </s:a>
                        </div>
                    </div>
                </div>
        </s:iterator>
</div>

</div>
</body>
</html>
