<!DOCTYPE html>

<html>
<head>
    <%@ include file="/_include/head.jsp"%>
    <style type="text/css">
        #bloc
        {
            margin: 20px;
            text-align: center;
        }

        #page {
            display: flex;
            justify-content: space-around;
        }
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("./image/gplay.png");
        }
        #cadreImage
        {
            height: 450px;

        }
    #carouselExampleSlidesOnly {
        border-color: black;
        border-style: solid;
        border-width: 0px 1px 0px 1px;
        text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
    }
    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div style="position: fixed;z-index: 1;right: 20px;bottom: 10px;">
    <s:if test="actionmessage != null">
    <div class="alert alert-success">
        <s:actionmessage/>
    </div>
    </s:if>
    <button class="btn btn-outline-light" type="button">X</button>
</div>

<div id="page">
<div class="col-lg-10 col-md-10 col-sm-10" style="color: white;">
    <div id="recherche" class="col-lg-12 col-md-12 col-sm-12" style="background-color:rgba(0,0,0,0.7);padding-top: 10px;padding-bottom: 10px;margin-top: 20px">
        <s:form action="recherche_site" style="width:100%">
        <div class="input-group">
            <input id="text" name="text" type="text" class="form-control" placeholder="Recherche" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <select name="select" class="form-control">
                    <option>Site</option>
                    <option>Topo</option>
                </select>

            </div>
                <s:submit style="margin:auto" value="Rechercher" id="btn" class="btn btn-info"/>
        </div>
        </s:form>
    </div>
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" class="col-lg-12 col-md-12 col-sm-12" style="background-color:rgba(0,0,0,0.7);height: 440px;">
            <div class="carousel-inner" style="height: 100%; background-color:rgba(0,0,0,0.8)">
                <div class="carousel-item active" style="height: 100%">
                        <img src="./image/6.jpg"
                             width="100%" height="100%" id="img1"  alt="First slide" style="background-color:rgba(0,0,0,0.8);" />

                    <div class="carousel-caption d-none d-md-block">
                        <h1>Bienvenue sur mon site</h1>
                        <p>Ce site propose des topos et sites d'escalade</p>
                    </div>
                </div>

            </div>
        </div>

    <div id="textDescri" class="col-lg-12 col-md-12 col-sm-12"style="background-color:rgba(0,0,0,0.7);padding-top: 10px;text-align: center" >

    </div>
</div>

</div>
</body>
</html>