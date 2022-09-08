import 'package:e_commerce_and_chat_apps/providers/wishlist_provider.dart';
import 'package:e_commerce_and_chat_apps/theme.dart';
import 'package:e_commerce_and_chat_apps/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: Text('Favorite Shoes'),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishList() {
      return Expanded(
        child: Container(
            width: double.infinity,
            color: bgColor3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image_wishlist.png',
                  width: 74,
                ),
                SizedBox(
                  height: 23,
                ),
                Text(
                  'You don\'t have dream shoes?',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Let\'s find your favorite shoes',
                  style: secondaryTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: bgColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(
                    productModel: product,
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        //emptyWishList(),
        wishlistProvider.wishlist.length == 0 ? emptyWishList() : content(),
      ],
    );
  }
}
