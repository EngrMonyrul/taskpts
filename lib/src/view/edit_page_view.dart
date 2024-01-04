import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpts/src/model/user_data_model.dart';
import 'package:taskpts/src/viewmodel/provider/home_page_provider.dart';
import 'package:taskpts/src/viewmodel/widgets/input_field.dart';

class EditPageView extends StatefulWidget {
  final UserData userData;

  const EditPageView({super.key, required this.userData});

  @override
  State<EditPageView> createState() => _EditPageViewState();
}

class _EditPageViewState extends State<EditPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<HomePageProvider>(builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoTextField(
                  hint: 'username',
                  label: 'Name',
                  textEditingController: value.usernameController,
                  hideText: false,
                  homePageProvider: value),
              SizedBox(height: 30),
              ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  value.getUpdate();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
