import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/firebase_options.dart';
import 'package:firebaseapp/screens/authentication_screen.dart';
import 'package:firebaseapp/screens/forget_password.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme:const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),
      initialRoute: AuthenticationScreen.routName,
      routes: {
        AuthenticationScreen.routName: (context) =>
            const AuthenticationScreen(),
        ForgetPasswordScreen.routeName:(context)=>const ForgetPasswordScreen(),
      },
    );
  }
}
