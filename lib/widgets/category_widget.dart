import 'package:flutter/material.dart';
import 'package:grocery_app/models/groceries_response.dart';
import 'package:grocery_app/widgets/grocery_item_card.dart';

class CategoryWidget extends StatelessWidget {

  List<GroceryItem> groceries;

  CategoryWidget({this.groceries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, position) {
        return GroceryItemCard(item: groceries[position],);
      },
    );
  }
}
