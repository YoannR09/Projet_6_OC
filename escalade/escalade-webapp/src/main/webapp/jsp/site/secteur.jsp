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
    <style type="text/css">
        #page {
            display: flex;
            justify-content: space-around;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
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
        h4
        {
            margin: 20px;
        }
        a{
            color: deepskyblue;
        }
        em
        {
            color : darkgray;
        }



    </style>
</head>
<body>

<%@ include file="/_include/header.jsp"%>



<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7); ">
            <h4 style="padding: 20px;text-align: left"><em>Liste des secteurs</em></h4>
            <div  style="display: flex;justify-content: space-around">
                <span style='width: 200px'>Nom</span>
                <span style='width: 100px'>Cotations</span>
                <span style='width: 100px'>Hauteurs</span>
                <span style='width: 50px'>Consulter</span>
            </div>

            <s:iterator value="listSecteur">
                <div  id="listResa" style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='width: 200px'> <s:property value="nom"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/></span>
                    <span class='badge badge-light' style='width: 100px'><s:property value="hauteurMin"/> à <s:property value="hauteurMax"/></span>
                    <s:a action="secteur_detail" style="width:50px;padding-top:10px"><s:param name="idSecteur" value="id" /> Voir </s:a>
                </div>
                <div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>
                </div>
            </s:iterator>

        </div>

    </div>
</div>

</body>
</html>



