import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:gestordeestados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

///la clase UserBloc extiende  de bloc que es de tipo Event, State
class UserBloc extends Bloc<UserEvent, UserState> {
  ///en el constructor inicializo el estado Inicial UserInitialState defino en user_state.dart
  ///dentro del contructor uso el metodo on para trabajar con los eventos.
  ///
  UserBloc() : super(UserInitialState()) {
    ///emit que me sirve para emitir un nuevo estado de manera condicional. Lo llamo
    ///cuando quiero cambiar un estado. En este caso cuando se dispara el Evento ActivateUser se
    ///emite un  nuevo estado (UserSetState) que crea un usuario.
    on<ActivateUser>((event, emit) => emit(UserSetState(event.User)));

    on<ChangeUserAgeEvent>((event, emit) {
      //si el usuario no existe entonces no tiene sentido cambiar la edad
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfessionEvent>((event, emit) {
      if (!state.existUser) return;
      final professions = [...state.user!.profesiones, event.profesion];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });

    on<DeleteUser>((event, emit) {
      emit(UserInitialState());
    });
  }
}
