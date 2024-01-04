import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpts/src/viewmodel/provider/home_page_provider.dart';

import '../viewmodel/widgets/input_field.dart';

class RegistrationPageView extends StatefulWidget {
  const RegistrationPageView({super.key});

  @override
  State<RegistrationPageView> createState() => _RegistrationPageViewState();
}

class _RegistrationPageViewState extends State<RegistrationPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomePageProvider>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              infoTextField(
                  textEditingController: value.usernameController,
                  hint: 'username007',
                  label: 'Username',
                  hideText: false,
                  homePageProvider: value),
              const SizedBox(height: 10),
              infoTextField(
                  textEditingController: value.emailController,
                  hint: 'user@gmail.com',
                  label: 'Email',
                  hideText: false,
                  homePageProvider: value),
              const SizedBox(height: 10),
              infoTextField(
                  textEditingController: value.passwordController,
                  hint: '1234567890',
                  label: 'Password',
                  hideText: true,
                  homePageProvider: value),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: const ButtonStyle().copyWith(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const Text('Register'),
                  onPressed: () {
                    value.registerUser();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Already Registered?'),
                  const SizedBox(width: 10),
                  InkWell(
                    child: const Text(
                      'Login Now!',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      value.goIntoLoginPage();
                    },
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
