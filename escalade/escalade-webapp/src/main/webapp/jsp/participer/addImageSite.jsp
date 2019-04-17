
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
                <h2 id="nomSite" style="padding: 20px"><s:property value="site.nom"/></h2>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <button type="button" class="btn btn-outline-info" id="btnSecteur" style="float: right" data-toggle="modal" data-target="#exampleModalCenter">Ajouter un secteur</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur" style="background-color:rgba(0,0,0,0.7);">
            <h5 style="text-align: center">Ajouter des images</h5>


            <div id="listImage">

            </div>

            <s:a action="" class="btn btn-info">Terminer </s:a>
        </div>
        <!--------------------------------- Pop-up ------------------------------------>


        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered " role="document" style="width: 25%">
                <div class="modal-content bg-dark">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Ajouter un secteur</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <input name="description" type="text" class="form-control" id="textNom" placeholder="Nom" required/>
                            <s:file id="file" name="myFile"  label="Image principale " style="color:white"/>
                        <button id="btn" data-dismiss="modal" class="btn btn-info">Créer</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

        $("#btn").click(function() {
            var filename = $("#myFile").val();

            $.ajax({
                type: "POST",
                url: "<s:url action="ajax_addImageSite"/>",
                enctype: 'multipart/form-data',
                data: {
                    file: filename
                },
                success: function () {
                    alert("Data Uploaded: ");
                }
            });
            addImage();
        });

    });

    function addImage() {

        var description = $("input[name=description]").val();

        var file =$("#myFile").val();

        var nomSite =$("#nomSite").text();

        // URL de l'action AJAX
        var url = "<s:url action="ajax_addImageSite"/>";

        // Paramètres de la requête AJAX
        var params = {
            description: description,
            nomSite: nomSite,
            file: file
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) { // La méthode qui lit le résultat retourné à la suite de l'envoi de la requêt POST
                var $listImage = jQuery("#listImage"); // OFA : il faut qu'une balise html existe avec cet id="listMessage" pour savoir ou mettre la liste des mesages.

                $listImage.empty();

                jQuery.each(data, function (key, val) {
                    $listImage.append(
                        jQuery("<div style='display:flex;justify-content: space-around'>")
                            .append(jQuery("<span class='badge badge-info' style='width: 200px'>").append(val.url),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(val.description))
                    );
                });
            })
            .fail(function () {
                alert("Erreur");
            });

        $("input[name=nomVoie]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.
    }
</script>
</body>
</html>


