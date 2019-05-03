<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>

    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            background-image: url("./image/gplay.png");
        }
        #bloc
        {
            margin: 20px;
            background-color:rgba(0,0,0,0.7);
        }
        #divImage
        {
            height: 100%;
        }
        #divCota
        {
            text-align: left;
        }
        #editeur
        {
            float: right;
            font-size: 0.7em;
        }
        .cota
        {
            border-radius: 25px;
            border: 1px black solid;
            padding: 10px;
        }
        #vil,#dep,#typ,#not,#nvo,#nse,#cotaMax,#cotaMin
        {
            font-size: 0.7em;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }
        em
        {
            color : darkgray;
        }
        #page
        {
            background-image: url("/image/qbkls.png");
            display: flex;
            justify-content: center;
        }
        #blocPage
        {
            position: absolute;
            bottom: -100px;
            justify-content: space-between;
            margin-bottom:20px;
            display: flex;
            background-color:rgba(0,0,0,0.7);
            padding: 20px;
            width: 350px;
            left: 50%;
            border-radius: 20px;
        }

    </style>
</head>
<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>
<div id="page" class="col-lg-12 col-md-12 col-sm-12">
    <div id="partieGauche"  class="col-lg-7 col-md-7 col-sm-7">
        <s:if test="listSite.empty">
            <div class="card text-white "  id="bloc">
                <div class="card-body" style="display: flex;">
                    <em style="color: white">Aucun site d'escalade</em>
                </div>
            </div>
        </s:if>
        <s:iterator value="listSite">
            <div class="card text-white "  id="bloc">
                <div class="card-header "><s:property value="nom"/><p id="editeur"><em>Editeur : </em><s:property value="editeur.pseudo"/></p></div>
                <div class="card-body" style="display: flex;">
                    <div id="divImage" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <img src="./image/<s:property value="urlImg"/>" width="100%" height="100%" id="img" style="border: 1px black solid;" />
                    </div>
                    <div id="divInfos" class="col-lg-4 col-md-4 col-sm-4">
                        <p id="vil"><em>Ville : </em><s:property value="ville"/></p>
                        <p id="dep"><em>Departement : </em><s:property value="departement.nom"/></p>
                        <p id="typ"><em>Roche : </em><s:property value="typeDeRoche.type"/></p>
                        <p id="not"><em>Note : </em><s:property value="note"/> / 10</p>
                    </div>
                    <div  class="col-lg-3 col-md-3 col-sm-3">
                        <p id="nvo"><s:property value="nombreVoie"/><em> voies</em></p>
                        <p id="nse"><s:property value="nombreSecteur"/><em> secteurs</em></p>
                        <div >
                            <p id="cotaMin"><em>Min : </em><span class="cota" style="background-color:<s:property value="cotationMin.couleur"/>" ><s:property value="cotationMin.valeur"/></span></p>
                        </div>
                        <div style="margin-top: 30px;">
                            <p id="cotaMax"><em>Max : </em><span class="cota" style="background-color:<s:property value="cotationMax.couleur"/>"><s:property value="cotationMax.valeur"/></span></p>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" id="divCota">
                        <s:a action="site_detail" class="btn btn-info" style="font-size:0.5em;"><s:param name="idSite" value="id" /> Voir </s:a>
                    </div>
                </div>
            </div>
        </s:iterator>
        <div id="blocPage">
            <s:if test="page != 1">
                <s:if test="%{#critere=='valide'}">
            <s:a id ="pageDown" action="site_valide_list_pageDown" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='recherche'}">
                    <s:a id ="pageDown" action="site_valide_list_pageDown_recherche" class="btn btn-info"><s:param name="page" value="page" /><s:param name="text" value="text" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='note'}">
                    <s:a id ="pageDown" action="site_valide_list_pageDown_note" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='cotaMin'}">
                    <s:a id ="pageDown" action="site_valide_list_pageDown_cotaMin" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='cotaMax'}">
                    <s:a id ="pageDown" action="site_valide_list_pageDown_cotaMax" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
            </s:if>
            <s:else>
                <button type="button" class="btn btn-info"  disabled> Page précédente </button>
            </s:else>
            <s:if test="endList == false">
                <s:if test="%{#critere=='valide'}">
                    <s:a id ="pageDown" action="site_valide_list_pageUp" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='recherche'}">
                    <s:a id ="pageDown" action="site_valide_list_pageUp_recherche" class="btn btn-info"><s:param name="page" value="page" /><s:param name="text" value="text" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='note'}">
                    <s:a id ="pageDown" action="site_valide_list_pageUp_note" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='cotaMin'}">
                    <s:a id ="pageDown" action="site_valide_list_pageUp_cotaMin" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
                <s:if test="%{#critere=='cotaMax'}">
                    <s:a id ="pageDown" action="site_valide_list_pageUp_cotaMax" class="btn btn-info"><s:param name="page" value="page" /> Page précédente </s:a>
                </s:if>
            </s:if>
            <s:else>
                <button type="button" class="btn btn-info"  disabled> Page suivante </button>
            </s:else>
        </div>
    </div>
    <div id="partieDroite"  class="col-lg-3 col-md-3 col-sm-3" style="margin-top: 20px">
        <div class="card text-white mb-4"  id="recherche" style="background-color:rgba(0,0,0,0.7)">
            <div class="card-header "><em>Rechercher les sites</em></div>
            <div class="card-body"style="text-align: center" >
                <s:form action="recherche_site">
                    <div class="input-group" style="display: flex;justify-content: space-around">
                        <input type="text" name="text" class="form-control" placeholder="Recherche..." aria-label="Recipient's username" aria-describedby="basic-addon2" required>
                        <div class="input-group-append">
                            <button id="btn" class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </s:form>
                <br/>
                <s:a action="site_valide_list_cotaMax" class="btn btn-info" style="width:80%; margin:10px;"> Difficiles </s:a>
                <br/>
                <s:a action="site_valide_list_cotaMin" class="btn btn-info" style="width:80%; margin:10px;"> Faciles </s:a>
                <br/>
                <s:a action="site_valide_list_note" class="btn btn-info" style="width:80%; margin:10px;"> Bien noté </s:a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
