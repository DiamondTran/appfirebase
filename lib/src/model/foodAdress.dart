class FoodAdress {
  String des;
  String emailuser;
  String kinhdo;
  String name;
  String namefood;
  String nameuser;
  String url;
  String price;
  String vido;
  String date;

  FoodAdress(this.des, this.emailuser, this.kinhdo, this.name, this.namefood,
      this.nameuser, this.url, this.price, this.vido, this.date);


}
abstract class FoodAdressRepo{
  Future<FoodAdress> getFoodAdressByLocation(String location);

  Future<List<FoodAdress>> getFoodAdress();

  Future<void> removeFoodAdress(FoodAdress foodAdress);
}
