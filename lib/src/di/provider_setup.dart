import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<SearchViewModel>(create: (context) => SearchViewModel()),
  ];

  List<SingleChildWidget> globalProviders = [
    ...viewModels,
  ];