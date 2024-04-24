class MedicalRecordType {
  final String name;
  final String collectionPath;

  MedicalRecordType(this.name, this.collectionPath);
}

final List<MedicalRecordType> recordTypes = [
  MedicalRecordType('Lab Test Result', 'LabTestResults'),
  MedicalRecordType('X-Rays', 'X-Rays'),
  MedicalRecordType('Family History', 'FamilyHistory'),
  MedicalRecordType('More', 'More'), // Can handle other types dynamically
];
