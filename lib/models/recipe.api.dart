import 'dart:convert';
import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{
  static Future<List<Recipe>> getRecipe() async{
    var uri = Uri.http('yummly2.p.rapidapi.com', '/feeds/list',{'limit': '24', 'start': '0'});
    final response=await http.get(uri,headers: {'X-RapidAPI-Key': '2e925fce99msh302b4ea6e9a98e1p1d8640jsnca23293a7628',
    'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'});
    Map data= jsonDecode(response.body);
    List _temp=[];
    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }

  }
