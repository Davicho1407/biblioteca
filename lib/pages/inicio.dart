import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_libreria_upec/pages/loginPage.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        SizedBox(
          height: 150,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: AlignmentDirectional.center,
            height: 300,
            width: 300,
            child:
                Image.asset("assets/img/logo.png", alignment: Alignment.center),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              width: 300,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                'Entrar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                'Registrarse',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ),
        ),
      ]),
    );
  }
}
