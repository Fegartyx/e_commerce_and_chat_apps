import 'package:e_commerce_and_chat_apps/providers/auth_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/product_provider.dart';
import 'package:e_commerce_and_chat_apps/theme.dart';
import 'package:e_commerce_and_chat_apps/widgets/product_card.dart';
import 'package:e_commerce_and_chat_apps/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    UserModel userModel = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin, // default is 30
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              // dibungkus dengan expanded ketika jika nama panjang tidak overflow
              // turun ke bawah
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${userModel.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${userModel.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(userModel.profilePhotoUrl!),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Training',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'BasketBall',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Hiking',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularsProductTitles() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          //right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(
                          products: product,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitles() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          //right: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(
                    products: product,
                  ))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularsProductTitles(),
        popularProducts(),
        newArrivalsTitles(),
        newArrivals(),
      ],
    );
  }
}
