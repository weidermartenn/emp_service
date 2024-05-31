import 'package:flutter/material.dart';
import 'package:Employment_Service/classes/classes.dart';
import 'admin.dart';
import 'package:Employment_Service/pages/Main/main_app.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Future<List<Accounts>> futureAccounts;

  @override
  void initState() {
    super.initState();
    futureAccounts = fetchAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( 
        textSelectionTheme: const TextSelectionThemeData( 
          cursorColor: Color.fromARGB(255, 62, 84, 145),
          selectionColor: Color.fromARGB(255, 62, 84, 145),
        ),
      ),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    child: Text(
                      "Добро пожаловать на секретную страницу",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Аккаунты",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Accounts>>(
                      future: futureAccounts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No data found'));
                        } else {
                          List<Accounts> accounts = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('ID')),
                                DataColumn(label: Text('Phone')),
                                DataColumn(label: Text('Password')),
                                DataColumn(label: Text('Salt')),
                                DataColumn(label: Text('Username')),
                              ],
                              rows: accounts.map((acc) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(acc.id.toString())),
                                    DataCell(Text(acc.phone)),
                                    DataCell(Text(acc.password)),
                                    DataCell(Text(acc.salt)),
                                    DataCell(Text(acc.username)),
                                  ],
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainApp()),
                      );
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}