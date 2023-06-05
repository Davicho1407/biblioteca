import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _emailController = TextEditingController();
  final _confirmemailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isObscure2 = true;

  String? validator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Este es un requisito obligatorio'
        : null;
  }

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
              height: 70,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Crear nueva cuenta",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.green.shade600,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "*Debe contener una mezcla de letras mayúsculas y minúsculas, números y simbolos.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(height: 1.5, fontSize: 16),
                    ),
                  ),
                  SafeArea(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                            controller: _firstNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 4),
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: 'Nombre',
                                fillColor: Colors.white),
                            validator: validator),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Por favor ingresa un email");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          hintText: 'Confirmar Email',
                          fillColor: Colors.white),
                      validator: (value) {
                        if (_confirmpasswordController.text !=
                            _passwordController.text) {
                          return "Contraseñas no coinciden";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //COntraseña textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      keyboardType: TextInputType.emailAddress,
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
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 4),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Contraseña',
                          fillColor: Colors.white),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Este es un requisito obligatio";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Por favor ingrese una contraseña valida minima de 6 caracteres ");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Confirmar contraseña
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: _isObscure2,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure2
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure2 = !_isObscure2;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 4),
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Confirmar contraseña',
                          fillColor: Colors.white),
                      validator: (value) {
                        if (_confirmpasswordController.text !=
                            _passwordController.text) {
                          return "Contraseñas no coinciden";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  //Boton de inicio sesion
                  MaterialButton(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Registrarme',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),
                      onPressed: () {}),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
