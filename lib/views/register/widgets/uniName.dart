import 'package:blocdeneme/blocs/auth/register/register_bloc.dart';
import 'package:blocdeneme/blocs/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class uniName extends StatefulWidget {
  const uniName({Key? key}) : super(key: key);

  @override
  State<uniName> createState() => _uniNameState();
}

class _uniNameState extends State<uniName> {
  String? selectedUniversity ;

  @override
  Widget build(BuildContext context) {

      return FormField<String>(
        validator: (value) {
          if (value == null) {
            return 'Üniversite seçilmedi';
          }
          return null;
        },
        builder: (FormFieldState<String> state) {
          return  DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                value: selectedUniversity,
                hint: Text('  Üniversite Seçiniz'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedUniversity = newValue;
                    state.didChange(newValue);
                  });
                },
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'Üniversite Seçiniz',
                    child: Text('  Üniversite Seçiniz'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Kırklareli Üniversitesi',
                    child: Text('  Kırklareli Üniversitesi'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'İstanbul Üniversitesi',
                    child: Text('  İstanbul Üniversitesi'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Boğaziçi Üniversitesi',
                    child: Text('  Boğaziçi Üniversitesi'),
                  ),
                ],
              ),
          );
        },
      );
    }
  }
