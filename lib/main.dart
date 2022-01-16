import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestordeestados/bloc/usuario/usuario_cubit.dart';

import 'package:gestordeestados/pages/pagina1_page.dart';
import 'package:gestordeestados/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                UsuarioCubit()) // cuando inicializo UsuarioCubit tambien se inicializa Usuario Initial() que es el estado inicial.
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
