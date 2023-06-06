import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_libreria_upec/pages/loginPage.dart';

class PaginaBody extends StatefulWidget {
  const PaginaBody({super.key});

  @override
  State<PaginaBody> createState() => _PaginaBodyState();
}

class _PaginaBodyState extends State<PaginaBody> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  void signOutFromGoogle() async {
    await _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5BDDAB), Color(0xFFACEDD3)], // Colores degradados
          begin: Alignment.topLeft, // Punto inicial del degradado
          end: Alignment.bottomRight, // Punto final del degradado
        ),
      ),
      child: MaterialButton(
          child: Text("Salir"),
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signOut();
              signOutFromGoogle();
              // Navegar a la pantalla de inicio de sesión
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } catch (e) {
              print(e);
            }
          }),
    ));
  }
}
