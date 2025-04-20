import 'package:flutter/material.dart';

class ListaCompraPantallaVacia extends StatelessWidget {
  const ListaCompraPantallaVacia({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No hay productos todavia",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Pulsa el boton + para añadirlos",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
