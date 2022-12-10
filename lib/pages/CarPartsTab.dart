import 'package:flutter/material.dart';
import 'package:motore/pages/PartTile.dart';
import 'package:motore/pages/carSpecCard.dart';

class EngineTab extends StatefulWidget {
  EngineTab({super.key});

  @override
  State<EngineTab> createState() => _EngineTabState();
}

class _EngineTabState extends State<EngineTab> {
  
  List partsOnSale = [
    // exampleURL = https://www.autozone.com/searchresult?searchText=MODEL%20MAKE%20PARTNAME
    // [ partName, partPrice, tileColor, imageName ]

    ["Driveshaft", "45", Colors.red, "lib/images/driveshaft.png",],
    ["Clutches", "84", Colors.purple, "lib/images/clutch.png",],
    ["Transmission", "95", Colors.brown, "lib/images/transmission.png"],
    ["Spark Plug", "36", Colors.blue, "lib/images/spark-plug.png"],

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
            imageName: partsOnSale[index][3],
            url: "https://www.autozone.com/searchresult?searchText=" + selMake + " " + selModel + " " + partsOnSale[index][0]);
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
    ["Wheels", "36", Colors.blue, "lib/images/wheel.png"],
    ["Brakes", "45", Colors.red, "lib/images/brakes.png"],
    ["Rotors", "84", Colors.purple, "lib/icons/brake.png"],
    ["Axle", "95", Colors.brown, "lib/images/axle.png"],
    ["Bearings", "36", Colors.blue, "lib/images/bearing.png"],
    ["Wheel Hub", "45", Colors.red, "lib/images/hub.png"],
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
            url: "https://www.autozone.com/searchresult?searchText=" + selMake + " " + selModel + " " + partsOnSale[index][0]);
      },
    );
  }
}

class BatteryTab extends StatefulWidget {
  BatteryTab({super.key});

  @override
  State<BatteryTab> createState() => _BatteryTabState();
}

class _BatteryTabState extends State<BatteryTab> {
  List partsOnSale = [
    ["Batteries", "36", Colors.blue, "lib/icons/battery.png"],
    ["Headlights", "45", Colors.red, "lib/images/headlight.png"],
    ["Tailight", "84", Colors.purple, "lib/images/taillight.png"],
    ["Electric Module", "95", Colors.brown, "lib/images/ecm.png"],
    ["Alternator", "36", Colors.blue, "lib/images/alternator.png"],
    ["Starter", "45", Colors.red, "lib/images/starter.png"],
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
            url: "https://www.autozone.com/searchresult?searchText=" + selMake + " " + selModel + " " + partsOnSale[index][0]);
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
    ["steering wheel", "36", Colors.blue, "lib/images/steering-wheel.png"],
    ["Air Conditioner", "45", Colors.red, "lib/images/air-conditioner.png"],
    ["Heating", "84", Colors.purple, "lib/images/climatization.png"],
    ["Seats", "95", Colors.brown, "lib/images/car-seat.png"],
    ["Mats", "36", Colors.blue, "lib/images/mats.png"],
    ["Speakers", "45", Colors.red, "lib/images/speaker.png"],
    ["Navigation", "84", Colors.purple, "lib/images/tracking.png"],
    ["Dome Light", "95", Colors.brown, "lib/images/dome-light.png"]
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
            url: "https://www.autozone.com/searchresult?searchText=" + selMake + " " + selModel + " " + partsOnSale[index][0]);
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
    ["Bumper", "36", Colors.blue, "lib/images/bumper.png"],
    ["Fender", "45", Colors.red, "lib/images/fender.png"],
    ["Heating", "84", Colors.purple, "lib/images/fog-lamp.png"],
    ["Grille", "95", Colors.brown, "lib/images/grille.png"],
    ["Hood", "36", Colors.blue, "lib/images/bonnet.png"],
    ["Mirrors", "45", Colors.red, "lib/images/side-mirror.png"],
    ["Windshield", "84", Colors.purple, "lib/images/windshield.png"],
    ["Wiper Blades", "95", Colors.brown, "lib/images/wiper.png"]
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
            url: "https://www.autozone.com/searchresult?searchText=" + selMake + " " + selModel + " " + partsOnSale[index][0]);
      },
    );
  }
}
