import 'package:ct_analyst_app/src/common/custom_button.dart';
import 'package:ct_analyst_app/src/common/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _emailEditingComplete(EmailPasswordSignInState state) {
  //   if (state.canSubmitEmail(email)) {
  //     _node.nextFocus();
  //   }
  // }

  // void _passwordEditingComplete(EmailPasswordSignInState state) {
  //   if (!state.canSubmitEmail(email)) {
  //     _node.previousFocus();
  //     return;
  //   }
  //   _submit(state);
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const CustomTextFormField(
                placeHolder: "Cssl ID",
              ),
              const SizedBox(height: 10),
              const CustomTextFormField(
                placeHolder: "Password",
                hidden: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(label: "Submit", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
