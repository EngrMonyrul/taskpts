import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taskpts/helper/api_handle.dart';
import 'package:taskpts/helper/navigation.dart';
import 'package:taskpts/src/model/registration_model.dart';
import 'package:taskpts/src/model/user_data_model.dart';
import 'package:taskpts/src/view/edit_page_view.dart';
import 'package:taskpts/src/view/lading_page_view.dart';
import 'package:taskpts/src/view/login_page_view.dart';
import 'package:taskpts/src/view/registration_page.dart';
import 'package:taskpts/src/view/usert_data_show.dart';

class HomePageProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  NavigationHelper navigationHelper = NavigationHelper();
  String userToken = '';
  int id = 0;

  setId({required int value}) {
    id = value;
    getUpdate();
    notifyListeners();
  }

  setUserToken({required String token}) {
    userToken = token;
    notifyListeners();
  }

  HomePageProvider(this.navigationHelper) {
    // getAllUser();
  }

  bool showPass = false;
  List<UserData> allUsers = [];

  void setPassShow() {
    if (showPass) {
      showPass = false;
    } else {
      showPass = true;
    }
    notifyListeners();
  }

  registerUser() async {
    navigationHelper.loadingPopup();
    final data = {
      "name": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };
    var resData = await ApiHandle()
        .registrationUser(url: '/authaccount/registration', data: data);

    if (resData) {
      usernameController.clear();
      passwordController.clear();
      emailController.clear();
      navigationHelper.setBack();
      navigationHelper.toggleMessage(
          msg: 'Successfully Registered', color: Colors.green);
      navigationHelper.setNavigationPushRemove(widget: const LoginPageView());
    } else {
      navigationHelper.setBack();
      navigationHelper.toggleMessage(
          msg: 'Something Went Wrong', color: Colors.red);
    }
    notifyListeners();
  }

  loginUser() async {
    navigationHelper.loadingPopup();
    final data = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    var resData =
        await ApiHandle().loginUser(url: '/authaccount/login', data: data);
    print(resData);
    if (resData[1]) {
      userToken = resData[0];
      usernameController.clear();
      passwordController.clear();
      emailController.clear();
      navigationHelper.setBack();
      navigationHelper.toggleMessage(
          msg: 'Successfully Login', color: Colors.green);
    } else {
      navigationHelper.setBack();
      navigationHelper.toggleMessage(msg: 'Wrong Data', color: Colors.red);
    }
    notifyListeners();
  }

  getUpdate() async {
    final data = await ApiHandle().getUpdate(
        url: '/users/$id', name: usernameController.text, userToken: userToken);
    if (data) {
      usernameController.clear();
      passwordController.clear();
      emailController.clear();
      navigationHelper.setBack();
      getAllUser();
      navigationHelper.toggleMessage(
          msg: 'Successfully Updated', color: Colors.green);
      navigationHelper.setNavigationPushRemove(widget: LandingPageView());
    } else {
      navigationHelper.setBack();
      navigationHelper.toggleMessage(
          msg: 'Something Went Wrong', color: Colors.red);
    }
    notifyListeners();
  }

  navigateToShowData({required UserData userData}) {
    navigationHelper.setNavigation(widget: UserDataShow(userData: userData));
    notifyListeners();
  }

  getAllUser() async {
    navigationHelper.loadingPopup();
    final data =
        await ApiHandle().getAllUser(url: '/users', userToken: userToken);
    print(data);
    allUsers = await data['data']
        .map<UserData>((item) => UserData.fromJson(item))
        .toList();
    navigationHelper.setNavigationPushRemove(widget: const LandingPageView());
    navigationHelper.setBack();
    notifyListeners();
  }

  goIntoEditPage({required UserData userDataModel}) {
    navigationHelper.setNavigation(
        widget: EditPageView(userData: userDataModel));
    notifyListeners();
  }

  goIntoRegistrationPage() {
    navigationHelper.setNavigation(widget: const RegistrationPageView());
    notifyListeners();
  }

  goIntoLoginPage() {
    navigationHelper.setNavigationPushRemove(widget: const LoginPageView());
    notifyListeners();
  }
}
