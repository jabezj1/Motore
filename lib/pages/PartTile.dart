import 'package:flutter/material.dart';
import 'package:motore/pages/InspectPastMaintenance.dart';
import 'package:url_launcher/url_launcher.dart';
// sellModel and sellMake
String newUrl = "test.com";

class EngineTile extends StatefulWidget {
  final String partType;
  final String partPrice;
  final tileColor;
  final String imageName;
  final String url;

  const EngineTile({
    super.key,
    required this.partType,
    required this.partPrice,
    required this.tileColor,
    required this.imageName,
    required this.url
  });
  @override
  State<EngineTile> createState() => _EngineTileState();
}

class _EngineTileState extends State<EngineTile> {
  final double borderRadius = 12;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Uri part_url = Uri.parse(widget.url);
        if(await canLaunchUrl(part_url)){
        await launchUrl(part_url);
      }},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.tileColor[50],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              // price
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: widget.tileColor[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius),
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '\$${widget.partPrice}',
                      style: TextStyle(
                        color: widget.tileColor[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              // part picture
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
                child: Image.asset(widget.imageName),
              ),

              // part type
              Text(
                widget.partType,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'CarPart',
                style: TextStyle(color: Colors.grey[600]),
              ),

              // add button
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // plus button
                    // Icon(
                    //   Icons.add,
                    //   color: Colors.grey[800],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
