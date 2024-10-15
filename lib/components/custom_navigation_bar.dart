import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key, required this.menu,
  });

  final MenuState menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getPropScreenHeight(15),
      ),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getPropScreenWidth(30)),
              topRight: Radius.circular(getPropScreenWidth(30)),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.3),
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }, 
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == menu ? kPrimaryColor : kInActiveIconColor,
                  )
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: SvgPicture.asset("assets/icons/Heart Icon.svg")
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg")
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  }, 
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == menu ? kPrimaryColor : kInActiveIconColor,
                  )
                )
              ],
            ),
    );
  }
}