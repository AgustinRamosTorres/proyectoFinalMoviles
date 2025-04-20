import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sesion_3_moviles/producto.dart';
import 'package:path_provider/path_provider.dart';

class ListaCompra extends ChangeNotifier {
  final _productos = <Producto>[];

  List<Producto> get productos => List.unmodifiable(_productos);

  void init() {
    _leerProductos();
  }

  void borraProducto(int indice) {
    _productos.removeAt(indice);
    _salvarProductos();
    notifyListeners();
  }

  void anadeProducto(Producto item) {
    _productos.add(item);
    _salvarProductos();
    notifyListeners();
  }

  void actualizaProducto(int indice, Producto item) {
    _productos[indice] = item;
    _salvarProductos();
    notifyListeners();
  }

  void marcaCompletado(int indice, bool completado) {
    final producto = _productos[indice];
    _productos[indice] = producto.copiaSinNulo(completado: completado);
    _salvarProductos();
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
    return File('$path/lista_compra.json'); ///< Nombre del archivo
  }

  Future<void> _salvarProductos() async {
    final file = await _localFile;

    var cadena = '[\n';
    for (var i = 0; i < _productos.length; i++) {
      cadena += _productos[i].aJson();
      if (i < _productos.length - 1) {
        cadena += ',\n';
      }else {
        cadena += '\n';
      }
    }
    cadena += ']';
    file.writeAsString(cadena);
  }

  Future<void> _leerProductos() async {
    try{
      final file = await _localFile;
      final productosString = await file.readAsString();
      final List<dynamic> productosJson = jsonDecode(productosString);
      for (var prodJson in productosJson){
        _productos.add(Producto.desdeJson(prodJson));
      }
      notifyListeners();
    }on FileSystemException catch(e){
      return;
    }
  }
}
