import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../widgets/custom_button.dart';

class VisitorQRCodeScreen extends StatelessWidget {
  final Map<String, dynamic>? arguments;
  const VisitorQRCodeScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    final String _name = arguments?['name'] ?? 'Unknown Name';
    final String _visitDate = arguments?['visitDate'] ?? '2023-01-01';
    final String _visitTime = arguments?['visitTime'] ?? '12:00:00';
    final String formattedDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(_visitDate));
    final String formattedTime =
        DateFormat('hh:mm a').format(DateTime.parse(_visitTime));

    Future<void> _shareImageWithText() async {
      try {
        final byteData = await rootBundle.load(AppAssets.qrCode);
        final tempDir = await getTemporaryDirectory();
        final tempFilePath = '${tempDir.path}/qr_code.png';
        final file = File(tempFilePath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
        await Share.shareXFiles(
          [XFile(tempFilePath)],
          text: 'Scan Your QR Code To Get Your Visiting Data',
        );
      } catch (e) {
        debugPrint('Error sharing image and text: $e');
      }
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0.h,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.man),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 300.h,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                AppAssets.qrCode,
                height: 180.h,
                width: 180.w,
              ),
            ),
          ),
          Positioned(
            bottom: 350.h,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  AppStrings.yourCode,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.lightBlueColor),
                ),
                SizedBox(height: 4.h),
                Text(
                  AppStrings.successQuote,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 230.h,
            right: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: AppColors.whiteColor,
                    child: Image.asset(
                      AppAssets.userIcon,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$formattedDate - $formattedTime',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 185.h,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                AppStrings.shareCodeString,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Positioned(
            bottom: 30.h,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomButton(
                    onTap: () {
                      _shareImageWithText();
                      // Share.share(
                      //   'Your Visiting Data is:\nname: $_name\nvisitDate: $_visitDate\nvisitTime: $_visitTime',
                      // );
                    },
                    buttonString: AppStrings.shareButton,
                    hasImage: false,
                  ),
                  SizedBox(height: 10.h),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.initialRoute, (route) => false);
                    },
                    child: Text(
                      AppStrings.backHome,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
