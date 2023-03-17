import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/onboard_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
        viewModel: OnBoardViewModel(),
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