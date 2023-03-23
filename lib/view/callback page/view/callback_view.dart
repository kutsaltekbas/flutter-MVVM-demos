import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/callback_view_model.dart';

class CallBackView extends StatelessWidget {
  const CallBackView({Key? key, required this.callbackFunc}) : super(key: key);
  final VoidCallback callbackFunc;
  
  @override
  Widget build(BuildContext context) {
    return BaseView<CallBackViewModel>(
      viewModel: CallBackViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Callback Page"),
          ),
          backgroundColor: Colors.grey.shade300,
          body: Center(
            child: ElevatedButton(
              child: Text("callback"),
              onPressed: callbackFunc,
            ),
          ),
        );
      },
    );
  }
}
