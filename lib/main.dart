import 'package:builder_pattern_exercise/screen/profile_collection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:builder_pattern_exercise/screen/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: const BuilderPatternApp(),
    ),
  );
}

class BuilderPatternApp extends StatelessWidget {
  const BuilderPatternApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Builder pattern app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormScreen(),
      initialRoute: FormScreen.route,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case ProfileCollectionScreen.route:
            return CupertinoPageRoute(builder: (_) => const ProfileCollectionScreen());
          case FormScreen.route:
          default:
            return CupertinoPageRoute(builder: (_) => const FormScreen());
        }
      },
    );
  }
}