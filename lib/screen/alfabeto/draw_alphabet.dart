import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:motore/screen/numeros/draw_number.dart';
import 'package:motore/util/number_draw.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class TelaDrawAlphabet extends StatefulWidget {
  const TelaDrawAlphabet({super.key});

  @override
  State<TelaDrawAlphabet> createState() => _TelaDrawAlphabetState();
}

class _TelaDrawAlphabetState extends State<TelaDrawAlphabet> {
  
  int index = 0;

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
    index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Nivel ${index + 1}',
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
            Positioned(
              bottom: 114,
              right: 0,
              left: 0,
              child: SvgPicture.asset(NumberDraw().getSvgByLyrics(index),
                height: MediaQuery.of(context).size.height * 0.7,
              )
            ),
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
            //numeral()
          ],
        ),
      ),
    );
  }
  
  Widget letraDots() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Bolinha superior
        Positioned(
          top: 104,
          left: (MediaQuery.of(context).size.width / 2) - 8,
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xffE45828),
          ),
        ),
        // Bolinha à esquerda
        const Positioned(
          top: 180,
          left: 58,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xffE45828),
          ),
        ),
        // Bolinha do centro
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: (MediaQuery.of(context).size.width / 2) - 8,
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffE45828),
          ),
        ),
        // Bolinhas inferiores
        Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: (MediaQuery.of(context).size.width / 2) - 112,
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffE45828),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: (MediaQuery.of(context).size.width / 2) - 8,
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffE45828),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: (MediaQuery.of(context).size.width / 2) + 92,
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffE45828),
          ),
        ),
      ],
    );
  }
  
  @override
  void dispose() {
    lines.dispose();
    line.dispose();
    super.dispose();
  }
}