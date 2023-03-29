import 'package:blocdeneme/Register.dart';
import 'package:blocdeneme/main.dart';
import 'package:blocdeneme/resetPassword.dart';
import 'package:blocdeneme/views/login/widgets/email_textfield.dart';
import 'package:blocdeneme/views/login/widgets/login_button.dart';
import 'package:blocdeneme/views/login/widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/chat.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.40,
          blur: 10,
          borderRadius: 20,
          border: 2,
          alignment: Alignment.center,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
              ],
              stops: [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("Giriş Yap",style: TextStyle(fontSize: 30,color: Colors.indigo),),
              ),

              email_textfield(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              password_textfield(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              login_button(),
            ],
          ),
        ),
      ),
    );
  }
}
