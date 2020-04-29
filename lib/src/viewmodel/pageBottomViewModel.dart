import 'dart:async';

class MyPageBottom{
  int index=0;
  StreamController _controller= new StreamController<int>();
  Stream get pageStream => _controller.stream;

  void intpaege(int i){
    _controller.sink.add(i);
  }

  void dispose(){
    _controller.close();
  }
}