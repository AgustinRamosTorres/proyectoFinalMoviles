import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/pantallas.dart';
import 'package:uuid/uuid.dart';

import '../modelo/lista.dart';

class ListaCompraPantalla extends StatelessWidget {
  const ListaCompraPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    //4
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
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
        if (manager.productos.isNotEmpty) {
          // 11
          return ListaCompraPantallaLlena(listaCompra: manager);
        } else {
          return const ListaCompraPantallaVacia();
        }
      },
    );
  }
}
