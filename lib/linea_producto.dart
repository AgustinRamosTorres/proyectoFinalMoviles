import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/producto.dart';

class LineaProducto extends StatelessWidget {
  final Producto producto;
  final TextDecoration textDecoration;
  // 19
  final Function(bool?)? completar;


  // 20
  LineaProducto({Key? key, required this.producto, required this.completar})
    : textDecoration =
          producto.completado
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleLarge = Theme.of(context).textTheme.titleLarge;
    var decortitleLarge = titleLarge?.copyWith(decoration: textDecoration);
    return Container(
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
                  Text(producto.nombre, style: decortitleLarge!),
                  const SizedBox(height: 4),
                  construirImportancia(context, producto),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(producto.cantidad.toString(), style: titleLarge),
              // 21
              Checkbox(value: producto.completado, onChanged: completar),
            ],
          ),
        ],
      ),
    );
  }

  Widget construirImportancia(BuildContext contexto, Producto producto) {
    var temaTexto = Theme.of(contexto).textTheme.bodyMedium;
    var temaTextoColoreado = temaTexto?.copyWith(
      color:
          producto.importancia == Importancia.alta
              ? Colors.red
              : temaTexto?.color,
    );
    return Text(
      producto.importancia.name,
      style: temaTextoColoreado!,
    );
  }
}
