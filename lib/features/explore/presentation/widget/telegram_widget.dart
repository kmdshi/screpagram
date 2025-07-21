import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramWidget extends StatelessWidget {
  const TelegramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: Image.asset('assets/images/tele_logo.png', width: 40),
        title: const Text('Пока что объединение у нас одно — Телега.'),
        onTap: () => _openTelegram(context),
      ),
    );
  }

  Future<void> _openTelegram(BuildContext ctx) async {
    const telegramPackage = 'org.telegram.messenger';
    final isInstalled = await LaunchApp.isAppInstalled(
      androidPackageName: telegramPackage,
    );

    if (isInstalled) {
      await LaunchApp.openApp(
        androidPackageName: telegramPackage,
        openStore: true,
      );
    } else {
      final url = Uri.parse('https://t.me/kmdshi_pub');
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('Не удалось открыть Telegram')),
        );
      }
    }
  }
}
