import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Utility {
  // Logger
  final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    colors: true,
    printEmojis: true,
    printTime: false,
    )
  );
  // Test Logger
  void testLogger() {
    logger.t('Verbose log');
    logger.d('Debug log');
    logger.i('Info log');
    logger.w('Warning log');
    logger.e('Error log');
    logger.f('What a terrible failure log');
  }
  // Check Network Connection
  static Future<String> checkNetwork() async {
    
    var checkNetwork = await Connectivity().checkConnectivity();

    if(checkNetwork == ConnectivityResult.none){
      return '';
    } else if(checkNetwork == ConnectivityResult.mobile){
      return 'mobile';
    } else if(checkNetwork == ConnectivityResult.wifi){
      return 'wifi';
    }
    
    return '';

  }

  // Alert Dialog
  static showAlertDialog(context, title, content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      }
    );
  }

}