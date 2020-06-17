
import 'package:flutter/cupertino.dart';
import 'groceries_screen_bloc.dart';
export 'groceries_screen_bloc.dart';

//This is like a module. Providing the bloc to the proper screen
class GroceriesScreenBlocProvider extends InheritedWidget {

  final GroceriesScreenBloc bloc;

  GroceriesScreenBlocProvider({Key key, Widget child})
    : bloc = GroceriesScreenBloc(),
      super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

   static GroceriesScreenBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(GroceriesScreenBlocProvider) as GroceriesScreenBlocProvider).bloc;
  }
}