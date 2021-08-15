import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/utils.dart';
import 'package:learning_people/bloc/screen/loginBloc.dart';

class PasswordReset extends StatefulWidget {
  PasswordReset({Key key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  LoginBloc bloc = LoginBloc.instance;
  Utils utils = Utils.instance;
  List<TextEditingController> controllers;
  @override
  void initState() {
    super.initState();
    controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextField(
            context,
            controllers[0],
            true,
            'Old Password',
            null,
            Icon(Icons.vpn_key),
            bloc.isPasswordValidated
                ? Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : Offstage(),
            null,
            textType: TextFieldType.password,
          ),
          CustomTextField(
            context,
            controllers[1],
            true,
            'New Password',
            null,
            Icon(Icons.vpn_key),
            bloc.isPasswordValidated
                ? Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : Offstage(),
            (c) => bloc.isEmailValid(c),
            textType: TextFieldType.password,
          ),
         CustomTextField(
            context,
            controllers[2],
            true,
            'Confirm Password',
            null,
            Icon(Icons.vpn_key),
            bloc.isPasswordValidated
                ? Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : Offstage(),
            (c) => bloc.isPasswordConfirmed = c == controllers[1].text,
            textType: TextFieldType.password,
          ),
         Buttons(            
            'Change Password',
            () => bloc.passwordReset(
              controllers[0].text,
              controllers[1].text,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
