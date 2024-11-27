import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class VisitorQRCodeScreen extends StatelessWidget {
  const VisitorQRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 392.0.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.opsMan),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 45.h,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                bottom: -100.h,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    AppAssets.qrCode,
                    height: 120.0.h,
                    width: 120.0.w,
                  ),
                ),
              )
            ],
          ),

          // QR Code Section
          const SizedBox(height: 20),
          const Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Your Visitor QR Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'was generated successfully!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          // Visitor Info Section
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF122D3E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.grey),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad Ali Mostafa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '13/12/2024 • 12:03 pm',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Spacer to push buttons to the bottom
          const Spacer(),

          // Button Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DA1F2),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Share This QR Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back To Home',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
