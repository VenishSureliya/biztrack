import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emailAddress;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  factory UserData.fromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      phoneNumber: snapshot['phoneNumber'],
      emailAddress: snapshot['email'],
    );
  }
}
