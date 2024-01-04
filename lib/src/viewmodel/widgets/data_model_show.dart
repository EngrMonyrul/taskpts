import 'package:flutter/material.dart';

Text showData({required String data}) {
  return Text(
    data,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 20,
    ),
  );
}