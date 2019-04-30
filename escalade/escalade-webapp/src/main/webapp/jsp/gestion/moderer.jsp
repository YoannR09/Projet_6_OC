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
        margin: 5px;
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

    <div class="col-lg-9 col-md-9 col-sm-9" id="bloc">

        <div class="col-lg-12 col-md-12 col-sm-12" style="display: flex; justify-content: space-around">
            <button type="button" class="btn btn-outline-info" style="padding: 20px;" id="btnSite">Modérer un site</button>
            <button type="button" class="btn btn-outline-info" style="padding: 20px;" id="btnTopo">Modérer un topo</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="addSite" >
            <div  style="display: flex;justify-content: space-around;text-align: center">
                <span style='width: 250px'>Nom</span>
                <span style='width: 150px'>Nombre de voies</span>
                <span style='width: 200px'>Nombre de secteurs</span>
                <span style='width: 100px'>Cotations</span>
                <span style='width: 100px'>Date</span>
                <span style='width: 100px'>Editeur</span>
                <span style='width: 100px'>Consulter</span>
            </div>
            <s:iterator value="siteList">
                <div  style="display: flex;justify-content: space-around;text-align: center">
                    <span class='badge badge-info' style='width: 250px'> <s:property value="nom"/></span>
                    <span class='badge badge-light' style='width:150px'><s:property value="nombreVoie"/></span>
                    <span class='badge badge-light' style='width:200px'><s:property value="nombreSecteur"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="date"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="editeur.pseudo"/></span>
                    <s:a action="moderer_site" style="width: 100px"><s:param name="idSite" value="id" /> Voir </s:a>
                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="addTopo" >
            <div  style="display: flex;justify-content: space-around;text-align: center">
                <span style='width: 250px'>Nom</span>
                <span style='width: 100px'>Date</span>
                <span style='width: 150px'>Editeur</span>
                <span style='width: 100px'>Consulter</span>
            </div>
            <s:iterator value="topoList">
                <div  style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='width: 250px'><s:property value="nom"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="date"/></span>
                    <span class='badge badge-light' style='width: 150px'><s:property value="responsable.pseudo"/></span>
                    <s:a action="moderer_topo" style="width:100px"><s:param name="idTopo" value="id" /> Voir </s:a>
                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>
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
