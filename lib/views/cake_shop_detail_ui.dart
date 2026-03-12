// ignore_for_file: prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun/models/cake_shop.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CakeShopDetailUi extends StatelessWidget {
  final CakeShop cakeShop;

  CakeShopDetailUi({super.key, required this.cakeShop});

// เมธอตโทร
  Future<void> _makePhoneCall(String phoneNumber) async { 
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

// เมธอตเปิดลิงก์ในเบราว์เซอร์
    Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 2, 2),
        centerTitle: true,
        title: Text(
          cakeShop.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              buildImage(cakeShop.image2!),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildImage(cakeShop.image1!),
                  buildImage(cakeShop.image3!),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.store),
                  SizedBox(width: 10),
                  Text(
                    cakeShop.name!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                cakeShop.description!,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.timer_sharp, color: Colors.lightBlue),
                  SizedBox(width: 10),
                  Text(
                    'เวลาเปิด/ปิด',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  cakeShop.openCloseTime!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'ที่อยู่ร้าน',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  cakeShop.address!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  _makePhoneCall(cakeShop.phone!);
                },
                child: Text(
                  '📞 ${cakeShop.phone}',
                  style: TextStyle(color:Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    50,
                  ),
                ),
              ),
              SizedBox(height: 25),
              ListTile(
                onTap: (){
                  _launchInBrowser(
                    Uri.parse(cakeShop.website!),
                  );
                },
                leading: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.pink,
                  size: 50,
                ),
                title: Text(
                  cakeShop.website!,
                  style: TextStyle(color: Colors.pink),
                ),
                trailing: Icon(
                  FontAwesomeIcons.link,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: (){
                  _launchInBrowser(
                    Uri.parse(cakeShop.facebook!),
                  );
                  
                },
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 250,
                width: 300,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(
                      double.parse(cakeShop.latitude!),
                      double.parse(cakeShop.longitude!),
                    ),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            double.parse(cakeShop.latitude!),
                            double.parse(cakeShop.longitude!),
                          ),
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String img) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/$img',
        width: 150,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
