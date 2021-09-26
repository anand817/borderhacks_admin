import 'package:borderhacks/ui/components/buttons/primary_button.dart';
import 'package:borderhacks/ui/components/text_field/email_textfield.dart';
import 'package:borderhacks/ui/components/text_field/password_textfield.dart';
import 'package:borderhacks/ui/views/base_view.dart';
import 'package:borderhacks/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthView(this.title, this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) => model.onModelReady(title),
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[100]!,
                  Colors.blue[200]!,
                  Colors.blue[300]!,
                ],
              ),
            ),
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    EmailTextField(emailController: model.emailController),
                    const SizedBox(height: 20),
                    PasswordTextField(
                        passwordController: model.passwordController),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      press: () async {
                        FocusScope.of(context).unfocus();
                        await model.authenticate(title);
                      },
                      text: title,
                      isFilled: true,
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      press: () => Get.offAndToNamed('/${model.path}'),
                      text: subtitle,
                      isFilled: false,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
