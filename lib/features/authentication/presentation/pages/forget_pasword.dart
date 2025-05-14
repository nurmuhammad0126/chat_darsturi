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

    viewModel.setLoading(true);

    final success = await viewModel.sendPasswordReset(email);
    viewModel.setLoading(false);
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
      backgroundColor: Color(0xff020D1B),

      body: Column(
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
          Consumer<AuthViewModel>(
            builder: (context, authViewModel, _) {
              return GestureDetector(
                onTap: authViewModel.isLoading ? null : resetPassword,
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
        ],
      ).paddingAll(20),
    );
  }
}
