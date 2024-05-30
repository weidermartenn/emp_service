import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                            Navigator.pop(context);
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
                                      child: const Text(
                                        'имя ',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 31, 31, 31),
                      ),
                      margin: const EdgeInsets.only(left: 20),
                      width: 200,
                      height: 500,
                      // Sorting container
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column( 
                              children: [ 
                                const Text( 
                                'Сортировка',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              DropdownButton<String>(
                                dropdownColor: Color.fromARGB(255, 31, 31, 31),
                                items: const[
                                  DropdownMenuItem<String>(
                                    value: 'asc',
                                    child: Text('Sort Ascending', style: TextStyle(color: Colors.white)),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'desc',
                                    child: Text('Sort Descending'),
                                  ),
                                ],
                                onChanged: (value) {
                                  // Sorting logic here
                                },
                              ),
                            ],
                          ),
                          Column( 
                            children: [ 
                              const Text( 
                                'Диапазон зарплат', 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Slider(
                                thumbColor: Color.fromARGB(255, 56, 93, 160),
                                activeColor: Color.fromARGB(255, 56, 93, 160),
                                min: 0,
                                max: 1000000,
                                onChanged: (value) {
                                  // Range selection logic here
                                },
                                value: 500000,
                              ),
                            ],
                          ),
                          Column( 
                            children: [
                              const Text( 
                                'Конкретное значение', 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              ConstrainedBox(constraints: const BoxConstraints.tightFor(width: 100, height: 50),
                                child: TextField(  
                                  style: const TextStyle(color: Colors.white, fontSize: 15),                         
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                },
                              ),
                            ) 
                            ],
                          )
                          
                        ],
                      ),
                    ),
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