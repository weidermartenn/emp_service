import 'dart:io';

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
          textButtonTheme: TextButtonThemeData( 
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0.0),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.all<Color>(Colors.black38),
            )
          )
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
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/main_page_pic.jpg'),
                  //   fit: BoxFit.cover, // Изображение сохраняет пропорции и заполняет всю область
                  // ),
                  color: Color.fromARGB(255, 11, 11, 11),
                ),
                child: Center( 
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
                            width: 2,
                          ),
                        ),
                        child: Column( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [ 
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ 
                                IconButton( 
                                  onPressed: () {
                                    exitDialog(context);
                                  },
                                  icon: Image.asset(
                                    'assets/icons/white/close_icon_white.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                  Image.asset(
                                    'assets/icons/default_icon.png',
                                    width: 70,
                                    height: 70,
                                  ),
                                  const Padding( 
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('СЛУЖБА ЗАНЯТОСТИ', 
                                      style: TextStyle( 
                                        color: Color.fromARGB(185, 255, 255, 255),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ),
                                  )
                              ]
                            ),
                            const Text('КЛИЕНТСКОЕ ПРИЛОЖЕНИЕ',
                              style: TextStyle( 
                                  color: Color.fromARGB(185, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                            ),
                            Padding( 
                              padding: const EdgeInsets.only(top: 60),
                              child: Row( 
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [ 
                                  TextButton( 
                                    onPressed: null,
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(96, 146, 146, 146)),
                                      fixedSize: const MaterialStatePropertyAll<Size>(Size(200, 50)),
                                      elevation: MaterialStateProperty.all<double>(2.0),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )
                                      )
                                    ),
                                    child: const Text(
                                      'Войти в аккаунт',
                                      style: TextStyle( 
                                        color: Color.fromARGB(185, 255, 255, 255),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  TextButton( 
                                  onPressed: null,
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(96, 146, 146, 146)),
                                      fixedSize: const MaterialStatePropertyAll<Size>(Size(200, 50)),
                                      elevation: MaterialStateProperty.all<double>(2.0),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )
                                      )
                                    ),
                                    child: const Text(
                                      'Зарегестрироваться',
                                      style: TextStyle( 
                                        color: Color.fromARGB(185, 255, 255, 255),
                                        fontSize: 18,
                                      ),
                                    ),
                                  )                               
                                ]
                              ),   
                            )                        
                          ],
                        )
                      )
                    )
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

exitDialog(BuildContext context){ 
  Widget cancelButton = TextButton( 
    child: const Text(
      'Отмена',
      style: TextStyle(
        color: Color.fromARGB(184, 220, 48, 48),
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget confirmButton = TextButton( 
    child: const Text(
      'Подтвердить',
      style: TextStyle(
        color: Color.fromARGB(184, 0, 0, 0),
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () { 
      exit(0);
    }
  );

  AlertDialog alert = AlertDialog( 
    title: Image.asset(
      'assets/icons/black/close_icon_black.png',
      width: 40,
      height: 40,
    ),
    content: const Text(
      'Вы уверены, что хотите выйти из приложения?',
      style: TextStyle(
        fontSize: 16,
      )
    ),
    actionsAlignment: MainAxisAlignment.center,
    actions: [ 
      cancelButton,
      confirmButton,
    ],
  );
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return alert;
    },
  );
}


