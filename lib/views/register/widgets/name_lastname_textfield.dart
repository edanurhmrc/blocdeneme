import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';

class name_lastname_textfield extends StatelessWidget {
  const name_lastname_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc,RegisterState>(
      builder: (context,state) {
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
            labelText: 'Ad-Soyad',
          ),

          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterNameLastnameChanged(nameLastname: value)),
          validator: (value) =>
          state.isValidName ? null : "Lütfen ad soyad giriniz",

          /*validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen ad soyad giriniz';
              }
              return null;
            }*/
        );
      }
    );
  }
}
