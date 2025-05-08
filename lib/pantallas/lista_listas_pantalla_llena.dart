import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/componentes/componentes.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/lista_compra_pantalla.dart';

import 'lista_compra_aniadir_producto.dart';

class ListaListasPantallaLlena extends StatelessWidget {
  final ListaCompra listaCompra;

  const ListaListasPantallaLlena({super.key, required this.listaCompra});

  @override
  Widget build(BuildContext context) {
    final productos = listaCompra.productos;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemCount: productos.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, index) {
          final producto = productos[index];
          // 18
          return Dismissible(
            key: Key(producto.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white, size: 35),
            ),
            onDismissed: (direction) {
              listaCompra.borraProducto(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${producto.nombre} eliminado')),
              );
            },
            child: InkWell(
              key: Key(producto.id),

              /// Tenemos que poner la lista de listas
              child: LineaProducto(
                producto: producto,
                completar: (valor) {
                  if (valor != null) {
                    listaCompra.marcaCompletado(index, valor);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaCompraPantalla(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
