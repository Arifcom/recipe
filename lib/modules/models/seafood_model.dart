class SeafoodModel {

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  SeafoodModel(this.idMeal, this.strMeal, this.strMealThumb);
  factory SeafoodModel.fromJson(Map<String, dynamic> json) {
    return SeafoodModel(
        json['idMeal'],
        json['strMeal'],
        json['strMealThumb']
    );
  }
}