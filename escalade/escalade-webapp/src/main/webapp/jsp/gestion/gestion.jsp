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

    #blocBtn
    {
        color: white;
        margin-top: 20px;
        display: flex;
        justify-content: space-around;
        background-color:rgba(0,0,0,0.7);
    }
    .btn
    {
        margin: 20px;
        padding: 10px;
    }


</style>


<div id="page">

    <div class="col-lg-4 col-md-4 col-sm-4" id="blocBtn" style="">
        <s:a action="moderation" class="btn btn-outline-info">Liste des sites/topos à moderer</s:a>
        <s:a action="listMessage" class="btn btn-outline-info">Messages des utilisateurs</s:a>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

</script>
</body>
</html>
