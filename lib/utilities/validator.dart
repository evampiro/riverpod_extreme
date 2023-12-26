String? validate(String? value, {String? label}) {
  if (value != null && value.isNotEmpty) return null;
  return "${label ?? "Field"} cannot be empty";
}
