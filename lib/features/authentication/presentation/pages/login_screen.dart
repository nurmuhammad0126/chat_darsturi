import 'package:chat_dasturi/core/extensions/widget_extension.dart';
import 'package:chat_dasturi/core/functions/validators.dart';
import 'package:chat_dasturi/core/router/app_route_name.dart';
import 'package:chat_dasturi/features/authentication/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/assets/app_images.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/external_auth_buttons.dart';
import '../widgets/line_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void login() async {
    print("\x1B[31m LOGIN BOSILDI: \x1B[0m");

    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      print("\x1B[31m IFGA TUSHDI: \x1B[0m");

      try {
        final res = await context.read<AuthViewModel>().login(
          email: email,
          password: password,
        );

        if (mounted) {
          if (res) {
            context.go(AppRouteNames.main);
          } else {
            ScaffoldMessenger.of(context).clearSnackBars();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Bunday foydalanuvchi topilmadi !!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Xatolik yuz berdi: $e'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Malumotlarni toliding"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).dividerColor;

    return Scaffold(
      backgroundColor: Color(0xff020D1B),

      body: Column(
        children: [
          30.height,
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back, size: 40, color: Colors.white),
                ),
                20.width,
                Text(
                  "KIRISH",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          30.height,
          Row(
            spacing: 5,
            children: [Icon(Icons.mail_outline), Text('E-MAIL:')],
          ),
          13.height,
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: CustomFormFieldWidget(
                    controller: _emailController,
                    validator: emailValidator,
                    hintText: "namuna@gmail.com",
                  ),
                ),
                SizedBox(height: 19),
                Row(
                  spacing: 5,
                  children: [Icon(Icons.lock_outline_rounded), Text('Parol:')],
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
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.go(AppRouteNames.forgetPaswrod);
                },
                child: Text(
                  'Parolni unutdingizmi?',
                  style: TextStyle(color: borderColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Consumer<AuthViewModel>(
            builder: (context, authViewModel, _) {
              return GestureDetector(
                onTap: authViewModel.isLoading ? null : login,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 77, vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child:
                        authViewModel.isLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              'Davom etish',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              );
            },
          ),

          35.height,
          GestureDetector(
            onTap: () {
              context.go(AppRouteNames.register);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 77, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  "Ro'yhatdan o'tish",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 36),
          Row(
            spacing: 15,
            children: [
              Expanded(child: Line()),
              Text(
                'yoki',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Line()),
            ],
          ),
          SizedBox(height: 36),
          ExternalAuthButtons(
            title: 'Continue with Google',
            logo: Image.asset(AppImages.google),
          ),
          SizedBox(height: 20),
          ExternalAuthButtons(
            title: 'Continue with Apple',
            logo: Icon(Icons.apple),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
