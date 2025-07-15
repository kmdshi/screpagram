import 'package:screpagram/core/initialization/model/dependency_container.dart';
import 'package:flutter/material.dart';

class DependenciesScope extends InheritedWidget {
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final DependenciesContainer dependencies;

  static DependenciesContainer of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DependenciesScope>()!
      .dependencies;

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) =>
      dependencies != oldWidget.dependencies;
}
