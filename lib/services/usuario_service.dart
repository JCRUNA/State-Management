import 'dart:async';

import 'package:gestordeestados/models/usuario.dart';

class _UsuarioService {
  Usuario?
      _usuario; //lo hago privado para controlar como se lee y como se establecen valores

  StreamController<Usuario> _usuarioStreamController = StreamController<
      Usuario>.broadcast(); //la informacion que va a fluir es de tipo Usuario
  ///debemos crear un getter que me permite exponer el stream de informacion para que en la pagina 1 pueda
  ///suscribirme a las emisiones del stream.

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario? get usuario => this._usuario; //controlo como se lee

  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    //me sirve para crear un usuario. Podria tambien haber aplicado un set
    this._usuario = user;
    this._usuarioStreamController.add(
        user); // cuando se carga el usuario se agrega el ususario al stream.
    //como consecuencia el Streambuilder de la pagina1 dice: Ey! hay nueva info! redibujate!!
  }

  void cambiarEdad(int edad) {
    this._usuario!.edad = edad;
    //cuando cambio la edad debo avisarle al stremcontroller para que cargue el usuario
    this._usuarioStreamController.add(this._usuario!);
  }

//creo metodo para que se cierre el stream para prevenir fugas de memoria y que no queden en memoria las suscripciones.
  dispose() {
    this._usuarioStreamController.close();
  }
}

final usuarioService =
    _UsuarioService(); //usamos solo esta instacia en cualquier lugar de mi app
