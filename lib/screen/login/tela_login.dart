import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: SizedBox(
              height: 260,
              width: 260,
              child: Image.asset('assets/images/logoback.png')
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              cursorColor: Color(0xff1F8785),
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: TextField(
              cursorColor: Color(0xff1F8785),
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                hoverColor: Color(0xff1F8785),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Container(
                height: 58,
                width: double.infinity ,
                decoration: BoxDecoration(
                  color: const Color(0xffE45828),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Entrar',
                      style: GoogleFonts.fredoka(
                        color: const Color(0xffFFFFFF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}