import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Overpass',
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints){
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1920 / 3,
                    maxHeight: 1080 / 3.5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(117, 11, 11, 11),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        )
      ),
    );
  }
}