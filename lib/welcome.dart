// ignore_for_file: camel_case_types

import 'package:simple_app/home_screen.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        drawerEdgeDragWidth: MediaQuery.of(context).size.width,
        body:
            // BoxDecoration takes the image
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.trolley,
                size: 72,
                color: Colors.black,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Welcome to Fruits Shopping",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                  hoverColor: Colors.lightBlue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Icon(Icons.arrow_forward)),
            ],
          ),
        ));
  }
}
