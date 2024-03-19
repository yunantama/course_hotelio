import 'package:course_hotelio/config/app_assets.dart';
import 'package:course_hotelio/config/app_color.dart';
import 'package:course_hotelio/config/app_route.dart';
import 'package:course_hotelio/source/user_source.dart';
import 'package:course_hotelio/widget/button_custom.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      UserSource.signIn(controllerEmail.text, controllerPassword.text)
          .then((response) {
        if (response['success']) {
          DInfo.dialogSuccess(context, response['message']);
          DInfo.closeDialog(context, actionAfterClose: () {
            Navigator.pushReplacementNamed(context, AppRoute.home);
          });
        } else {
          DInfo.toastError(response['message']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.logo,
                        width: 180,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 80),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in\n To Your Account',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerEmail,
                        validator: (value) =>
                            value == '' ? "Please insert your email" : null,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          hintText: 'Email Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: AppColor.secondary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerPassword,
                        obscureText: true,
                        validator: (value) =>
                            value == '' ? "Please insert your password" : null,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: AppColor.secondary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ButtonCustom(
                        label: 'Sign In',
                        onTap: () => login(context),
                        isExpand: true,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Create new account',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
