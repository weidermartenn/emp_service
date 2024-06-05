import 'package:postgres/postgres.dart';

void main() async{
  final conn = await Connection.open(
    Endpoint( 
      host: 'localhost',
      database: 'employment_service',
      username: 'postgres',
      password: '1234'
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable)
  );

  final result = await conn.execute('select b.benefit_name, b.benefit_amount from employment_service.benefit_types b;');

  print(result);
}