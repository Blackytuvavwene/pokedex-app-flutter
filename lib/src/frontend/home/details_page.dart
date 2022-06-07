import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_app_flutter/src/src.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)?.settings.arguments as dynamic;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          upperCaseFirstLetter(args['name']) ?? 'Pokemon',
          style: const TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          color: Colors.black87,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(args?.toString() ?? 'No data'),
        ),
      ),
    );
  }
}
