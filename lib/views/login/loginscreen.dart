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


        child: LayoutBuilder(builder: (context, constraints) {
          final maxheight = constraints.maxHeight * 0.2;
          final maxwidth = constraints.maxWidth * 0.81;
          final margintop = constraints.maxHeight * 0.05;
          final margintop2 = margintop / 2;
          return Center(
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
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: LayoutBuilder(
                  builder: (context,cons) {
                    final maxheight = cons.maxHeight * 0.2;
                    final maxwidth = cons.maxWidth * 0.81;
                    final margintop = cons.maxHeight * 0.05;
                    final margintop2 = margintop / 2;
                    return Column(
                      children: [
                        Flexible(
                          flex: 10,
                          child: Container(
                            margin: EdgeInsets.only(bottom: margintop2),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 9,
                            child: Container(
                                margin: EdgeInsets.only(top: margintop),
                                height: maxheight,
                                width: maxwidth,
                                child: email_textfield()
                            )),
                        Flexible(
                            flex: 9,
                            child: Container(
                                margin: EdgeInsets.only(top: margintop),
                                height: maxheight,
                                width: maxwidth,
                                child: password_textfield())),

                        Flexible(
                          flex: 9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: margintop2,
                                      bottom: margintop2),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    resetPassword()));
                                      },
                                      child: Text("Şifreni mi unuttun?", style: TextStyle(color: Colors.indigo),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 10,
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: margintop2, bottom: margintop2),
                                child: login_button())),
                        Flexible(
                          flex: 6,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Register()));
                              },
                              child: Text(
                                "Üye değil misiniz?",
                                style: TextStyle(color: Colors.indigo),
                              )),
                        )
                      ],
                    );
                  }
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}
