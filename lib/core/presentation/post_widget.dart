import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            CircleAvatar(),
            SizedBox(width: 10),
            Text('Гражданин №1232',
                style: TextStyle(fontWeight: FontWeight.w600)),
            Spacer(),
            Text('2 часа назад',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        SizedBox(height: 10),
        const Text(
          'Сегодня я доложил на соседа. Он слишком громко слушал музыку.',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
