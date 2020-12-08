import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yama/services/auth.dart';
import 'package:yama/widgets/widget.dart';
import 'package:yama/extensions/extensions.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();
  TextEditingController passwordMatchTextEditingController = new TextEditingController();

  signUp(){
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, 
          passwordTextEditingController.text).then((value){
            print("$value");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),)
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children:[
                      // TextFormField(
                      //   validator: (val){
                      //     return val.isEmpty || val.length < 4 || val.length > 20 ? "Username must be 4 to 20 characters long" : null;
                      //   },
                      //   controller: userNameTextEditingController,
                      //   style: inputTextStyle(),
                      //   decoration: textFieldInputDecoration("user name")
                      // ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val){
                          return val.isValidEmail() ? null : "Please enter a valid email";
                        },
                        controller: emailTextEditingController,
                        style: inputTextStyle(),
                        decoration: textFieldInputDecoration("email")
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        validator: (val){
                          return val.isEmpty || val.length < 6 || val.length > 20 ? "Password must be 6 to 20 characters long" : null;
                        },
                        controller: passwordTextEditingController,
                        style: inputTextStyle(),
                        decoration: textFieldInputDecoration("password")
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        validator: (val){
                          return val != passwordTextEditingController.text ? "Passwords do not match" : null;
                        },
                        controller: passwordMatchTextEditingController,
                        style: inputTextStyle(),
                        decoration: textFieldInputDecoration("confirm password")
                      ),
                    ]
                  ),
                ),
                
                // SizedBox(height: 16),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     child: Text("Forgot Password", style: inputTextStyle(),)
                //   )
                // ),
                SizedBox(height: 32),
                GestureDetector(
                  onTap: (){
                    signUp();
                  },
                  child: Container(
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
                  child: Text("Sign Up", style: blueButtonTextStyle())
                ),
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
                  child: Text("Sign Up with Google", style: blueButtonTextStyle())
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: inputTextStyle(),),
                    Text("Sign in now", style: TextStyle(
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