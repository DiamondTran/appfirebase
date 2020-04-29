import 'package:appfirebase/src/firebase/typefoodModel.dart';
import 'package:appfirebase/src/model/foodAdress.dart';

class FoodRepoImpl with FoodAdressRepo{
  DatatypeFood datatypeFood = DatatypeFood();



  static FoodRepoImpl instance;

  static FoodRepoImpl getInstance() {
    if (instance == null) {
      instance = FoodRepoImpl();
    }
    return instance;
  }
  @override
  Future<List<FoodAdress>> getFoodAdress() {
    return datatypeFood.getlocationfood();
  }

  @override
  Future<FoodAdress> getFoodAdressByLocation(String location) {
    // TODO: implement getFoodAdressByLocation
    return null;
  }

  @override
  Future<void> removeFoodAdress(FoodAdress foodAdress) {
    // TODO: implement removeFoodAdress
    return null;
  }

}