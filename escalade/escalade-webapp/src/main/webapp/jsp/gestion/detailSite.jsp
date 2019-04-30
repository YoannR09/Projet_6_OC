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
    #cadreImage
    {
        height: 400px;

    }
    #cadreInfos
    {
        text-align: center;
        border-color: black;
        border-style: solid;
        border-width: 0px 0px 0px 1px;

    }
    span
    {
        margin: 15px;
    }
    em
    {
        color : darkgray;
    }
    h4
    {
        padding: 20px;
    }
    .btn
    {
        margin: 20px;
    }
    #cadreSecteur
    {
        background-color: white;
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 0px 1px;
    }
    #cadreBtn
    {
        position: fixed;
        display: flex;
        justify-content: space-between;
        bottom: 10px;
        width: 100%;
    }
    #spanCotaMin,#spanCotaMax
    {
        border-radius: 25px;
        border: black solid 2px;
        padding: 10px;
    }


</style>


<div id="page">
    <div id="cadreBtn">
    <s:a action="supprimer" id="btnDelete" class="btn btn-outline-danger"><s:param name="idSite" value="site.id" />Refuser</s:a>
    <s:a action="valider"  id="btnValider" class="btn btn-outline-info"><s:param name="idSite" value="site.id" /> Valider </s:a>
    </div>
    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" style="max-height: 380px">
                    <s:iterator value="listImage" status="list">
                        <s:if test="%{#list.count == 1}">
                            <s:property value="%{#list.count}"/>
                            <div class="carousel-item active" style="width: 100%;height: 100%">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="First slide">
                            </div>
                        </s:if>
                        <s:else>
                            <div class="carousel-item" style="width: 100%;height: 100%">
                                <img class="d-block w-100" src="./image/<s:property value="urlImage"/>"
                                     alt="Second slide">
                            </div>
                        </s:else>
                    </s:iterator>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);border-bottom: 2px solid white">
            <h2 id="nomSite"><s:property value="site.nom"/></h2>
            <br/><s:property value="site.description"/>

            <h4><em>Localisation</em></h4>

            <p><span><em>Region : </em><s:property value="site.departement.region.nom"/></span>
                <span><em>Département : </em><s:property value="site.departement.nom"/> </span>
                <span><em>Ville : </em><s:property value="site.ville"/></span> </p>

            <h4><em>Détails</em></h4>
            <p><span><em>Type de roche: </em><s:property value="site.typeDeRoche.type"/></span>
                <span><em>Nombre de voies : </em><s:property value="site.nombreVoie"/> </span>
                <span><em>Nombre de secteurs : </em><s:property value="site.nombreSecteur"/></span> </p>
            <p>
                <span ><em>Cotation minimum: </em><span id="spanCotaMin" style="background-color:<s:property value="site.cotationMin.couleur"/>"><s:property value="site.cotationMin.valeur"/></span></span>
                <span><em>Cotation maximum: </em><span id="spanCotaMax" style="background-color:<s:property value="site.cotationMax.couleur"/>"><s:property value="site.cotationMax.valeur"/></span></span>
            </p>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur" style="background-color:rgba(0,0,0,0.7);">
            <div id="listSecteur" style="border-bottom: 2px white solid;text-align: center" >
                <h4><em>Liste des secteurs</em></h4>
                <div  style="display: flex;justify-content: space-around">
                    <span style='width: 200px'>Nom</span>
                    <span style='width: 200px'>Nombres de voies</span>
                </div>
                <s:iterator value="secteurList">
                    <div  style="display: flex;justify-content: space-around">
                        <span class='badge badge-info' style=' width: 200px'><s:property value="nom"/></span>
                        <span class='badge badge-light' style='width: 200px'><s:property value="nombreVoie"/></span>
                    </div>
                </s:iterator>
            </div>
            <div id="listVoie" style="text-align: center">
                <h4><em>Liste des voies</em></h4>
                <div  style="display: flex;justify-content: space-around;text-align: center">
                    <span style='width: 200px'>Nom</span>
                    <span style='width: 100px'>Hauteur</span>
                    <span style='width: 100px'>Cotation</span>
                </div>
                <s:iterator value="listVoie">
                    <div  style="display: flex;justify-content: space-around">
                        <span class='badge badge-info' style='width: 200px'> <s:property value="nom"/></span>
                        <span class='badge badge-light' style='width: 100px'><s:property value="hauteur"/></span>
                        <span class='badge badge-light' style='color: white;width: 100px;background-color:<s:property value="cotation.couleur"/>'><s:property value="cotation.valeur"/></span>
                    </div>
                </s:iterator>
            </div>
        </div>
    </div>

</div>

</body>
</html>
