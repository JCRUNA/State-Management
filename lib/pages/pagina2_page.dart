import 'package:flutter/material.dart';
import 'package:gestordeestados/models/usuario.dart';
import 'package:gestordeestados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    //el usuarioService puedo definirlo dentro del metodo onPressed. Pero debemos
    //poner el listen en false!! sino revienta el codigo!!!
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('Nombre: ${usuarioService.usuario.nombre}')
            : const Text('Pagina 2'),
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
                  usuarioService.usario = Usuario(
                      nombre: 'Raul',
                      edad: 27,
                      profesiones: ["Full-stack Devoloper", "Data Scientist"]);
                  //establezco el usuario mediante el setter. El setter ejecuta el codigo y
                  // nofica los listener!!!
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioService.cambiarEdad(100);
                }),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Anadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioService.agregarProfesion('Experto');
                }),
          ],
        ),
      ),
    );
  }
}
