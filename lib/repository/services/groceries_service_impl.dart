import 'dart:convert';
import 'package:grocery_app/models/groceries_response.dart';
import 'package:grocery_app/repository/services/groceries_service.dart';
import 'package:http/http.dart' show Client;

const _baseUrl = "https://host_url/api/user/";
const _operation = "getItemsByStore";
const _tagParam = "tag";
const _storeNameParam = "store_name";
const _tag = "getItemsByStore";
const _storeName = "ojas";

class GroceriesServiceImpl implements GroceriesService {

  Client client = Client();

  @override
  Future<GroceriesResponse> fetchGroceries() async {
    final url = "$_baseUrl$_operation?$_tagParam=$_tag&$_storeNameParam=$_storeName";

    print('Fetching response from $url');
    final response = await client.post(url);

    final json = jsonDecode(response.body);
    print('Groceries Response - $json');

    return GroceriesResponse.fromJson(json);
  }

}