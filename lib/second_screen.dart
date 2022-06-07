import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'generated/locale_keys.g.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.second_screen).tr(),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(LocaleKeys.second_screen).tr(),
            ElevatedButton(
              child: const Text(LocaleKeys.change_value).tr(),
              onPressed: () async {
                if (context.locale == const Locale('en', 'US')) {
                  //context.setLocale(const Locale('pt', 'BR'));
                  // context.setLocale(context.supportedLocales[1]);
                  const _newLocale = Locale('pt', 'BR');
                  await context.setLocale(_newLocale);
                  Get.updateLocale(_newLocale);
                } else {
                  //context.setLocale(const Locale('en', 'US'));
                  // context.setLocale(context.supportedLocales[0]);
                  const _newLocale = Locale('en', 'US');
                  await context.setLocale(_newLocale);
                  Get.updateLocale(_newLocale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
