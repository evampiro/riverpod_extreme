import 'package:riverpod_extreme/utilities/exporter.dart';

abstract class ListController<T> extends Notifier<List<T>> {
  @override
  List<T> build() {
    return load();
  }

  /// flag for State Persistance
  bool useStorage = true;

  switchUseStorage() {
    useStorage = !useStorage;
    state = load();
  }

  /// Defines the value of key for read/write in storage
  final String key = "key";

  /// Method to convert json String into [List]
  List<T> fromStorage(String data);

  /// Method to convert current state [List] into json String
  String toStorage();

  /// Load state from storage using [key]
  List<T> load() {
    if (useStorage) {
      final list = storage.read(key);
      if (list != null) {
        return fromStorage(list);
      }
    }

    return [];
  }

  /// Store current state into storage using [key]
  store() {
    if (useStorage) storage.write(key, toStorage());
  }

  add(T model) {
    state = [...state..add(model)];
    store();
  }

  update(int index, {required T model}) {
    state = [...state..[index] = model];
    store();
  }

  remove(int index) {
    state = [...state..removeAt(index)];
  }

  /// Condition for findById
  bool findById(T element, T current);

  /// Handles add or edit to list based on findById
  handleSubmit(T model) {
    final index = state.indexWhere((element) => findById(element, model));
    if (index == -1) {
      add(model);
    } else {
      update(index, model: model);
    }
  }

  /// Set the Form Widget
  Widget formWidget(T? model);

  /// Navigate to user form
  ///
  /// ```dart
  ///  model determines weather to show Add or Edit form
  ///  if(model==null) Add else Edit
  ///
  /// formWIdget is used as Widget
  /// ```
  ///
  void showForm(BuildContext context, {T? model}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => formWidget(model)));
  }
}
