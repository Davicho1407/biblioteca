import 'package:flutter/material.dart';

class OlvideContrasePage extends StatefulWidget {
  const OlvideContrasePage({super.key});

  @override
  State<OlvideContrasePage> createState() => _OlvideContrasePageState();
}

class _OlvideContrasePageState extends State<OlvideContrasePage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5BDDAB),
              Color(0xFFACEDD3)
            ], // Colores degradados
            begin: Alignment.topLeft, // Punto inicial del degradado
            end: Alignment.bottomRight, // Punto final del degradado
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 750,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 225,
                      height: 225,
                      child: Image.asset("assets/img/logo.png")),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Introduce el correo electrónico para poder regenerar tu contraseña: ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SafeArea(
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 4),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Email',
                              fillColor: Colors.white),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Este es un requisito obligatorio";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Por favor ingresa un email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      splashColor: Colors.cyanAccent,
                      color: Colors.greenAccent,
                      child: Text(
                        'Recuperar contraseña',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //   if (_formKey.currentState?.validate() == true) {
                        //     passwordReset();
                        //   }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
