import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Optionally, you can update the user's profile with the name
      await userCredential.user!.updateProfile(displayName: name);
      // Send verification email
      await userCredential.user!.sendEmailVerification();
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return "An unexpected error occurred";
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Check if email is verified
      if (userCredential.user!.emailVerified) {
        return "success";
      } else {
        return "Email not verified. Please check your email for the verification link.";
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return "An unexpected error occurred";
    }
  }

// Add other auth related methods as needed
}
