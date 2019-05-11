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
        em
        {
            color : darkgray;
        }
        h3
        {
            padding: 10px;
        }
        #infos
        {
            border-radius: 25px;
            position: absolute;
            top: 20px;
            right: 40px;
            z-index: 1;
        }
        #info
        {
            color: white;
        }

    </style>

    <%@ include file="/_include/head.jsp"%>
</head>
<body>

<%@ include file="/_include/header.jsp"%>


<div id="page">

    <div class="col-lg-9 col-md-9 col-sm-9" style="color: white; margin-top: 20px;">

        <button id="infos" type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#informations"><em id="info"><i class="fas fa-info"></i></em></button>

        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreImage" style="background-color:rgba(0,0,0,0.7);padding-top: 10px;text-align: center;margin-bottom: 20px;">
            <p id="count"></p>
            <h2 id="nomTopo"><s:property value="topo.nom"/></h2>
            <h4 style="text-align: left;margin: 15px;"><em>Vous voulez reserver ce topo</em></h4>

            <div  id="messageAjax" style="padding: 15px">
            <em style="color: yellow;"><i class="fas fa-exclamation-triangle"></i>  Créneau déjà réservé</em>
            </div>
                <div class="form-group row">
                    <label for="example-date-input" class="col-2 col-form-label">Date à reserver : </label>
                    <div class="col-4">
                        <input id="date" name="date" class="form-control" type="date" id="example-date-input">
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input id="matin" name="matin" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> Matin
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input id="apresMidi" name="apresMidi" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> Après-midi
                        </label>
                    </div>
                    <button type="button" onclick="addResa()" class="btn btn-outline-info">Réserver</button>
                </div>

            <div>
                <h4 style="text-align: left;margin: 15px"><em>Liste des réservations de ce topo</em></h4>
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

                <div  id="listResa" class="overflow-auto" style="max-height: 400px">
                </div>

        </div>

        <!--------------------------------- Pop-up ------------------------------------>

            <div class="modal fade" id="informations" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="color: black">
                <div class="modal-dialog modal-dialog-centered" role="document" style="width: 50%">
                    <div class="modal-content bg-dark" style="color:white;">
                        <div class="modal-header">
                            <h5 class="modal-title" id="tittle">Responsable du topo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span style="color: white" aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <p><s:property value="topo.responsable.nom"/> / <s:property value="topo.responsable.prenom"/></p>
                            <p><s:property value="topo.responsable.email"/></p>
                            <p><s:property value="topo.responsable.numero"/></p>
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


        $('#messageAjax').hide();
        $('#count').hide();

        listResa();
        countResa();

        $('#blocBtn > button').click(function(){
            var x = $(this).attr('id');
            $('#blocBtn > button').addClass('bg-info');
            listResaMois(x);
        });
    });

    /**
     * Méthode pour afficher la liste des réservations du topo.
     */
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

                    var dates = new Date(val.date);

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
                            jQuery("<span class='badge badge-light' style='width: 100px'>").append(dates.getDate(),'/',(dates.getMonth()+1),'/',dates.getFullYear()),
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


    /**
     * Méthode pour afficher la liste des réservations du topo en fonction du mois.
     * @param mois
     */
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

                    var dates = new Date(val.date);

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
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(dates.getDate(),'/',(dates.getMonth()+1),'/',dates.getFullYear()),
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

    /**
     * Méthode pour ajouter une réservation.
     * Ajoute la réservation à la bdd si toutes les conditions sont bonnes.
     * On affiche ensuite la liste des réservations du mois de la réservation éffectuée.
     */
    function addResa() {

        // URL de l'action AJAX
        var url = "<s:url action="ajax_add_reservation"/>";

        countResa();

        var nomTopo = $("#nomTopo").text();

        var date = $("#date").val();

        if( $('input[name=matin]').is(':checked') ){
            var matin = true;
        } else {
            var matin = false;
        }

        if( $('input[name=apresMidi]').is(':checked') ){
            var apresMidi = true;
        } else {
            var apresMidi = false;
        }

        var params = {
            date:date,
            matin:matin,
            apresMidi:apresMidi,
            nomTopo: nomTopo,
        };

        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                var $listResa = jQuery("#listResa");
                var $messageAjax = jQuery("#messageAjax");
                $listResa.empty();
                jQuery.each(data, function (key, val) {
                    var dates = new Date(val.date);

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
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(dates.getDate(),'/',(dates.getMonth()+1),'/',dates.getFullYear()),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatMatin),
                                jQuery("<span class='badge badge-light' style='width: 100px'>").append(etatApres))

                    );
                    $listResa.append(
                        jQuery("</div><div style='width: 100%;height: 5px; border-bottom : 1px solid lightgray; border-radius: 40%'>")
                    );
                });

                var nbreResa = $('#count').text();
                console.log(data.length);
                console.log(nbreResa);

                if(data.length == nbreResa){
                    $('#messageAjax').show();
                }else {
                    $('#messageAjax').hide();

                }
            })
            .fail(function () {
                alert("Erreur !!");
            });

        countResa();
    }

    /**
     * Méthode pour compter le nombre de réservations.
     */
    function countResa() {
        // URL de l'action AJAX
        var url = "<s:url action="ajax_count_resa"/>";

        var nomTopo = $("#nomTopo").text();

        var params = {
            nomTopo: nomTopo,
        };
        // Action AJAX en POST
        jQuery.post(
            url,
            params,
            function (data) {
                $('#count').empty();
                $('#count').append(data);
            });
    }
</script>
</body>
</html>
