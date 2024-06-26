import 'package:flutter/material.dart';
import 'package:Employment_Service/pages/Main/main_app.dart';
import 'package:Employment_Service/pages/User/user_page.dart';
import 'package:Employment_Service/pages/Admin/admin_page.dart';
import 'package:Employment_Service/scripts/dialogs.dart';
import 'auth.dart';
import 'dialogs.dart';
import 'package:Employment_Service/classes/classes.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{ 
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        inputDecorationTheme: const InputDecorationTheme(
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
        textSelectionTheme: const TextSelectionThemeData( 
          cursorColor: Color.fromARGB(255, 62, 84, 145),
          selectionColor: Color.fromARGB(255, 62, 84, 145),
        ),
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
                        maxHeight: 1080 / 3,
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
                                            controller: _dataController,
                                            decoration: const InputDecoration(
                                              labelText: 'Имя пользователя/Телефон' 
                                            ),
                                            style: const TextStyle(color: Colors.white),
                                            validator: (value) => value == null || value.isEmpty ? 'Поле не может быть пустым' : null,       
                                          ),
                                        ),
                                        SizedBox( 
                                          width: 300,
                                          height: 70,
                                          child: TextFormField(
                                            controller: _passwordController,
                                            decoration: const InputDecoration(
                                              labelText: 'Пароль',
                                            ),
                                            obscureText: true,
                                            obscuringCharacter: '*',
                                            style: const TextStyle(color: Colors.white),
                                            validator: (value) => value == null || value.isEmpty ? 'Поле не может быть пустым' : null,
                                          )
                                        ),
                                        const SizedBox(height: 30),
                                        SizedBox( 
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton( 
                                            onPressed: () async {
                                              if (_formKey.currentState!.validate()) {
                                                var data = _dataController.text;
                                                var pass = _passwordController.text;
                                                final result = await isAuth(data, pass);

                                                if (data == 'admin' && pass == '1234') {
                                                  Navigator.push( 
                                                    context,
                                                    MaterialPageRoute( 
                                                      builder: (context) => const AdminPage(),
                                                    )
                                                  );
                                                  successDialog(context);
                                                }
                                                else if (result == 'true') {
                                                  var accounts = Accounts('id', 'password', 'username', 'phone_number');
                                                  Navigator.push( 
                                                    context,
                                                    MaterialPageRoute( 
                                                      builder: (context) => UserPage(username: accounts.username),
                                                    )
                                                  );
                                                  successDialog(context);
                                                }
                                                else{
                                                  notFoundDialog(context);
                                                }
                                              }
                                              else {
                                                emptyInputDialog(context);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromARGB(197, 105, 105, 105),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              elevation: 2.0,
                                            ),
                                            child: const Text(
                                              'Войти',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 255, 255, 255),
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


  
