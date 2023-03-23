import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewmodel>(
        viewModel: SplashScreenViewmodel(),
        onModelReady: (viewmodel) {
          viewmodel.setContext(context);
          viewmodel.init();
        },
        onPageBuilder: (context, viewmodel) {
           return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
           );
        },
     );
  }
}