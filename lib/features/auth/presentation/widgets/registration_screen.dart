import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  late final TextEditingController nicknameController;
  late final TextEditingController interestsController;
  late final TextEditingController keyPhraseController;

  @override
  void initState() {
    nicknameController = TextEditingController();
    interestsController = TextEditingController();
    keyPhraseController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AutoRouter()
    );
  }
}
