import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawNumberScreen extends StatefulWidget {
  const DrawNumberScreen({super.key});

  @override
  State<DrawNumberScreen> createState() => _DrawNumberScreenState();
}

class _DrawNumberScreenState extends State<DrawNumberScreen> {
  List<Offset?> points = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Nivel 1 - Numeral 0',
          style: GoogleFonts.fredoka(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasSize = Size(constraints.maxWidth, constraints.maxHeight);
            return Stack(
              children: [
                // Fundo com a marca do número "0"
                CustomPaint(
                  size: canvasSize,
                  painter: BackgroundPainter(),
                ),

                // Área de desenho com GestureDetector
                GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      // Corrigir a posição local usando o tamanho do widget
                      RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      Offset localPosition =
                          renderBox.globalToLocal(details.globalPosition);
                      points.add(localPosition);
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      points.add(null); // Adiciona um marcador de quebra de linha
                    });
                  },
                  child: CustomPaint(
                    size: canvasSize,
                    painter: DrawingPainter(points: points),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Desenha o traço do usuário
class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffE45828)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Desenha o número "0" como guia de fundo
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    // Desenha o número "0"
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2.5),
        width: size.width * 0.68,
        height: size.height * 0.38,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}