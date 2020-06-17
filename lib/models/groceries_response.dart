
class GroceriesResponse {
  final List<GroceryItem> _groceryItemsList;

  GroceriesResponse.fromJson(Map<String, dynamic> parsedJson)
    : _groceryItemsList = (parsedJson['data'] as List).map((groceryItemJson) => GroceryItem.fromJson(groceryItemJson)).toList();

  List<GroceryItem> get groceryItemsList => _groceryItemsList;

}

class GroceryItem {
  final String _name;
  final String _category;
  final String _image;
  final String _unitPrice;

  GroceryItem.fromJson(Map<String, dynamic> parsedJson)
    : _name = parsedJson['name'],
      _category = parsedJson['category'],
      _image = parsedJson['image_path'],
      _unitPrice = parsedJson['unit_price'];

  String get unitPrice => _unitPrice;

  String get image => _image;

  String get category => _category;

  String get name => _name;

}