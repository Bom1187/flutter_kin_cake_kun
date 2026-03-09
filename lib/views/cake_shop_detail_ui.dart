// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun/models/cake_shop.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatelessWidget {
  final CakeShop cakeShop;

  CakeShopDetailUi({super.key, required this.cakeShop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ปิดปุ่มย้อนกลับอัตโนมัติ
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
        child: Column(
          children: [
            SizedBox(height: 50),

            buildImage(cakeShop.image2!),
            SizedBox(height: 25),
            // รูปภาพ 3 รูป
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildImage(cakeShop.image1!),
                buildImage(cakeShop.image3!),
              ],
            ),

            SizedBox(height: 25),

            // กล่องข้อมูลร้าน
            Container(
              height: 350,
              margin: EdgeInsets.symmetric(horizontal: 60),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // ชื่อร้าน
                  Row(
                    children: [
                      Icon(Icons.store),
                      SizedBox(width: 10),
                      Text(
                        cakeShop.name!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  // ที่อยู่
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        cakeShop.address!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),

                  SizedBox(height: 25),

                  // โทร
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        cakeShop.phone!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  // เว็บไซต์
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.orange),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        cakeShop.website!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),

                  SizedBox(height: 25),

                  // facebook
                  Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        cakeShop.facebook!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ],
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
