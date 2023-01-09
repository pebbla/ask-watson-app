import 'package:ask_watson_app/src/presentation/cafe/cafe_view_model.dart';
import 'package:ask_watson_app/src/presentation/main/main_view_model.dart';
import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<MainViewModel>(create: (context) => MainViewModel()),
    ChangeNotifierProvider<SearchViewModel>(create: (context) => SearchViewModel()),
    ChangeNotifierProvider<CafeViewModel>(create: (context) => CafeViewModel()),
  ];

  List<SingleChildWidget> globalProviders = [
    ...viewModels,
  ];