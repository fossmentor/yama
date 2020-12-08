import 'package:firebase_auth/firebase_auth.dart';
import 'package:yama/models/yamaUser.dart';

class AuthMethods {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  YamaUser _user(User user) {
    return user != null ? YamaUser(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      var user = result.user; 
      return _user(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      var user = result.user; 
      return _user(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPassword(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);

    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();      
    }catch(e){
      print(e.toString());
    }
  }
}