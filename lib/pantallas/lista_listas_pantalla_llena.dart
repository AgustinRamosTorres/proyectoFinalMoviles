import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion_3_moviles/componentes/componentes.dart';
import 'package:sesion_3_moviles/componentes/linea_lista.dart';
import 'package:sesion_3_moviles/modelo/lista_listas.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/lista_compra_pantalla.dart';

import 'lista_compra_aniadir_producto.dart';

class ListaListasPantallaLlena extends StatelessWidget {
  final ListaListas listaListas;

  const ListaListasPantallaLlena({super.key, required this.listaListas});

  @override
  Widget build(BuildContext context) {
    final listas = listaListas.listas;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemCount: listas.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, index) {
          final lista = listas[index];
          // 18
          return Dismissible(
            key: Key(lista.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white, size: 35),
            ),
            onDismissed: (direction) {
              listaListas.borraLista(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${lista.nombre} eliminado')),
              );
            },
            child: InkWell(
              key: Key(lista.id),
              /// Tenemos que poner la lista de listas
              child: LineaLista(
                lista: lista,
              ),
              onTap: () {
                final listaCompra = Provider.of<ListaCompra>(context, listen: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: listaCompra,
                      child: ListaCompraPantalla(),
                    ),
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
