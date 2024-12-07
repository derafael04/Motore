import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class TelaInicioGeometricas extends StatefulWidget {
  const TelaInicioGeometricas({super.key});

  @override
  State<TelaInicioGeometricas> createState() => _TelaInicioGeometricasState();
}

class _TelaInicioGeometricasState extends State<TelaInicioGeometricas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: Text(
          'Formas Geométricas',
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
          horizontalGridMargin: 16,
          verticalGridMargin: 16,
          minItemWidth: 80,
          children: List.generate(4,
            (index) => ColoredBox(
              color: const Color(0xffF1A131),
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
      )
    );
  }
}