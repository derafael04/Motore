import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class TelaInicioTracos extends StatefulWidget {
  const TelaInicioTracos({super.key});

  @override
  State<TelaInicioTracos> createState() => _TelaInicioTracosState();
}

class _TelaInicioTracosState extends State<TelaInicioTracos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traçados',
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
              color: const Color(0xffD83951),
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