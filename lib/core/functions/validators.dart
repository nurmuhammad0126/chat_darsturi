String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email kiritish zarur';
  }
  // Email formatini tekshirish
  const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  final regExp = RegExp(emailPattern);
  if (!regExp.hasMatch(value)) {
    return 'Email noto‘g‘ri formatda';
  }
  return null;
}


String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Parol kiritish zarur';
  }
  if (value.length < 6) {
    return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
  }
  return null;
}
