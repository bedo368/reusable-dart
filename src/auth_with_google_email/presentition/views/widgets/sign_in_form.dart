// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_useable_widget_and_classes/core/common/widgets/custom_text_field1.dart';
import 'package:flutter_useable_widget_and_classes/core/res/colors.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/app_utls.dart';
import 'package:flutter_useable_widget_and_classes/src/auth_with_google_email/presentition/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: widget.formKey,
          child: Column(
            children: [
              CustomTextField1(
                controller: widget.emailController,
                hintText: 'Email address',
                overriderValidator: true,
                validator: (value) {
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    caseSensitive: false,
                  );
                  if (value == null) {
                    return 'please enter your email';
                  } else {
                    if (!emailRegex.hasMatch(value)) {
                      return 'please enter valied email';
                    }
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField1(
                controller: widget.passwordController,
                hintText: 'password',
                overriderValidator: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'password is required';
                  }
                  return null;
                },
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? IconlyLight.show : IconlyLight.hide,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        obscurePassword = !obscurePassword;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: const Text('forget Password'),
                ),
              ),
              const SizedBox(height: 30),
              if (state is AuthLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    widget.formKey.currentState!.save();

                    if (widget.formKey.currentState == null) {
                      AppUtils.showSnackBar(
                        context: context,
                        message: 'please compleate the form',
                      );
                    } else if (widget.formKey.currentState != null) {
                      if (widget.formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignInEvent(
                                email: widget.emailController.text,
                                password: widget.passwordController.text,
                              ),
                            );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colours.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.maxFinite, 50),
                  ),
                  child: const Text('Sign In'),
                ),
            ],
          ),
        );
      },
    );
  }
}
