import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_taking_application/Model/stocktake.dart';
import '../services/PublicVariables.dart';


class StocktakeDAO {
  static const ROOT = PublicVariables.ROOTIP+'/stocktake/stocktake_actions.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_ACTION ='_ADD';
  static Future<List<Stocktake>> getObjects() async {
    try {
      //add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      //print('get all objects Response: ${response.body}');
      if(200 == response.statusCode){
        List <Stocktake> list = parseResponse(response.body);
        return list;
      }else{
        return List<Stocktake>();//return an empty list
      }
    } catch (e) {
      return List<Stocktake>();//return an empty list on exception/ error
    }
  }
  static List<Stocktake> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Stocktake>((json) => Stocktake.fromJson(json)).toList();
  }
  //Method to add an object to the database.
  static Future<String> addObject(String stocktake_id, String store_name, String location, String store_id,
      String created_by,
      String status, String deleted, String date_created, String date_closed, String note) async {
    try {
      //add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _ADD_ACTION;
      map['stocktake_id'] = stocktake_id;
      map['store_name'] = store_name;
      map['location'] = location;
      map['store_id'] = store_id;
      map['created_by'] = created_by;
      map['status'] = status;
      map['deleted'] = deleted;
      map['date_created'] = date_created;
      map['date_closed'] = date_closed;
      map['note'] = note;
      final response = await http.post(ROOT, body: map);
      print('add object Response: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}