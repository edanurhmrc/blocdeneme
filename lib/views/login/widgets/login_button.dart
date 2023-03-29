import 'package:blocdeneme/main.dart';
import 'package:flutter/material.dart';

class login_button extends StatelessWidget {
  const login_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      20))),
          side: MaterialStateProperty.all(
              BorderSide(
                  color: Colors.indigoAccent,
                  width: 1.0,
                  style: BorderStyle.solid))),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    MyHomePage()));
      },
      child: Text("Giriş Yap"),
    );
  }
}
