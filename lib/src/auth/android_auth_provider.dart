
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth_provider_base.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: 'weathertalks',
      options: FirebaseOptions(
          apiKey: "AIzaSyCQKLWJ_YoV1GY-l12kxN5jfx60SzIMyqc",
          authDomain: "weathertalks-cfd87.firebaseapp.com",
          projectId: "weathertalks-cfd87",
          storageBucket: "weathertalks-cfd87.appspot.com",
          messagingSenderId: "383908787517",
          appId: "1:383908787517:android:062f7c471f9734f7f4c154",
          measurementId: "G-MDW95LS2F9"),
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {}
