 import 'package:postgres/postgres.dart';
import 'package:Employment_Service/classes/classes.dart';

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

    final result = await conn.execute('SELECT * FROM employment_service.accounts');

    List<List<dynamic>> rawData = result.toList();

    List<Accounts> accs = rawData.map((row) => Accounts(row[0], row[1], row[2], row[3], row[4])).toList();

    await conn.close();
    return accs;
  }