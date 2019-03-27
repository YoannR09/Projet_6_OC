

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/_include/head.jsp"%>
    <style type="text/css">

        #btn
        {
            margin: 10px;
        }
        #card
        {
            margin-top: 30px;
        }

        #mid {
            display: flex;
            justify-content: space-around;
            text-align: center;
        }
        #page {
            display: flex;
            justify-content: space-around;
            text-shadow: 0px 0px 15px rgba(0, 0, 0, 1);
        }

        .blocInfo{
            margin: 20px;
        }
    </style>
</head>

<body>
<header>
    <%@ include file="/_include/header.jsp"%>
</header>

<div id="page">
<div class="card text-white mb-3" style="max-width: 25rem;background-color:rgba(0,0,0,0.8)"
     id="card">

    <div class="card-header"><h3>Connection</h3></div>
    <div class="card-body" id="mid">
        <s:form action="login">
            <s:textfield name="pseudo" label="Identifiant " class="blocInfo"/>
            <s:textfield name="password" type="password" label="Mot de passe " class="blocInfo" />
            <s:submit value="Connexion" id="btn" class="btn btn-info"/>
        </s:form>
    </div>
</div>
</div>
</body>
</html>