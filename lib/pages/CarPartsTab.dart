import 'package:flutter/material.dart';
import 'package:motore/pages/PartTile.dart';

class EngineTab extends StatefulWidget {
  EngineTab({super.key});

  @override
  State<EngineTab> createState() => _EngineTabState();
}

class _EngineTabState extends State<EngineTab> {
  List partsOnSale = [
    // [ partName, partPrice, tileColor, imageName ]
    ["Alternator", "36", Colors.blue, "lib/images/alternator.png"],
    ["Driveshaft", "45", Colors.red, "lib/images/driveshaft.png"],
    ["Clutches", "84", Colors.purple, "lib/images/clutch.png"],
    ["Transmission", "95", Colors.brown, "lib/images/transmission.png"],
    ["Spark Plug", "36", Colors.blue, "lib/images/spark-plug.png"],
    ["Starter", "45", Colors.red, "lib/images/starter.png"],
    ["Gearbox", "84", Colors.purple, "lib/images/gearbox.png"],
    ["Air Filter", "95", Colors.brown, "lib/images/air-filter.png"],
    ["Intake Sytem", "36", Colors.blue, "lib/images/filter.png"],
    ["Pistons", "45", Colors.red, "lib/images/piston.png"],
    ["Flywheels", "84", Colors.purple, "lib/images/flywheel.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
            partType: partsOnSale[index][0],
            partPrice: partsOnSale[index][1],
            tileColor: partsOnSale[index][2],
            imageName: partsOnSale[index][3]);
      },
    );
  }
}

class WheelTab extends StatefulWidget {
  WheelTab({super.key});

  @override
  State<WheelTab> createState() => _WheelTabState();
}

class _WheelTabState extends State<WheelTab> {
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
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return EngineTile(
              partType: partsOnSale[index][0],
              partPrice: partsOnSale[index][1],
              tileColor: partsOnSale[index][2],
              imageName: partsOnSale[index][3]);
        });
  }
}

class BatteryTab extends StatefulWidget {
  BatteryTab({super.key});

  @override
  State<BatteryTab> createState() => _BatteryTabState();
}

class _BatteryTabState extends State<BatteryTab> {
  List partsOnSale = [
    ["wheel", "36", Colors.blue, "lib/icons/battery.png"],
    ["brakes", "45", Colors.red, "lib/icons/battery.png"],
    ["rotors", "84", Colors.purple, "lib/icons/battery.png"],
    ["rims", "95", Colors.brown, "lib/icons/battery.png"]
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

class InteriorTab extends StatefulWidget {
  InteriorTab({super.key});

  @override
  State<InteriorTab> createState() => _InteriorTabState();
}

class _InteriorTabState extends State<InteriorTab> {
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
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EngineTile(
            partType: partsOnSale[index][0],
            partPrice: partsOnSale[index][1],
            tileColor: partsOnSale[index][2],
            imageName: partsOnSale[index][3]);
      },
    );
  }
}

class ExteriorTab extends StatefulWidget {
  ExteriorTab({super.key});

  @override
  State<ExteriorTab> createState() => _ExteriorTabState();
}

class _ExteriorTabState extends State<ExteriorTab> {
  List partsOnSale = [
    ["steering wheel", "35", Colors.blue, "lib/icons/exterior.png"],
    ["spekaers", "45", Colors.red, "lib/icons/exterior.png"],
    ["navigation", "84", Colors.purple, "lib/icons/exterior.png"],
    ["dome light", "95", Colors.brown, "lib/icons/exterior.png"],
    ["steering wheel", "36", Colors.blue, "lib/icons/exterior.png"],
    ["spekaers", "45", Colors.red, "lib/icons/exterior.png"],
    ["navigation", "84", Colors.purple, "lib/icons/exterior.png"],
    ["dome light", "95", Colors.brown, "lib/icons/exterior.png"]
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: partsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
