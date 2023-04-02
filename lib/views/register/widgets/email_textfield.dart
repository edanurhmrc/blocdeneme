import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';

class email_textfield extends StatelessWidget {
  const email_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state){
        return TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: -3.0, left: 10),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 5.0,
                ),
                borderRadius:
                BorderRadius.circular(20)),
            labelText: 'E-mail',
          ),
            /*validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen e-posta adresinizi giriniz';
              }
              return null;
            }*/
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterEmailChanged(email: value)),
          validator: (value) =>
          state.isValidEmail ? null : "Lütfen e-posta giriniz",
        );
      }
    );
  }
}
