import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/utils.dart';
import 'package:learning_people/bloc/screen/loginBloc.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<TextEditingController> controllers;
  List<FocusNode> nodes;
  Utils utils = Utils.instance;
  LoginBloc bloc;
  bool isForgetPassword = false;
  @override
  void initState() {
    super.initState();
    bloc = LoginBloc.instance;
    controllers = [TextEditingController(), TextEditingController()];
    nodes = [FocusNode(), FocusNode()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/image/logo.png',
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              context,
              controllers[0],
              true,
              'Email',
              null,
              Icon(Icons.people),
              bloc.isEmailValidated
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : Offstage(),
              (c) => bloc.isEmailValid(c),
              focusNode: nodes,
              focusNodeNumber: 0,
            ),
            if (!isForgetPassword)
              CustomTextField(
                context,
                controllers[1],
                true,
                'Password',
                null,
                Icon(Icons.vpn_key),
                bloc.isPasswordValidated
                    ? Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : Offstage(),
                (c) => bloc.isPasswordCompliant(c),
                textType: TextFieldType.password,
                focusNode: nodes,
                focusNodeNumber: 1,
              ),
            StreamBuilder<String>(
              stream: bloc.error,
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
                  Text(snapshot.data ?? '', textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
            ),
            Buttons(
              
              isForgetPassword ? 'Forgot Password' : 'Login',
              () {
                bloc.login(controllers[0].text, controllers[1].text);
              },
            ),
            InkWell(
              onTap: () => setState(() => isForgetPassword = !isForgetPassword),
              child: Text(
                isForgetPassword ? 'Go Back' : 'Forgot Password',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

 
}
