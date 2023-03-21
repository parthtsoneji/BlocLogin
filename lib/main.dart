import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/BLoc/login_bloc.dart';
import 'package:loginbloc/Screen/LoginPage.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => LoginBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      )));
}
