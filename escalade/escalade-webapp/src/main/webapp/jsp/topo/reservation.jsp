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
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("./image/gplay.png");
        }
        #page {
            display: flex;
            justify-content: space-around;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }
        span
        {
            margin: 15px;
            padding: auto;
            text-align: center;
        }

        #cadreBouton
        {
            display: flex;
            justify-content: space-around;
            border-color: black;
            border-style: solid;
            border-width: 0px 1px 1px 1px;
        }

        #cadreCommentaire
        {
            background-color: white;
            border-color: black;
            border-style: solid;
            border-width: 0px 1px 0px 1px;
        }
        h3
        {
            padding: 10px;
        }

    </style>

    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>


<div id="page">


    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px">
            <h2 id="nomTopo"><s:property value="topo.nom"/></h2>
            <h3>Vous voulez reserver ce topo</h3>

                <div class="form-group row" >
                    <label for="example-date-input" class="col-2 col-form-label">Date à reserver : </label>
                    <div class="col-4">
                        <input name="date" class="form-control" type="date" value="2019-08-04" id="example-date-input">
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input name="matin" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> Matin
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input name="apresMidi" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> Après-midi
                        </label>
                    </div>
                    <s:a action="" class="btn btn-outline-info"><s:param name="idTopo" value="id" /> Réserver </s:a>
                </div>

            <div>
            <h3 >Liste des réservations de ce topo</h3>
            <div id="blocBtn" class="btn-group mr-2" role="group" aria-label="First group" style="width: 100%;margin-bottom: 20px;">
                <button id="1" class="btn btn-info btn-sm">Janvier</button>
                <button id="2" class="btn btn-info btn-sm">Février</button>
                <button id="3" class="btn btn-info btn-sm">Mars</button>
                <button id="4" class="btn btn-info btn-sm">Avril</button>
                <button id="5" class="btn btn-info btn-sm">Mai</button>
                <button id="6" class="btn btn-info btn-sm">Juin</button>
                <button id="7" class="btn btn-info btn-sm">Juillet</button>
                <button id="8" class="btn btn-info btn-sm">Août</button>
                <button id="9" class="btn btn-info btn-sm">Septembre</button>
                <button id="10" class="btn btn-info btn-sm">Octobre</button>
                <button id="11" class="btn btn-info btn-sm">Novembre</button>
                <button id="12" class="btn btn-info btn-sm">Décembre</button>

            </div>
                <div  style="display: flex;justify-content: space-around">
                    <span style='width: 200px'>Qui ?</span>
                    <span style='width: 100px'>Date</span>
                    <span style='width: 100px'>Matinée</span>
                    <span style='width: 100px'>Après-midi</span>
                </div>
                <div  id="listResa">
                </div>
        </div>

        <!--------------------------------- Pop-up ------------------------------------>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: 20%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Evaluer le site</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="display: flex;justify-content: center">
                        <input type="number" id="tentacles" name="tentacles" style="margin: 5px"
                               min="1" max="10">  <span>/ 10</span>
                    </div>
                    <div class="modal-footer" style="display: flex;justify-content: space-around">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary">Valider</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {

        listResa();


        $('#blocBtn > button').click(function(){
            var x = $(this).attr('id');
            listResaMois(x);
        });

    });

    function listResa() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_listResa"/>";


        var nomTopo = $("#nomTopo").text();

        var params = {
            nomTopo: nomTopo
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listResa = jQuery("#listResa");
                $listResa.empty();
                jQuery.each(data, function (key, val) {

                    if (val.matin == true) {
                        var etatMatin = 'réservé';
                    }else {
                        var etatMatin = 'non réservé';
                    }
                    if (val.apresMidi == true) {
                        var etatApres = 'réservé';
                    }else {
                        var etatApres = 'non réservé';
                    }

                    $listResa.append(
                        jQuery("<div style='display:flex;justify-content: space-around'>")
                            .append(jQuery("<span class='badge badge-info' style='width: 200px'>").append(val.compte.pseudo),
                            jQuery("<span class='badge badge-light' style='width: 100px'>").append(val.date),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatMatin),
                            jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatApres))

                    );
                    $listResa.append(
                        jQuery("</div><div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>")
                    );
                });
            })
            .fail(function () {
                alert("Erreur !!");
            });
    }



    function listResaMois(mois) {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_listResaMois"/>";


        var nomTopo = $("#nomTopo").text();

        var params = {
            mois:mois,
            nomTopo: nomTopo
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listResa = jQuery("#listResa");
                $listResa.empty();
                jQuery.each(data, function (key, val) {

                    if (val.matin == true) {
                        var etatMatin = 'réservé';
                    }else {
                        var etatMatin = 'non réservé';
                    }
                    if (val.apresMidi == true) {
                        var etatApres = 'réservé';
                    }else {
                        var etatApres = 'non réservé';
                    }

                    $listResa.append(
                        jQuery("<div style='display:flex;justify-content: space-around'>")
                            .append(jQuery("<span class='badge badge-info' style='width: 200px'>").append(val.compte.pseudo),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(val.date),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatMatin),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatApres))

                    );
                    $listResa.append(
                        jQuery("</div><div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>")
                    );
                });
            })
            .fail(function () {
                alert("Erreur !!");
            });
    }
</script>
</body>
</html>
