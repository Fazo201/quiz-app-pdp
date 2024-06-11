import 'package:flutter/material.dart';
import 'package:quiz_app/services/auth_service.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20In/sign_in_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/home_screen.dart';
import 'package:quiz_app/widget/screen/Main/main_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService.auth.authStateChanges(), 
      builder: (context,snapshot){
        if(snapshot.hasData){
          return const MainScreen(child: HomeScreen());
        }else{
          return const SignInScreen();
        }
      },
    );
  }
}