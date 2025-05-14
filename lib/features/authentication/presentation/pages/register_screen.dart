import 'package:chat_dasturi/core/extensions/widget_extension.dart';
import 'package:chat_dasturi/core/functions/validators.dart';
import 'package:chat_dasturi/core/router/app_route_name.dart';
import 'package:chat_dasturi/features/authentication/models/user_model.dart';
import 'package:chat_dasturi/features/authentication/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final viewModel = AuthViewModel();

  void register() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _nameController.text;

      final res = await viewModel.register(email: email, password: password);
      final authModel = viewModel.authModel;

      if (mounted) {
        if (authModel != null) {
          final userModel = UserModel(
            name: name,
            email: email,
            token: authModel.idToken,
          );

          viewModel.saveUserModel(userModel);
          context.go(AppRouteNames.login);
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (!res) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Bunday Foydalanuvchi "),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0, 4), blurRadius: 4, spreadRadius: 0),
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B223A),

              Color(0xFF1B223A),
              Color(0xFF151825),
              Color(0xFF151825),
              Color(0xFF151825),
              Color(0xFF151825),
              Color(0xFF1B223A),
              Color(0xFF1B223A),
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.height,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Ro'yhatdan O'tish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                  ),
                ),
              ),
              30.height,
              Row(
                spacing: 5,
                children: [Icon(Icons.person), Text('Ism Familiya')],
              ),
              13.height,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: CustomFormFieldWidget(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ism va Familiyangizni kiriting ";
                          }

                          return null;
                        },
                        hintText: "Suhrobjon Tolipov",
                      ),
                    ),
                    18.height,
                    Row(
                      spacing: 5,
                      children: [Icon(Icons.mail_outline), Text('E-MAIL:')],
                    ),
                    19.height,
                    SizedBox(
                      height: 50,
                      child: CustomFormFieldWidget(
                        controller: _emailController,
                        validator: emailValidator,
                        hintText: "namuna@gmail.com",
                      ),
                    ),
                    19.height,
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.lock_outline_rounded),
                        Text('Parol:'),
                      ],
                    ),
                    13.height,
                    SizedBox(
                      height: 50,
                      child: CustomFormFieldWidget(
                        validator: passwordValidator,
                        controller: _passwordController,
                        hintText: "password",
                      ),
                    ),
                    8.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "kamida 8 ta belgidan iborat boʻlishi kerak",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ).paddingOnly(left: 8),
                    19.height,
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.lock_outline_rounded),
                        Text('Parolni tasdiqlang:'),
                      ],
                    ),
                    13.height,
                    SizedBox(
                      height: 50,
                      child: CustomFormFieldWidget(
                        validator: (value) {
                          if (_passwordController.text != value) {
                            return "Parol mas kelmadi!!";
                          }
                          if (value == null || value.isEmpty) {
                            return "Parolni tasdiqlang";
                          }
                          return null;
                        },
                        controller: _passwordConfirmController,
                        hintText: "password",
                      ),
                    ),
                  ],
                ),
              ),
              30.height,
              InkWell(
                onTap: register,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 77, vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      'Davom etish',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              36.height,
            ],
          ),
        ),
      ),
    );
  }
}
