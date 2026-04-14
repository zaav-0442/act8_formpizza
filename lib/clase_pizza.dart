class Pizza {
  int id;
  String nombre;
  String ingredientes;
  double precio;

  Pizza({
    required this.id,
    required this.nombre,
    required this.ingredientes,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'ingredientes': ingredientes,
      'precio': precio,
    };
  }
}
