
extension ListExtensions<T> on List<T> {
  // Check if the list is null or empty
  bool get isNullOrEmpty => isEmpty;

  // Get the first element or null
  T? get firstOrNull => isNotEmpty ? this[0] : null;

  // Get the last element or null
  T? get lastOrNull => isNotEmpty ? this[lastIndex] : null;

  // Get the last index
  int get lastIndex => length - 1;

  // Remove duplicates
  List<T> distinct() => toSet().toList();
}