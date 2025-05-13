import 'package:flutter/material.dart';

enum Importancia {
  General,
  Lacteos,
  Congelados,
  Carnes,
  Frutas,;

  static Importancia getImportanciaDesde({required String nombre}) {
    return Importancia.values.byName(nombre);
  }

  static List<PopupMenuItem<int>> obtenerPopupMenuItemsDesdeEnum() {
    return Importancia.values.map((importancia) {
      return PopupMenuItem<int>(
        value: importancia.index,
        child: Text("Ordenar por: " + importancia.name),
      );
    }).toList();
  }

}

class Producto {
  final String id;
  final String nombre;
  final Importancia importancia;
  final int cantidad;
  final bool completado;
  final String listaId;

  Producto({
    required this.id,
    required this.nombre,
    required this.importancia,
    required this.cantidad,
    required this.listaId,
    this.completado = false,
  });

  Producto copiaSinNulo({
    String? id,
    String? nombre,
    Importancia? importancia,
    int? cantidad,
    bool? completado,
  }) {
    return Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      importancia: importancia ?? this.importancia,
      cantidad: cantidad ?? this.cantidad,
      completado: completado ?? this.completado,
      listaId: listaId,
    );
  }

  String aJson() {
    var json = '''
        {
          "id": "$id",
          "nombre": "$nombre",
          "importancia": "${importancia.name}",
          "cantidad": $cantidad,
          "completado": $completado,
          "listaId": "$listaId"
        }
    ''';

    return json;
  }

  factory Producto.desdeJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      importancia: Importancia.getImportanciaDesde(nombre: json['importancia']),
      cantidad: json['cantidad'] as int,
      completado: json['completado'] as bool,
      listaId: json['listaId'] as String,
    );
  }
}
