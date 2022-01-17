part of 'user_bloc.dart';

///aqui definimos los eventos que vamos a llamar
///tambien trabajamos con una clase abstracta.

@immutable
abstract class UserEvent {}

///los eventos van a extender de UserEvent. Esto permite que el Bloc sepa que tipo de
///eventos debe esperar.
///

//evento para activar usuario que se llama cuando presionamos el boton
//establecer usuario.
class ActivateUser extends UserEvent {
  final Usuario User;

  ActivateUser(this.User);
}

///evente para cambiar la edad
class ChangeUserAgeEvent extends UserEvent {
  final int age;

  ChangeUserAgeEvent(this.age);
}

///evento para agregar profesion
class AddProfessionEvent extends UserEvent {
  final String profesion;

  AddProfessionEvent(this.profesion);
}

///evento para borrar usuario
class DeleteUser extends UserEvent {}
