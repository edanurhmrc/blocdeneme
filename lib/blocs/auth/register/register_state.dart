import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';

import '../../../repository/auth/form_submission_status.dart';

class RegisterState extends Equatable {

  final String nickname;
  bool get isValidNickname => nickname.length > 8;

  final String nameLastname;
  bool get isValidName => nameLastname.length > 15;

  final String uniName;
  bool get isValidUniName => uniName.length > 30;

  final String schoolNum;
  bool get isValidSchoolNum => schoolNum.length == 11;


    final String email;
  bool get isValidEmail => email.length >= 26;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String confirmPassword;
  bool get isValidConfirmPass => confirmPassword == password;

    final FormSubmissionStatus formStatus;

  const RegisterState({
    this.nickname="",
    this.nameLastname="",
    this.uniName="",
    this.schoolNum="",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.formStatus = const InitialFormStatus(),
});

   RegisterState copyWith({
     String? nickname,
     String? nameLastname,
     String? uniName,
     String? schoolNum,
     String? email,
     String? password,
     String? confirmPassword,
     FormSubmissionStatus? formStatus,
   }) {
     return RegisterState(
       nickname: nickname ?? this.nickname,
       nameLastname: nameLastname ?? this.nameLastname,
       uniName: uniName ?? this.uniName,
       schoolNum: schoolNum ?? this.schoolNum,
       email: email ?? this.email,
       password: password ?? this.password,
       confirmPassword: confirmPassword ?? this.confirmPassword,
       formStatus: formStatus ?? this.formStatus,
     );
   }

  @override
  List<Object?> get props => [nickname,nameLastname,uniName,schoolNum,email,password,confirmPassword,formStatus];

}