import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:motore/screen/alfabeto/draw_alphabet.dart';
import 'package:motore/screen/alfabeto/level_alfabeto/level_inicial_alfabeto.dart';
import 'package:motore/screen/desenho_livre/desenho_livre.dart';
import 'package:motore/screen/geometricas/draw_geometricas.dart';
import 'package:motore/screen/geometricas/level_geometricas/level_inicio_geometricas.dart';
import 'package:motore/screen/home/tela_inicial.dart';
import 'package:motore/screen/login/tela_cadastro_login.dart';
import 'package:motore/screen/login/tela_login.dart';
import 'package:motore/screen/numeros/draw_number.dart';
import 'package:motore/screen/numeros/level_numeral/draw_number_screen.dart';
import 'package:motore/screen/numeros/level_numeral/level_inicial_numeral.dart';
import 'package:motore/screen/tracos/draw_tracos.dart';
import 'package:motore/screen/tracos/level_tracos/level_inicio_tracos.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffE45828)),
        useMaterial3: true,
        dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Telainicial(),
        '/level_inicial_numeral': (context) => const LevelInicialNumeral(),
        '/level_inicial_alfabeto': (context) => const TelaInicialAlfabeto(),
        '/level_inicial_geometricas': (context) => const TelaInicioGeometricas(),
        '/level_inicial_tracos': (context) => const TelaInicioTracos(),
        '/drawNumberScreen': (context) => const DrawNumberScreen(),
        '/login': (context) => const TelaLogin(),
        '/telaCadastroLogin': (context) => const TelaCadastroLogin(),
        '/drawNumberOne': (context) => const TelaDrawNumber(),
        '/telaDrawAlphabet': (context) => const TelaDrawAlphabet(),
        '/telaDrawGeometricas': (context) => const TelaDrawGeometricas(),
        '/telaDrawTracos': (context) => const TelaDrawTracos(),
        '/telaDesenhoLivre': (context) => const TelaDesenhoLivre(),
      },
    );
  }
}