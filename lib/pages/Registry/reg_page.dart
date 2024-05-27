import 'package:flutter/material.dart';
import 'package:Employment_Service/pages/Main/main_app.dart';
import 'package:Employment_Service/scripts/dialogs.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage>{ 
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
        )
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
                        maxHeight: 1080 / 2,
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
                                            controller: _loginController,
                                            decoration: const InputDecoration(
                                              labelText: 'Придумайте имя пользователя',
                                            ),
                                            validator: (value) => value == null || value.isEmpty ? 'Поле не может быть пустым' : null, 
                                          ),
                                        ),
                                        SizedBox( 
                                          width: 300,
                                          height: 70,
                                          child: TextFormField(
                                            controller: _passwordController,
                                            decoration: const InputDecoration(
                                              labelText: 'Придумайте пароль',
                                            ),
                                            validator: (value) => value == null || value.isEmpty ? 'Поле не может быть пустым' : null, 
                                          )
                                        ),
                                        SizedBox( 
                                          width: 300,
                                          height: 70,
                                          child: TextFormField(
                                            controller: _passwordController2,
                                            decoration: const InputDecoration(
                                              labelText: 'Повторите пароль',
                                            ),
                                            obscureText: true,
                                            obscuringCharacter: '*',
                                            style: const TextStyle(color: Colors.white),
                                            validator: (value) => value == null || value.isEmpty ? 'Поле не может быть пустым' : null, 
                                          )
                                        ),
                                        SizedBox(
                                          width: 300,
                                          height: 70,
                                          child: TextFormField(
                                            controller: _emailController,
                                            decoration: const InputDecoration(
                                              labelText: 'Email',
                                            ),
                                            style: const TextStyle(color: Colors.white),
                                            keyboardType: TextInputType.emailAddress, // Указывает тип клавиатуры для ввода email
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Пожалуйста, введите адрес электронной почты'; // Сообщение об ошибке, если поле пустое
                                              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                                return 'Пожалуйста, введите действительный адрес электронной почты'; // Сообщение об ошибке, если формат email неверный
                                              }
                                              return null;
                                            },
                                          )
                                        ),
                                        const SizedBox(height: 30),
                                        SizedBox( 
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton( 
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                successDialog(context);
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

incorrectInputDialog(BuildContext dialogContext){ 
  Widget okButton = TextButton( 
    onPressed: () {
      Navigator.of(dialogContext, rootNavigator: true).pop();
    },
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
    ), 
    child: const Text( 
      'Понимаю',
      style: TextStyle(
        color: Color.fromARGB(184, 0, 0, 0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  AlertDialog alert = AlertDialog( 
    title: Image.asset( 
      'assets/icons/black/incorrect_icon_black.png',
      width: 40,
      height: 40,
    ),
    content: const Text( 
      'Пожалуйста, заполните форму.',
      style: TextStyle( 
        fontSize: 16,
      )
    ), 
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      okButton,
    ],
  );
  showDialog( 
    context: dialogContext,
    builder: (BuildContext context){ 
      return alert;
    },
  );
}
  
