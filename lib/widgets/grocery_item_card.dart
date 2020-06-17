import 'package:flutter/material.dart';
import 'package:grocery_app/models/groceries_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroceryItemCard extends StatefulWidget {
  GroceryItem item;

  GroceryItemCard({this.item});

  @override
  _GroceryItemCardState createState() => _GroceryItemCardState();
}

class _GroceryItemCardState extends State<GroceryItemCard> {

  int amount;

  @override
  void initState() {
    setState(() {
      amount = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: widget.item.image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.item.name,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      widget.item.unitPrice,
                      textAlign: TextAlign.end,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => setState(() => amount--),
                        ),
                        Text('$amount'),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => setState(() => amount++),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
