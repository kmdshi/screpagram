import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/initialization/widget/custom_snackbar.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/auth/domain/entities/person_entity.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class BaseRegScreen extends StatefulWidget {
  const BaseRegScreen({super.key});

  @override
  State<BaseRegScreen> createState() => _BaseRegScreenState();
}

class _BaseRegScreenState extends State<BaseRegScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.router.push(AddingAdditionalInfoRoute());
        } else if (state is AuthFailure) {
          showCustomSnackBar(context, state.message);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png'),
              const SizedBox(height: 40),
              const Text('Добро пожаловать в Screpagram!'),
              const Text('Давайте создадим ваш аккаунт!'),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Почта'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Пароль'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: 'Подтверждение пароля'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _onRegisterPressed,
                child: const Text('Продолжить'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showCustomSnackBar(context, 'Заполните все поля');
      return;
    }

    if (password != confirmPassword) {
      showCustomSnackBar(context, 'Пароли не совпадают');
      return;
    }

    context.read<AuthBloc>().add(SignUpEvent(pass: password, email: email));
  }
}
