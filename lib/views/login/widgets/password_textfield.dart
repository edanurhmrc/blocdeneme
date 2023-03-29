import 'package:flutter/material.dart';

class password_textfield extends StatelessWidget {
  const password_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: -3.0, left: 10),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigoAccent,
                width: 2.0,
              ),
              borderRadius:
              BorderRadius.circular(20)),
          labelText: 'Şifre',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen şifrenizi girin';
            }
            return null;
          }
          );

  }
}
