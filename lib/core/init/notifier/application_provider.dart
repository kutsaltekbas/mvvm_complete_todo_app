import 'package:mvvm_complete_todo_app/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class ApplicationProvider {
  static final ApplicationProvider _instance = ApplicationProvider._init();

  static ApplicationProvider get instance => _instance;
  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
   
  ];
  List<SingleChildWidget> uiChangesItems = [];


}