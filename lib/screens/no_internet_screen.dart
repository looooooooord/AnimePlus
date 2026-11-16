import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/network_manager.dart';
import '../theme/tako_theme.dart';
import '../utils/constants.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 80,
          ),
          const SizedBox(height: 3),
          Text(
            'عفوًا!',
            style: TakoTheme.darkTextTheme.displayLarge,
          ),
          const SizedBox(height: 15),
          Text(
            'لا يوجد اتصال بالإنترنت',
            style: TakoTheme.darkTextTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          Text(
            'يرجى التحقق من اتصالك بالإنترنت',
            style: TakoTheme.darkTextTheme.titleSmall,
          ),
          const SizedBox(height: 15),
          MaterialButton(
            onPressed: _onTryAgainPressed,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: tkGradientBlue,
            child: const Text('حاول مرة أخرى'),
          ),
        ],
      ),
    );
  }

  void _onTryAgainPressed() {
    // Manually check if connected to internet
    Get.find<NetworkManager>().checkConnection();
  }
}
