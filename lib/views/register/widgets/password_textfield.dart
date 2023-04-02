import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';

class password_textfield extends StatelessWidget {
  const password_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context,state) {
        return TextFormField(
            obscureText: true,
            decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: -3.0, left: 10),
        border: OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.black,
        width: 5.0,
        ),
        borderRadius:
        BorderRadius.circular(20)),
        labelText: 'Şifre',
        ),
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterPasswordChanged(password: value)),
          validator: (value) =>
          state.isValidPassword ? null : "Lütfen şifrenizi giriniz",
        );
      }
    );
  }
}
