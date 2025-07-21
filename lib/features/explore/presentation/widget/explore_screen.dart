import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:screpagram/features/explore/presentation/widget/people_tab_widget.dart';
import 'package:screpagram/features/explore/presentation/widget/posts_tab_widget.dart';
import 'package:screpagram/features/explore/presentation/widget/telegram_widget.dart';

@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<ExploreBloc>().add(LoadExploreUsersEvent());
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      switch (_tabController.index) {
        case 0:
          context.read<ExploreBloc>().add(LoadExploreUsersEvent());
          break;
        case 1:
          break;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Люди'),
                Tab(text: 'Посты'),
                Tab(text: 'Объединения'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  PeopleTabWidget(),
                  PostsTabWidget(),
                  Center(child: TelegramWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
