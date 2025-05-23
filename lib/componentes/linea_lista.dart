import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';

import '../modelo/lista.dart';

class LineaLista extends StatelessWidget {
  final Lista lista;


  // 20
  LineaLista({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    //var titleLarge = Theme.of(context).textTheme.titleLarge;
    //var decortitleLarge = titleLarge?.copyWith(decoration: textDecoration);
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(lista.nombre, style: Theme.of(context).textTheme.titleLarge,), // aqui va estilo
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


}
