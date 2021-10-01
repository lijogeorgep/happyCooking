import 'package:flutter/material.dart';
import 'package:happy_cooking/Presentation/auth/phoneLogin.dart';
import 'package:happy_cooking/Presentation/userAccount/userAccount.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isLogged=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLogged==false?PhoneLogin():UserAccount(),
    );
  }
}
