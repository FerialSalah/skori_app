import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login()=>_googleSignIn.signIn();
  static Future<GoogleSignInAccount?> signOut()=>_googleSignIn.signOut();
  // static Future<GoogleSignInAuthentication?> getToken()=> _googleSignIn.();
}