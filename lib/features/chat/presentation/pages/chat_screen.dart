import 'package:chat_dasturi/core/router/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets/app_images.dart';
import '../../../authentication/presentation/widgets/custom_textfield.dart';
import '../widgets/add_widget.dart';
import '../widgets/history_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: false,
        actions: [SvgPicture.asset(AppImages.edit)],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormFieldWidget(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
              controller: _searchController,
              hintText: 'Search here..',
            ),
            SizedBox(height: 35),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  DashedCircleButton(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.push(AppRouteNames.inChat);
                    },
                    leading: Icon(Icons.person),
                    title: Text(
                      'Smith Mathew',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Hi, David. Hope you’re doing....'),
                    trailing: Text(
                      DateTime.now().toIso8601String().split("T")[1],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
