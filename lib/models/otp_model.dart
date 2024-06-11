import 'package:email_otp/email_otp.dart';

class OTPModel {
  static EmailOTP myAuth = EmailOTP();

  static Future<bool> sendOTP({required String userEmail}) async {
    myAuth.setConfig(
      appEmail: userEmail,
      appName: "Quiz app",
      userEmail: userEmail,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );

    return await myAuth.sendOTP();
  }

  static Future<bool> verifyOTP({required String inputOTP}) async {
    return myAuth.verifyOTP(otp: inputOTP);
  }
}
