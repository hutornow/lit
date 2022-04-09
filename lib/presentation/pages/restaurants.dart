import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/data/provider/location_provider.dart';
import 'package:lit/presentation/pages/map.dart';
import 'package:lit/presentation/pages/profile.dart';
import 'package:lit/presentation/widgets/bottom_sheets/restaurants_filters_bottom_sheet.dart';
import 'package:lit/presentation/widgets/restaurants_list.dart';
import 'package:provider/provider.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocationProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 48,
            title: const Text(
              'Рестораны',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.filter_list, size: 26),
                    onPressed: () {
                      ProjectFiltersBottomSheet(context);
                    }),
              )
              // IconButton(
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   icon: const Icon(Icons.map, size: 26),
              //   onPressed: () {
              //     //provider.getLocation();
              //     Navigator.of(context).push(
              //         CupertinoPageRoute(builder: (context) => MapTest()));
              //   },
              // ),
            ]),
        body: SafeArea(
          child: Column(children: [
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            //   child: TextField(
            //       textAlign: TextAlign.center,
            //       decoration: InputDecoration(
            //         hintText: 'Введите название ресторана',
            //         hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
            //         contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(50.0))),
            //         //border: ,
            //       )),
            // ),
            Expanded(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const RestaurantsList()),
            ),
          ]),
        ));
  }
}
