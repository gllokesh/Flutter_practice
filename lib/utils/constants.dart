
class Constants {
  //Singleton Pattern in Dart
  static final Constants constants = Constants._internal();
  Constants._internal();

  factory Constants() {
    return constants;
  }

  //Application
  static const APPLICATION_NAME = "Grocery App";

  //Groceries Screen
  static const GROCERIES_SCREEN_TITLE = "Store";

}