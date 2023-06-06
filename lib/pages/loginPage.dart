import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_libreria_upec/pages/olvidarContrase%C3%B1a.dart';
import 'package:my_libreria_upec/pages/paginaBody.dart';
import 'package:my_libreria_upec/pages/resgistroCuenta.dart';
import 'package:http/http.dart' as http;
import 'package:my_libreria_upec/services/authGoogle.dart';
import 'package:my_libreria_upec/services/authentication.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

import 'package:quickalert/quickalert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscure2 = true;

  String? validator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Este es un requisito obligatorio'
        : null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5BDDAB), Color(0xFFACEDD3)], // Colores degradados
          begin: Alignment.topLeft, // Punto inicial del degradado
          end: Alignment.bottomRight, // Punto final del degradado
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                width: 225,
                height: 225,
                child: Image.asset("assets/img/logo.png")),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 550,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(25),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bienvenido a UPECMyLibrary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      child: SafeArea(
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.greenAccent,
                                                width: 4),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        hintText: 'Email',
                                        fillColor: Colors.white),
                                    validator: validator,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //Password Controller
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _isObscure,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(_isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.greenAccent,
                                                width: 4),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        hintText: 'Contraseña',
                                        fillColor: Colors.white),
                                    validator: validator,
                                    onChanged: (value) {},
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                BtnGoogle()
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    BtnIniciarSesion(
                        email: _emailController.text,
                        password: _passwordController.text,
                        formkey: _formKey),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BtnDireccion(
                                    nombre: "Olvide mi contraseña?",
                                    ruta: OlvideContrasePage())
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BtnDireccion(
                                    nombre: "Registrarse?",
                                    ruta: RegistroPage())
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BtnGoogle extends StatefulWidget {
  const BtnGoogle({super.key});

  @override
  State<BtnGoogle> createState() => _BtnGoogleState();
}

class _BtnGoogleState extends State<BtnGoogle> {
  bool _isPressed = false;
  // final IngresarConGoogle _auth = IngresarConGoogle();

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final googleAuth = await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw Exception('Inicio de sesión con Google cancelado.');
      }
    } catch (e) {
      // Handle any errors or exceptions
      print('Error en el inicio de sesión con Google: $e');
      throw Exception(
          'Error en el inicio de sesión con Google. Por favor, inténtalo de nuevo.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color:
                _isPressed ? Colors.greenAccent.shade200 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    width: 40,
                    "assets/img/iconGoogle.png",
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Continuar con Google")],
              )
            ],
          ),
        ),
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        onTap: () {
          try {
            signInWithGoogle();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaBody(),
                ));
          } catch (e) {
            print('Error es: $e');
          }
        },
      ),
    );
  }
}

///////////////////////////////////////////////////////

class BtnIniciarSesion extends StatefulWidget {
  final String email;
  final String password;
  final GlobalKey<FormState> formkey;

  const BtnIniciarSesion({
    super.key,
    required this.email,
    required this.password,
    required this.formkey,
  });
  @override
  State<BtnIniciarSesion> createState() => _BtnIniciarSesionState();
}

class _BtnIniciarSesionState extends State<BtnIniciarSesion> {
  // final usuario = TextEditingController();
  // final password = TextEditingController();

  bool _isPressed = false;

  final FirebaseAuthService _authService = FirebaseAuthService();
  void signIn() async {
    try {
      final UserCredential =
          await _authService.signIn(widget.email, widget.password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaginaBody(),
        ),
      );
      // Reemplaza la pantalla actual con la pantalla de inicio
    } catch (e) {
      print('Error en la autenticacion con los requisitos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color:
                _isPressed ? Colors.grey.shade200 : Colors.greenAccent.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () {
          if (widget.formkey.currentState?.validate() == true) {
            signIn();
          }
        },
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
      ),
    );
  }
}

class BtnDireccion extends StatefulWidget {
  final String nombre;

  final Widget ruta;

  const BtnDireccion({super.key, required this.nombre, required this.ruta});
  @override
  State<BtnDireccion> createState() => _BtnDireccionState();
}

class _BtnDireccionState extends State<BtnDireccion> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: AnimatedContainer(
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          color: Colors.white,
          duration: Duration(milliseconds: 200),
          child: Text(
            widget.nombre,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: _isPressed ? Colors.grey : Colors.black,
            ),
          ),
        ),
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.ruta),
          );
        },
      ),
    );
  }
}
