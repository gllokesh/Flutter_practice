
import 'package:grocery_app/models/groceries_response.dart';
import 'package:grocery_app/repository/repository.dart';
import 'package:grocery_app/repository/repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class GroceriesScreenBloc {

  Repository repository = RepositoryImpl();

  final _groceriesListSubject = PublishSubject<List<List<GroceryItem>>>();
  Observable<List<List<GroceryItem>>> get groceriesListStream => _groceriesListSubject.stream;

  GroceriesScreenBloc.fromMock({this.repository});

  GroceriesScreenBloc();

  //Calls the repository, which calls the service. If we get a successful response we set our stream value
  //If we get an error we set an error
  void fetchGroceries() async {
    repository.fetchGroceries().listen((groceries) {
      List<List<GroceryItem>> groceryCategoriesList = List();
      List<String> categories = List();
      for (GroceryItem item in groceries) {
        if (!categories.contains(item.category)) {
          categories.add(item.category);
        }
      }

      for (String category in categories) {
        List<GroceryItem> categoryList = List();
        for (GroceryItem item in groceries) {
          if (item.category == category) {
            categoryList.add(item);
          }
        }
        groceryCategoriesList.add(categoryList);
      }

      //Categories each grocery item into their own respective list, then sets the subject equal to this list of categories
      _groceriesListSubject.sink.add(groceryCategoriesList);
      print(groceryCategoriesList);
    }, onError: (e) {
      print('fetchGroceries - $e');
      _groceriesListSubject.sink.addError(e);
    });
  }

  List<String> getCategories({List<List<GroceryItem>> categories}) {
    List<String> categoriesLabelList = List();

    for (List<GroceryItem> categoriesList in categories) {
      categoriesLabelList.add(categoriesList[0].category);
    }

    return categoriesLabelList;
  }

  void dispose() {
    _groceriesListSubject.close();
  }
}