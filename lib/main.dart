import 'package:flutter/material.dart';
import 'package:motore/screen/alfabeto/level_alfabeto/level_inicial_alfabeto.dart';
import 'package:motore/screen/geometricas/level_geometricas/level_inicio_geometricas.dart';
import 'package:motore/screen/home/tela_inicial.dart';
import 'package:motore/screen/numeros/level_numeral/level_inicial_numeral.dart';
import 'package:motore/screen/tracos/level_tracos/level_inicio_tracos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Telainicial(),
        '/level_inicial_numeral': (context) => const LevelInicialNumeral(),
        '/level_inicial_alfabeto': (context) => const TelaInicialAlfabeto(),
        '/level_inicial_geometricas': (context) => const TelaInicioGeometricas(),
        '/level_inicial_tracos': (context) => const TelaInicioTracos(),
      },
    );
  }
}