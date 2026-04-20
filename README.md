# "Retro-Gaming Vault" (Museo del Píxel)


**Parte 1**
Lo primero que hacemos es declarar en baseX para que entienda file:write
Si pones file:write, no lo entendera. Hay que poner esto:

declare namespace file = "http://expath.org/ns/file";
despues cargamos el xml en baseX.

He creado el html para la consulta 1 con sus etiquetas correspondientes. Main, header, head, body

**consulta 1**

Lo que queremos en la consulta 1: 
 son los ítems de tipo "Hardware" lanzados antes de 1985.

 for $item in $xml//Item[@categoria = 'Hardware' and xs:integer(AnioLanzamiento) < 1985]
 order by xs:integer($item/AnioLanzamiento)
 return 

La variable creada es ruta_salida.

En la serializacion he seguido lo que ponia en classroom.
file:write(
  "C:/ruta/proyecto/index.html",
  $html,
  map {
    "method": "html",
    ...
