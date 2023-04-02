import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';
import 'package:blocdeneme/repository/auth/register/register_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository? registerRepo;

  RegisterBloc({this.registerRepo}) : super(RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    ///nickname updated
    if (event is RegisterNicknameChanged) {
      emit(state.copyWith(nickname: event.nickname));

      ///username updated
    } else if (event is RegisterNameLastnameChanged) {
      emit(state.copyWith(nameLastname: event.nameLastname));

      ///uni name  updated
    } else if (event is RegisterUniNameChanged) {
      emit(state.copyWith(uniName: event.uniName));

      ///school number updated
    } else if (event is RegisterSchoolNumChanged) {
      emit(state.copyWith(schoolNum: event.schoolNumber));

      ///email updated
    } else if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));

      ///pasword updated
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));

      ///password confirm updated
    } else if (event is RegisterConfirmPasswordChanged) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));

      ///Form submitted
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await registerRepo?.register();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
