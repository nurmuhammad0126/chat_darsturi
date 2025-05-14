import 'package:chat_dasturi/core/extensions/widget_extension.dart';
import 'package:chat_dasturi/core/functions/validators.dart';
import 'package:chat_dasturi/core/router/app_route_name.dart';
import 'package:chat_dasturi/features/authentication/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_textfield.dart';

class ForgetPasword extends StatefulWidget {
  const ForgetPasword({super.key});

  @override
  State<ForgetPasword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetPasword> {
  final TextEditingController _emailController = TextEditingController();

  void resetPassword() async {
    final viewModel = context.read<AuthViewModel>();
    final email = _emailController.text.trim();

    final validationMessage = emailValidator(email);
    if (validationMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationMessage), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await viewModel.sendPasswordReset(email);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Parolni tiklash havolasi emailingizga yuborildi."),
          backgroundColor: Colors.green,
        ),
      );
      context.go(AppRouteNames.login);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Parolni tiklashda xatolik yuz berdi."),
          backgroundColor: Colors.red,
        ),
      );
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
            // stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
          ),
        ),
        child: Column(
          children: [
            30.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Parolni Tiklash',
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
              children: [Icon(Icons.mail_outline), Text('E-MAIL:')],
            ),
            13.height,
            SizedBox(
              height: 50,
              child: CustomFormFieldWidget(
                controller: _emailController,
                validator: emailValidator,
                hintText: "namuna@gmail.com",
              ),
            ),

            30.height,
            GestureDetector(
              onTap: resetPassword,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 77, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Parolni tiklash',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
