import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:Employment_Service/classes/classes.dart';

Future<List<Map<String, dynamic>>> benefitTypes() async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'employment_service',
      username: 'client_user',
      password: '123',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  final result = await conn.execute('SELECT benefit_name, benefit_amount FROM employment_service.benefit_types');

  return result.map((row) {
    return {
      'benefit_name': row[0],
      'benefit_amount': row[1],
    };
  }).toList();
}

Future<List<Map<String, dynamic>>> applicantInfo(user) async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'employment_service',
      username: 'client_user',
      password: '123',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  final result = await conn.execute('''
    select concat(a.last_name, ' ', a.first_name, ' ', a.surname) as FIO,
    gl.level, s.specialization_name, r.skills_description
    from employment_service.specializations s
    inner join employment_service.applicants a on s.specialization_id = a.specialization_id
    inner join employment_service.applicant_educations ae on a.applicant_id = ae.applicant_id
    inner join employment_service.grade_levels gl on ae.grade_level_id = gl.grade_level_id 
    inner join employment_service.resumes r on a.applicant_id = r.applicant_id
    where account_id = (select ac.account_id from employment_service.accounts ac where username = '$user');
  '''
  );

  return result.map((row) {
    return {
      'FIO': row[0],
      'grade': row[1],
      'spec': row[2], 
      'skills': row[3]
    };
  }).toList();
}

Future<int> vacanciesCount() async { 
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'employment_service',
      username: 'client_user',
      password: '123',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  final result = await conn.execute(
    "select employment_service.count_of_active_vacancies();"
  );
  return result[0][0] as int;
}

Future<List<Map<String, dynamic>>> vacancies(parameter) async {
  final _param = parameter.toString();
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'employment_service',
      username: 'client_user',
      password: '123',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );

  final result = await conn.execute(  
    "select * from employment_service.vacancies('$_param')"
  );

  return result.map((row) {
    return {
      'vacancy_name': row[0],
      'vacancy_desc': row[1],
      'salary': row[2], 
      'company_name': row[3], 
      'rating': row[4], 
      'company_desc': row[5], 
      'contact_person': row[6], 
      'phone': row[7]
    };
  }).toList();
}

vacanciesList(vacancies){ 
  return ListView.builder(
    itemCount: vacancies?.length ?? 0,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemBuilder: (context, index) {
      final vacancy = vacancies?[index];
      return ListTile(
        title: Text(
          vacancy?['vacancy_name'],
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 650,
              height: 180,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container( 
                        width: 600, 
                        child: Text(
                          'Описание: ${vacancy?['vacancy_desc']}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                width: 520,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 39, 39, 39),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Text(
                                          vacancy?['company_name'],
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                    Text(
                                          'Рейтинг: ${vacancy?['rating']}',
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                    const Divider(color: Colors.white),
                                    Text(
                                      vacancy?['company_desc'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.white),
                                    ),
                                    const Divider(color: Colors.white),
                                    Text(
                                      'Контактное лицо: ${vacancy?['contact_person']}',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      'Телефон: ${vacancy?['phone']}',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            vacancy?['company_name'],
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Text(
                        'Рейтинг: ${vacancy?['rating']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${vacancy?['salary']} руб.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

