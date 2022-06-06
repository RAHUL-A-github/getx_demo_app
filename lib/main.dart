import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // localeResolutionCallback: (locale, supportedLocales) {
      //     if (supportedLocales.contains(locale)) {
      //       return locale;
      //     }
      //
      //     if (locale?.languageCode == 'en') {
      //       return const Locale('en', 'US');
      //     }
      //     return const Locale('pt', 'BR');
      //   },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Easy localization'),
    );

    //   GetMaterialApp(
    //   title: 'GetX Demo App',
    //   locale: _locale,
    //   localeResolutionCallback: (locale, supportedLocales) {
    //     if (supportedLocales.contains(locale)) {
    //       return locale;
    //     }
    //
    //     if (locale?.languageCode == 'en') {
    //       return const Locale('en', 'US');
    //     }
    //     return const Locale('pt', 'BR');
    //   },
    //   localizationsDelegates: [
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //     LocalJsonLocalization.delegate,
    //   ],
    //   supportedLocales: const [
    //     Locale('pt', 'BR'),
    //     Locale('en', 'US'),
    //   ],
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'GetX Demo App'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.home_title).tr(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTextFieldView(),
              const SizedBox(
                height: 20,
              ),
              _buildButtonView(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextFieldView() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      child: TextField(
        controller: controller.ctrl,
        onChanged: (value) {
          controller.upDate();
        },
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
          counterText: '',
          labelText: 'Enter Name',
          border: InputBorder.none,
        ),
      ),
    );
  }

  _buildButtonView() {
    return GestureDetector(
      onTap: ()
      {
        controller.goToNexPage();
      },
      child: Container(
        height: 67,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => Text(
              controller.buttonName.value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
