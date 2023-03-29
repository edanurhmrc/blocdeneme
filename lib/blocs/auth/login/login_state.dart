import 'package:equatable/equatable.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';

class LoginState extends Equatable {
   final String email;
  bool get isValidEmail => email.length > 15;

   final String password;
  bool get isValidPassword => password.length > 6;

   final FormSubmissionStatus formStatus;

  const LoginState({
    this.email = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
});

   LoginState copyWith({
     String? email,
     String? password,
     FormSubmissionStatus? formStatus,
   }) {
     return LoginState(
       email: email ?? this.email,
       password: password ?? this.password,
       formStatus: formStatus ?? this.formStatus,
     );
   }

  @override
  List<Object?> get props => [email,password,formStatus];



}