import 'package:ct_analyst_app/src/common/custom_button.dart';
import 'package:ct_analyst_app/src/common/textField.dart';
import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_controller.dart';
import 'package:ct_analyst_app/src/utils/string_validator.dart';
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
  final _csslId = TextEditingController();
  final _passwordController = TextEditingController();

  String get csslId => _csslId.text;
  String get password => _passwordController.text;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _csslId.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await ref
          .watch(authRepositoryProvider)
          .login(_csslId.text, _passwordController.text);
    } catch (err) {
      print(err);
    }
  }

  void _emailEditingComplete() {
    // if (EmailSubmitRegexValidator().isValid("darshank@cssl.com")) {
    //   _node.nextFocus();
    // }
    _node.nextFocus();
  }

  void _passwordEditingComplete() {
    // if (!state.canSubmitEmail(email)) {
    //   _node.previousFocus();
    //   return;
    // }
    _submit();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomTextFormField(
                placeHolder: "Cssl ID",
                onEditingComplete: () => _emailEditingComplete,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                placeHolder: "Password",
                hidden: true,
                onEditingComplete: () => _passwordEditingComplete,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(label: "Submit", onPressed: _submit),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () =>
                    ref.read(screenProvider.notifier).update((state) => false),
                child: const Text("Register Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
