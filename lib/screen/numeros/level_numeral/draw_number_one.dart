import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:ui';
import 'package:perfect_freehand/perfect_freehand.dart';

class DrawNumberOne extends StatefulWidget {
  const DrawNumberOne({super.key});

  @override
  State<DrawNumberOne> createState() => _DrawNumberOneState();
}

class _DrawNumberOneState extends State<DrawNumberOne> {

  StrokeOptions options = StrokeOptions(
    size: 16,
    thinning: 0.7,
    smoothing: 0.5,
    streamline: 0.5,
    start: StrokeEndOptions.start(
      taperEnabled: true,
      customTaper: 0.0,
      cap: true,
    ),
    end: StrokeEndOptions.end(
      taperEnabled: true,
      customTaper: 0.0,
      cap: true,
    ),
    simulatePressure: true,
    isComplete: false,
  );

  /// Previous lines drawn.
  final lines = ValueNotifier(<Stroke>[]);

  /// The current line being drawn.
  final line = ValueNotifier<Stroke?>(null);

  void clear() => setState(() {
        lines.value = [];
        line.value = null;
      });

  void onPointerDown(PointerDownEvent details) {
    final supportsPressure = details.kind == PointerDeviceKind.stylus;
    options = options.copyWith(simulatePressure: !supportsPressure);

    final localPosition = details.localPosition;
    final point = PointVector(
      localPosition.dx,
      localPosition.dy,
      supportsPressure ? details.pressure : null,
    );

    line.value = Stroke([point]);
  }

  void onPointerMove(PointerMoveEvent details) {
    final supportsPressure = details.pressureMin < 1;
    final localPosition = details.localPosition;
    final point = PointVector(
      localPosition.dx,
      localPosition.dy,
      supportsPressure ? details.pressure : null,
    );

    line.value = Stroke([...line.value!.points, point]);
  }

  void onPointerUp(PointerUpEvent details) {
    lines.value = [...lines.value, line.value!];
    line.value = null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Nivel 2',
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
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: false,
                backgroundColor: const Color(0xffFFFFFF),
                builder: (BuildContext context) {
                  return StatefulBuilder (
                    builder: (context, setState) {
                      return SafeArea(
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    'Tamanho',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.fredoka(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Slider(
                                  value: options.size,
                                  activeColor: const Color(0xffE45828),
                                  min: 1,
                                  max: 50,
                                  divisions: 100,
                                  label: options.size.round().toString(),
                                  onChanged: (double value) => {
                                    setState(() {
                                      options.size = value;
                                    })
                                  },
                                ),
                                Text(
                                  'Afinamento',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.fredoka(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Slider(
                                  activeColor: const Color(0xffE45828),
                                  value: options.thinning,
                                  min: -1,
                                  max: 1,
                                  divisions: 100,
                                  label: options.thinning.toStringAsFixed(2),
                                  onChanged: (double value) => {
                                    setState(() {
                                      options.thinning = value;
                                    })
                                  },
                                ),
                                Text(
                                    'Suavização',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.fredoka(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Slider(
                                  activeColor: const Color(0xffE45828),
                                  value: options.streamline,
                                  min: 0,
                                  max: 1,
                                  divisions: 100,
                                  label: options.streamline.toStringAsFixed(2),
                                  onChanged: (double value) => {
                                    setState(() {
                                      options.streamline = value;
                                    })
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Icon(
              Ionicons.pencil,
              size: 18,
              color: Color(0xff000000),
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              clear();
            },
            icon: const Icon(
              Ionicons.sync,
              size: 20,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
      body: Listener(
        onPointerDown: onPointerDown,
        onPointerMove: onPointerMove,
        onPointerUp: onPointerUp,
        child: Stack(
          children: [
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: lines,
                builder: (context, lines, _) {
                  return CustomPaint(
                    painter: StrokePainter(
                      color: const Color(0xffE45828),
                      lines: lines,
                      options: options,
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: line,
                builder: (context, line, _) {
                  return CustomPaint(
                    painter: StrokePainter(
                      color: const Color(0xffE45828),
                      lines: line == null ? [] : [line],
                      options: options,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    lines.dispose();
    line.dispose();
    super.dispose();
  }
}

class StrokePainter extends CustomPainter {
  const StrokePainter({
    required this.color,
    required this.lines,
    required this.options,
  });

  final Color color;
  final List<Stroke> lines;
  final StrokeOptions options;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (final line in lines) {
      final outlinePoints = getStroke(line.points, options: options);

      if (outlinePoints.isEmpty) {
        continue;
      } else if (outlinePoints.length < 2) {
        // If the path only has one point, draw a dot.
        canvas.drawCircle(
          outlinePoints.first,
          options.size / 2,
          paint,
        );
      } else {
        final path = Path();
        path.moveTo(outlinePoints.first.dx, outlinePoints.first.dy);
        for (int i = 0; i < outlinePoints.length - 1; ++i) {
          final p0 = outlinePoints[i];
          final p1 = outlinePoints[i + 1];
          path.quadraticBezierTo(
            p0.dx,
            p0.dy,
            (p0.dx + p1.dx) / 2,
            (p0.dy + p1.dy) / 2,
          );
        }
        // You'll see performance improvements if you cache this Path
        // instead of creating a new one every paint.
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Stroke {
  final List<PointVector> points;

  const Stroke(this.points);
}