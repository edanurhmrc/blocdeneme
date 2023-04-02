import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_event.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';

class uni_name_textfield extends StatelessWidget {
  const uni_name_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context,state) {
        return TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: -3.0, left: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 5.0,
                ),
                borderRadius:
                BorderRadius.circular(20)),
            labelText: 'Üniversite Adı',
          ),
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterUniNameChanged(uniName: value)),
          validator: (value) =>
          state.isValidEmail ? null : "Lütfen okul adını giriniz",
        );

      }
    );
  }
}
