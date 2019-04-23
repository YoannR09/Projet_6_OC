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

    <div class="col-lg-8 col-md-8 col-sm-8" style="color: white; margin-top: 20px;">

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <h4>Envoyez nous votre message</h4>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreMessage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px;display: flex;justify-content: space-around">
            <s:form action="addMessage" style="width:60%;text-align:center" >
                <label for="inputObjet">Objet</label>
                <input name="objet" type="text" class="form-control" id="inputObjet" placeholder="Objet du message" required/>
                <label for="inputContenu">Message</label>
                <textarea  name="contenu" class="form-control" id="inputContenu" rows="4" placeholder="Ecrivez votre message..."></textarea>
                <div style="width:100%;display: flex;justify-content: flex-end">
                    <s:submit value="Envoyer" id="btn" class="btn btn-info" style="position:absolute;margin:20px;right:10px;bottom:5px;"/>
                </div>

            </s:form>
        </div>

    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

</script>
</body>
</html>
