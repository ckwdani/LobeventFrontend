import 'package:flutter/material.dart';
import 'package:lobevent/Presentation/Content/RegisterScreen.dart';
import 'package:lobevent/Services/Communication/LoginCommunicator.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState();

  bool progressIndicatorVisiblity = false;
  final loginNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.cyanAccent,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter your username:'),
                  controller: loginNameController,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter your Password:'),
                  controller: passwordController,
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 50,
                      height: 40,
                      color: Colors.amber,
                      child: Text('Login'),
                      onPressed: () async {
                        if (loginNameController.text == null ||
                            passwordController.text == null ||
                            loginNameController.text.length == 0 ||
                            passwordController.text.length == 0) {
                          falseInputs();
                        } else {
                          progressIndicatorVisiblity = true;
                          await LoginCommunicator().sendLogin(
                              loginNameController.text.trim(),
                              passwordController.text.trim());
                          Navigator.pushNamed(context, "/");
                        }
                      },
                    ),
                    MaterialButton(
                      minWidth: 50,
                      height: 40,
                      color: Colors.brown,
                      child: Text('Registrate'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                    ),

                    ///TODO: implement forgot password function
                    MaterialButton(
                      minWidth: 50,
                      height: 40,
                      child: Text('Forgot Password'),
                    )
                  ],
                ),
                Visibility(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  visible: progressIndicatorVisiblity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TODO; catch false Inputs
  void falseInputs() {
    Widget build(BuildContext context) {
      return Center(child: Text('Please input name and password.'));
    }
  }
}
