import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motore/navbar.dart';
import 'package:motore/pages/carSpec.dart';
import 'package:motore/pages/profile.dart';

dynamic bord = Colors.blue;
String selMake = '';
String selModel = '';

class CarSpecCard extends StatelessWidget {
  final CarSpec _car;
  CarSpecCard(this._car);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          selMake = _car.make.toString();
          selModel = _car.model.toString();
          index = 4;
          defPage = Profile();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Navigation()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            //<-- SEE HERE
          ),
          color: Colors.black,
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(18)),
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24))),
                    child: Image.network(
                      "https://cdn-01.imagin.studio/getImage?customer=usmotore&make=${_car.make}&modelFamily=${_car.model}",
                      scale: 10,
                    )),
                title: Text(
                  "${_car.nickname}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                subtitle: Row(
                  children: <Widget>[
                    Text("${_car.make} ${_car.model}",
                        style: TextStyle(color: Colors.black, fontSize: 10)),
                  ],
                ),
                trailing: const Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0)),
          ),
        ));
  }
}
