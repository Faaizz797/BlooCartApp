import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class CardBottomNavigation extends StatelessWidget {
  const CardBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(30),
        vertical: getPropScreenWidth(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getPropScreenWidth(30)),
          topRight: Radius.circular(getPropScreenWidth(30)),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(getPropScreenWidth(10)),
                height: getPropScreenWidth(40),
                width: getPropScreenWidth(40),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset("assets/icons/receipt.svg"),
              ),
              const Spacer(),
              const Text("Add voucher code"),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12,
                color: kTextColor,
              ),
            ],
          ),
          SizedBox(height: getPropScreenHeight(20)),
          Row(
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Total:\n"),
                    TextSpan(
                      text: "£315.27",
                      style: TextStyle(
                        fontSize: 16, 
                        color: kTextColor
                      ),
                    ),
                  ]
                )
              ),
              const Spacer(),
              SizedBox(
                width: getPropScreenWidth(190),
                child: MyDefaultButton(
                  text: "Check Out",
                  press: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: getPropScreenHeight(10)),
        ],
      ),
    );
  }
}