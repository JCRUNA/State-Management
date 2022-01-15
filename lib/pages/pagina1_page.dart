import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: informacionUsuario(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next_rounded),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class informacionUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('General',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre')),
          ListTile(title: Text('Edad')),
          Text('Profesiones',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          ListTile(title: Text('Profesiones 1')),
          ListTile(title: Text('Profesiones 1')),
          ListTile(title: Text('Profesiones 1')),
        ],
      ),
    );
  }
}
