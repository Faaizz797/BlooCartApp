import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/screens/cart/components/item_cart.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCart.length,
      itemBuilder: (context, index) {
        final Cart cart = listCart[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenHeight(10),
          ),
          child: Dismissible(
            key: Key(cart.product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                listCart.removeAt(index);
              });
            },
            background: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFA7777),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: getPropScreenWidth(20)),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
            ),
            child: ItemCart(cart: cart)
          ),
        );
      }
    );
  }
}

