class DessertModel {

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  DessertModel(this.idMeal, this.strMeal, this.strMealThumb);
  factory DessertModel.fromJson(Map<String, dynamic> json) {
    return DessertModel(
        json['idMeal'],
        json['strMeal'],
        json['strMealThumb']
    );
  }
}