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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Inicio',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.tealAccent),
              accountName:
                  Text("Usuario", style: TextStyle(color: Colors.black)),
              accountEmail:
                  Text("Contraseña", style: TextStyle(color: Colors.black))),
          ListTile(
            leading: Icon(Icons.house),
            title: Text("Inicio"),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("Nuevo Chat"),
          ),
          ListTile(
            leading: Icon(Icons.content_copy),
            title: Text("Nuevo Contenido"),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Libros"),
          ),
          ListTile(
            leading: Icon(Icons.art_track_sharp),
            title: Text("Revistas"),
          ),
          ListTile(
            leading: Icon(Icons.telegram),
            title: Text("Red Social"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notificaciones"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: () async {
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
            },
          )
        ],
      )),
      body: _PaginaBienvenidad(),
    );
  }
}

class _PaginaBienvenidad extends StatefulWidget {
  const _PaginaBienvenidad({super.key});

  @override
  State<_PaginaBienvenidad> createState() => __PaginaBienvenidadState();
}

class __PaginaBienvenidadState extends State<_PaginaBienvenidad> {
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
    ));
  }
}
