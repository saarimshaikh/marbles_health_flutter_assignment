import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'setup_locator.dart';
import 'form_state_service.dart';
import 'screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<FormStateService>(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
