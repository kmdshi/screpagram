import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/presentation/bloc/actions/actions_bloc.dart';

@RoutePage()
class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ActionsBloc>().add(LoadActionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Уведомления")),
      body: BlocBuilder<ActionsBloc, ActionsState>(
        builder: (context, state) {
          if (state is ActionsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ActionsFailure) {
            return Center(child: Text("Ошибка: ${state.message}"));
          }

          if (state is ActionsLoaded) {
            final actions = state.actions;

            if (actions.isEmpty) {
              return const Center(child: Text("Уведомлений пока нет."));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: actions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final action = actions[index];
                return _ActionItem(action: action);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final ActionModel action;

  const _ActionItem({required this.action});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(action.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(action.description),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatTimestamp(action.timestamp),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              if (action.type == ActionType.friendRequest)
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ActionsBloc>()
                        .add(AcceptFriendRequestEvent(action));
                  },
                  child: const Text("Принять"),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inMinutes < 60) return "${diff.inMinutes} мин назад";
    if (diff.inHours < 24) return "${diff.inHours} ч назад";
    return "${diff.inDays} дн назад";
  }
}
