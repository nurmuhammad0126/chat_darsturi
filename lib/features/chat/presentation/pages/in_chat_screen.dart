import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets/app_images.dart';
import '../../../authentication/presentation/widgets/custom_textfield.dart';
import '../../../authentication/presentation/widgets/line_widget.dart';

class InChatScreen extends StatefulWidget {
  const InChatScreen({super.key});

  @override
  State<InChatScreen> createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          children: [
            Icon(Icons.person),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Smith Mathew'),
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      'Active Now',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(Icons.circle, size: 12, color: Colors.green),
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              spacing: 20,
              children: [
                SvgPicture.asset(AppImages.call),

                SvgPicture.asset(AppImages.cam),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child: Column(children: [Line()])),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: CustomFormFieldWidget(
                  controller: messageController,
                  hintText: 'Send Message',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
