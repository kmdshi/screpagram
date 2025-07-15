import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BaseRegScreen extends StatefulWidget {
  const BaseRegScreen({super.key});

  @override
  State<BaseRegScreen> createState() => _BaseRegScreenState();
}

class _BaseRegScreenState extends State<BaseRegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png'),
              SizedBox(height: 40),
              Text(
                'Добро пожаловать в Screpagram!',
              ),
              Text(
                'Давайте создам ваш аккаунт!',
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Прозвище'),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(hintText: 'Почта'),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(hintText: 'Пароль'),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(hintText: 'Подтверждение пароля'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () =>
                    context.router.push(AddingAdditionalInfoRoute()),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
