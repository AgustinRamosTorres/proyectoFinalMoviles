import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/componentes/componentes.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';

class GridRecetas extends StatelessWidget {
  final List<RecetaBasica> recetas;
  const GridRecetas({Key? key , required this.recetas}): super(key: key);


  @override
  Widget build(BuildContext context) {
    //25
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            mainAxisExtent: 136,
          ),
          itemBuilder: (context, index) {
            return MiniaturaReceta(receta: recetas[index]);
          },
          itemCount: recetas.length,
        );
      }
    );
  }
}
