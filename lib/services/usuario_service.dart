import 'package:flutter/cupertino.dart';
import 'package:gestordeestados/models/usuario.dart';

class UsuarioService extends ChangeNotifier {
  ///para usar provider la clase debo extenderla de ChangeNotifier. No pertenece al paquete provider sino a material.
  ///changeNotifier me va  ayudar mediante el metodo notifyListeners a avisarle a los widget cuando haya cambios
  ///para que se redibujen
  Usuario? _usuario;

  Usuario get usuario =>
      this._usuario!; // controlo el retono y como establezco valores

  bool get existeUsuario => (this._usuario != null) ? true : false;

  /// en el ejemplo de singleton cree un metodo cargar usuario. Aca para probar otra forma
  /// creo un setter.
  set usario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    if (existeUsuario) {
      this._usuario!.edad = edad;
      notifyListeners();
    }
  }

  void removeUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion(String prof) {
    this._usuario!.profesiones!.add('Profesion ${prof}');
    notifyListeners();
  }
}
