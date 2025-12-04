import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/interna.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  cadUser({
    required String email,
    required String senha,
    required String nome,
  }) async{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
    await userCredential.user!.updateDisplayName(nome);
  }
  loginUser({
    required String email,
    required String senha,
    }) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
      return null;
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
  logout() async{
    return _firebaseAuth.signOut();
  }
}
