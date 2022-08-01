import 'package:ct_analyst_app/src/features/authentication/application/auth_local_service.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/textField.dart';
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

      await ref.watch(authRepositoryProvider).register(
            _csslId.text,
            _passwordController.text,
            _firstNameController.text,
            _lastNameController.text,
            position,
          );
    } catch (err) {
      print(err);
    }
  }

  void _editingComplete() {
    // if (EmailSubmitRegexValidator().isValid("darshank@cssl.com")) {
    //   _node.nextFocus();
    // }
    _node.nextFocus();
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
                controller: _csslId,
                placeHolder: "Cssl ID",
                onEditingComplete: () => _editingComplete(),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: _passwordController,
                placeHolder: "Password",
                hidden: true,
                onEditingComplete: () => _editingComplete,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: _firstNameController,
                placeHolder: "First Name",
                hidden: true,
                onEditingComplete: () => _editingComplete,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: _lastNameController,
                placeHolder: "Lasr Name",
                hidden: true,
                onEditingComplete: () => _editingComplete,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropDown(value: _positionValue),
              CustomButton(label: "Submit", onPressed: _submit),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () =>
                    ref.read(screenProvider.notifier).update((state) => true),
                child: const Text("Register Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
