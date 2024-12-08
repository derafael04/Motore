import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

class Telainicial extends StatefulWidget {
  const Telainicial({super.key});

  @override
  State<Telainicial> createState() => _TelainicialState();
}

class _TelainicialState extends State<Telainicial> {

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xffFFFFFF),
      //   elevation: 0,
      //   title: Container(
      //     height: 194,
      //     width: 194,
      //     decoration: const BoxDecoration(
      //       image: DecorationImage(image: AssetImage('assets/images/logoback.png'), fit: BoxFit.fill, alignment: Alignment.center),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.notifications,
      //         color: Color(0xff000000),
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          children: [
            SizedBox(
              height: 260,
              width: 260,
              child: Image.asset('assets/images/logoback.png')),
            const SizedBox(height: 24),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/level_inicial_alfabeto');
                  },
                  child: Container(
                    height: 120,
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    decoration: BoxDecoration(
                      color: const Color(0xff1F8785),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/images/abc.png'), alignment: Alignment.centerRight),
                    ),
                    child: Center(
                      child: Text(
                        'Alfabeto',
                        style: GoogleFonts.fredoka(
                          color: const Color(0xffFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/level_inicial_numeral');
                  },
                  child: Container(
                    height: 120,
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    decoration: BoxDecoration(
                      color: const Color(0xffE45828),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/images/numeral.png'), alignment: Alignment.centerRight),
                    ),
                    child: Center(
                      child: Text(
                        'Numerais',
                        style: GoogleFonts.fredoka(
                          color: const Color(0xffFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/level_inicial_tracos');
                  },
                  child: Container(
                    height: 120,
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    decoration: BoxDecoration(
                      color: const Color(0xffD83951),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Traçados',
                        style: GoogleFonts.fredoka(
                          color: const Color(0xffFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/level_inicial_geometricas');
                  },
                  child: Container(
                    height: 120,
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    decoration: BoxDecoration(
                      color: const Color(0xffF1A131),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/images/formas.png'), alignment: Alignment.centerRight),
                    ),
                    child: Center(
                      child: Text(
                        'Formas Geométricas',
                        style: GoogleFonts.fredoka(
                          color: const Color(0xffFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}