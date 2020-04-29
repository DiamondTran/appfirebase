
import 'package:appfirebase/src/resources/BottomNavigationBar/newPage.dart';
import 'package:appfirebase/src/resources/BottomNavigationBar/pagetypeFood.dart';
import 'package:appfirebase/src/resources/BottomNavigationBar/favourite.dart';
import 'package:appfirebase/src/viewmodel/pageBottomViewModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<HomePage>  {
  MyPageBottom pageBottom = new MyPageBottom();
  int index = 0;
  final List<Widget> _children = [
    NewPageFood(),
    PageTypeFood(),
    Favourite()
  ];
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.fiber_new), Text("Mới"), Colors.orange),
    NavigationItem(Icon(Icons.fastfood), Text("Thể loại"), Colors.blue),
    NavigationItem(Icon(Icons.favorite_border), Text("Yêu thích"), Colors.purple),
  ];
  Widget _buildItem(NavigationItem item, bool isSlected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      height: double.maxFinite,
      padding: EdgeInsets.only(left: 12),
      width: isSlected ? 120 : 50,
      decoration: isSlected
          ? BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: item.color.withOpacity(.2))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconTheme(
                  data: IconThemeData(
                      size: 28,
                      color: isSlected ?  item.color: Colors.black
                  ),
                  child: item.icon),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: isSlected ? DefaultTextStyle.merge(
                    style: TextStyle(
                        color: item.color
                    ),
                    child: item.title) : Container(),
              )
            ],
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:StreamBuilder(
          stream: pageBottom.pageStream,
          builder: (context, snapshot)=> snapshot.hasData ?_children[snapshot.data] : _children[0] ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 6, bottom: 6),
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                pageBottom.intpaege(itemIndex);
                setState(() {
                  index = itemIndex;
                });
              },
              child: _buildItem(item,index == itemIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageBottom.dispose();
  }

}
class NavigationItem{
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);


}
