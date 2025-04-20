import 'package:flutter/material.dart';
import 'package:sesion_3_moviles/producto.dart';
import 'package:uuid/uuid.dart';

class ListaCompraAniadirProducto extends StatefulWidget {
  final Function(Producto) crearProducto;
  final Function(Producto) editarProducto;
  final Producto? productoOriginal;
  final bool actualizando;

  const ListaCompraAniadirProducto({
    Key? key,
    required this.crearProducto,
    required this.editarProducto,
    this.productoOriginal,
  }) : actualizando = (productoOriginal != null),
       super(key: key);

  @override
  State<ListaCompraAniadirProducto> createState() =>
      _ListaCompraAniadirProductoState();
}

class _ListaCompraAniadirProductoState
    extends State<ListaCompraAniadirProducto> {
  final _controladorNombre = TextEditingController();
  String _nombre = '';
  bool _completado = false;

  //12
  Importancia _importancia = Importancia.baja;

  //15
  int _valorActualSlider = 0;

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
      _completado = productoOriginal.completado;
      _importancia = productoOriginal.importancia;
      _valorActualSlider = productoOriginal.cantidad;
    }
  }

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
              final producto = Producto(
                id: widget.productoOriginal?.id ?? const Uuid().v1(),
                nombre: _controladorNombre.text,
                completado: _completado,
                //14
                importancia: _importancia,
                // 17
                cantidad: _valorActualSlider,
              );

              if (widget.actualizando) {
                widget.editarProducto(producto);
              } else {
                widget.crearProducto(producto);
              }
            },
          ),
        ],
        elevation: 0.0,
        title: const Text('Añadir/Editar producto'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            construyeCampoNombre(),
            // 13
            const SizedBox(height: 16.0),
            construyeCampoImportancia(),
            //16
            const SizedBox(height: 16.0),
            construyeCampoCantidad(),
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
          "Nombre del producto",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextField(
          controller: _controladorNombre,
          decoration: const InputDecoration(hintText: 'Nombre del producto'),
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
