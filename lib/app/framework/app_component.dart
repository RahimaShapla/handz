import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../helper/constant/constants.dart';
import '../../helper/router/custom_router.dart';
import '../../helper/router/route_constants.dart';
import 'app_provider.dart';
import 'handz_application.dart';

class AppComponent extends StatefulWidget {
  final HandzApplication? application;

  const AppComponent({Key? key, this.application}) : super(key: key);

  @override
  State<AppComponent> createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await widget.application!.onTerminate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: kPrimaryOrangeColor,
        primaryColorDark: kSecondaryOrangeColor,
        primaryColorLight: kLightOrangeColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: kSecondaryOrangeColor.withOpacity(.5),
          cursorColor: kSecondaryOrangeColor,
          selectionHandleColor: Colors.transparent,
        ),
      ),
      onGenerateRoute: CustomRouter.generatedRoute,
      initialRoute: splash,
    );
    final appProvider =
        AppProvider(application: widget.application!, child: app);
    return appProvider;
  }
}
