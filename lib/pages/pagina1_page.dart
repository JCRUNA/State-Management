import 'package:flutter/material.dart';
import 'package:gestordeestados/models/usuario.dart';
import 'package:gestordeestados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          //para usar el stream y que pagina 1 se suscriba al strem
          ///necesito envolver el stream en un streambuilder
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? //preguntamos si existe informacion. Si tiene data(hay algun usuario cargado)
                //entonces sabemos que tiene dato
                InformacionUsuario(usuario: snapshot.data)
                : const Center(
                    child: Text('No hay informacion del usuario'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next_rounded),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario? usuario;

  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);
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
          ListTile(title: Text('Nombre: ${usuario!.nombre}')),
          ListTile(title: Text('Edad: ${usuario!.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          ListTile(title: Text('Profesiones 1')),
          ListTile(title: Text('Profesiones 1')),
          ListTile(title: Text('Profesiones 1')),
        ],
      ),
    );
  }
}
