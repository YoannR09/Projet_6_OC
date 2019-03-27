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
<div id="page">
<div class="col-lg-10 col-md-10 col-sm-10" style="color: white;">
    <div id="recherche" class="col-lg-12 col-md-12 col-sm-12" style="background-color:rgba(0,0,0,0.8);padding-top: 10px;padding-bottom: 10px;margin-top: 20px">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Recherche" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-outline-light" type="button">Site</button>
                <button class="btn btn-outline-light" type="button">Topo</button>
            </div>
        </div>
    </div>
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" class="col-lg-12 col-md-12 col-sm-12" style="background-color:rgba(0,0,0,0.8);height: 440px;">
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

    <div id="textDescri" class="col-lg-12 col-md-12 col-sm-12"style="background-color:rgba(0,0,0,0.8);padding-top: 10px;text-align: center" >
        <p>Bienvenue sur mon site communautaire dédié à l'escalade.</p>
        <p>Vous pouvez y trouver des sites et topos disponibles dans vos regions/departement</p>
    </div>
</div>

</div>
</body>
</html>