import 'package:flutter/material.dart';
import 'package:lit/constants/strings.dart';
import 'package:lit/data/provider/location_provider.dart';
import 'package:lit/presentation/pages/map.dart';
import 'package:lit/presentation/pages/profile.dart';
import 'package:lit/presentation/pages/restaurants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    RestaurantsPage(),
    Maps(),
    ProfilePage(), //?
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        var provider = Provider.of<LocationProvider>(context, listen: false);
        provider.getLocation();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black45,
            iconSize: 35,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "Рестораны",
                icon: Icon(Icons.restaurant_outlined),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Карта',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Профиль',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap:
                // (index) {
                //   switch (index) {
                //     case 0:
                //       Navigator.pushNamed(context, '/first');
                //       break;
                //     case 1:
                //       Navigator.pushNamed(context, '/second');
                //       break;
                //     case 2:
                //       Navigator.pushNamed(context, PROFILE);
                //       break;
                //   }
                // }

                _onItemTapped,
          ),
        ));
  }
}
