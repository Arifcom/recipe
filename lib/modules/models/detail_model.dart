class DetailModel {

  final String idMeal;
  final String strMeal;
  final String strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strIngredient6;
  final String strIngredient7;
  final String strIngredient8;
  final String strIngredient9;
  final String strIngredient10;
  final String strIngredient11;
  final String strIngredient12;
  final String strIngredient13;
  final String strIngredient14;
  final String strIngredient15;
  final String strIngredient16;
  final String strIngredient17;
  final String strIngredient18;
  final String strIngredient19;
  final String strIngredient20;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;
  final String strMeasure6;
  final String strMeasure7;
  final String strMeasure8;
  final String strMeasure9;
  final String strMeasure10;
  final String strMeasure11;
  final String strMeasure12;
  final String strMeasure13;
  final String strMeasure14;
  final String strMeasure15;
  final String strMeasure16;
  final String strMeasure17;
  final String strMeasure18;
  final String strMeasure19;
  final String strMeasure20;

  DetailModel(
      this.idMeal,
      this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strIngredient16,
      this.strIngredient17,
      this.strIngredient18,
      this.strIngredient19,
      this.strIngredient20,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strMeasure16,
      this.strMeasure17,
      this.strMeasure18,
      this.strMeasure19,
      this.strMeasure20,
      );
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
        json['idMeal'],
        json['strMeal'],
        json['strDrinkAlternate'],
        json['strCategory'],
        json['strArea'],
        json['strInstructions'],
        json['strMealThumb'],
        json['strTags'],
        json['strYoutube'],
        json['strIngredient1'],
        json['strIngredient2'],
        json['strIngredient3'],
        json['strIngredient4'],
        json['strIngredient5'],
        json['strIngredient6'],
        json['strIngredient7'],
        json['strIngredient8'],
        json['strIngredient9'],
        json['strIngredient10'],
        json['strIngredient11'],
        json['strIngredient12'],
        json['strIngredient13'],
        json['strIngredient14'],
        json['strIngredient15'],
        json['strIngredient16'],
        json['strIngredient17'],
        json['strIngredient18'],
        json['strIngredient19'],
        json['strIngredient20'],
        json['strMeasure1'],
        json['strMeasure2'],
        json['strMeasure3'],
        json['strMeasure4'],
        json['strMeasure5'],
        json['strMeasure6'],
        json['strMeasure7'],
        json['strMeasure8'],
        json['strMeasure9'],
        json['strMeasure10'],
        json['strMeasure11'],
        json['strMeasure12'],
        json['strMeasure13'],
        json['strMeasure14'],
        json['strMeasure15'],
        json['strMeasure16'],
        json['strMeasure17'],
        json['strMeasure18'],
        json['strMeasure19'],
        json['strMeasure20'],
    );
  }
}