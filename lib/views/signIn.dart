import "package:flutter/material.dart";
import 'package:yama/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: inputTextStyle(),
                  decoration: textFieldInputDecoration("email")
                ),
                TextField(
                  style: inputTextStyle(),
                  decoration: textFieldInputDecoration("password")
                ),
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Forgot Password", style: inputTextStyle(),)
                  )
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign In", style: blueButtonTextStyle())
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign In with Google", style: blueButtonTextStyle())
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: inputTextStyle(),),
                    Text("Register now", style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline
                    ),)
                  ],
                ),
                //SizedBox(height: 50),
              ],
            )
          ),
        )
      ) 
    );
  }
}