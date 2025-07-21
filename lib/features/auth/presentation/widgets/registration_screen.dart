import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationRoute extends StatefulWidget {
  const RegistrationRoute({super.key});

  @override
  State<RegistrationRoute> createState() => _RegistrationRouteState();
}

class _RegistrationRouteState extends State<RegistrationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: AutoRouter());
  }
}
