import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/authstate.dart';
// import 'package:flutter_application_5/pages/homepage.dart';
import 'package:flutter_application_5/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_5/firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  return runApp(MianApp());
  
}

class MianApp extends StatelessWidget {
  const MianApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
     theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: AuthState(),
 
    );
  }
}