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
        height: 450px;

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
    .btn
    {
        margin: 20px;
    }
    #cadreBtn
    {
        position: fixed;
        display: flex;
        justify-content: space-between;
        bottom: 10px;
        width: 100%;
    }

</style>


<div id="page">

    <div id="cadreBtn">
        <s:a action="supprimer" id="btnDelete" class="btn btn-outline-danger"><s:param name="idTopo" value="topo.id" />Refuser</s:a>
        <s:a action="valider"  id="btnValider" class="btn btn-outline-info"><s:param name="idTopo" value="topo.id" /> Valider </s:a>
    </div>

    <div class="col-lg-8 col-md-8 col-sm-8" style="color: white; margin-top: 20px;">
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
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);">
            <h2 id="nomTopo"><s:property value="topo.nom"/></h2>
            <br/><s:property value="topo.description"/>
        </div>
    </div>

</div>
</body>
</html>
