class FolderDatabase {
  String folderName;
  bool isLocked = false;
  String folderContent = "";

  FolderDatabase(
      {required this.folderName,
      required this.isLocked,
      required this.folderContent});
}

var folders = [
  FolderDatabase(
      folderName: 'Secret', isLocked: true, folderContent: "This is Secret"),
  FolderDatabase(folderName: "folderNameaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", isLocked: false, folderContent: "folderContent")
];
