import 'package:e_commerce_and_chat_apps/providers/cart_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/transaction_provider.dart';
import 'package:e_commerce_and_chat_apps/theme.dart';
import 'package:e_commerce_and_chat_apps/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      if (await transactionProvider.checkout(authProvider.user.token,
          cartProvider.carts, cartProvider.totalPrice())) {
        cartProvider.carts = [];
        // kenapa pakai pushNamedAndRemoveUntil
        // agar setelah dikirim ke page halaman ini tidak akan ditampilkan lagi
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // NOTE : LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                Column(
                  children: cartProvider.carts
                      .map((e) => CheckoutCard(
                            cartModel: e,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          // NOTE : ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: bgColor4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_your_address.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: subtitleTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          'Your Address',
                          style: subtitleTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Marsemoon',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: bgColor4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Divider(
                  thickness: 1,
                  color: subtitleColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: subtitleColor,
          ),
          // NOTE : CHECKOUT
          Container(
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            width: double.infinity,
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
