import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/core/initialization/widget/custom_snackbar.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class AddingAdditionalInfoScreen extends StatefulWidget {
  const AddingAdditionalInfoScreen({super.key});

  @override
  State<AddingAdditionalInfoScreen> createState() =>
      _AddingAdditionalInfoScreenState();
}

class _AddingAdditionalInfoScreenState
    extends State<AddingAdditionalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.read<UserCubit>().setUser(state.user!);
          context.router.replace(const RootRoute());
        } else if (state is AuthFailure) {
          showCustomSnackBar(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Дополнительная информация')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Давайте заполним еще немного данных о вас!'),
              const SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: 'Фамилия')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Имя')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Отчество')),
              SizedBox(height: 15),
              TextField(
                  decoration:
                      InputDecoration(labelText: 'Дата рождения (ДД.ММ.ГГГГ)')),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(
                      labelText: 'Пол (Муж / Жен / Не указывать)')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Гражданство')),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(labelText: 'Город рождения')),
              SizedBox(height: 30),
              Text('Адрес регистрации',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Страна')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Город')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Улица')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Дом')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Корпус')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Квартира')),
              SizedBox(height: 30),
              Text('Контакты', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TextField(
                  decoration:
                      InputDecoration(labelText: 'Дополнительный телефон')),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(labelText: 'Резервная почта')),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(
                      labelText: 'Ссылка на Telegram / WhatsApp')),
              SizedBox(height: 30),
              Text('Паспортные данные',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(labelText: 'Тип документа')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Серия')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Номер')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Дата выдачи')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Кем выдан')),
              SizedBox(height: 30),
              Text('Дополнительно',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TextField(
                  decoration: InputDecoration(labelText: 'Семейное положение')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Образование')),
              SizedBox(height: 15),
              TextField(decoration: InputDecoration(labelText: 'Род занятий')),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(labelText: 'Интересы / Хобби'),
                maxLines: 3,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AddAdditInfoEvent());
                },
                child: const Text('Продолжить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
