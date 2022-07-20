import 'package:amazon_clone/common/widgets/custom_widgets.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum AuthState { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthState _authState = AuthState.signUp;
  final _singUpFormKey = GlobalKey<FormState>();
  final _singInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // limpiar el controlador cuando el widget se deshace
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _nameController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Welcome')),
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _authState == AuthState.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create an account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: AuthState.signUp,
                  groupValue: _authState,
                  onChanged: (AuthState? value) {
                    setState(() {
                      _authState = value!;
                    });
                  },
                ),
              ),
              if (_authState == AuthState.signUp)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _singUpFormKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _passWordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        text: 'Sign up',
                        onTap: () {},
                      )
                    ]),
                  ),
                ),
              ListTile(
                tileColor: _authState == AuthState.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'SingIn an account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: AuthState.signIn,
                  groupValue: _authState,
                  onChanged: (AuthState? value) {
                    setState(() {
                      _authState = value!;
                    });
                  },
                ),
              ),
              if (_authState == AuthState.signIn)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _singInFormKey,
                    child: Column(children: [
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _passWordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {},
                      )
                    ]),
                  ),
                ),
            ]),
          ),
        ));
  }
}
