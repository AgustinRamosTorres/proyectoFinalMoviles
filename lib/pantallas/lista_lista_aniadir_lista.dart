import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/modelo/modelo.dart';
import 'package:uuid/uuid.dart';

import '../modelo/lista.dart';

class ListaListaAniadirLista extends StatefulWidget {
  final Function(Lista) crearLista;
  final Function(Lista) editarLista;
  final Lista? productoOriginal;
  final bool actualizando;

  const ListaListaAniadirLista({
    super.key,
    required this.crearLista,
    required this.editarLista,
    this.productoOriginal,
  }) : actualizando = (productoOriginal != null);

  @override
  State<ListaListaAniadirLista> createState() =>
      _ListaListaAniadirListaState();
}

class _ListaListaAniadirListaState
    extends State<ListaListaAniadirLista> {
  final _controladorNombre = TextEditingController();
  String _nombre = '';
  bool _completado = false;

  //12
  Importancia _importancia = Importancia.General;

  //15
  int _valorActualSlider = 1;

  @override
  void initState() {
    super.initState();
    _controladorNombre.addListener(() {
      setState(() {
        _nombre = _controladorNombre.text;
      });
    });
    // 22
    final productoOriginal = widget.productoOriginal;
    if (productoOriginal != null) {
      _controladorNombre.text = productoOriginal.nombre;
      _nombre = productoOriginal.nombre;
    }
  }

  @override
  void dispose() {
    _controladorNombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            // 8
            onPressed: () {
              final lista = Lista(
                id: widget.productoOriginal?.id ?? const Uuid().v1(),
                nombre: _controladorNombre.text,
              );

              if (widget.actualizando) {
                widget.editarLista(lista);
              } else {
                widget.crearLista(lista);
              }

              //Navigator.pop(context, lista); // Devuelve la lista editada
            },
          ),
        ],
        elevation: 0.0,
        title: const Text('Añadir/Editar Lista'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            construyeCampoNombre(),
          ],
        ),
      ),
    );
  }

  Widget construyeCampoNombre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nombre de la lista",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextField(
          controller: _controladorNombre,
          decoration: const InputDecoration(hintText: 'Nombre de la lista'),
        ),
      ],
    );
  }

  Widget construyeCampoImportancia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Importancia", style: Theme.of(context).textTheme.titleSmall),
        Wrap(
          spacing: 10.0,
          children:
          Importancia.values.map((elemento) {
            return ChoiceChip(
              selected: _importancia == elemento,
              shape: StadiumBorder(),
              label: Text(elemento.name),
              onSelected: (section) {
                setState(() {
                  _importancia = elemento;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget construyeCampoCantidad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text("Cantidad", style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: 16.0),
            Text(
              _valorActualSlider.toInt().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        Slider(
          value: _valorActualSlider.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          label: _valorActualSlider.toInt().toString(),
          onChanged: (double value) {
            setState(() {
              _valorActualSlider = value.toInt();
            });
          },
        ),
      ],
    );
  }
}
