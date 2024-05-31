import 'package:postgres/legacy.dart';
import 'package:postgres/postgres.dart';

Future<String> isAuth(data, pass) async {
  final _data = data.toString();
  final _pass = pass.toString();
  final conn = await Connection.open( 
    Endpoint( 
      host: 'localhost',
      database: 'employment_service',
      username: 'postgres',
      password: '1234'
    ),
    settings: const ConnectionSettings(sslMode: SslMode.disable)
  );
  final result = await conn.execute(
    "SELECT * FROM employment_service.check_auth_correct('$_data', '$_pass')",
  );
  return result[0][0].toString();
}
