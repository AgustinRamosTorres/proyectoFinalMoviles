# sesion_3_moviles

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Sesión 3

## Esquema de la aplicación

- moster_chef_app
  - moster_chef_pagina_principal
    - lista_compra_pantalla (observa de lista_compra (Esto es lo que cambia, y lo que es observado))
      - lista_compra_aniadir_producto  (La sustituye, por encima, por eso lo del navigator )
      - lista_compra_pantalla_vacia
      - lista_compra_pantalla_llena (Se compone de los widgets de linea_producto)
    - lista_recetas_pantalla

## Apuntes 
- La variable _páginas la he declado como static debido a que va a compartirse entre todas las instancias de la clase y no depende de ninguna.
- Podemos cambiar el tema claro y oscuro, usando en el ThemeData: Brignetness.dark o Brightness.light. y fuera el dartTheme.Dark y el themMode: com Thememode.system.
- IMPORTANTE: Los navigator para quitar y poner las pantallas (Material Page route y navigator)
- Importante declarar el controlador del campo de texto en el init state, para poder ir recogiendo la información.
- Todas las vistas tienen un método dispose que permite, eliminar recursos cuando dejan de estar vistas por el usuario
- Basicamente lo que hace el Navigator.push es añadir a la pila con una animación
- MaterialPageRoute: Es la que se encarga de crear la animación de la pantalla.
- Un map devuelve un iterable, por lo que cuando pide una list de widget, hay que convertirla a un tolist.
- Una cosa muy importante son los temas de testoColoreado.
- Material pageRoute para aniadir pantallas
- Que es el key
- Podemos usar el plugin path provider para almacenar los datos. 
- Podemos usar dentro de un enumerado, el método byname para poder encontrar cosas.

## Json
- Basicmente tenemos que hcaer un método que nos lo convierta a un objeto
- Tenemos que hacer otro método que nos lo devuelva a otro Json (Estructuras de los métodos en el código)
- Para ello utilizamos el método getApplicationDocuemntsdirectory.
- Almacenamos la posible ruta, porque es un future y xd con los futures.
- Todos estos trastes se han realizado en la lista de la compra. 
Funcionamiento de los métodos

## Patrones de diseño
- Patrón de interacción barra de navegación: Tiene como caracteristica que es un patrón de navegación persistente.
- Información anidada
- Estado IMPORTANTE: 
- Boton hacia atrás
- Herramienta
## Widgets
- BottonNavigationBar: Es un widget que permite la navegación entre diferentes pantallas de la aplicación. (En la parte de abajo). IMPORTANTE: Hacerlos const debido a que no van a cambiar.
- floatingActionButton: Es un widget que agrega un boton a la parte inferior, con el que podemos interactuar
- ListView: Te permite hacer scroll
- ListView.separated: Basicamente te hace sola la separación de la lista.
- Wrap: Basicamente para mostrar cosas cosas en horizontal mientras haya sitio.(Hace filas sucesivas).
- Choice Chip: Es un widget para escoger opciones. (Pero más bonito)
- Row: Para poner las cosas en una sola fila.
- Slider: Es como una barra que se puede desplazar para seleccionar cosas.
- TextDecoration: Para hacer cosas con el texto, del rollo como subrayado, tachado, etc.
- InkWell: Para detectar gestos
- Dismissible: Para poder girar a la izquierda o derecha para realizar una acción.
- 
## Patrón de diseño estado productor consumidor
- ChangeNotifier: Es el que observa el cambio. (Es la que tiene el estado mutable)
  - Tienen que tener los métodos notifyLsisteners() para notificar de que se ha producido un fallo.
- ChangeNotifierProvider: Es quien da acceso al estado mutable a las vistas que lo necesitan.
- Consumer: Es el observador, su tarea es escuchar los cambios que se producen, en un changeNotiffier
- Provider: Permite acceder a los estados, pero sin escuchar  los cambios de estado. (Hago un provider, para que cuando hago algo se reproduzca)

IMPORTENTE: Los observadores no son widgets, si no que son clases del modelo de la apliación.

IMPORTANTE: Tengo que crear un changeNotifier, que tiene la logica, luego esto, lo encapsulo en un changeNotifierProvider, que es el que produce los cambios. (A estos se les pasa el contexto para que sean visibles hacia todo el arbol). (Son 3 capas: changenotifier, el changenotifierProvider y el consumer).

## Opciones
- BottonNavigationBarItem:
  - icon: Icono que se muestra en la barra de navegación.
  - label: Texto que se muestra en la barra de navegación del icono.

- BottomNavigationBar: 
  - currentIndex: Indica el índice de la pestaña seleccionada actualmente.
  - onTap: Función que se ejecuta cuando se selecciona una pestaña. Recibe el índice de la pestaña seleccionada.

- Scaffold:
  - floatingActionButton: Botón de acción flotante que se muestra en la pantalla. Se puede personalizar con un icono y una función onPressed.

- ChangeNotifierProvider:
  - create: Función que crea una instancia del ChangeNotifier (Se le pasa el contexto, para que ande)
  - child: Widget hijo que tiene acceso al ChangeNotifier proporcionado.

- Consumer: Hay que ponerlo a disposición de uno de los changeNotifier, por eso se pone entre angulos.
  - builder:
    - context : Es el contexto
    - child: Las vistas que no cambian.
    - manager: En nuestro caso es el objeto del que escuchamos 

- AppBar:
  - actions: Permite añadir botones a la barra de navegación.

- TextField:
  - decoration: Para poner como que aparece en el campo de texto. (Mediante un listener)

- Provider:
  - El listen es para que no puedas tocar

- OnChip: 
  - onSelected: Función que se le pasa con las cosas que tiene que hacer cuando se seleciona una opción (Se actualiza la propiedad setState)

- Slider:
  - value: Valor actual del slider.
  - min: Valor mínimo del slider.
  - max: Valor máximo del slider.
  - divisions: Número de divisiones en el slider.
    - onChanged: Función que se ejecuta cuando se cambia el valor del slider.

- Checkbox:
  - onChanged: Función que se ejecuta cuando se cambia el valor del checkbox. (Tiene la forma (bool?)?)
- Dismissible:
  - key: Clave única para identificar el widget. (Importante para que no se solapen y no hayan problemas)
  - background: Widget que se muestra detrás del widget deslizante.
  - child: Widget que se desliza.
  - onDismissed: Función que se ejecuta cuando se desliza el widget. (Recibe un parámetro de dirección)
  - confirmDismiss: Función que se ejecuta para confirmar si se debe eliminar el widget. (Recibe un parámetro de dirección)