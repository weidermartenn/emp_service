import 'package:flutter/material.dart';
import 'package:Employment_Service/classes/classes.dart';
import 'package:Employment_Service/pages/Auth/auth_page.dart';

class UserPage extends StatelessWidget {
  final String username;
  const UserPage({required this.username});
  
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
        body: LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: Column( 
              children: [ 
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push( 
                              context,
                              MaterialPageRoute(builder: (context) => const AuthPage()),
                            );
                          },
                          icon: Image.asset('assets/icons/white/back_icon_white.png', width: 30, height: 30),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Поиск вакансий',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                        ),
                      ),
                      TextButton( 
                        onPressed: () {},
                        child: const Text('Пособия', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      const SizedBox(width: 50,),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(width: 200, height: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Аккаунт',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Divider(thickness: 1, color: Color.fromARGB(255, 31, 31, 31)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icons/white/emp_icon_white.png', width: 45, height: 45),
                                  MouseRegion( 
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/auth');
                                      },
                                      child: Text(
                                        username,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.white),
                const SizedBox(height: 15),
                Row( 
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 22, 22, 22),
                      ),
                      margin: const EdgeInsets.only(left: 20),
                      width: 290,
                      height: 500,
                      // Sorting container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container( 
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: const Color.fromARGB(255, 39, 39, 39),
                                border: Border.all(color: Colors.white, width: 1),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column( 
                              children: [ 
                                const Text( 
                                'Сортировка зарлплат',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Sorting logic for ascending
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(96, 146, 146, 146)),
                                      fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                                      elevation: MaterialStateProperty.all<double>(2.0),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'К наибольшему',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Sorting logic for descending
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(96, 146, 146, 146)),
                                      fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                                      elevation: MaterialStateProperty.all<double>(2.0),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'К наименьшему',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ),
                          Container( 
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: const Color.fromARGB(255, 39, 39, 39),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column( 
                              children: [
                                const Text( 
                                  'Зарлпаты', 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [ 
                                    const Text('от', style: TextStyle(color: Colors.white, fontSize: 15)),
                                    const SizedBox(width: 8),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints.tightFor(width: 80, height: 40),
                                      child: TextField(
                                        style: const TextStyle(color: Colors.white, fontSize: 14),
                                        keyboardType: TextInputType.number,
                                        textAlignVertical: TextAlignVertical.top,
                                        onChanged: (value) {
                                          // Logic for handling input changes
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text('до', style: TextStyle(color: Colors.white, fontSize: 15)),
                                    const SizedBox(width: 8),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints.tightFor(width: 80, height: 40),
                                      child: TextField(
                                        style: const TextStyle(color: Colors.white, fontSize: 14),
                                        keyboardType: TextInputType.number,
                                        textAlignVertical: TextAlignVertical.top,
                                        onChanged: (value) {
                                          // Logic for handling input changes
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                )
                              ],
                            )
                          ),
                          Container( 
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: const Color.fromARGB(255, 39, 39, 39),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton( 
                              onPressed: () {
                                // Logic for handling button click
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 34, 34, 34)),
                                overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(95, 97, 97, 97)),
                                fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                                elevation: MaterialStateProperty.all<double>(2.0),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: const Text( 
                                'Вывести компании с высоким рейтингом',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 130),
                    Container( 
                      width: 700,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: const Color.fromARGB(255, 39, 39, 39),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column( 
                        children: [
                          const Text('Количество активных вакансий: 0', style: TextStyle(color: Colors.white, fontSize: 15)),
                          const SizedBox(height: 10),
                          Expanded( 
                            child: ListView.builder( 
                              itemCount: 5,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder:(context, index) { 
                                return ListTile( 
                                  title: const Text('Вакансия 1', style: TextStyle(color: Colors.white)),
                                  subtitle: Column( 
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container( 
                                        width: 600,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          border: Border.all(color: Colors.white, width: 1),
                                        ),
                                        child: Row( 
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [ 
                                            Column( 
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [ 
                                                const Text('Описание: Описание вакансии', style: TextStyle(color: Colors.white)),
                                                GestureDetector( 
                                                  onTap: () { 
                                                    showModalBottomSheet( 
                                                      context: context, 
                                                      builder: (BuildContext context) { 
                                                        return Container( 
                                                          width: 500,
                                                          decoration: BoxDecoration(
                                                            color: const Color.fromARGB(255, 39, 39, 39),
                                                          ),
                                                          child: const Column( 
                                                            children: [ 
                                                              Text('Компания 1', style: TextStyle(color: Colors.white)),
                                                              Text('Описание компании', style: TextStyle(color: Colors.white)),
                                                            ],
                                                          )
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: const Text('Компания: Компания 1', style: TextStyle(color: Colors.white)),
                                                ),
                                                const Text('Рейтинг: 4.5', style: TextStyle(color: Colors.white)),
                                              ]
                                            ),
                                            const Text('39824 руб.', style: TextStyle(color: Colors.white, fontSize: 20)),
                                          ]
                                        )
                                      )
                                    ],
                                  )
                                );
                              },
                            )
                          )
                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          );
        }
      )
    )
    );
  }
}