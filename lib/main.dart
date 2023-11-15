import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/my_app.dart';
import 'package:flutter_application_2/app/my_app_model.dart';
import 'package:flutter_application_2/library/widgets/inherited/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  const app = MyApp();
  final widget = Provider(model: model, child: app);
  runApp(widget);
}
