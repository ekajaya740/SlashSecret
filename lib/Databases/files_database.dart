class FilesDatabase {
  String fileName;
  bool isLocked = false;
  String fileContent;

  FilesDatabase(
      {required this.fileName,
      required this.isLocked,
      required this.fileContent});
}

List<FilesDatabase> files = [];
