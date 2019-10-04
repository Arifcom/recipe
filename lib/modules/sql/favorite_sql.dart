import 'package:recipe/initialization/db_initialization.dart';
import 'package:recipe/modules/models/favorite_model.dart';

class FavoriteSQL {
  var db_initialization = new DBInitialization();

  Future<int> saveFavorite(FavoriteModel favorite) async {
    var dbClient = await db_initialization.db;
    int res = await dbClient.insert("favorite", favorite.toMap());
    print("Data Inserted");
    return res;
  }

  Future<List<FavoriteModel>> getFavorite() async{
    var dbClient = await db_initialization.db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM favorite ORDER BY updateDate DESC");
    List<FavoriteModel> favoritedata = new List();
    for(int i=0; i<list.length; i++){
      var favorite = FavoriteModel(
        list[i]["idMeal"],
        list[i]["strMeal"],
        list[i]["strMealThumb"],
        list[i]["createDate"],
        list[i]["updateDate"],
      );
      favorite.setFavoriteId(list[i]['id']);
      favoritedata.add(favorite);
    }

    return favoritedata;
  }

  Future<List<FavoriteModel>> getFavoriteByIdMeal(String idMeal) async{
    var dbClient = await db_initialization.db;
    List<Map> list = await dbClient.rawQuery("SELECT * FROM favorite WHERE idMeal = ?", [idMeal]);
    List<FavoriteModel> favoritedata = new List();
    for(int i=0; i<list.length; i++){
      var favorite = FavoriteModel(
        list[i]["idMeal"],
        list[i]["strMeal"],
        list[i]["strMealThumb"],
        list[i]["createDate"],
        list[i]["updateDate"],
      );
      favorite.setFavoriteId(list[i]['id']);
      favoritedata.add(favorite);
    }

    return favoritedata;
  }

  Future<bool> updateFavorite(FavoriteModel favorite) async{
    var dbClient = await db_initialization.db;
    int res = await dbClient.update("favorite", favorite.toMap(),
        where: "id=?",
        whereArgs: <int>[favorite.id]
    );
    return res > 0 ? true : false;
  }

  Future<int> deleteFavorite(String idMeal) async{
    var dbClient = await db_initialization.db;
    int res = await dbClient.rawDelete("DELETE FROM favorite WHERE idMeal = ?", [idMeal]);
    return res;
  }
}