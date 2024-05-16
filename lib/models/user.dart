import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  late final String _firstName;
  late final String _lastName;
  late final String _emailAddress;
  late final String _profession;
  late final String _age;
  late final String _phoneNumber;
  late final String _address;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get profession => _profession;
  String get age => _age;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get emailAddress => _emailAddress;

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setProfession(String profession) {
    _profession = profession;
    notifyListeners();
  }

  void setAge(String age) {
    _age = age;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setEmailAddress(String emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }
}