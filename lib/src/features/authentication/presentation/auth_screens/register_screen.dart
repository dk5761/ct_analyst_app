import 'package:ct_analyst_app/src/constants/colors.dart';
import 'package:ct_analyst_app/src/features/authentication/application/auth_local_service.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/auth_controller.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/textField.dart';
import '../../../../utils/functions.dart';
import '../../data/auth_repository.dart';
import '../screen_holder/screen_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _csslId = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final String _positionValue = 'Analyst';

  String get csslId => _csslId.text;
  String get password => _passwordController.text;
  String get firstName => _firstNameController.text;
  String get lastName => _lastNameController.text;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _csslId.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      final position =
          await ref.read(authServiceProvider).getPositionInt(_positionValue);

      await ref.watch(authProvider.notifier).register(
            _csslId.text,
            _passwordController.text,
            _firstNameController.text,
            _lastNameController.text,
            position,
          );
    } catch (err) {
      logger.e(err);
    }
  }

  void _editingComplete(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      _node.nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
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
                    "Register",
                    style: TextStyle(color: darkHeaderTextColor, fontSize: 21),
                  ),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                      controller: _csslId,
                      placeHolder: "Cssl ID",
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => _editingComplete(_csslId)),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                      controller: _passwordController,
                      placeHolder: "Password",
                      hidden: true,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          _editingComplete(_passwordController)),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      controller: _firstNameController,
                      placeHolder: "First Name",
                      hidden: true,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          _editingComplete(_firstNameController)),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      controller: _lastNameController,
                      placeHolder: "Last Name",
                      hidden: true,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          _editingComplete(_lastNameController)),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Position",
                          style: TextStyle(
                              color: darkHeaderTextColor, fontSize: 16),
                        ),
                        CustomDropDown(value: _positionValue),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(label: "Register", onPressed: _submit),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => ref
                            .read(screenProvider.state)
                            .update((state) => true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.arrow_left,
                              color: Color.fromARGB(238, 187, 216, 241),
                            ),
                            Text(
                              "Login Page",
                              style: TextStyle(
                                  color: Color.fromARGB(238, 187, 216, 241)),
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
