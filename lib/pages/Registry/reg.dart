import 'package:postgres/postgres.dart';

Registry(user, phone, pass, rep_pas) async {
  final conn = await Connection.open( 
    Endpoint( 
      host: 'localhost',
      database: 'employment_service',
      username: 'postgres',
      password: '1234'
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable)
  );

  final result = await conn.execute();

}