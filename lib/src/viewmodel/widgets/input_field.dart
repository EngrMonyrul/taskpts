import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/home_page_provider.dart';

Container infoTextField(
    {required String hint,
    required String label,
    required TextEditingController textEditingController,
    required bool hideText,
    required HomePageProvider homePageProvider}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.black),
    ),
    child: TextField(
      controller: textEditingController,
      obscureText: hideText ? homePageProvider.showPass : false,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        labelText: label,
        hintText: hint,
        suffixIcon: hideText
            ? IconButton(
                icon: !homePageProvider.showPass
                    ? const Icon(CupertinoIcons.eye_slash)
                    : const Icon(CupertinoIcons.eye),
                onPressed: () {
                  homePageProvider.setPassShow();
                },
              )
            : null,
      ),
    ),
  );
}
