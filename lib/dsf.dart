import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Accounts {
  final String id;
  final String phone;
  final String password;
  final String salt;
  final String username;

  Accounts(this.id, this.phone, this.password, this.salt, this.username);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  late Future<List<Accounts>> futureAccounts;

  @override
  void initState() {
    super.initState();
    futureAccounts = fetchAccounts();
  }

  Future<List<Accounts>> fetchAccounts() async {
    final conn = await Connection.open(
      Endpoint(
        host: 'localhost',
        database: 'employment_service',
        username: 'postgres',
        password: '1234',
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    print('Connected to the database');
    final result = await conn.execute('SELECT * FROM employment_service.accounts');

    List<List<dynamic>> rawData = result.toList();

    List<Accounts> accs = rawData.map((row) => Accounts(row[0], row[1], row[2], row[3], row[4])).toList();

    await conn.close();
    return accs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts Table'),
      ),
      body: FutureBuilder<List<Accounts>>(
        future: futureAccounts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('Password')),
                    DataColumn(label: Text('Salt')),
                    DataColumn(label: Text('Username'))
                  ],
                  rows: snapshot.data!.map((acc) {
                    return DataRow(
                      onSelectChanged: (selected) {
                        if (selected != null && selected) {
                          var rowData = [acc.id, acc.phone, acc.password, acc.salt, acc.username];
                          print(rowData);
                        }
                      },
                      cells: [
                        DataCell(Text(acc.id)),
                        DataCell(Text(acc.phone)),
                        DataCell(Text(acc.password)),
                        DataCell(Text(acc.salt)),
                        DataCell(Text(acc.username)),
                      ],
                    );
                  }).toList(),
                  showBottomBorder: true,
                
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
