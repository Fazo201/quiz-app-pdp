import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@immutable
sealed class AppImages {
  const AppImages._();

  ///  SVG
  
  static final splashPdpLogo = SvgPicture.asset(
    "assets/images/pdp_academy_logo.svg",
    height: 78,
    width: 245,
    fit: BoxFit.cover,
  );

  static final signInPdpLogo = SvgPicture.asset(
    "assets/images/pdp_academy_logo.svg",
    height: 65,
    width: 205,
    fit: BoxFit.cover,
  );

  static final googleLogo = SvgPicture.asset(
    "assets/images/google_logo.svg",
    height: 44,
    width: 44,
    fit: BoxFit.cover,
  );

  static final homeFlutterLogo = SvgPicture.asset(
    'assets/images/flutter_logo.svg',
    height: 75,
    width: 60.57,
    fit: BoxFit.cover,
  );

  static final homePythonLogo = SvgPicture.asset(
    'assets/images/python_logo.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeFrontendLogo = SvgPicture.asset(
    'assets/images/frontend_logo.svg',
    height: 49,
    width: 73,
    fit: BoxFit.cover,
  );

  static final homeJavaLogo = SvgPicture.asset(
    'assets/images/java_logo.svg',
    height: 74.98,
    width: 40.31,
    fit: BoxFit.cover,
  );

  static final homeCPlusLogo = SvgPicture.asset(
    'assets/images/c_plus_logo.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeCSharpLogo = SvgPicture.asset(
    'assets/images/c_sharp_logo.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeAndroidLogo = SvgPicture.asset(
    'assets/images/android_logo.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  static final homeIOSLogo = SvgPicture.asset(
    'assets/images/ios_logo.svg',
    height: 75,
    width: 75,
    fit: BoxFit.cover,
  );

  /// PNG
  static final personLogo = Image.asset(
    "assets/images/person_logo.png",
    height: 46,
    width: 46,
    fit: BoxFit.cover,
  );

}