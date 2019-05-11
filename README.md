##  Mettre en place l'application

####  1) Créer la base de données :

   1. Ajouter le script qui se trouve dans le fichier SQL/SCRIPT.sql.
   Ou alors ajouter avec le backup dans le fichier SQL/postgreSQL/backup_postgreSQL_structure.sql
 
   2. Récupèrer le backup de la base de données dans le fichier SQL/postgreSQL/backup_postgreSQL_data.sql

####   2) Modifier les variables dans le fichier webapp/META-INF/context.xml :

   1. Mettre l'url de la base de données.
   2. Changer l'username.
   3. Changer le password.
   		
  ![automated like clockwork](doc/image/2.png)
  
####  3)  Modifier le despath pour ajouter les images
    
   > Dans la classe escalade-webapp/src/main/java/fr.oc.projet.webapp.action.GestionParticiper.
   
   ![automated like clockwork](doc/image/3.png)

####   4) Se connecter à l'application avec un compte admin
    
   > Identifiant : Yocorps <br>
     Mot de passe : 123
