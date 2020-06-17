
import 'package:grocery_app/models/groceries_response.dart';
import 'package:grocery_app/repository/repository.dart';
import 'package:grocery_app/repository/services/groceries_service.dart';
import 'package:grocery_app/repository/services/groceries_service_impl.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryImpl implements Repository {

  final GroceriesService _groceriesService = GroceriesServiceImpl();

  @override
  Observable<List<GroceryItem>> fetchGroceries() {
    return Observable.fromFuture(_groceriesService.fetchGroceries())
        .map((response) => response.groceryItemsList);
  }

}