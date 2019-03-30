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
        text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
    }
    #cadreInfos
    {
        display: flex;
        justify-content: space-between;
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
    label
    {
        color: white;
    }
    #cadreMessage
    {
        padding: 20px;
    }
    #messageText
    {
        height: 200px;
    }


</style>


<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.8);padding-top: 10px">
            <h4>Envoyez nous votre message</h4>
            <span style="font-size: 0.7em;">Par email : rocheyoann@outlook.fr</span>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreMessage" style="background-color:rgba(0,0,0,0.8);padding-top: 10px">
            <s:textarea id="messageText" name="message" class="form-control" placeholder="Entrez votre message..." label="Votre message "/>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreBtn" style="background-color:rgba(0,0,0,0.8);padding-top: 10px;display: flex;justify-content: flex-end">
            <s:a action="addVoie" class="btn btn-outline-info" style="margin-bottom:15px;"><s:param name="nomSite" value="nom" /> Envoyer </s:a>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

</script>
</body>
</html>
