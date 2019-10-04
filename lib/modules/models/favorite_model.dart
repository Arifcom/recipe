class FavoriteModel {
  int id;
  String _idMeal, _strMeal, _strMealThumb, _createDate, _updateDate;

  FavoriteModel(
      this._idMeal,
      this._strMeal,
      this._strMealThumb,
      this._createDate,
      this._updateDate,
      );

  FavoriteModel.map(dynamic obj) {
    this._idMeal = obj["idMeal"];
    this._strMeal = obj["strMeal"];
    this._strMealThumb = obj["strMealThumb"];
    this._createDate = obj["createDate"];
    this._updateDate = obj["updateDate"];
  }

  String get idMeal => _idMeal;
  String get strMeal => _strMeal;
  String get strMealThumb => _strMealThumb;
  String get createDate => _createDate;
  String get updateDate => _updateDate;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["idMeal"] = _idMeal;
    map["strMeal"] = _strMeal;
    map["strMealThumb"] = _strMealThumb;
    map["createDate"] = _createDate;
    map["updateDate"] = _updateDate;

    return map;
  }

  void setFavoriteId(int id) {
    this.id = id;
  }
}