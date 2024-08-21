import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = "Some error occurred";

    // Input validation
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      return "Please fill in all the fields.";
    }

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Store user data in Firestore
      await _firestore.collection("users").doc(credential.user!.uid).set({
        "uid": credential.user!.uid,
        "email": email.trim(),
        "name": name.trim(),
        "createdAt": FieldValue.serverTimestamp(), // Store timestamp of creation
      });

      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        res = "The email address is already in use by another account.";
      } else if (e.code == 'invalid-email') {
        res = "The email address is not valid.";
      } else if (e.code == 'weak-password') {
        res = "The password is too weak.";
      } else {
        res = e.message ?? "An undefined error occurred";
      }
    } catch (e) {
      res = "Failed to sign up: ${e.toString()}";
    }
    return res;
  }
}
