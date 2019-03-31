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

    <div class="col-lg-8 col-md-8 col-sm-8" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.8); ">
            <s:iterator value="messageList">

                <br/>
                <div  style="display: flex;justify-content: space-around">
                    <span class='badge badge-info' style='padding-top:11px; width: 200px'> <s:property value="auteur.pseudo"/></span>
                    <span class='badge badge-light' style='padding-top:11px; width: 200px'><s:property value="objet"/></span>
                    <span class='badge badge-light' style='padding-top:11px;'><s:property value="date"/></span>
                    <s:a action="message_detail" class="btn btn-outline-info" style="float:right;margin-top:13px"><s:param name="idMessage" value="id" /> Voir </s:a>

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



