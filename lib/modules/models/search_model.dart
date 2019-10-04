class SearchModel {

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  SearchModel(this.idMeal, this.strMeal, this.strMealThumb);
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        json['idMeal'],
        json['strMeal'],
        json['strMealThumb']
    );
  }
}