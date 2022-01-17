part of 'user_bloc.dart';

///aqui podemos tener diferentes estados.
///defino clase abstracta del estado del usuario. Los estados van a extender de esta clase UserState

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});
}

///En este ejemplo tenemos 2 estados , estado inicial(UserInitialState) de usuario y estado activo (userSetState)
///defino estado inicial

class UserInitialState extends UserState {
  //en el constructor defino el estado inicial a traves del padre UserState con super
  UserInitialState() : super(existUser: false);
}

///defino nueov estado para crear usuario
class UserSetState extends UserState {
  final Usuario newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
