import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/widgets/loader/loader_view_model.dart';
import 'package:provider/provider.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black26,
        ),
      ),
    );
  }
}
