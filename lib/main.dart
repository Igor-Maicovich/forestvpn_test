import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/main_bloc.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:forestvpn_test/ui/screens/main_screen.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      theme: ThemeData(fontFamily: "SFPro"),
      home: BlocProvider(
        create: (context) => MainBloc(MockNewsRepository()),
        child: MainScreen(),
      ),
    );
  }
}
