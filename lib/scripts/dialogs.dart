import 'package:flutter/material.dart';

// Диалог сообщения о пустой форме
emptyInputDialog(BuildContext dialogContext){ 
  Widget okButton = TextButton( 
    onPressed: () {
      Navigator.of(dialogContext, rootNavigator: true).pop();
    },
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
    ), 
    child: const Text( 
      'ОК',
      style: TextStyle(
        color: Color.fromARGB(184, 0, 0, 0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  AlertDialog alert = AlertDialog( 
    title: Image.asset( 
      'assets/icons/black/incorrect_icon_black.png',
      width: 40,
      height: 40,
    ),
    content: const Text( 
      'Пожалуйста, заполните форму.',
      style: TextStyle( 
        fontSize: 16,
      )
    ), 
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      okButton,
    ],
  );
  showDialog( 
    context: dialogContext,
    builder: (BuildContext context){ 
      return alert;
    },
  );
}

// Диалог об успешном входе
successDialog(BuildContext dialogContext){
  Widget okButton = TextButton( 
    onPressed: () {
      Navigator.of(dialogContext, rootNavigator: true).pop();
    },
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )
    ), 
    child: const Text( 
      'ОК',
      style: TextStyle(
        color: Color.fromARGB(184, 0, 0, 0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  AlertDialog alert = AlertDialog( 
    title: Image.asset( 
      'assets/icons/black/success_icon_black.png',
      width: 40,
      height: 40,
    ),
    content: const Text( 
      'Вы успешно вошли в систему.',
      style: TextStyle( 
        fontSize: 16,
      )
    ), 
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      okButton,
    ],
  );
  showDialog( 
    context: dialogContext,
    builder: (BuildContext context){ 
      return alert;
    },
  );
}