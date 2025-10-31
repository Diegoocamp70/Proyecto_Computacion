#Comandos para git

#Clonar repositorio

git clone urldelrepositorio

#Listar ramas

git branch(la rama en la esta aparece con asterisco *)

#cambiarse a la rama 

git checkout nombrerama

#actualizar la rama actual

git pull origin main


#guardar cambios

git add.

#hacer commit indicando que se cambio

git commit -m "Descripción corta y clara del cambio"


#subir cambio a su rama la primera vez

git push -u origin nombre-rama

#subir cambios despues de la primera vez

git push

#luego solicitar el pull request desde github para que los cambios de la rama se pasen al main
