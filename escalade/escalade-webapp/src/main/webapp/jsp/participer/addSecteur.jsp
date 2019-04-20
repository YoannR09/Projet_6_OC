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
                <h2 id="nomSite" style="padding: 20px"><s:property value="nomSite"/></h2>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <button type="button" class="btn btn-outline-info" id="btnSecteur" style="float: right" data-toggle="modal" data-target="#exampleModalCenter">Ajouter un secteur</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur" style="background-color:rgba(0,0,0,0.7);">
            <h5>Liste des secteurs du site</h5>
            <div style="text-align: center" >
                <span style='padding :10px;margin-bottom: 15px;'>Nom du secteur</span>
            </div>

            <div id="listSecteur" style="text-align: center" >

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12" id="listBoutons" style="display: flex;justify-content: flex-end">
                <s:a action="secteurAdd" class="btn btn-info"><s:param name="nomSite" value="nomSite" /> Suivant </s:a>
            </div>
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
                        <input name="nomSecteur" type="text" class="form-control" id="inputObjet" placeholder="Nom" required/>
                        <button id="btn" data-dismiss="modal" onclick="addSecteur()" class="btn btn-info">Créer</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>


    function addSecteur() {

        // récupère le message entré par l'utilisateur
        var nomSecteur = $("input[name=nomSecteur]").val();

        var nomSite =$("#nomSite").text();


        // URL de l'action AJAX
        var url = "<s:url action="ajax_addSecteur"/>";

        // Paramètres de la requête AJAX
        var params = {
            nomSecteur: nomSecteur,
            nomSite: nomSite
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listSecteur = jQuery("#listSecteur");

                $listSecteur.empty();

                jQuery.each(data, function (key, val) {
                    $listSecteur.append(
                        jQuery("<div style='width: 100%;'>").append(jQuery("<span class='badge badge-light' style='padding :10px;margin-bottom: 15px;'>").append(val.nom)
                    ));
                });
            })
            .fail(function () {
                alert("Erreur");
            });

        $("input[name=nomSecteur]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.
     }
</script>
</body>
</html>

