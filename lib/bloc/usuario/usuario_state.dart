part of 'usuario_cubit.dart';
//como es parte de usuario_cubit las importaciones se hacen alla

@immutable
abstract class UsuarioState {}

//acabo de crea clase abstracta e inmutable.
/// todos los estados van a extender de UsuarioState. Es como una
/// llave de control.
///
///clase de estado inicial que debe extender de UsuarioState para que mi cubic lo entienda
class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;

  ///para mostrar en consola si exite el usuario
  // @override
  // String toString() {
  //   return 'Usuario Inicial: existe usuario-> ${existeUsuario}';
  // }
}

///clase utilizada cuando ya existe usuario. Debe extender de UsuarioState para que mi cubic lo entienda
class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;

  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
