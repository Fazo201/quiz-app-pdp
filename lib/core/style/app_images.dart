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

  /// Home Screen

  static final signInPdpLogo = SvgPicture.asset(
    "assets/images/pdp_academy_logo.svg",
    height: 65,
    width: 205,
    fit: BoxFit.cover,
  );

  static final googleLogo = SvgPicture.asset(
    "assets/images/google_logo.svg",
    height: 65,
    width: 65,
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

  static final largeFlutter = SvgPicture.asset(
    'assets/images/large_flutter.svg',

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
    height: 74.26,
    width: 66.7,
    fit: BoxFit.cover,
  );

  static final homeCSharpLogo = SvgPicture.asset(
    'assets/images/c_sharp_logo.svg',
    height: 74.26,
    width: 66.7,
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


  ///Level Screen 
  
  static final levelFlutterLogo = SvgPicture.asset(
    'assets/images/flutter_logo.svg',
    height: 33,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelPythonLogo = SvgPicture.asset(
    'assets/images/python_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelFrontendLogo = SvgPicture.asset(
    'assets/images/frontend_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelJavaLogo = SvgPicture.asset(
    'assets/images/java_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelCPlusLogo = SvgPicture.asset(
    'assets/images/c_plus_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelCSharpLogo = SvgPicture.asset(
    'assets/images/c_sharp_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelAndroidLogo = SvgPicture.asset(
    'assets/images/android_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  static final levelIOSLogo = SvgPicture.asset(
    'assets/images/ios_logo.svg',
    height: 32,
    width: 32,
    fit: BoxFit.cover,
  );

  ///  Grade result Icon

  static final gradeResultPersonIcon = SvgPicture.asset(
    "assets/images/person_icon.svg",
    height: 46,
    width: 46,
    fit: BoxFit.cover,
  );


  ///  Profile Person Icon

  static final profilePersonIcon = SvgPicture.asset(
    "assets/images/person_icon.svg",
    height: 109,
    width: 109,
    fit: BoxFit.cover,
  );


  ///  AppBar Flutter Icon

  static final appBarFlutterLogo = SvgPicture.asset(
    'assets/images/flutter_logo.svg',
    height: 26,
    width: 21,
    fit: BoxFit.cover,
  );



  /// PNG
  static final personLogo = Image.asset(
    "assets/images/person_logo.png",
    height: 46,
    width: 46,
    fit: BoxFit.cover,
  );


  ///  Bottom Navigation Bar Icons
  
  static final bottomHomeSelectLogo = SvgPicture.asset(
    'assets/images/home_select_logo.svg',
    height: 41,
    width: 41,
    fit: BoxFit.cover,
  );

  static final bottomHomeLogo = SvgPicture.asset(
    'assets/images/home_logo.svg',
    height: 41,
    width: 41,
    fit: BoxFit.cover,
  );

  static final bottomLevelSelectLogo = SvgPicture.asset(
    'assets/images/level_select_logo.svg',
    height: 41,
    width: 41,
    fit: BoxFit.cover,
  );

  static final bottomLevelLogo = SvgPicture.asset(
    'assets/images/level_logo.svg',
    height: 41,
    width: 41,
    fit: BoxFit.cover,
  );
  
  static final bottomProfileSelectLogo = SvgPicture.asset(
    'assets/images/profile_select_logo.svg',
    height: 37,
    width: 37,
    fit: BoxFit.cover,
  );

  static final bottomProfileLogo = SvgPicture.asset(
    'assets/images/profile_logo.svg',
    height: 41,
    width: 41,
    fit: BoxFit.cover,
  );
  
}