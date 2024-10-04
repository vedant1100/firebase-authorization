import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser; // firebase user class to create and perform operations related to user
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges(); 
  // Stream of users where users serves as objects. authStateChanges is a firebase_auth function which Notifies about
  // changes to the user's sign-in state (such as sign-in or sign-out).
  // Its basically a stream of state changes for login/signup.
  Future <void> signInWithEmailAndPassword({ required dynamic email, required dynamic password}) async{
    await _firebaseAuth.signInWithEmailAndPassword(
      email:email,
      password:password,
    );
  }

  Future <void> createUserWithEmailAndPassword({ required dynamic email, required dynamic password}) async{
    await _firebaseAuth.createUserWithEmailAndPassword(
      email:email,
      password:password,
    );
  }

  Future <void> signOut() async{
    await _firebaseAuth.signOut();
  }
}