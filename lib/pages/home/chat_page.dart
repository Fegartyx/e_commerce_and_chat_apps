import 'package:e_commerce_and_chat_apps/theme.dart';
import 'package:e_commerce_and_chat_apps/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: true,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 18,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false, // remove back button
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: (() {}),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            ChatTile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
