import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturarpizza.dart';
import 'verpizzas.dart';

void main() {
  runApp(const MaterialAppPrincipal());
}

class MaterialAppPrincipal extends StatelessWidget {
  const MaterialAppPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzería',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/capturar': (context) => const PantallaCaptura(),
        '/ver': (context) => const PantallaVerPizzas(),
      },
    );
  }
}
