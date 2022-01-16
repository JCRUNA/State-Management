import 'package:gestordeestados/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  ///cuando llamo al constructor mando a llamar al estado inicial
  ///UsuarioInitial donde definimos que existeUsuario esta en false.
  UsuarioCubit() : super(UsuarioInitial());

  ///metodo para seleccionar un usuario .
  ///el metodo recibie un Usuario y luego el metodo emit emite un nuevo estaddo.
  ///En este caso seria UsuarioActivo
  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
    //cuando se emite el nuevo estado, los widget que estan escuchando en este caso los BlocBuilder
    //volver a redibujarse si es necesario.
  }

  void cambiarEdad(int edad) {
    final currentState =
        state; //estado actual (puede ser usuario activo o usuario inicial)
    if (currentState is UsuarioActivo) {
      ///uso el metodo copyWiht definido para la clase usuario para crear nueva instancia de usuario donde
      ///le pasamos solo el argumento que queremos cambiar. Es muy util ya que hacemos copia del estado anterior en vez
      ///de mutar el estado.
      final newUser = currentState.usuario.copyWith(edad: 30);
      //de esta forma emito un nuevo estado de usuario.
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      List<String>? newprofesiones = currentState.usuario.profesiones != null
          ? [
              ...currentState.usuario.profesiones!,
              'Profesion ${currentState.usuario.profesiones!.length + 1}'
            ]
          : ["Profesion x"];
      final newUser =
          currentState.usuario.copyWith(profesiones: newprofesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
