import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/auth/login_screen.dart';

import '../routes/screen_routes.dart';

class SplashService{
  void isLogin(BuildContext context){
    final auth =FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
  Timer(Duration(seconds: 3),()=>Navigator.pushNamed(context, RoutesName.bottomNavBar,
     ));
    }else{
      Timer(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));
    }

  }
}