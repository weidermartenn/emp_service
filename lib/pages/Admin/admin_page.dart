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
  late Future<List<dynamic>> futureTableData;
  var tableName = '';
  int? _selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    futureTableData = fetchData(tableName); // Initialize the futureTableData
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Text(
                    "Добро пожаловать в редактор БД",
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: DropdownButton<int>(
                    dropdownColor: Color.fromARGB(255, 11, 11, 11),
                    value: _selectedItemIndex,
                    onChanged: (int? newIndex) {
                      setState(() {
                        _selectedItemIndex = newIndex;
                        switch (_selectedItemIndex) {
                          case 0:
                            tableName = 'accounts';
                            break;
                          case 1:
                            tableName = 'benefit_types';
                            break;
                          case 2:
                            tableName = 'companies';
                            break;
                        }
                        futureTableData = fetchData(tableName); // Update the futureTableData with the new tableName
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem<int>(
                        value: 0,
                        child: Text(
                          'Аккаунты',
                          style: TextStyle(color: Colors.white), // Set the text color to white
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text(
                          'Виды пособий',
                          style: TextStyle(color: Colors.white), // Set the text color to white
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text(
                          'Компании',
                          style: TextStyle(color: Colors.white), // Set the text color to white
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<dynamic>>(
                  future: futureTableData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<dynamic> tableData = snapshot.data!;
                      return DataTable(
                        columns: getTableColumns(tableName),
                        rows: getTableRows(tableName, tableData),
                      );
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainApp()),
                    );
                  },
                  child: Text('Back', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))), // Set the text color to black
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<DataColumn> getTableColumns(String tableName) {
  switch (tableName) {
    case 'accounts':
      return [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Password')),
        DataColumn(label: Text('Username')),
        DataColumn(label: Text('Phone')),
      ];
    case 'benefit_types':
      return [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Amount')),
      ];
    case 'companies':
      return [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Description')),
      ];
    default:
      return [];
  }
}

List<DataRow> getTableRows(String tableName, List<dynamic> tableData) {
  try {
    switch (tableName) {
      case 'accounts':
        return tableData.map((data) {
          if (data is Accounts) {
            Accounts account = data;
            return DataRow(cells: [
              DataCell(Text(account.id.toString())),
              DataCell(Text(account.password)),
              DataCell(Text(account.username)),
              DataCell(Text(account.phone)),
            ]);
          } else {
            throw Exception('Invalid data type for accounts table');
          }
        }).toList();
      case 'benefit_types':
        return tableData.map((data) {
          if (data is BenefitsType) {
            BenefitsType benefitType = data;
            return DataRow(cells: [
              DataCell(Text(benefitType.id)),
              DataCell(Text(benefitType.name)),
              DataCell(Text(benefitType.amount.toString())),
            ]);
          } else {
            throw Exception('Invalid data type for benefit_types table');
          }
        }).toList();
      case 'companies':
        return tableData.map((data) {
          if (data is Companies) {
            Companies company = data;
            return DataRow(cells: [
              DataCell(Text(company.id)),
              DataCell(Text(company.name)),
              DataCell(Text(company.description)),
            ]);
          } else {
            throw Exception('Invalid data type for companies table');
          }
        }).toList();
      default:
        return [];
    }
  } catch (e) {
    print('Error in getTableRows: $e');
    return [];
  }
}