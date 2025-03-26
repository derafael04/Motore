import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ionicons/ionicons.dart';
import 'package:motore/screen/numeros/draw_number.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class TelaDesenhoLivre extends StatefulWidget {
  const TelaDesenhoLivre({super.key});

  @override
  State<TelaDesenhoLivre> createState() => _TelaDesenhoLivreState();
}

class _TelaDesenhoLivreState extends State<TelaDesenhoLivre> {
  ScreenshotController screenshotController = ScreenshotController(); 

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

  Future<bool> _requestPermission() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Desenho Livre',
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
              screenshotController.capture().then((image) async {
                if (await _requestPermission()) {
                  await ImageGallerySaver.saveImage(image!);
                } else {
                  // TRATAR ERRO
                }
              });
            },
            child: const Icon(
              Ionicons.save_outline,
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
        child: Screenshot(
          controller: screenshotController,
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
              //numeralDots()
            ],
          ),
        ),
      ),
    );
  }
}