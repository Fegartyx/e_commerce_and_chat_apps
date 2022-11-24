import 'package:e_commerce_and_chat_apps/pages/home/chat_page.dart';
import 'package:e_commerce_and_chat_apps/pages/home/home_page.dart';
import 'package:e_commerce_and_chat_apps/pages/home/profile_page.dart';
import 'package:e_commerce_and_chat_apps/pages/home/wishlist_page.dart';
import 'package:e_commerce_and_chat_apps/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // default page appearance index (Home)
  int currentIndex = 0;

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
        break;
      case 1:
        return const ChatPage();
        break;
      case 2:
        return const WishlistPage();
        break;
      case 3:
        return const ProfilePage();
        break;
      default:
        return const HomePage();
    }
  }

  Widget btnCart() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.popAndPushNamed(context, '/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget customBottomNav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          // untuk mengatur index icon
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: bgColor4,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 21,
                  color: currentIndex == 0 ? primaryColor : inActiveBtnColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 21,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_chat.png',
                  width: 20,
                  color: currentIndex == 1 ? primaryColor : inActiveBtnColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 21,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_wishlist.png',
                  width: 20,
                  color: currentIndex == 2 ? primaryColor : inActiveBtnColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_profile.png',
                  width: 18,
                  color: currentIndex == 3 ? primaryColor : inActiveBtnColor,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 0 ? bgColor : bgColor3,
      floatingActionButton: btnCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
