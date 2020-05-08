### Game Jam

09-05-2020 Jam Chill 

https://itch.io/jam/rigid-jam-10


-----------------------------------
## Indice Documento_de_diseño 
* [Documento de diseño de juego plataformas Godot](#Documento_de_diseño)
* [Estructura del proyecto ](#Estructura_del_proyecto )
* [Mecánicas](#Mecánicas)
* [Producción](#Producción)
* [Objetivos alcanzados](#Objetivos_alcanzados)

### Documento_de_diseño 
juego plataformas Godot

Bueno aquí se va poniendo las historias del proyecto

-----------------------------------

Diseño de juego: No es diseño de gráficos.

Juego 2D con un solo botón. El protagonista avanza automáticamente, debe de saltar los obstáculos , ¿coger potenciadores? 

¿cambio de sentido?

Hay que ponerlo para movil
--------------------------------
### Estructura_del_proyecto 
No me gusta la estructura. que los scritp por un lado las escenas en otro las imagenes en otro y asi. 
Cuando creas un nuevo elemento tienes que subir un archivo aqui otro alli y el otro no se donde y si despues quieres reutilizar algo. 
Pues. Te dan por culo!!!
Por que al proyecto en el que lo quieras meter no va a tener la misma configuracion. 
Por lo que propondo hacerlo como lo hemos hecho en otros proyectos que cada elemento este dentro de una carpeta con todas las cosas de ese elemento. 
Por ejemplo:
/Player
/Player/escenas
/Player/script
/Player/imagenes
Que os parece???
No digo de hacerlo ahora ¿o si?. Pero si despues del final de la jam

----------------------------------
# No se como. Pero parece que al poner la almuadilla se crea un enlace al renglon en el que se ha puesto. molaria un indice de esos enlaces al principio del documento
-----------------------------------
### Mecánicas:

Primeramente se deben pasar a Godot 3:

Definir formato gráficos: tamaño de la pantalla (lo que se ve) y ajustar escala cámara y/o nivel - player

EL juego no se muestra adecuadamente:

https://cyclopistudio.github.io/CyloPi-Studio-Web/testing_2020/pruebas/1-boton-test.html

Difenir mecánicas, tiempos muerte o muertes, menús, ciclo de juego.

Propuesta de mecánicas de menús - juego con botón secuencial:

Panatalla inicio (portada) menu 1 ( muestra créditos y controles) ==> juego nivel 1,  todas las transiciones con solo botón ( toda la pantalla de botón ) ==> game over / win (transición automática con  temporizador + botón ) ==> panatalla inicio (portada) u otro nivel (pondré un flujograma). 

Lo saco del proyecto

Lo podeis encontrar aquí, 

Solo una pantalla entrar : controles = solo un un botón (pantalla) y créditos: Antonio cga, un par de la música y nosotros. 

-----------------------------------

Artes (Personaje, pantallas, malos, potenciadores, menús, promo):

Definir temática, propuestas, venga nenes a proponer:

* Pollo sin cabeza

* Piratas

-----------------------------------

Audio: música, sonidos 

-----------------------------------

Publicación:

Créditos,  descripción , promos, ¿ landing page ?( podría valer la de ichio, si se hace en condiones)

Sacar html del juego

Sacar html para ichio

-----------------------------------

### Producción
(aquí vamos pasando las cosas que se van haciendo):

Jose: Repaso de errores para adapatación a Godot 3D

Bravo: lo que le da la gana, pon aquí lo que estás haciendo +  abajo lo que has terminado

Ksk: 
* Arreglo de tileset
* Redimensionado del proyecto 
* Ajustar background level_0
* añado enemigo_01 (no mata solo molesta al chocar con el)

Usuario 2: tocandose los ...

Usuario 3: A 2 manos

-----------------------------------

### Objetivos_alcanzados
(aquí vamos pasando las cosas que se ha terminado):
Jose: pruebas de exportación a html del juego

Jose: Base para desarrollar el documento de diseño de juego

Cyclo π Studio: Estructura de diseño de juego, base rama template 

-----------------------------------


Template: Practicando con Godot, juego de plataformas. 

Gracias  Antonio cga:

https://github.com/toniocga/plataformas

--------------------------------------------------------------------------------------------------------------

## Welcome to Cyclo 𝛑 Studio

You can visit our website [cyclopistudio.github.io](https://cyclopistudio.github.io/) and you will play our video games.

Visita nuestra página Web de CyloPi Studio y verán nuestros juegos:

https://cyclopistudio.github.io/


#### Collaborators and partners:

Cyclo π Studio in Github https://cyclopistudio.github.io/

Cyclo π Studio Web 2017 http://greenfactory.es/23d/cyclopi.html

Juan Blender https://sites.google.com/site/blender3dgear/

greenfactory.es http://greenfactory.es/

Cyclo π Studio, Cyclo Pi Studio
