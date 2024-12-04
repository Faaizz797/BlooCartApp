import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      width: double.infinity,
      height:
          getPropScreenHeight(150), // Sesuaikan dengan tinggi frame di Figma
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/discount_banner.png'),
          fit: BoxFit
              .cover, // Gambar akan di-scale agar memenuhi seluruh container
        ),
        borderRadius:
            BorderRadius.circular(20), // Tetap mempertahankan border radius
      ),
    );
  }
}
