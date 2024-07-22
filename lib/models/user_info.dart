class UserInfo {
  final String name;
  final String licenseType;
  final String licenseNumber;
  final String dateOfBirth;
  final String dateOfIssue;

  UserInfo({
    required this.name,
    required this.licenseType,
    required this.licenseNumber,
    required this.dateOfBirth,
    required this.dateOfIssue,
  });

  @override
  String toString() {
    return 'UserInfo{name: $name, licenseType: $licenseType, licenseNumber: $licenseNumber, dateOfBirth: $dateOfBirth, dateOfIssue: $dateOfIssue}';
  }
}
