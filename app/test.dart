import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Page()));

class IncrementButton extends View<IncrementButtonViewModel> {
  IncrementButton({
    required void Function() onIncrementNumber,
    required void Function() onIncrementLetter,
    super.key,
  }) : super(
            viewModelBuilder: () => IncrementButtonViewModel(
                  incrementNumber: onIncrementNumber,
                  incrementLetter: onIncrementLetter,
                ));

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: viewModel.incrementCounter,
      child: Text(viewModel.label, style: const TextStyle(fontSize: 24)),
    );
  }
}

class IncrementButtonViewModel extends ViewModel {
  IncrementButtonViewModel({required this.incrementNumber, required this.incrementLetter});
  final void Function() incrementNumber;
  final void Function() incrementLetter;
  bool isNumber = false;
  String get label => isNumber ? '+a' : '+1';
  void incrementCounter() {
    isNumber ? incrementLetter() : incrementNumber();
    isNumber = !isNumber;
    buildView();
  }
}

class Page extends View<PageViewModel> {
  Page({super.key}) : super(viewModelBuilder: () => PageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(viewModel.letterCounter.value, style: TextStyle(fontSize: 64, color: viewModel.color.value)),
            Text(viewModel.numberCounter.value.toString(), style: TextStyle(fontSize: 64, color: viewModel.color.value))
          ])
        ]),
        floatingActionButton: IncrementButton(
            onIncrementNumber: () => viewModel.incrementNumber(),
            onIncrementLetter: () => viewModel.incrementLetter()));
  }
}

class PageViewModel extends ViewModel {
  late final color = ValueNotifier<Color>(const Color.fromRGBO(0, 0, 0, 1.0))..addListener(buildView);
  late final numberCounter = ValueNotifier<int>(0)..addListener(buildView);
  late final letterCounter = ValueNotifier<String>('a')..addListener(buildView);
  late final StreamSubscription<Color> _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = ColorService.currentColor.listen((newColor) => color.value = newColor);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void incrementNumber() {
    numberCounter.value = numberCounter.value == 9 ? 0 : numberCounter.value + 1;
  }

  void incrementLetter() {
    letterCounter.value = letterCounter.value == 'z' ? 'a' : String.fromCharCode(letterCounter.value.codeUnits[0] + 1);
  }
}

class ColorService {
  static final currentColor = Stream<Color>.periodic(const Duration(seconds: 2), (int i) {
    return <Color>[Colors.red, Colors.green, Colors.blue, Colors.orange][i % 4];
  });
}

abstract class View<T extends ViewModel> extends StatefulWidget {
  View({required this.viewModelBuilder, super.key});

  final T Function() viewModelBuilder;
  final _viewModelInstance = _ViewModelInstance<T>();
  T get viewModel => _viewModelInstance.value!;

  Widget build(BuildContext context);

  @nonVirtual
  @override
  State<View<T>> createState() => _ViewState<T>();
}

class _ViewState<T extends ViewModel> extends State<View<T>> {
  late T _viewModel;

  @override
  void initState() {
    super.initState();
    _initViewModel();
    _viewModel.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _initViewModel() {
    _viewModel = widget.viewModelBuilder();
    _viewModel.buildView = () => setState(() {});
    _viewModel.addListener(_viewModel.buildView);
  }

  @override
  Widget build(BuildContext context) {
    widget._viewModelInstance.value = _viewModel;
    return widget.build(context);
  }
}

class _ViewModelInstance<T> {
  T? value;
}

abstract class ViewModel extends ChangeNotifier {
  @protected
  late void Function() buildView;

  @protected
  @mustCallSuper
  void initState() {}
}
