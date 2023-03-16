import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  // "T extends Store" kod parçası Mobx kullanımı içindir.

  const BaseView(
      {super.key,
      this.onDispose,
      required this.viewModel,
      required this.onPageBuilder,
      required this.onModelReady});
  final VoidCallback? onDispose; // Sayfadan çıkıldığında ex olur.
  final T viewModel; // Çizilecek sayfanın alacağı viewModel.
  final Function(BuildContext contex, T value) onPageBuilder; // Sayfayı çizecek olan fonksiyon.
  final void Function(T model) onModelReady; 

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose?.call();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}



