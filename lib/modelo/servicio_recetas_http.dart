import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';

class ServiciorecetasHttp {
  Future<String> _cargarDesdeHttp(String url) async {
    final urlComprobada = Uri.parse(url);
    final respuesta = await get(urlComprobada);

    if (respuesta.statusCode == HttpStatus.ok) {
      return respuesta.body;
    } else {
      return "";
    }
  }

  Future<List<RecetaBasica>> getRecetas() async {
    final cadenaLeidaServidor = await _cargarDesdeHttp(
      "https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken",
    );
    final Map<String, dynamic> json = jsonDecode(cadenaLeidaServidor);
    if (json["meals"] != null) {

      final recetas = <RecetaBasica>[];
      print('Respuesta correcta');
      print('Respuesta correcta');
      for (var receta in json["meals"]) {
        recetas.add(RecetaBasica.desdeJson(receta));
      }

      return recetas;
    } else {
      return [];
    }
  }
}
