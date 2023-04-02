import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';
import 'package:blocdeneme/repository/auth/form_submission_status.dart';

class register_button extends StatelessWidget {
  const register_button({Key? key, required this.formKey}) : super(key: key);
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const Center(child: CircularProgressIndicator())
          : OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.indigo,
                      width: 1.0,
                      style: BorderStyle.solid))),
              child: const Text(
                "Kayıt Ol",
                style: TextStyle(color: Colors.indigo),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<RegisterBloc>().add(RegisterSubmitted());
                }
                /*Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));*/
              },
            );
    });
  }
}
