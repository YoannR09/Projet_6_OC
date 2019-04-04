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
        margin: 15px;
    }
    label
    {
        color: white;
    }


</style>


<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreInfos" style="background-color:rgba(0,0,0,0.7);display: flex;justify-content: space-around">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <h2 id="nomTopo" style="padding: 20px"><s:property value="nom"/></h2>
            </div>
        </div>
        <div  style="display: flex;justify-content: space-around">

                <s:textfield name="description" label="Description " class="blocInfo"/>
                <input type="file" name="myFile">
            <button id="btn" onclick="addImage()" class="btn btn-info">Ajouter</button>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);">
            <h5 style="text-align: center">Liste des images du topos</h5>
            <div  style="display: flex;justify-content: space-around">
                <span style='width: 400px'>Description</span>
                <span style='width: 200px'>Image</span>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12" id="listImage" style="display: flex;justify-content: space-around">

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12" id="listBoutons" style="display: flex;justify-content: flex-end">
                <s:a action="addVoie" class="btn btn-info"> Suivant </s:a>
            </div>
        </div>
        <!--------------------------------- Pop-up ------------------------------------>



    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

            reloadListImage();

    });
    function reloadListImage() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_getListImageTopo"/>";

        var nomTopo =$("#nomTopo").text();

        var params = {
            nomTopo: nomTopo
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listImage = jQuery("#listImage");
                $listImage.empty();
                jQuery.each(data, function (key, val) {
                    $listImage.append(
                        jQuery("<span class='badge badge-light' id='nom' style='padding :10px;margin-bottom: 15px;width: 400px;'>")
                            .append(val.description)
                    );
                    $listImage.append(
                        jQuery(" <div id='divImage'>")
                            .append(jQuery("<img id='img' src='./image/"+(val.urlImage)+"' width='200px;' height='100px' id='img' style='border: 1px black solid;' />"))
                    );

                    $("#img").attr('src', url);

                    console.log($("#img").attr('src'));
                });
            })
            .fail(function () {
                alert("Erreur !!");
            });

    }

    function addImage() {

        // récupère le message entré par l'utilisateur
        var myFile = $("input[name=myFile]").val();
        var description = $("input[name=description]").val();

        var nom =$("#nomTopo").text();


        // URL de l'action AJAX
        var url = "<s:url action="ajax_addImageTopo"/>";

        // Paramètres de la requête AJAX
        var params = {
            myFile: myFile,
            description: description,
            nom: nom
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listImage = jQuery("#listImage");
                $listImage.empty();
                jQuery.each(data, function (key, val) {
                    $listImage.append(
                        jQuery("<span class='badge badge-light' id='nom' style='padding :10px;margin-bottom: 15px;width: 400px;'>")
                            .append(val.description)
                    );
                    $listImage.append(
                        jQuery(" <div id='divImage'>")
                            .append(jQuery("<img id='img' src='./image/"+(val.urlImage)+"' width='200px;' height='100px' id='img' style='border: 1px black solid;' />"))
                    );

                    $("#img").attr('src', url);
                });

            })
            .fail(function () {
                alert("Erreur");
            });

        $("input[name=myFile]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.
        $("input[name=description]").val("");
    }


</script>
</body>
</html>

