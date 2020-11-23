import 'package:flutter/material.dart';
import 'package:valorant_self_statistics/ui/ValorantApp.dart';

import 'dao/Database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ValorantDatabase.populateDatabaseIfEmpty();
  runApp(ValorantApp());
}