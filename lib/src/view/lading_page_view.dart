import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskpts/helper/api_handle.dart';
import 'package:taskpts/src/viewmodel/provider/home_page_provider.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  void getData() async {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    await homePageProvider.getAllUser();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<HomePageProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.allUsers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  onTap: () {
                    value.navigateToShowData(userData: value.allUsers[index]);
                  },
                  leading: CircleAvatar(
                    child: Image.network(value.allUsers[index].profilepicture!),
                  ),
                  title: Text(value.allUsers[index].name!),
                  subtitle: Text(value.allUsers[index].email!),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
