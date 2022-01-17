import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestordeestados/bloc/user/user_bloc.dart';
import 'package:gestordeestados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///hago referencia a mi instancia de user bloc.
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final newUser = Usuario(
                      nombre: 'Horacio Cruna',
                      edad: 65,
                      profesiones: ["Molinero", "Influencer"]);

                  ///con el metodo add paso un evento. En este caso seria ActivateUser.
                  ///El UserBloc va a recibir este evento y en base a eso va a emitir un nuevo estado.
                  ///En este caso seria el estado UserSetState
                  userBloc.add(ActivateUser(newUser));
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  userBloc.add(ChangeUserAgeEvent(15));
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Anadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final String profesion = 'Adicto';
                  userBloc.add(AddProfessionEvent(profesion));
                }),
          ],
        ),
      ),
    );
  }
}
