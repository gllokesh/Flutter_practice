
//our datasource interface
import 'package:grocery_app/models/groceries_response.dart';
import 'package:rxdart/rxdart.dart';

abstract class Repository {
  Observable<List<GroceryItem>> fetchGroceries();
}