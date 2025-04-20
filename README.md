# sesion_4_moviles

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Sesión 4

## Esquema de la aplicación

- moster_chef_app
  - moster_chef_pagina_principal
    - lista_compra_pantalla (observa de lista_compra (Esto es lo que cambia, y lo que es observado))
      - lista_compra_aniadir_producto  (La sustituye, por encima, por eso lo del navigator )
      - lista_compra_pantalla_vacia
      - lista_compra_pantalla_llena (Se compone de los widgets de linea_producto)
    - lista_recetas_pantalla

## Apuntes 
- Podemos tener un archivo barrrel que nos permite resumir todos los import de las clases de un paquete. (Si añadimos una clase al modelo, añadimos el export en la clase modelo y todas las que lo importaban, ahora la usan)
- Puedes recorrer un mapa con un foeach :) Maravilloso 
- Ojo porque el snapshot.data de las cosas, le pasamos la lista de recetas, que es loque devuelve el future 
- Flutter tiene la vista oritentation builder, que permite saber como está el bicho. en este caso tiene una propiedad que le pasamos, y esta permite saber las cosas como está. 
## Future
- Importante usar el acrónico async y como cabecera el future
- Normalmente se disponen de dos funciones, una que lee, e internamente hace los cambios que se necesite, y por otro lado tenemos la función que conecta con el servicio, que realmente realiza la llamada a la API
- Lo que hace cuando ponemos async es que ejecuta en una hebra diferente.
- El await lo que hace es interrumpir la ejecición para que los demás puedan ejecutar. 

## Peticiones HTTP
- Es conveniente antes de hacer la petición, poder comprobar la url (Uri.parse)
- 

## Funciones
- JsonDecode: Jsondecode devuelve el mapa que hemos hablado para poderrecorrelo 

## Vistas
- FutureBuilder: Permite mostrar otra vista mientras que carga la que está ahora. (Necesita un contexto y un AsyuncSnapshot que escuche del contexto del future )

## Patrones
- Galeria: Navegación primaria persistente. 

## Widgets
- CircularProgresIndicator: Permite mostrar una animación de carga mientras se está cargando algo.
- clipRRect: Oermite recortar los bordes de un widget
- GridView: Es una vista la cual, puede desplazarse.
  - SliverGridDelegateWithFixedCrossAxisCount: Permite definir el número de columnas que queremos en la vista. y en función a este número hacer los cálculos.
- Gridview.builder: 
## Opciones
SizeBox:
  - Width: double.infinity, depende de la cantidad de elementos que haya en pantalla

Image.network: Permite coger imágenes de internet
  - fit: BoxFit.cover, permite que la imagen se ajuste al tamaño del contenedor. (Permite que las imágenes se escalen).

Gridview.builder:
  - gridDelegate. Basicamente prar que calcule el espacio y como se van a distribuir los elementos.
  - itemBuilder: La función que creará la instancia de la clase MiniaturaReceta. (Se ejecuta una vez por cada receta)
  - intemConunt: El número de elementos a represnetar en la cuadrícula.