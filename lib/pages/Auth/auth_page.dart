import 'package:flutter/material.dart';
import 'package:Employment_Service/pages/Main/main_app.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{ 
  final _formKey = GlobalKey<FormState>();
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
            ),
          ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 11, 11, 11),
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
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
                            width: 2,
                          ),
                        ),
                        child: Column( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [ 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push( 
                                        context,
                                        MaterialPageRoute( 
                                          builder: (context) => const MainApp(),
                                        )
                                      );
                                  },
                                  icon: Image.asset(
                                    'assets/icons/white/back_icon_white.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                const SizedBox(width: 155), // Устанавливаем промежуток в 10 пикселей
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/white/auth_icon_white.png',
                                    ),
                                    const SizedBox(width: 10), // Дополнительный промежуток между картинкой и текстом
                                    const Text(
                                      'Авторизация',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [     
                                        const Text( 
                                          'Введите данные для входа',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox( 
                                          width: 300,
                                          height: 70,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Номер телефона/Почта',
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Color.fromARGB(90, 255, 255, 255)),
                                              ),
                                            ),
                                            style: const TextStyle(color: Colors.white),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Пожалуйста, введите данные.';
                                              }  
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        SizedBox( 
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton( 
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                print('Вход выполнен');
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(197, 11, 11, 11),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              elevation: 2.0,
                                            ),
                                            child: const Text(
                                              'Войти',
                                              style: TextStyle(
                                                color: Color.fromARGB(166, 255, 255, 255),
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        )
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                          ],
                        )
                      )
                    )
                  )
                );
          },
        ),
      ),
    );
  }
}
  
