<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 05/02/2019
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("./image/gplay.png");
        }
        #page
        {
            background-image: url("/image/qbkls.png");
            display: flex;
            justify-content: center;
        }
        #bloc
        {
            margin: 20px;
            width: 200px;
        }
        #divImage
        {
            height: 100%;
            background-color: white;
        }
        #divCota
        {
            text-align: center
        }
        #editeur
        {
            float: right;
            font-size: 0.7em;
        }
        #btnVoir
        {
            float: right;
        }
        #recherche
        {
            margin-top: 20px;
        }

    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div id="page" class="col-lg-12 col-md-12 col-sm-12">

<div id="partieGauche"  class="col-lg-7 col-md-7 col-sm-7" style="display: flex;justify-content: space-around">
        <s:iterator value="listTopo">
                <div class="card text-white mb-4" id="bloc" style="background-color:rgba(0,0,0,0.7)">
                    <div class="card-header " style="text-align: center"><s:property value="nom"/></div>
                    <div class="card-body" >
                        <div id="divImage" class="col-lg-12 col-md-12 col-sm-12">
                            <img src="./image/topo1.jpg"
                                 width="100%" height="100%" id="img" style="border: 1px black solid;" />
                        </div>
                    </div>
                    <div class="card-footer">
                        <s:a action="topo_detail" class="btn btn-info" id="btnVoir" style="width:100%"><s:param name="idTopo" value="id" /> Voir </s:a>
                    </div>
                </div>
        </s:iterator>
    <s:if test="nombre == 3">
        <s:a id ="pageUp" action="topo_valide_list_pageUp" class="btn btn-info"><s:param name="lastId" value="lastId" /> Page suivante </s:a>
    </s:if>
    <s:if test="firstPage != true">
        <s:a id ="pageDown" action="topo_valide_list_pageUp" class="btn btn-info"><s:param name="lastId" value="lastId" /> Page précedente </s:a>
    </s:if>
</div>
    <div id="partieDroite"  class="col-lg-3 col-md-3 col-sm-3">
        <div class="card text-white mb-4"  id="recherche" style="background-color:rgba(0,0,0,0.7)">
            <div class="card-header "><em>Rechercher les sites</em></div>
            <div class="card-body"style="text-align: center" >
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Recherche..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-info" type="button"> <span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
                <br/>
                <s:a action="site_detail" class="btn btn-info" style="width:80%; margin:10px;"><s:param name="idSite" value="id" /> Bien noté </s:a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
