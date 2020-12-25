import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Language.of(context).getText("app_name")),
    );
  }
}
