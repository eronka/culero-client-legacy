import 'package:flutter/material.dart';
import 'package:culero/utils/const.dart';

// helper function to check device according to screen width.


bool isMobile(MediaQueryData mediaQueryData) {
  return mediaQueryData.size.width < mobile;
}

bool isTablet(MediaQueryData mediaQueryData) {
  return mediaQueryData.size.width >= mobile && mediaQueryData.size.width  < tablet;
}

bool isLaptop(MediaQueryData mediaQueryData) {
  return mediaQueryData.size.width >= tablet && mediaQueryData.size.width  < laptop;
}

bool isDesktop(MediaQueryData mediaQueryData) {
  return mediaQueryData.size.width >= laptop;
}