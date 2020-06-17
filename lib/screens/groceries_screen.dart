import 'package:flutter/material.dart';
import 'package:grocery_app/blocs/groceries_screen_bloc_provider.dart';
import 'package:grocery_app/models/groceries_response.dart';
import 'package:grocery_app/utils/constants.dart';
import 'package:grocery_app/widgets/category_widget.dart';
import 'package:grocery_app/widgets/loading_widget.dart';

class GroceriesScreen extends StatefulWidget {
  @override
  _GroceriesScreenState createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  GroceriesScreenBloc _bloc;

  @override
  void didChangeDependencies() {
    //We instantiate it this here. This is like when we start listening to the VM onCreate()
    _bloc = GroceriesScreenBlocProvider.of(context);
    _bloc.fetchGroceries();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //this is like the dispose in the ViewModel, to clean up RxStreams
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.groceriesListStream,
        builder: (context, AsyncSnapshot<List<List<GroceryItem>>> snapshot) {
          if (snapshot.hasData) {
            return DefaultTabController(
              length: snapshot.data.length,
              child: Scaffold(
                appBar: buildAppBar(
                    categories: !snapshot.hasData || snapshot.hasError ? List() : _bloc.getCategories(categories: snapshot.data)),
                body: buildBody(groceries: snapshot.data),
              ),
            );
          }

          //Before loading has finished
          return Scaffold(
            appBar: AppBar(
              title: Text(
                Constants.GROCERIES_SCREEN_TITLE,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            body: LoadingWidget(),
          );
        });
  }

  //Normally we'd make a base app bar for an app, but since this one is a little more complex, with a viewpager, I'm just building it here
  Widget buildAppBar({List<String> categories}) {
    return AppBar(
      title: Text(
          Constants.GROCERIES_SCREEN_TITLE,
        style: Theme.of(context).textTheme.title,
        ),
      bottom: TabBar(
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).textTheme.subtitle.color,
        isScrollable: true,
        tabs: categories.map((category) => Tab(text: category,)).toList(),
      ),
    );
  }

  Widget buildBody({List<List<GroceryItem>> groceries}) {
    return TabBarView(
      children: groceries.map((groceryPerCategory) => CategoryWidget(groceries: groceryPerCategory,)).toList(),
    );
  }
}
