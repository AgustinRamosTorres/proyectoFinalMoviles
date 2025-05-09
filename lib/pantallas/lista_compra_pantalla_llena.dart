import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/componentes/componentes.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';

import 'lista_compra_aniadir_producto.dart';

class ListaCompraPantallaLlena extends StatelessWidget {
  final ListaCompra listaCompra;
  String idLista = "";

  ListaCompraPantallaLlena({super.key, required this.listaCompra, required this.idLista});

  @override
  Widget build(BuildContext context) {
    final productos = getProductosLista();
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
                    builder:
                        (context) => ListaCompraAniadirProducto(
                          productoOriginal: producto,
                          editarProducto: (producto) {
                            listaCompra.actualizaProducto(index, producto);
                            Navigator.pop(context);
                          },
                          crearProducto: (producto) {},
                          idLista: idLista,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }


  List<Producto> getProductosLista() {
    List<Producto> productos = [];
    for (var i = 0; i < listaCompra.productos.length; i++) {
      if (listaCompra.productos[i].listaId == idLista) {
        productos.add(listaCompra.productos[i]);
      }
    }
    return productos;
  }
}
