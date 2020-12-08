import "package:flutter/material.dart";

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset("assets/images/yama_logo.png", height: 40),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue)
      )
  );
}

TextStyle inputTextStyle(){
  return TextStyle(
    color: Colors.black,
    fontSize: 18
  );
}

TextStyle blueButtonTextStyle(){
  return TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
}