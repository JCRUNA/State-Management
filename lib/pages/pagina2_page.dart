import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {}),
            MaterialButton(
                color: Colors.indigo,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {}),
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
