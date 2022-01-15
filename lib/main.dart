import 'package:flutter/material.dart';

import 'package:gestordeestados/pages/pagina1_page.dart';
import 'package:gestordeestados/pages/pagina2_page.dart';
import 'package:gestordeestados/services/usuario_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      ///defino en nivel alto del arbol de widget asi la instancia usuarioServie es usada en todos lados de mi app
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                UsuarioService()) //otro de los parametros es lazy que por defecto esta en true(crea la inst
        //instancia cuando la necesita. Si lo pongo en false apenas se crea el widget crea la instancia.
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
      ),
    );
  }
}
