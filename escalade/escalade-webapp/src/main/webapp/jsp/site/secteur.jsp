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
</head>
<body>

<%@ include file="/_include/header.jsp"%>
<style type="text/css">
    #page {
        display: flex;
        justify-content: space-around;
    }

</style>


<div id="page">

    <div class="col-lg-8 col-md-8 col-sm-8">

<s:iterator value="listSecteur">

    <br/>
    <div style="margin: 10px;border-bottom: 1px solid black ;">
    <s:property value="nom"/>
        / Nombre de voie : <s:property value="nombreVoie"/>
        / Cotations : <s:property value="cotationMin.valeur"/> à <s:property value="cotationMax.valeur"/>
        / Hauteur : <s:property value="hauteurMin"/> à <s:property value="hauteurMax"/>
        <s:a action="site_detail"  style="float:right"><s:param name="idSecteur" value="id" /> Voir </s:a>
    </div>
</s:iterator>

    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {


    });

</script>
</body>
</html>
