import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
            TextField(decoration: InputDecoration(labelText: 'Город рождения')),
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
            TextField(decoration: InputDecoration(labelText: 'Тип документа')),
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
                // обработка
              },
              child: const Text('Продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}
