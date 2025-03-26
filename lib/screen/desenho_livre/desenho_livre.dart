import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ionicons/ionicons.dart';
import 'package:painter/painter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class TelaDesenhoLivre extends StatefulWidget {
  const TelaDesenhoLivre({super.key});

  @override
  State<TelaDesenhoLivre> createState() => _TelaDesenhoLivreState();
}

class _TelaDesenhoLivreState extends State<TelaDesenhoLivre> {
  ScreenshotController screenshotController = ScreenshotController(); 
  PainterController controller = _newController();

  static PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = const Color(0xffFFFFFF);
    return controller;
  }

  @override
  void initState() {
    super.initState();
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
              controller.clear();
            },
            icon: const Icon(
              Ionicons.sync,
              size: 20,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Painter(controller)
      ),
    );
  }
}