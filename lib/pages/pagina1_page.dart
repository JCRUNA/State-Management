import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestordeestados/bloc/usuario/usuario_cubit.dart';
import 'package:gestordeestados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UsuarioCubit>().borrarUsuario();
              },
              icon: const Icon(Icons.delete_outline_rounded))
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next_rounded),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///para usar nuestro cubit usamos el widget BlocBuilder que retorna un widget
    ///El BlocBuilder es de tipo <Cubit, state> En este caso <UsuarioCubit,UsuarioState>
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
      //con el state conozco el estado de mi cubit
      print(state); //imprime instancia de usuario
      //cuando tenemos pocos estados como en este caso 2 estados UsuarioInicial y UsuarioActivo no queda mal manejarlo
      ///con if else if..
      ///Cuando tenemos muchos estados es conveniente usar Switch
      ///------IMPLEMENTACION CON IF ELSE
      ///si state es una instancia de UsuarioInicial entonces que muestre lo siguiente:
      // if (state is UsuarioInitial) {
      //   return const Center(child: Text('No hay informacion del Usuario'));
      // } else if (state is UsuarioActivo) {
      //   return informacionUsuario(state
      //       .usuario); //le paso el usuario para despues mostrarlo en pantalla
      // }else{

      // return const Center(child: Text('Estado no reconocido'),);
      // }
      /// ------IMPLEMENTACION CON SWITCH
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(child: Text('No hay informacion del Usuario'));
          break;
        case UsuarioActivo:
          return informacionUsuario((state as UsuarioActivo).usuario);
          break;
        default:
          return const Center(child: Text('Estado no reconocido'));
      }
    });
  }
}

class informacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const informacionUsuario(this.usuario);

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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones!
              .map((p) => ListTile(title: Text('Profesion $p')))
              .toList()
        ],
      ),
    );
  }
}
