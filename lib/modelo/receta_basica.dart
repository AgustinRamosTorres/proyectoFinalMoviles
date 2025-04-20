class RecetaBasica {
  String id;
  String nombre;
  String urlImagen;

  RecetaBasica({
    required this.id,
    required this.nombre,
    required this.urlImagen,
  });


  factory RecetaBasica.desdeJson(Map<String, dynamic> json) {
    return RecetaBasica(
      id: json['idMeal'] as String,
      nombre: json['strMeal'] as String,
      urlImagen: json['strMealThumb'] as String,
    );
  }




}
