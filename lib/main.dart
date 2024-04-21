import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( 
          fontFamily: 'Overpass',
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                width: 1920,
                height: 1080,
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/main_page_pic.jpg'),
                    fit: BoxFit.cover, // Изображение сохраняет пропорции и заполняет всю область
                  ),
                ),
                child: Center( 
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ConstrainedBox( 
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth,
                          maxHeight: 100,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(188, 0, 0, 0),                      
                          ),
                          child: Center(
                            child: Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Row (
                                  children: [ 
                                    Image.asset('assets/icons/default_icon.png', width: 80, height: 80),
                                    const Padding( 
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text('СЛУЖБА ЗАНЯТОСТИ', 
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white, 
                                        fontSize: 40, 
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    )
                                    
                                  ],
                                ),
                              ],
                            )
                          )
                        )
                      )
                    ]
                  )
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
