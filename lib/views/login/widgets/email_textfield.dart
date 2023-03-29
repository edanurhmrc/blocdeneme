import 'package:flutter/material.dart';

class email_textfield extends StatelessWidget {
  const email_textfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: -3.0, left: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigoAccent,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(20)),
            labelText: 'E-Mail',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen e-posta adresinizi girin';
            }
            return null;
          });

  }
}
