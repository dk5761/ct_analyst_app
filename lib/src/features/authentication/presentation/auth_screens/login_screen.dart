import 'package:ct_analyst_app/src/common/custom_button.dart';
import 'package:ct_analyst_app/src/common/textField.dart';
import 'package:ct_analyst_app/src/constants/colors.dart';
import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/auth_controller.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/functions.dart';

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
      if (_csslId.text.isNotEmpty || _passwordController.text.isNotEmpty) {
        await ref
            .watch(authProvider.notifier)
            .login(_csslId.text, _passwordController.text);
      }
    } catch (err) {
      logger.e(err);
    }
  }

  // not working for some reason test it once
  void _editingComplete(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(color: darkHeaderTextColor, fontSize: 21),
                  ),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                    controller: _csslId,
                    placeHolder: "Cssl ID",
                    onEditingComplete: () => _editingComplete(_csslId),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null) {
                        return value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _passwordController,
                    placeHolder: "Password",
                    hidden: true,
                    onEditingComplete: () =>
                        _passwordEditingComplete(_passwordController),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null) {
                        return value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(label: "Login", onPressed: _submit),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => ref
                            .read(screenProvider.state)
                            .update((state) => false),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Register Page",
                              style: TextStyle(
                                  color: Color.fromARGB(238, 187, 216, 241)),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Color.fromARGB(238, 187, 216, 241),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
