import 'package:flutter/material.dart';
import 'package:Employment_Service/pages/Admin/admin.dart';

class Accounts {
  final String id;
  final String password;
  final String username;
  final String phone;

  Accounts(this.id, this.password, this.username, this.phone);

  getName() {
    return username;
  }
}

class BenefitsType {
  final String id;
  final String name;
  final String amount;

  BenefitsType(this.id, this.name, this.amount);
}

class Companies {
  final String id;
  final String name;
  final String description;

  Companies(this.id, this.name, this.description);
}

