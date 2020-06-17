import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/blocs/groceries_screen_bloc_provider.dart';
import 'package:grocery_app/repository/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'mocks/repository_mock.dart';

class GroceriesScreenBlocTest {
  final Repository _repository = RepositoryMock();
  GroceriesScreenBloc _bloc;

  void main() {
    group("fetchGroceries", () {
      test('verify that stream is of proper value after successful call', () {
        _bloc = GroceriesScreenBloc.fromMock(repository: _repository);
        List response = List();
        
        when(_repository.fetchGroceries()).thenAnswer((_) => Observable.just(response));

        expect(_bloc.groceriesListStream, response);
      });


    });
  }
}