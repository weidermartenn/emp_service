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
                    children: [
                      ConstrainedBox( 
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth,
                          maxHeight: 200,
                        ),
                        child: Container( 
                          decoration: BoxDecoration(
                            color: Colors.black12
                          ),                        
                          child: Center(
                            child: Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Row (
                                  children: [ 
                                    Column( 
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row( 
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
                                            ),   
                                          ]
                                        ),
                                        Row( 
                                          children: [
                                            TextButton(
                                              child: const Text('Войти'),
                                              onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) => Dialog(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      const Text('This is a typical dialog.'),
                                                      const SizedBox(height: 15),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: const Text('Close'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ), 
                                            ),
                                            ),
                                            TextButton(
                                              child: const Text('Регистрация'),
                                              onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) => Dialog(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      const Text('This is a typical dialog.'),
                                                      const SizedBox(height: 15),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: const Text('Close'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ), 
                                            ),
                                            ),
                                            
                                          ]
                                        )
                                      ]
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
