
import 'package:appfirebase/src/model/foodAdress.dart';
import 'package:appfirebase/src/model/foodRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class GetFoodViewModel extends Model{
  static GetFoodViewModel _instance;
  static GetFoodViewModel getinstance(){
    if(_instance ==null){
      _instance= GetFoodViewModel();

    }
    return _instance;
  }
  GetFoodViewModel(){
    getfoodadress();
  }
  FoodAdressRepo foodAdressRepo  = FoodRepoImpl();
  List<FoodAdress> listAdress = [];


  void getfoodadress() async {
    listAdress = await foodAdressRepo.getFoodAdress();
    notifyListeners();
  }
  static void destroyInstance() {
    _instance = null;
  }
}