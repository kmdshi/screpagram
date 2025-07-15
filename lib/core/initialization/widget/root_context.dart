import 'package:screpagram/core/initialization/dependency_scope.dart';
import 'package:screpagram/core/initialization/logic/composition_root.dart';
import 'package:screpagram/core/initialization/widget/material_context.dart';
import 'package:flutter/material.dart';

class RootContext extends StatelessWidget {
  const RootContext({required this.compositionResult, super.key});

  final CompositionResult compositionResult;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: compositionResult.dependencies,
      child: MaterialContext(),
    );
  }
}
