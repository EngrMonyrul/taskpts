import 'package:flutter/material.dart';
import 'package:taskpts/helper/navigation.dart';
import 'package:taskpts/src/view/login_page_view.dart';
import 'package:provider/provider.dart';
import 'package:taskpts/src/viewmodel/provider/home_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
            create: (_) => HomePageProvider(NavigationHelper.instance)),
      ],
      child: MaterialApp(
        navigatorKey: NavigationHelper.instance.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const LoginPageView(),
      ),
    );
  }
}
