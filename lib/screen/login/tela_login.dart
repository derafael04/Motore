import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool senhaOculta = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Center(
              child: SizedBox(
                height: 260,
                width: 260,
                child: Image.asset('assets/images/logoback.png', alignment: Alignment.center,)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Text(
              'Faça login na sua conta',
              style: GoogleFonts.fredoka(
                color: Colors.grey[700],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              //style: TextStyle(color: Color(0xff1F8785)), // Add this line to change the text color
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: TextField(
              //style: TextStyle(color: Color(0xff1F8785)),
              decoration: InputDecoration(
                labelText: 'Senha',
                border: const OutlineInputBorder(),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      senhaOculta = !senhaOculta;
                    });
                  },
                  child: Icon(senhaOculta ? Ionicons.eye_off : Ionicons.eye))
              ),
              obscureText: senhaOculta,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Container(
                height: 50,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.5,
                  width: 10,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Ou faça login com',
                    style: GoogleFonts.fredoka(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 10,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               InkWell(
                onTap: () {},
                 child: SizedBox(
                  height: 48,
                  width: 80,
                  child: Image.asset('assets/images/google.png', alignment: Alignment.center),
                 ),
               ),
               const SizedBox(width: 16),
               InkWell(
                onTap: () {},
                 child: SizedBox(
                  height: 38,
                  width: 80,
                  child: Image.asset('assets/images/facebook.png', alignment: Alignment.center)
                 ),
               ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tem uma conta?  ',
                  style: GoogleFonts.fredoka(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Cadastre-se',
                  style: GoogleFonts.fredoka(
                    color: const Color(0xffE45828),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}