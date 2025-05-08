import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/lista_listas_pantalla_llena.dart';
import 'package:sesion_3_moviles/pantallas/lista_listas_pantalla_vacia.dart';
import 'package:sesion_3_moviles/pantallas/pantallas.dart';

class ListaListasPantalla extends StatelessWidget {
  const ListaListasPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    //4
    return Scaffold(
      // 6
      body: construirPantallaListaCompra(),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        shape: const CircleBorder(),
        // 7
        onPressed: () {
          // 9
          final manager = Provider.of<ListaCompra>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                /// Tienes que poner ahí la pantalla para ir a añadir una lista
                return const Placeholder();
               /* return ListaCompraAniadirProducto(
                  // 10
                  crearProducto: (producto) {
                    manager.anadeProducto(producto);
                    Navigator.pop(context);
                  },
                  editarProducto: (producto) {},
                );*/
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Tenemos que cambiar el listener y ponerlo para que escuche de otra estrcutura que sea lista de listas
  Widget construirPantallaListaCompra() {
    return Consumer<ListaCompra>(
      builder: (context, manager, child) {
        if (manager.productos.isNotEmpty) {
          // 11
          /// Ojo cuidao
          return ListaListasPantallaLlena(listaCompra: manager);
        } else {
          return const ListaListasPantallaVacia();
        }
      },
    );
  }
}
