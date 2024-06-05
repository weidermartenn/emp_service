import 'package:flutter/material.dart';
import 'user.dart';

class BenefitsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/black/benefit_icon_black.png',
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Пособия',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(),
              Center(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: benefitTypes(),
                  builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Ошибка: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Map<String, dynamic>> benefitList = snapshot.data!;
                      return Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: benefitList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(benefitList[index]['benefit_name']),
                              subtitle: Text(benefitList[index]['benefit_amount'].toString()),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text('Нет доступных данных');
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Закрыть',
                    style: TextStyle(
                      color: Color.fromARGB(184, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/black/benefit_icon_black.png',
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Ваш аккаунт',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(),
              Center(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: benefitTypes(),
                  builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Ошибка: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Map<String, dynamic>> benefitList = snapshot.data!;
                      return Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: benefitList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(benefitList[index]['benefit_name']),
                              subtitle: Text(benefitList[index]['benefit_amount'].toString()),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text('Нет доступных данных');
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

accountDialog(BuildContext context, info){
  showModalBottomSheet( 
    context: context, 
    builder: (BuildContext context) { 
      return Container( 
        width: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 43, 32, 32),
        ),
        child: Column( 
          children: [
            const SizedBox(height: 15),
            Text(info[0]['FIO'], style: TextStyle(color: Colors.white, fontSize: 20)),
            const Divider(color: Colors.white),
            Text('Образование: ${info[0]['grade']}', style: TextStyle(color: Colors.white)),
            Text('Специальность: ${info[0]['spec']}', style: TextStyle(color: Colors.white)),
            const Divider(color: Colors.white),
            Text('Опыт работы', style: TextStyle(color: Colors.white, fontSize: 20)),
            Text(info[0]['skills'], style: TextStyle(color: Colors.white)),                   
          ],
        )
      );
    },
  );
}