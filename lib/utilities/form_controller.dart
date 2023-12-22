import 'dart:async';

import 'package:riverpod_extreme/utilities/exporter.dart';

/// Abstract class to define AutoDisposableFamilyNotifier Controller
abstract class FormController<T> extends AutoDisposeFamilyNotifier<T, T?> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get isValidated => formKey.currentState!.validate();
  FormState get formState => formKey.currentState!;
  @override
  T build(T? arg);
  updateState();
  handleSubmit(BuildContext context);
}

/// Abstract class to define AutoDisposableFamilyAsyncNotifier Controller
abstract class AsyncFormController<T>
    extends AutoDisposeFamilyAsyncNotifier<T, T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get isValidated => formKey.currentState!.validate();
  FormState get formState => formKey.currentState!;
  @override
  FutureOr<T> build(T? arg);
  updateState();
  handleSubmit(BuildContext context);
}
