import 'package:postgres/postgres.dart';

Future<String> Registry(user, phone, pass, rep_pas) async {
  final _user = user.toString();
  final _phone = phone.toString();
  final _pass = pass.toString();
  final _rep_pas = rep_pas.toString();
  final conn = await Connection.open( 
    Endpoint( 
      host: 'localhost',
      database: 'employment_service',
      username: 'postgres',
      password: '1234'
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable)
  );

  final result = await conn.execute(
    "select * from employment_service.check_reg_correct('$_user', '$_phone', '$_pass', '$_rep_pas')"
  );
  return result[0][0].toString();

}

void main() async{
  print(await Registry('user45', 'test', 'pass', 'test'));
}