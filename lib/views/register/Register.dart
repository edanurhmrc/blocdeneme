import 'package:blocdeneme/views/login/loginscreen.dart';
import 'package:blocdeneme/views/register/widgets/uniName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';
import 'package:blocdeneme/repository/auth/register/register_repository.dart';
import 'package:blocdeneme/views/register/widgets/email_textfield.dart';
import 'package:blocdeneme/views/register/widgets/password_textfield.dart';
import 'package:blocdeneme/views/register/widgets/name_lastname_textfield.dart';
import 'package:blocdeneme/views/register/widgets/nickname_textfield.dart';
import 'package:blocdeneme/views/register/widgets/password_confirm_textfield.dart';
import 'package:blocdeneme/views/register/widgets/register_button.dart';
import 'package:blocdeneme/views/register/widgets/school_num_textfield.dart';
import 'package:blocdeneme/views/register/widgets/uni_name_textfield.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) =>
                RegisterBloc(registerRepo: RegisterRepository()),
            child: BlocListener<RegisterBloc, RegisterState>(
              listenWhen: (previous, current) =>
                  previous.formStatus != current.formStatus,
              listener: (context, state) {
                final formStatus = state.formStatus;

                if (formStatus is SubmissionFailed) {
                  _showSnackBar(context, formStatus.exception.toString());
                }
                if (formStatus is SubmissionSuccess) {
                  _goToLogin(context);
                }
              },
              child: Form(
                key: _formKey,
                child: Center(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/chat.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: LayoutBuilder(builder: (context, constraints) {
                        if (MediaQuery.of(context).size.height <= 750 &&
                            MediaQuery.of(context).size.height > 650) {
                          return Center(
                            child: GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.70,
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
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child:
                                      LayoutBuilder(builder: (context, cons) {
                                    final maxheight = cons.maxHeight * 0.2;
                                    final maxwidth = cons.maxWidth * 0.81;
                                    final margintop = cons.maxHeight * 0.038;
                                    final margintop2 = margintop / 2;
                                    return Column(
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            "Kayıt Ol",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                                height: maxheight,
                                                width: maxwidth,
                                                child: nickname_textfield()),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: name_lastname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: uni_name_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: school_num_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: email_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: password_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child:
                                                  password_confirm_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 10,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: margintop,
                                                bottom: margintop2),
                                            child: register_button(formKey: _formKey),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            login_screen()));
                                              },
                                              child: Text(
                                                "Zaten üye misiniz ?",
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              )),
                                        )
                                      ],
                                    );
                                  })),
                            ),
                          );
                        }
                        if (MediaQuery.of(context).size.height <= 650 &&
                            MediaQuery.of(context).size.height > 600) {
                          return Center(
                            child: GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.80,
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
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child:
                                      LayoutBuilder(builder: (context, cons) {
                                    final maxheight = cons.maxHeight * 0.2;
                                    final maxwidth = cons.maxWidth * 0.81;
                                    final margintop = cons.maxHeight * 0.038;
                                    final margintop2 = margintop / 2;
                                    return Column(
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            "Kayıt Ol",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: nickname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: name_lastname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: uni_name_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: school_num_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: email_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: password_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child:
                                                  password_confirm_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 10,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: margintop,
                                                bottom: margintop2),
                                            child: register_button(formKey: _formKey),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            login_screen()));
                                              },
                                              child: Text(
                                                "Zaten üye misiniz ?",
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              )),
                                        )
                                      ],
                                    );
                                  })),
                            ),
                          );
                        }
                        if (MediaQuery.of(context).size.height <= 600 &&
                            MediaQuery.of(context).size.height > 525) {
                          return Center(
                            child: GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.90,
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
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child:
                                      LayoutBuilder(builder: (context, cons) {
                                    final maxheight = cons.maxHeight * 0.2;
                                    final maxwidth = cons.maxWidth * 0.81;
                                    final margintop = cons.maxHeight * 0.038;
                                    final margintop2 = margintop / 2;
                                    return Column(
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            "Kayıt Ol",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: nickname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: name_lastname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: uni_name_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: school_num_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: email_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: password_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child:
                                                  password_confirm_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 10,
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: margintop,
                                                  bottom: margintop2),
                                              child: register_button(formKey: _formKey),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            login_screen()));
                                              },
                                              child: Text(
                                                "Zaten üye misiniz ?",
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              )),
                                        )
                                      ],
                                    );
                                  })),
                            ),
                          );
                        }
                        if (MediaQuery.of(context).size.height <= 525) {
                          return Center(
                            child: GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.98,
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
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child:
                                      LayoutBuilder(builder: (context, cons) {
                                    final maxheight = cons.maxHeight * 0.2;
                                    final maxwidth = cons.maxWidth * 0.81;
                                    final margintop = cons.maxHeight * 0.038;
                                    final margintop2 = margintop / 2;
                                    return Column(
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            "Kayıt Ol",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: nickname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: name_lastname_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              height: maxheight,
                                              width: maxwidth,
                                              child: uni_name_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: school_num_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: email_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child: password_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(top: margintop),
                                            child: SizedBox(
                                              width: maxwidth,
                                              height: maxheight,
                                              child:
                                                  password_confirm_textfield(),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 10,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: margintop,
                                                bottom: margintop2),
                                            child: register_button(formKey: _formKey),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            login_screen()));
                                              },
                                              child: Text(
                                                "Zaten üye misiniz ?",
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              )),
                                        )
                                      ],
                                    );
                                  })),
                            ),
                          );
                        }
                        return Center(
                          child: GlassmorphicContainer(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.65,
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
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: LayoutBuilder(builder: (context, cons) {
                                  final maxheight = cons.maxHeight * 0.2;
                                  final maxwidth = cons.maxWidth * 0.81;
                                  final margintop = cons.maxHeight * 0.038;
                                  final margintop2 = margintop / 2;
                                  return Column(
                                    children: [
                                      Flexible(
                                        flex: 10,
                                        child: Text(
                                          "Kayıt Ol",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            height: maxheight,
                                            width: maxwidth,
                                            child: nickname_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            height: maxheight,
                                            width: maxwidth,
                                            child: name_lastname_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                          border: Border.all(width: 1.0,
                                              color: Colors.black38),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            height: maxheight,
                                            width: maxwidth,
                                            child: uniName(),
                                          ),
                                        ),
                                  ),

                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            width: maxwidth,
                                            height: maxheight,
                                            child: school_num_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            width: maxwidth,
                                            height: maxheight,
                                            child: email_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            width: maxwidth,
                                            height: maxheight,
                                            child: password_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 9,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: margintop),
                                          child: SizedBox(
                                            width: maxwidth,
                                            height: maxheight,
                                            child: password_confirm_textfield(),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 10,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: margintop,
                                              bottom: margintop2),
                                          child: register_button(formKey: _formKey),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          login_screen()));
                                            },
                                            child: Text(
                                              "Zaten üye misiniz ?",
                                              style: TextStyle(
                                                  color: Colors.indigo),
                                            )),
                                      )
                                    ],
                                  );
                                })),
                          ),
                        );
                      })),
                ),
              ),
            )));
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => login_screen()), (route) => false);
  }
}
