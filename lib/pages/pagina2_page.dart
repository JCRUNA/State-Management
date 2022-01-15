import 'package:flutter/material.dart';
import 'package:gestordeestados/models/usuario.dart';
import 'package:gestordeestados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///cada vez que haga click en establecer usuario en mi texto de appbar debe mostrarme
        /// mi nombre. Aqui tambien debo usar streamBuilder.
        /// Sin embargo estamos usando el mismo stream para diferentes lugares.
        /// Solo una "persona" debe estar escuchandolo y ya lo estamos usando en la
        /// pagina 1. Vamos a usuario_service y en la definicion de streamController agregamos el metodo
        /// broadcast para que le emite valores a todos los widget q esten escuchando
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre ${snapshot.data!.nombre}')
                : const Text('Pagina 2');
          },
        ),
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
                  ///aca creo un usuario y se lo paso al metodo cargarUsuario de la instancia
                  ///usuarioService ya que podemos usarla en cualquier parte de la aplicacion.
                  ///De todas maneras aunque hagamos click no vamos a ver ningun cambio ya que no se
                  ///estan redibuando los widgets.
                  final nuevoUsuario = Usuario(nombre: 'Joaquin', edad: 28);
                  usuarioService.cargarUsuario(nuevoUsuario);
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  ///llamo al metodo para cambiar mi edad.
                  ///Para poder cambiar la edad primero debe exister el usuario.
                  ///De todas maneras aunque hagamos click no vamos a ver ningun cambio ya que no se
                  ///estan redibuando los widgets.
                  usuarioService.cambiarEdad(21);
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Anadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
