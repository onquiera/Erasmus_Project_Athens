
installation de psql : recherche google :)

puis

passage en tant que l'utilisateur 'postgres' > l'utilisateur par défaut

et création de l'utilisateur avec la session 
(-s pour permission superuser)
createuser -s xxx
createuser -s root
(aussi à faire pour faciliter les choses sur linux) > sur windows, c'est surement différent

puis gestion database etc 

createdb er Asmus-project

(faire bien attention au nom)

puis : psql er Asmus-project
pour y accéder et pouvoir faire les commandes sql ..

commande comme select, create ..
\q .. \i script


gestion utilisateurs/mdp psql :
https://stackoverflow.com/questions/15008204/how-to-check-postgres-user-and-password

url psql : 
https://stackoverflow.com/questions/3582552/postgresql-connection-url
> general URL = "jdbc:postgresql://host:port/database"
pour nous : "jdbc:postgresql://localhost:5432/er Asmus-project"

doc globale psql :
https://www.postgresql.org/docs/9.2/index.html
