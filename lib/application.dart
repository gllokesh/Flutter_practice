import 'package:flutter/material.dart';
import 'package:grocery_app/blocs/groceries_screen_bloc_provider.dart';
import 'package:grocery_app/screens/groceries_screen.dart';
import 'package:grocery_app/utils/constants.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APPLICATION_NAME,
      //this just hides the debug banner letting the user know it's in debug mode
      debugShowCheckedModeBanner: false,
      //This is like injecting the bloc into the screen
      home: GroceriesScreenBlocProvider(child: GroceriesScreen()),
      theme: ThemeData(
        primaryColor: Colors.tealAccent[700],
        accentColor: Colors.teal,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          subtitle: TextStyle(
            color: Colors.white
          )
        )
      ),
    );
  }
}
