import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farms/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreServices {
  final CollectionReference user =
      FirebaseFirestore.instance.collection("User");

  // create user
  final CollectionReference users = FirebaseFirestore.instance.collection("users");

Future<void> addUser(String firstName, String lastName, String email, String password) async {
  try {
    // Create user in Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Get the current user UID
    String uid = "${userCredential.user!.email}";

    // Add user data to Firestore
    await users.doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    });
  } catch (error) {
    // Handle error
    print('Error creating user: $error');
    throw error;
  }
}


  //get user

  // update user

  final CollectionReference farm =
      FirebaseFirestore.instance.collection('Farm');

  // create farm

  //get farm

  // update farm

  //delete farm

  final CollectionReference harvest =
      FirebaseFirestore.instance.collection('Harvest');

  // create Harvest

  //get Harvest

  // update Harvest

  //delete Harvest

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Notes');

  // create Notes

  //get Notes

  // update Notes

  //delete Notes

  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('Jobs');

  // create Jobs

  //get Jobs

  // update Jobs

  //delete Jobs
}
