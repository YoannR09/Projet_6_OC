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
            display: flex;
            justify-content: space-around;

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
        #text{
            word-wrap: break-word;
            text-align: left;
            padding :10px;
            margin-bottom: 15px;
            width: 100%;
            background-color: white;
            border-radius: 15px;
            border: 1px solid black;
            color: black;
            min-height: 200px;
        }
        #btnInfo
        {
            border: black 1px solid;
            border-radius: 50%;
            font-style: italic;
        }




    </style>
</head>
<body>

<%@ include file="/_include/header.jsp"%>



<div id="page">

    <div class="col-lg-8 col-md-8 col-sm-8" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7); ">
            <div class="col-lg-12 col-md-12 col-sm-12" >

                <span id="pseudo"class='btn btn-info btn-sm' data-toggle="modal" data-target="#mail" style='text-align:center'>
                    <s:property value="message.auteur.pseudo"/></span>
                <span class='badge badge-light'>
                <s:property value="message.objet"/>
                    </span>
                <span class='badge badge-light'>
                    <s:property value="message.date"/>
                </span>
            <div id="text" >
                <s:property value="message.contenu"/>
            </div>
            </div>
        </div>
        <div class="modal fade" id="mail" tabindex="-1" role="dialog" aria-labelledby="exampleModal" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 350px">
                <div class="modal-content bg-dark" style="color:white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModal">Informations du compte</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="text-align: center">
                        <p> <s:property value="message.auteur.prenom"/></p>
                        <p> <s:property value="message.auteur.nom"/></p>
                        <p> <s:property value="message.auteur.numero"/></p>
                        <p> <s:property value="message.auteur.email"/></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {
        $('#infos').hide();

        $("#pseudo").click(function() {



            $('#infos').slideDown(1500);

        });
    });
</script>

</body>
</html>



