class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});

  ///como no debemos mutar el estado. Sino crea un nuevo estado.
  /// Usamos el metodo copywith para crear una nueva instancia copiada de la clase Usuario

  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) =>
      Usuario(
          nombre: nombre ?? this.nombre,
          edad: edad ?? this.edad,
          profesiones: profesiones ?? this.profesiones);
}
