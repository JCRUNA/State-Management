import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestordeestados/bloc/user/user_bloc.dart';
import 'package:gestordeestados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(DeleteUser());
              },
              icon: const Icon(Icons.delete_forever_outlined))
        ],
      ),

      ///como la pantalla a mostrar va a depender del estado del usuario, es decir si
      ///existe o no usuario. Para esto uso el BlocBuilder que es de tipo Bloc,State y retorna un widget
      ///Bloc builder construye cada vez que hay cambios en el state
      ///en el builder le pasamos el state actual. El state es de tipo UserState.
      ///Podemos acceder a sus propiedades como existUser

      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return state.existUser
            ? InformacionUsuario(
                user: state.user!,
              )
            : const Center(
                child: Text('No hay informacion de Usuario'),
              );
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next_rounded),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;
  const InformacionUsuario({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesiones
              .map((p) => ListTile(
                    title: Text('Profesion: $p'),
                  ))
              .toList()
        ],
      ),
    );
  }
}
