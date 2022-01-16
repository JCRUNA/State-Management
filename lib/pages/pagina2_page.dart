import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestordeestados/bloc/usuario/usuario_cubit.dart';
import 'package:gestordeestados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///hago referencia a mi instancia de usuariocubit
    final usuarioCubit = context.read<UsuarioCubit>();

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
                  //defino nuevo usuario
                  final newUser = Usuario(
                      nombre: 'Franco',
                      edad: 67,
                      profesiones: ['gamer', 'tenista']);
                  //con context.read de tipo UsuarioCubit llamo al metodo seleccionarUsuario
                  usuarioCubit.seleccionarUsuario(newUser);
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioCubit.cambiarEdad(45);
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Anadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                }),
          ],
        ),
      ),
    );
  }
}
