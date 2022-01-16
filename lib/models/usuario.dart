class Usuario {
  final String nombre;
  final int? edad;
  final List<String>? profesiones;

  Usuario({required this.nombre, this.edad, this.profesiones});

  ///metodo para copiar usuario.
  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) {
    return Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ??
            this.edad, //si es nulo retorna la edad que tiene la instancia usuario
        profesiones: profesiones ?? this.profesiones);
  }
}
