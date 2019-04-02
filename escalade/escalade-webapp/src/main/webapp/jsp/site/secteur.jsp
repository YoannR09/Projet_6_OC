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


    </style>
</head>
<body>

<%@ include file="/_include/header.jsp"%>



<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7); ">
            <s:iterator value="listSecteur">

                <br/>
                <div  style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='padding-top:11px; width: 200px'> <s:property value="nom"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'> Nombre de voies : <s:property value="nombreVoie"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'> Cotations : <s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/></span>
                        <span class='badge badge-light' style='padding-top:11px;'>- Hauteur : <s:property value="hauteurMin"/> à <s:property value="hauteurMax"/></span>
                    <s:a action="site_detail" class="btn btn-outline-info" style="float:right;margin-top:13px"><s:param name="idSecteur" value="id" /> Voir </s:a>

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
    });
</script>

</body>
</html>



