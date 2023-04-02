import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterNicknameChanged extends RegisterEvent{
  final String? nickname;

  RegisterNicknameChanged({this.nickname});

  @override
  List<Object?> get props => [nickname];
}

class RegisterNameLastnameChanged extends RegisterEvent{
  final String? nameLastname;

  RegisterNameLastnameChanged({this.nameLastname});

  @override
  List<Object?> get props => [nameLastname];
}

class RegisterUniNameChanged extends RegisterEvent{
  final String? uniName;

  RegisterUniNameChanged({this.uniName});

  @override
  List<Object?> get props => [uniName];
}

class RegisterSchoolNumChanged extends RegisterEvent{
  final String? schoolNumber;

  RegisterSchoolNumChanged({this.schoolNumber});

  @override
  List<Object?> get props => [schoolNumber];
}


class RegisterEmailChanged extends RegisterEvent {
   final String? email;

  RegisterEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String? password;

  RegisterPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}


class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String? confirmPassword;

  RegisterConfirmPasswordChanged({this.confirmPassword});

  @override
  List<Object?> get props => [confirmPassword];
}


class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}