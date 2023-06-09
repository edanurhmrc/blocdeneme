import 'package:blocdeneme/blocs/auth/login/login_event.dart';
import 'package:blocdeneme/blocs/auth/login/login_state.dart';
import 'package:blocdeneme/repository/auth/login/login_repository.dart';
import 'package:blocdeneme/blocs/auth/login/login_event.dart';
import 'package:blocdeneme/blocs/auth/login/login_state.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';
import 'package:blocdeneme/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    /// Email updated
    if (event is LoginEmailChanged) {
      emit(state.copyWith(email: event.email));

      /// Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      /// Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}

