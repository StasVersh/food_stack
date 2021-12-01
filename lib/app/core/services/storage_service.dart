import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageService {
  Future<String> uploadFile(File file) async {
    var url = '';
    await firebase_storage.FirebaseStorage.instance
        .ref('images/${file.path}')
        .putFile(file)
        .then((p0) async {
      url = await firebase_storage.FirebaseStorage.instance
          .ref('images/${file.path}')
          .getDownloadURL();
    });
    return url;
  }
}
