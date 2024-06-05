 import 'package:postgres/postgres.dart';
import 'package:Employment_Service/classes/classes.dart';

 Future<List<dynamic>> fetchData(String table) async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'employment_service',
      username: 'postgres',
      password: '1234',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );

  late Result result;

  switch (table) {
    case 'accounts':
      result = await conn.execute(
        '''
        select a.account_id, md5(a.password || a.salt), a.username, a.phone_number
        from employment_service.accounts a;
      ''',
      );
      break;
    case 'benefit_types':
      result = await conn.execute(
        '''
        select bt.benefit_type_id, bt.benefit_name, bt.benefit_amount 
        from employment_service.benefit_types bt;
      ''',
      );
      break;
    case 'companies':
      result = await conn.execute(
        '''
        select c.company_id, c.company_name, c.company_description 
        from employment_service.companies c;
      ''',
      );
      break;
  }

  List<List<dynamic>> rawData = result.toList();

  await conn.close();
  return rawData;
}