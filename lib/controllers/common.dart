
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibleProvider = StateProvider((ref) => false);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) => navigatorKey);