import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/features/profile/widget/statistics_widget.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(user?.nickname ?? 'Гражднанин №'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                  ),
                  SizedBox(height: 15),
                  Text('${user?.friends.length} Связей • 1 Группа'),
                  SizedBox(height: 15),
                  StatisticsWidget(),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Изменить профиль'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('История активности'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Выйти из системы'),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
