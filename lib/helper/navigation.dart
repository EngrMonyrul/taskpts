import 'package:flutter/material.dart';

class NavigationHelper {
  late GlobalKey<NavigatorState> navigatorKey;
  static NavigationHelper instance = NavigationHelper();

  NavigationHelper() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  setNavigation({required Widget widget}) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  setNavigationPushRemove({required Widget widget}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  setBack() {
    return navigatorKey.currentState!.pop();
  }

  toggleMessage({required String msg, required Color color}) {
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            msg,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ));
    });
  }

  loadingPopup() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    });
  }
}
