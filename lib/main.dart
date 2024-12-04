import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/state_managements/auth_provider.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';
import 'package:ui_ecommerce/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(
    DevicePreview(
      enabled: true, // Aktifkan DevicePreview untuk pengujian
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ],
        child: MainApp(isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(theme.isDarkMode),
        // Tambahkan konfigurasi DevicePreview di bawah ini
        useInheritedMediaQuery: true, // Pastikan kompatibilitas dengan DevicePreview
        locale: DevicePreview.locale(context), // Gunakan locale sesuai pengaturan DevicePreview
        builder: DevicePreview.appBuilder, // Gunakan builder dari DevicePreview
        initialRoute: isLoggedIn ? HomeScreen.routeName : SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
