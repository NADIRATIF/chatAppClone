import 'package:flutter/material.dart';

const kDuration = Duration(seconds: 1);
const Color kColorWhite = Colors.white;
const TextStyle kHintStyle = TextStyle(color: Colors.lightBlue);
const BorderSide kBorderSide = BorderSide(color: Colors.blue);
const BorderSide kBorderSideError = BorderSide(color: Colors.red);
const kTextStyle1 = TextStyle(
  fontSize: 24.0,
  color: Colors.blueAccent,
);
const kTextStyle2 = TextStyle(
  fontSize: 24.0,
);
const kTextStyle3 = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);
const kPadding = EdgeInsets.all(8.0);
const kPaddingX10 = EdgeInsets.all(10.0);
const kPaddingSymmetric =
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0);
const kSize = Size(
  200.0,
  60.0,
);
const Radius kRadius = Radius.circular(8.0);
const Icon kIconLogOut = Icon(Icons.logout);
const BoxDecoration kContainerStyle = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const InputDecoration kInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
