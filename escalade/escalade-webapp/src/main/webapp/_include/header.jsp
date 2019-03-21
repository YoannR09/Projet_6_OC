<%--
  Created by IntelliJ IDEA.
  User: El-ra
  Date: 05/02/2019
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <s:a action="home" class="navbar-brand">Palabres</s:a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <form class="form-inline my-2 my-lg-0" >
            <s:if test="#session.user"><span id="label" style="color: white; margin-right: 5px;"> Utilisateur :  </span>
               <span id="loginText"><s:property value="#session.user.pseudo" /></span>
                <s:a action="logout" class="nav-link">Deconnexion</s:a>
            </s:if>
            <s:else>
                <s:a action="newUser" class="nav-link">Nouveau compte</s:a>
                <s:a action="login" class="nav-link">Connexion</s:a>
            </s:else>
        </form>
    </div>
</nav>
