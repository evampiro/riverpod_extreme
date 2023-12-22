// import 'package:audioplayers/audioplayers.dart';
import 'package:get_storage/get_storage.dart';
// import "package:http/http.dart" as http;
// packages
export 'package:get_storage/get_storage.dart';
export 'package:flutter/material.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:hooks_riverpod/hooks_riverpod.dart';

// models
export 'package:riverpod_extreme/features/user/domain/user_model.dart';

// classes
export 'package:riverpod_extreme/utilities/form_controller.dart';

const storageContainer = "Extreme";
final storage = GetStorage();
