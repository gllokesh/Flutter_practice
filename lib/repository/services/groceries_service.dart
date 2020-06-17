
import 'package:grocery_app/models/groceries_response.dart';

//Our service interface
abstract class GroceriesService {
  Future<GroceriesResponse> fetchGroceries();
}