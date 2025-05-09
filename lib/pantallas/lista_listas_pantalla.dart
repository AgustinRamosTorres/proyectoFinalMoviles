import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion_3_moviles/modelo/lista_listas.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:sesion_3_moviles/pantallas/lista_lista_aniadir_lista.dart';
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
          final manager = Provider.of<ListaListas>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ListaListaAniadirLista(
                  crearLista: (lista) {
                    manager.anadeLista(lista);
                    Navigator.pop(context);
                  },
                  editarLista: (lista) {},);
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
    return Consumer<ListaListas>(
      builder: (context, manager, child) {
        if (manager.listas.isNotEmpty) {
          // 11
          /// Ojo cuidao
          return ListaListasPantallaLlena(listaListas: manager);
        } else {
          return const ListaListasPantallaVacia();
        }
      },
    );
  }
}
