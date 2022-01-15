import 'package:flutter/material.dart';
import 'package:gestordeestados/models/usuario.dart';
import 'package:gestordeestados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //hago referencia a mi instancia de UsuarioService() creado en el MultiProvide del main.dart
    final usuarioService = Provider.of<UsuarioService>(
        context); //por defecto la propiedad listen esta en true. Eso quiere decir
    //que esta escuchando cualquier cambio. Cuando se ejecute notifylistener esto se vuelve a redibujar
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                usuarioService.removeUsuario();
              },
              icon: const Icon(Icons.delete_forever))
        ],
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: usuarioService.existeUsuario
          ? informacionUsuario(usuarioService.usuario)
          : const Center(
              child: Text('No hay usuario seleccionado'),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next_rounded),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
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
          // ... ES PARA DESESTRUCTURAR
          ...usuario.profesiones!
              .map((p) => ListTile(title: Text('Profesion: $p')))
              .toList()
        ],
      ),
    );
  }
}
