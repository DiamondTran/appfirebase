import 'package:appfirebase/src/model/foodAdress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FoodDetail extends StatefulWidget {
  final FoodAdress food;


  FoodDetail({this.food});

  @override
  _foodetail createState() => _foodetail();
}

class _foodetail extends State<FoodDetail> {
  final double expen_height = 400;
  final double container_height = 50;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[

          CustomScrollView(
            slivers: <Widget>[_bluidSilverHeader(),
              SliverToBoxAdapter(
                child: _bluildAdapter(),
              )
            ],
          ),
          Positioned(top: 30,left: 15,
            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,), onPressed: ()=> Navigator.pop(context)),),
          Positioned(left: 0, right: 0, bottom: 0,child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                gradient:LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue[200],Colors.blue])
            ),
            child: FlatButton(
              onPressed: (){
              },child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height/17,
              width: MediaQuery.of(context).size.width/ 2.4,
              child: Text("Chỉ đường", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
            ),),
          ))
        ],
      )

    );
  }

  Widget _bluidSilverHeader() {
    return SliverPersistentHeader(
      delegate: DetailDelegate(expen_height,container_height, widget.food),
    );
  }
  Widget _bluildAdapter(){
    return Container(
      padding: EdgeInsets.only(left: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(widget.food.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25, letterSpacing: 1),),
          Padding(padding: EdgeInsets.only(top: 15),
          child: Text("Tên món: "+widget.food.namefood, style: TextStyle(fontSize: 18),),
          ),
          Padding(padding: EdgeInsets.only(top: 5),
            child: Text("Giá: "+widget.food.price+ " đ", style: TextStyle(fontSize: 18, color: Colors.blue),),
          ),
          Padding(padding: EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nhận xét/Mô tả:", style: TextStyle(fontSize: 18),),
                Text("    "+widget.food.des, style: TextStyle(fontSize: 16),)
              ],
            )
          ),

          Padding(padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:   Text("Người đăng: "+ widget.food.emailuser)),
                 Expanded(child:  Text("Ngày đăng: "+ widget.food.date =="Đang cập nhật"? "":"Ngày đăng: " +widget.food.date)),

                ],
              )
          ),

        ],
      ),
    );
  }
}

class DetailDelegate extends SliverPersistentHeaderDelegate {
  final double expenHeight;

  final FoodAdress foodAdress;
  final double container_height;
  DetailDelegate(this.expenHeight, this.container_height, this.foodAdress);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Image.network(
          foodAdress.url==""? "https://i.ytimg.com/vi/3eIWZPxZJjY/maxresdefault.jpg": foodAdress.url,
          width: MediaQuery.of(context).size.width,
          height: expenHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: expenHeight- container_height -shrinkOffset,
            left: 0,
            child: Container(
              width:MediaQuery.of(context).size.width ,
              height: container_height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
            )),
        Positioned(
          top:expenHeight- 100 -shrinkOffset,
          left: 30,
          child:
          Text(foodAdress.namefood, style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w500),)
        )
      ],
    );
  }

  @override
  double get maxExtent => expenHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return null;
  }
}
