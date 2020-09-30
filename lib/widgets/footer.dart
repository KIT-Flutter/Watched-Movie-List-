import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Footer extends StatefulWidget{
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.movie,
    Icons.format_list_numbered, //今回は見た目だけ
    Icons.settings //今回は見た目だけだと思う
  ];

  static const _footerItemNames = [
    'ウォッチリスト',
    'ランキング', //今回は見た目だけ
    '設定', //今回は見た目だけだと思う
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_UpdateActiveState(0));
    for ( var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_UpdateDeactiveState(i));
    }
  }

  BottomNavigationBarItem _UpdateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black87,
      ),
      title:  Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.black87,
        ),
      )
    );
  }

  BottomNavigationBarItem _UpdateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black26,
      ),
      title: Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.black26
        ),
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] = _UpdateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _UpdateActiveState(index);
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
