import 'package:flutter/material.dart';

import 'package:motore/pages/PartTile.dart';

class EngineTab extends StatelessWidget {
  List partsOnSale = [
    // [ partName, partPrice, tileColor, imageName ]
    ["Engine", "36", Colors.blue, "lib/icons/engine.png"],
    ["Spark Plug", "45", Colors.red, "lib/icons/engine.png"],
    ["Engine Oil", "84", Colors.purple, "lib/icons/engine.png"],
    ["Air FIlter", "95", Colors.brown, "lib/icons/engine.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
          partType: partsOnSale[index][0],
          partPrice: partsOnSale[index][1],
          tileColor: partsOnSale[index][2],
          imageName: partsOnSale[index][3],
        );
      },
    );
  }
}

class WheelTab extends StatelessWidget {
  List partsOnSale = [
    ["wheel", "36", Colors.blue, "lib/icons/brake.png"],
    ["brakes", "45", Colors.red, "lib/icons/brake.png"],
    ["rotors", "84", Colors.purple, "lib/icons/brake.png"],
    ["rims", "95", Colors.brown, "lib/icons/brake.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
          partType: partsOnSale[index][0],
          partPrice: partsOnSale[index][1],
          tileColor: partsOnSale[index][2],
          imageName: partsOnSale[index][3],
        );
      },
    );
  }
}

class BatteryTab extends StatelessWidget {
  List partsOnSale = [
    ["wheel", "36", Colors.blue, "lib/icons/battery.png"],
    ["brakes", "45", Colors.red, "lib/icons/battery.png"],
    ["rotors", "84", Colors.purple, "lib/icons/battery.png"],
    //["rims", "95", Colors.brown, "lib/icons/battery.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
          partType: partsOnSale[index][0],
          partPrice: partsOnSale[index][1],
          tileColor: partsOnSale[index][2],
          imageName: partsOnSale[index][3],
        );
      },
    );
  }
}

class InteriorTab extends StatelessWidget {
  List partsOnSale = [
    ["steering wheel", "36", Colors.blue, "lib/icons/interior.png"],
    ["spekaers", "45", Colors.red, "lib/icons/interior.png"],
    ["navigation", "84", Colors.purple, "lib/icons/interior.png"],
    ["dome light", "95", Colors.brown, "lib/icons/interior.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
          partType: partsOnSale[index][0],
          partPrice: partsOnSale[index][1],
          tileColor: partsOnSale[index][2],
          imageName: partsOnSale[index][3],
        );
      },
    );
  }
}

class ExteriorTab extends StatelessWidget {
  List partsOnSale = [
    ["steering wheel", "35", Colors.blue, "lib/icons/exterior.png"],
    ["spekaers", "45", Colors.red, "lib/icons/exterior.png"],
    ["navigation", "84", Colors.purple, "lib/icons/exterior.png"],
    ["dome light", "95", Colors.brown, "lib/icons/exterior.png"],
    ["steering wheel", "36", Colors.blue, "lib/icons/exterior.png"],
    ["spekaers", "45", Colors.red, "lib/icons/exterior.png"],
    ["navigation", "84", Colors.purple, "lib/icons/exterior.png"],
    ["dome light", "95", Colors.brown, "lib/icons/exterior.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
          partType: partsOnSale[index][0],
          partPrice: partsOnSale[index][1],
          tileColor: partsOnSale[index][2],
          imageName: partsOnSale[index][3],
        );
      },
    );
  }
}
