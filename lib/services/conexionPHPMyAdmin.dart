import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ConexionBaseDatos extends StatefulWidget {
  const ConexionBaseDatos({super.key});

  @override
  State<ConexionBaseDatos> createState() => _ConexionBaseDatosState();
}

class _ConexionBaseDatosState extends State<ConexionBaseDatos> {
  TextEditingController controllerUser = new TextEditingController();

  TextEditingController controllerPass = new TextEditingController();

  String mensaje = "";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
