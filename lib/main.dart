import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: whiteBackColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: transparentColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const WalletManager());
}

class WalletManager extends StatelessWidget {
  const WalletManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [
        // ChangeNotifierProvider.value(value: SettingsProvider()),
        // ChangeNotifierProvider.value(value: CategoriesProvider()),
        // ChangeNotifierProvider.value(value: TransactionsProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Messages.APP_TITLE,
          color: mainColor,
          // home: InitialScreen(),
          // home: Splash(),
        );
      },
    );
  }
}
