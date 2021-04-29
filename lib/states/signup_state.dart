import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:persotrainer/models/user.dart';
import 'package:provider/provider.dart';

import '../services/database_service.dart';
import '../services/database_service.dart';

class SignUpState with ChangeNotifier {
  bool showSignUp = true;
  final TextEditingController fullNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPassTextEditingController =
      TextEditingController();
  final birthdayTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final heightTextController = TextEditingController();
  String phoneNumber = '';
  Map<String, bool> interestOptions = {
    'BOXING': false,
    'BODY WEIGHT': false,
    'YOGA': false,
    'FITNESS': false,
    'GYM': false,
  };
  Map<String, dynamic> fitnessLevelOptions = {
    'Beginer': [true, 'You\'re new to fitness training'],
    'Intermediate': [false, 'You have been training regularly'],
    'Advanced': [false, 'You\'re fit and ready for an intensive workout plan'],
  };
  Map<String, bool> genderOptions = {
    'Male': true,
    'Female': false,
  };

  selectOptions(String key) {
    if (interestOptions[key]) {
      interestOptions[key] = false;
    } else {
      interestOptions[key] = true;
    }
    notifyListeners();
  }

  switchLogin() {
    showSignUp = !showSignUp;
    notifyListeners();
  }

  selectFitness(String key) {
    if (key == 'Beginer') {
      fitnessLevelOptions['Beginer'][0] = true;
      fitnessLevelOptions['Intermediate'][0] = false;
      fitnessLevelOptions['Advanced'][0] = false;
    } else if (key == 'Intermediate') {
      fitnessLevelOptions['Beginer'][0] = false;
      fitnessLevelOptions['Intermediate'][0] = true;
      fitnessLevelOptions['Advanced'][0] = false;
    } else if (key == 'Advanced') {
      fitnessLevelOptions['Beginer'][0] = false;
      fitnessLevelOptions['Intermediate'][0] = false;
      fitnessLevelOptions['Advanced'][0] = true;
    }
    notifyListeners();
  }

  selectGender(String key) {
    if (key == 'Male') {
      genderOptions['Male'] = true;
      genderOptions['Female'] = false;
    } else {
      genderOptions['Male'] = false;
      genderOptions['Female'] = true;
    }
    notifyListeners();
  }

  uploadUser(BuildContext context) {
    DatabaseService databaseService =
        DatabaseService(FirebaseFirestore.instance);
    String fitnessLevel = fitnessLevelOptions.keys.firstWhere(
        (key) => fitnessLevelOptions[key][0] == true,
        orElse: () => null);
    String gender = genderOptions.keys
        .firstWhere((key) => genderOptions[key] == true, orElse: () => null);
    Map<String, dynamic> user = {
      'fullName': fullNameTextEditingController.text,
      'emailId': emailTextEditingController.text,
      'phoneNumber': phoneNumber,
      'interestOptions': interestOptions,
      'fitnessLevel': fitnessLevel,
      'birthday': birthdayTextController.text,
      'Weight': weightTextController.text,
      'Height': heightTextController.text,
      'Gender': gender,
    };
    defaultFields();
    databaseService.addUser(user);
  }

  defaultFields() {
    fullNameTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    confirmPassTextEditingController.clear();
    phoneNumber = '';
    birthdayTextController.clear();
    weightTextController.clear();
    heightTextController.clear();
    interestOptions = {
      'BOXING': false,
      'BODY WEIGHT': false,
      'YOGA': false,
      'FITNESS': false,
      'GYM': false,
    };
    fitnessLevelOptions = {
      'Beginer': [true, 'You\'re new to fitness training'],
      'Intermediate': [false, 'You have been training regularly'],
      'Advanced': [
        false,
        'You\'re fit and ready for an intensive workout plan'
      ],
    };
    genderOptions = {
      'Male': true,
      'Female': false,
    };
    notifyListeners();
  }
}
