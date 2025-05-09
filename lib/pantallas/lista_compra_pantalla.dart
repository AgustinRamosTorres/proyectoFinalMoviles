import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/pantallas.dart';
import 'package:uuid/uuid.dart';

import '../modelo/lista.dart';

class ListaCompraPantalla extends StatelessWidget {
  String _idLista = "";


  ListaCompraPantalla({super.key, required String idLista})
      : _idLista = idLista;

  @override
  Widget build(BuildContext context) {
    //4
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              // 8
              final manager = Provider.of<ListaCompra>(context, listen: false);
              manager.borrarComprados(_idLista);

            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              // 8
              final manager = Provider.of<ListaCompra>(context, listen: false);
              manager.borraListaCompra(_idLista);
            },
          ),
        ],
      ),
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
                return ListaCompraAniadirProducto(
                  // 10
                  crearProducto: (producto) {
                    manager.anadeProducto(producto);
                    Navigator.pop(context);
                  },
                  editarProducto: (producto) {},
                  idLista: _idLista,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget construirPantallaListaCompra() {
    return Consumer<ListaCompra>(
      builder: (context, manager, child) {
        if (funcionCompruebaSiHayProductos(_idLista, manager)) {
          // 11
          return ListaCompraPantallaLlena(listaCompra: manager, idLista: _idLista);
        } else {
          return const ListaCompraPantallaVacia();
        }
      },
    );
  }

  bool funcionCompruebaSiHayProductos(String idLista, manager) {
    for (var i = 0; i < manager.productos.length; i++) {
      if (manager.productos[i].listaId == idLista) {
        return true;
      }
    }
    return false;
  }


}
