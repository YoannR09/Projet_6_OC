<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 05/02/2019
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-expand-lg navbar-dark " style="background-color:rgba(0,0,0,0.7);">
    <s:a action="index" class="navbar-brand">Mon site d'escalade</s:a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <s:a action="site_valide_list" class="nav-link">Site</s:a>
            </li>
            <li class="nav-item">
                <s:a action="topo_valide_list" class="nav-link">Topo</s:a>
            </li>
            <li class="nav-item">
                <s:a action="participer" class="nav-link">Participer</s:a>
            </li>
            <li class="nav-item">
                <s:a action="contact" class="nav-link">Nous contacter</s:a>
            </li>
            <s:if test="%{#session.niveau == 2}">
                <li class="nav-item">
                    <s:a action="gestion" style="color:deepskyblue"  class="nav-link">Gestion</s:a>
                </li>
            </s:if>
        </ul>
        <form class="form-inline my-2 my-lg-0" style="color: white" >
            <s:if test="#session.user">
                <s:property value="#session.user.pseudo" />
                <s:set var="pseudo" value="session.user.pseudo"/>
                <s:a action="logout" class="nav-link">Deconnexion</s:a> /
                <s:a action="logout" class="nav-link">Mon profil</s:a>
            </s:if>
            <s:else>
                <s:a action="login" style="color:lightgray" class="nav-link">Connexion</s:a> /
                <s:a action="newUser" style="color:lightgray" class="nav-link">S'inscrire</s:a>
            </s:else>

        </form>
    </div>
</nav>
