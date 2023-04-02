import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';

class password_confirm_textfield extends StatelessWidget {
  const password_confirm_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context,state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: -3.0, left: 10),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 5.0,
                ),
                borderRadius:
                BorderRadius.circular(20)),
            labelText: 'Şifre Yeniden',
          ),
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterConfirmPasswordChanged(confirmPassword: value)),
          validator: (value) =>
          state.isValidConfirmPass ? null : "Lütfen şifrenizi yeniden giriniz",
        );
      }
    );
  }
}
