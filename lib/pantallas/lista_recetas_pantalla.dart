import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/componentes/componentes.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';

class ListaRecetasPantalla extends StatelessWidget {
  final servicioRecetasHttp = ServiciorecetasHttp();

  ListaRecetasPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: servicioRecetasHttp.getRecetas(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("No se puede contactar con el servidor"),
            );
          } else {
            return Center(child: GridRecetas(recetas: snapshot.data));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
