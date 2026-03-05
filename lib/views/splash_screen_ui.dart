// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun/views/cake_shop_list._ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
    void initState() {
    // หน่วงเวลา เมื่อครบกำหนดให้เปิดหน้าจอ HomeUI แบบย้อนกไม่ได้
    Future.delayed(
      // ระยะเวลาที่หน่วง
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CakeShopListUi(),
          )
        );
      },
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/bg_welcome.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                'สายด่วนกินเคก',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 18, 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'CAKE CALL FAST',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 18, 1),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CircularProgressIndicator(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
