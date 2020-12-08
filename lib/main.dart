import 'package:flutter/material.dart';
import 'package:yama/views/signUp.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          //return SomethingWentWrong();
          //print("error initializing firebase");
        }

        if(snapshot.connectionState == ConnectionState.done) {
          //print("successful connection");
        }

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xff145C9E),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: SignUp(),
          );
        //return Loading();
      }
    );

  }
}