import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class TelaInicialAlfabeto extends StatefulWidget {
  const TelaInicialAlfabeto({super.key});

  @override
  State<TelaInicialAlfabeto> createState() => _TelaInicialAlfabetoState();
}

class _TelaInicialAlfabetoState extends State<TelaInicialAlfabeto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        title: Text(
          'Alfabeto',
          style: GoogleFonts.fredoka(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ResponsiveGridList(
          horizontalGridMargin: 0,
          verticalGridMargin: 16,
          minItemWidth: 100,
          children: List.generate(26,
            (index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/telaDrawAlphabet', arguments: index);
              },
              child: ColoredBox(
                color: const Color(0xff1F8785),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    'Nivel ${index + 1}',
                    style: GoogleFonts.fredoka(
                      color: const Color(0xffFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}