

class Lista {
  final String id;
  final String nombre;

  Lista({
    required this.id,
    required this.nombre,
  });

  Lista copiaSinNulo({
    String? id,
    String? nombre,
  }) {
    return Lista(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
    );
  }

  String aJson() {
    var json = '''
        {
          "id": "$id",
          "nombre": "$nombre"
        }
    ''';

    return json;
  }

  factory Lista.desdeJson(Map<String, dynamic> json) {
    return Lista(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
    );
  }
}
