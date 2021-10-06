import 'package:wallpaperapp/model/categories_model.dart';

List<CatgeoriesModel> getCategories() {
  List<CatgeoriesModel> categories =
      List<CatgeoriesModel>.empty(growable: true);
  CatgeoriesModel catgeorieModel = new CatgeoriesModel();

  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/227908/pexels-photo-227908.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  catgeorieModel.categorieName = 'tea';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();

  //
  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  catgeorieModel.categorieName = 'food';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();

  //
  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/164654/pexels-photo-164654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  catgeorieModel.categorieName = 'car';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();


  //
  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/5417678/pexels-photo-5417678.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  catgeorieModel.categorieName = 'calendar';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();


  //
  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/7123604/pexels-photo-7123604.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  catgeorieModel.categorieName = 'time';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();



  //
  catgeorieModel.imageURL =
      'https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  catgeorieModel.categorieName = 'technology';
  categories.add(catgeorieModel);
  catgeorieModel = new CatgeoriesModel();

  return categories;
}
