# Control1DBDA


####################################
##### Manual de Carga y prueba #####
####################################

Para la creacion de la base de datos desde consola PSQL:

1- Abrir PSQL y acceder a la version 12 de postgreSQL
    *Si se instalo con valores por basicos, apretar enter hasta tener que usar consola.

2- Crear la base de datos de prueba usando el siguiente comando:
    CREATE TABLE tiendas_comerciales
    
    *Si la base de datos se creo correctamente aparecera al usar el comando "\l".

3- Conectarse a la base de datos creada anteriormente utilizando:
    \c tiendas_comerciales

4- Crear las tablas utilizando el archivo dbCreate.sql:
    \i 'C:/Users/pdema/Documents/Universidad/tbd/Control1DBDA/dbCreate.sql'

    *reemplazar la ruta con la ubicacion local del archivo.

5- Cargar los datos fakers utilizando el archivo loadData.sql:
    \i 'C:/Users/pdema/Documents/Universidad/tbd/Control1DBDA/loadData.sql'

    *reemplazar la ruta ocn la ubicacion local del archivo.

6- Correr las querys de respuesta utilizando el archivo runStatements.sql:
    \i 'C:/Users/pdema/Documents/Universidad/tbd/Control1DBDA/runStatements.sql'

    *reemplazar la ruta ocn la ubicacion local del archivo.

Las respuestas a las preguntas apareceran en orden de las preguntas. Si se desea ver el codigo de estas queries
se puede acceder al archivo runStatements.sql abriendolo con algun editor como VSCode o la herramienta de queries 
de PGAdmin.


Para la creacion de la base de datos desde PGAdmin:

1- Abrir PGAdmin y acceder a la version 12 de postgreSQL.

2- Hacer click secundario en postgreSQL 12 y seleccionar "Create>Database".

3- Escribir el nombre de la base de datos y presionar "save" (Recomendacion de nombre: "tiendas_comerciales").

4- Hacer click secundario en la base de datos recien creada y presionar en "Query tool".

5- Presionar el boton de abrir archivo arriba a la izquierda y seleccionar el archivo "dbCreate.sql".

6- Asegurarse que el cursor se encuentra al inicio del archivo y apretar F5 (igualmente se puede presional el boton Execute, que posee el simbolo de "play").

7- Cargar otro archivo llamado "loadData.sql" que se encuentra en la misma carpeta (se puede utilizar una nueva query tool o la misma, pero no guardar cambios).

8- Realizar lo mismo que en el paso 6.

9- Cargar un nuevo archivo llamado "runStatements.sql" de la misma carpeta (misma recomendacion que en 7).

Desde aqui se recomienda seleccionar el codigo completo de la pregunta a revisar y correr el codigo (con F5 o el boton Execute).
Con este metodo se puede observar el codigo y los resultados en la misma ventana.