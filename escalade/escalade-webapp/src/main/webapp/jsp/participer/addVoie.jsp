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
                <button type="button" class="btn btn-outline-info" id="btnSecteur" style="float: right" data-toggle="modal" data-target="#exampleModalCenter">Ajouter une voie</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur" style="background-color:rgba(0,0,0,0.7);">
            <h5 style="text-align: center">Ajouter des voies</h5>
            <div  style="display: flex;justify-content: space-around">
                <span style='width: 200px;text-align: center'>Nom</span>
                <span style='width: 100px;text-align: center'>Hauteur</span>
                <span style='width: 100px;text-align: center'>Secteur</span>
                <span style='width: 100px;text-align: center'>Cotation</span>
            </div>

            <div id="listVoie">

            </div>

            <s:a action="addImageSite" class="btn btn-info">Suivant <s:param name="nomSite" value="nomSite" /></s:a>
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
                        <s:select id="selectSecteur" name="secteurId" label="Secteur "
                                  list="listSecteur" listKey="id" listValue="nom"/>
                        <s:select id="selectCotation" name="cotationId" label="Cotation "
                                  list="listCotation" listKey="id" listValue="valeur"/>
                        <div class="form-group">
                            <label for="textNom">Nom</label>
                            <input name="nomVoie" type="text" class="form-control" id="textNom" placeholder="Nom de la voie" required>
                        </div>
                        <div class="form-group">
                            <label for="textNom">Hauteur</label>
                            <input name="hauteur" type="text" class="form-control" id="textHauteur" placeholder="Mètres" required>
                        </div>

                        <button id="btn" data-dismiss="modal" onclick="addVoie()" class="btn btn-info">Créer</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

    });

    /**
     * Méthode pour ajouter une voie pendant la création d'un site.
     * On récupère toute les informations rentré par l'utilisateur.
     * On les envoies dans une méthode ajax pour l'ajouter dans la bdd.
     * On affiche ensuite la liste des voies.
     */
    function addVoie() {

        var nom = $("input[name=nomVoie]").val();

        var hauteur = $("input[name=hauteur]").val();

        var secteurId = $("select[name=secteurId]").val();

        var cotationId = $("select[name=cotationId]").val();


        var nomSite =$("#nomSite").text();

        // URL de l'action AJAX
        var url = "<s:url action="ajax_add_voie"/>";

        // Paramètres de la requête AJAX
        var params = {
            nom: nom,
            nomSite: nomSite,
            hauteur: hauteur,
            secteurId:secteurId,
            cotationId:cotationId
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) { // La méthode qui lit le résultat retourné à la suite de l'envoi de la requêt POST
                var $listVoie = jQuery("#listVoie"); // OFA : il faut qu'une balise html existe avec cet id="listMessage" pour savoir ou mettre la liste des mesages.

                $listVoie.empty();

                jQuery.each(data, function (key, val) {
                    $listVoie.append(
                        jQuery("<div style='display:flex;justify-content: space-around'>")
                            .append(jQuery("<span class='badge badge-info' style='width: 200px'>").append(val.nom),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(val.hauteur),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(getNomSecteur(val.secteurId)),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(val.cotation.valeur))
                    );
                });
            })
            .fail(function () {
                alert("Erreur");
            });
        $("input[name=nomVoie]").val(""); //-- On vide le champ de saisie du nouveau message à chaque tour.
    }

    /**
     * Méthode pour transformer l'id du secteur en nom du secteur.
     * @param idSecteur
     * @returns {*}
     */
    function getNomSecteur(idSecteur) {


        // URL de l'action AJAX
        var url = "<s:url action="ajax_get_secteur"/>";

        // Paramètres de la requête AJAX
        var params = {
            idSecteur: idSecteur,
        };
        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var nomSecteur = data;

            });
        return nomSecteur;
    }
</script>
</body>
</html>

