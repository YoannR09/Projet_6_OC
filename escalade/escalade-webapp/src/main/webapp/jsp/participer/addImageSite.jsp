
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
                <h2 id="nomSite" style="padding: 20px"><s:property value="site.nom"/></h2>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <button type="button" class="btn btn-outline-info" id="btnSecteur" style="float: right" data-toggle="modal" data-target="#exampleModalCenter">Ajouter un secteur</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12" id="cadreSecteur" style="background-color:rgba(0,0,0,0.7);">
            <h5 style="text-align: center">Ajouter des images</h5>

            <div id="listImage">
                <s:iterator value="listImage">
                    <img src="./image/<s:property value="urlImage"/>" style="height: 200px;width: 300px;margin: 10px;">
                    <s:property value="description"/>
                    <br/>
                </s:iterator>
            </div>

            <s:a action="index" class="btn btn-info">Terminer </s:a>
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
                        <s:form action="addImageSite" id="formulaire" method="POST" style="margin-left:10%;" enctype="multipart/form-data">
                            <s:file id="fileProfil" name="myFile"  label="Image principale " style="color:white"/>
                            <s:submit value="Ajouter" id="btn" class="btn btn-info"/>
                            <s:textfield value="" name="nomSiteText" id="nomSiteText"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(function() {
        var text = $('#nomSite').text();
        $('#nomSiteText').hide();
        $('#nomSiteText').val(text);
    });


</script>
</body>
</html>


