import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/pantallas/lista_listas_pantalla.dart';
import 'package:sesion_3_moviles/pantallas/pantallas.dart';

class MosterChefPaginaPrincipal extends StatefulWidget {
  final String _titulo;

  const MosterChefPaginaPrincipal({super.key, required titulo}): _titulo = titulo;

  @override
  State<MosterChefPaginaPrincipal> createState() =>
      _MosterChefPaginaPrincipalState();
}

class _MosterChefPaginaPrincipalState extends State<MosterChefPaginaPrincipal> {
  int _categoriaActiva = 0;

  static final _paginas = <Widget>[ListaListasPantalla(), ListaRecetasPantalla()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._titulo),centerTitle: true,),

      body: SafeArea(
        // 2
        child: _paginas[_categoriaActiva],
      ),
      // 1
      bottomNavigationBar: BottomNavigationBar(
        //3
        currentIndex: _categoriaActiva,
        onTap: _alPulsar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Lista de la compra",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: "Recetas",
          ),
        ],
      ),
    );
  }

  void _alPulsar(int indice) {
    setState(() {
      _categoriaActiva = indice;
    });
  }
}


// Hacer casi el enumerado de la sesión 1

