// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// // Initialize Firebase
// void initializeFirebase() async {
//   await Firebase.initializeApp();
// }
//
// // Sign in with email and password
// Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email,
//     password: password,
//   );
//   return userCredential;
// }
//
// // Sign out
// Future<void> signOut() async {
//   await FirebaseAuth.instance.signOut();
// }
//
// // Check current user
// User? getCurrentUser() {
//   User? user = FirebaseAuth.instance.currentUser;
//   return user;
// }
//
// // Example usage
// void main() async {
//
//
//   UserCredential userCredential = await signInWithEmailAndPassword("example@example.com", "password");
//   print("Signed in user: ${userCredential.user?.email}");
//
//   User? currentUser = getCurrentUser();
//   if (currentUser != null) {
//     print("Current user: ${currentUser.email}");
//   } else {
//     print("No user is currently signed in.");
//   }
//
//   await signOut();
//   print("User signed out.");
// }
//
//
//
//
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class AuthService {
// //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //
// //   // Future and stream that will be used to check the login status of the user.
// //   User? get getUser => _firebaseAuth.currentUser;
// //   Stream<User?> get user => _firebaseAuth.authStateChanges();
// //
// //   // Get email.
// //   Future<String?> getEmail() async {
// //     try {
// //       User? currentUser = await _firebaseAuth.currentUser;
// //       currentUser!.reload;
// //       currentUser = await _firebaseAuth.currentUser;
// //       return currentUser!.email;
// //     } catch (error) {
// //       return error.toString();
// //     }
// //   }
// //
// //   // Get current username.
// //   Future<String?> getUsername() async {
// //     String? email = await this.getEmail();
// //     try {
// //       var document = await _firestore.doc('users/$email').get();
// //       return document['username'];
// //     } catch (error) {
// //       return error.toString();
// //     }
// //   }
// //
// //   // SignUp.
// //   Future<String> createUserWithEmailAndPassword(
// //       String email, String password, String name) async {
// //     try {
// //       await _firebaseAuth.createUserWithEmailAndPassword(
// //           email: email, password: password);
// //       User? currentUser = await _firebaseAuth.currentUser;
// //       await currentUser?.reload;
// //       await currentUser?.sendEmailVerification();
// //       // update username
// //       // var userUpdateInfo = UserUpdateInfo();
// //       // userUpdateInfo.displayName = name;
// //       // await currentUser.updateProfile(userUpdateInfo);
// //     }
// //     catch (e) {
// //       User? currentUser = await _firebaseAuth.currentUser;
// //       await currentUser!.reload();
// //       await currentUser.sendEmailVerification();
// //       // kShowFlushBar(
// //       //     content: 'Verification code sent again.', customError: true);
// //     }
// //     return '';
// //   }
// //
// //   // SignIn.
// //   Future<String?> signInWithEmailAndPassword(
// //       String email, String password) async {
// //     try {
// //       await _firebaseAuth.signInWithEmailAndPassword(
// //           email: email, password: password);
// //       User? currentUser = await _firebaseAuth.currentUser;
// //       currentUser!.reload();
// //       currentUser = await _firebaseAuth.currentUser;
// //       // if (currentUser?.IsEmailVerified) {
// //       //   return currentUser?.uid;
// //       // }
// //       return null;
// //     } catch (e) {}
// //   }
// //
// //   // Reset Password.
// //   Future<void> resetPassword(String email) async {
// //     await _firebaseAuth.sendPasswordResetEmail(email: email);
// //   }
// //
// //   // SignOut.
// //   Future<void> signOut() {
// //     return _firebaseAuth.signOut();
// //   }
// // }