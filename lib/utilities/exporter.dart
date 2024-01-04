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
export 'package:riverpod_extreme/utilities/implementations/form_controller.dart';

// utils
export 'package:riverpod_extreme/utilities/custom_snack.dart';
export 'package:riverpod_extreme/utilities/ref_extension.dart';

const storageContainer = "Extreme";
final storage = GetStorage();
