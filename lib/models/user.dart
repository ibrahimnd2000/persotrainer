import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String fullName;

  @HiveField(1)
  final String emailId;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String birthday;

  @HiveField(4)
  final String height;

  @HiveField(5)
  final String weight;

  @HiveField(6)
  final String gender;

  @HiveField(7)
  final String fitnessLevel;

  @HiveField(8)
  final Map<String, dynamic> interests;

  User(
      {this.fullName,
      this.emailId,
      this.phoneNumber,
      this.birthday,
      this.height,
      this.weight,
      this.gender,
      this.fitnessLevel,
      this.interests});

  User.fromSnapshot(Map<String, dynamic> snapshot)
      : fullName = snapshot['fullName'],
        emailId = snapshot['emailId'],
        phoneNumber = snapshot['phoneNumber'],
        birthday = snapshot['birthday'],
        height = snapshot['Height'],
        weight = snapshot['Weight'],
        gender = snapshot['Gender'],
        fitnessLevel = snapshot['fitnessLevel'],
        interests = snapshot['interestOptions'];
}
