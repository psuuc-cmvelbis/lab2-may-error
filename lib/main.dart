import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velbis_labact2/providers/productprovider.dart';
import 'package:velbis_labact2/screens/viewproducts.dart';

void main() {
  runApp(const ActivityApp());
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewProductsScreen(),
      ),
    );
  }
}
