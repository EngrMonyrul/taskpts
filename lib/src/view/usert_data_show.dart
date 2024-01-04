import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpts/src/viewmodel/provider/home_page_provider.dart';

import '../model/user_data_model.dart';
import '../viewmodel/widgets/data_model_show.dart';

class UserDataShow extends StatefulWidget {
  final UserData userData;

  const UserDataShow({super.key, required this.userData});

  @override
  State<UserDataShow> createState() => _UserDataShowState();
}

class _UserDataShowState extends State<UserDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.network(widget.userData.profilepicture!),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                showData(data: 'ID: '),
                showData(data: widget.userData.id.toString()),
              ],
            ),
            Row(
              children: [
                showData(data: 'Name: '),
                showData(data: widget.userData.name.toString()),
              ],
            ),
            Row(
              children: [
                showData(data: 'Email: '),
                showData(data: widget.userData.email.toString()),
              ],
            ),
            Row(
              children: [
                showData(data: 'Location: '),
                showData(data: widget.userData.location.toString()),
              ],
            ),
            Row(
              children: [
                showData(data: 'Create Date: '),
                showData(data: widget.userData.createdat.toString()),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Edit'),
                  onPressed: () {
                    context
                        .read<HomePageProvider>()
                        .setId(value: widget.userData.id!);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
