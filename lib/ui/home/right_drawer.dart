import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class RightDrawer extends ConsumerWidget {
  const RightDrawer({
    super.key,
    required this.goal,
  });

  final Goal? goal;

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (goal != null)
            TextButton(
                onPressed: () {
                  context.pop();
                  context.push('/hist/${goal?.id}');
                },
                child: const Text('Event History')),
          if (goal != null) DeactivateButton(goal!),
          const Divider(),
          TextButton(
              onPressed: () =>
                  ref.watch(authNotifierProvider.notifier).logout(),
              child: const Text('Logout'))
        ],
      ),
    );
  }
}

class DeactivateButton extends StatefulWidget {
  const DeactivateButton(this.goal, {super.key});
  final Goal goal;
  @override
  State<DeactivateButton> createState() => _DeactivateButtonState();
}

class _DeactivateButtonState extends State<DeactivateButton> {
  bool showModal = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showModal)
          PortalModal(
            child: Card(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200, maxWidth: 250),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                          'This will end and remove current goal. You will not be able to reactivate it once it has been deactivated.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () => setState(() {
                                  showModal = false;
                                }),
                            child: const Text('Cancel')),
                        Consumer(
                          builder: (context, ref, child) => ElevatedButton(
                              onPressed: () => setState(() {
                                    ref
                                        .watch(goalNotifierProvider.notifier)
                                        .deactivate(widget.goal);
                                    context.pop();
                                    showModal = false;
                                  }),
                              child: const Text('Deactivate')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
            onCancel: () => context.pop(),
          ),
        TextButton(
            onPressed: () {
              setState(() {
                showModal = true;
              });
            },
            child: const Text('Deactivate'))
      ],
    );
  }
}
