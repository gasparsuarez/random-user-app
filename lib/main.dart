import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/presentation/app.dart';

void main() {
  ServiceLocator.setup();
  runApp(const MyApp());
}
