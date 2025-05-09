import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sesion_3_moviles/modelo/producto.dart';
import 'package:path_provider/path_provider.dart';

import 'lista.dart';

class ListaListas extends ChangeNotifier {
  final _listas = <Lista>[];

  List<Lista> get listas => List.unmodifiable(_listas);

  void init() {
    _leerListas();
  }

  void borraLista(int indice) {
    _listas.removeAt(indice);
    _salvarListas();
    notifyListeners();
  }

  void anadeLista(Lista item) {
    _listas.add(item);
    _salvarListas();
    notifyListeners();
  }

  void actualizaLista(int indice, Lista item) {
    _listas[indice] = item;
    _salvarListas();
    notifyListeners();
  }

  // Accedo al directorio y creo el directorio
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Obtengo la referencia al directorio
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/lista_listas_compra.json'); ///< Nombre del archivo
  }

  Future<void> _salvarListas() async {
    final file = await _localFile;

    var cadena = '[\n';
    for (var i = 0; i < _listas.length; i++) {
      cadena += _listas[i].aJson();
      if (i < _listas.length - 1) {
        cadena += ',\n';
      }else {
        cadena += '\n';
      }
    }
    cadena += ']';
    file.writeAsString(cadena);
  }

  Future<void> _leerListas() async {
    try{
      final file = await _localFile;
      final productosString = await file.readAsString();
      final List<dynamic> productosJson = jsonDecode(productosString);
      for (var prodJson in productosJson){
        _listas.add(Lista.desdeJson(prodJson));
      }
      notifyListeners();
    }on FileSystemException {
      return;
    }
  }
}
