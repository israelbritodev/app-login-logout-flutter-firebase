import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';

class Interna extends StatefulWidget {
  const Interna({super.key});

  @override
  State<Interna> createState() => _InternaState();
}

class _InternaState extends State<Interna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 28, 28),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: Text(
          "Seja Bem-vindo ao NetFrix+",
          style: TextStyle(
            color: Color.fromARGB(255, 88, 19, 19),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 300,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(255, 88, 4, 4),
              width: 4,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Seja Bem-Vindo Sr(a) "),
                    Text("Pessoa", style: TextStyle(color: const Color.fromARGB(255, 243, 33, 33))),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsGeometry.fromLTRB(8, 0, 8, 0),
                child: Divider(color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                   AuthService().logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 88, 4, 4),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
