import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {

  static final storage = FirebaseStorage.instance;

  static Future<String> upload({required String path, required File file})async{
    // Reference reference = storage.ref(path).child("${DateTime.now().toIso8601String()}${file.path.substring(file.path.lastIndexOf('.'))}");
    Reference reference = storage.ref(path).child("profile_image${file.path.substring(file.path.lastIndexOf('.'))}");
    UploadTask task = reference.putFile(file);
    await task.whenComplete((){});
    log(reference.fullPath);
    return reference.getDownloadURL();
  }

  static Future<void> update({required String path, required File file}) async {
    Reference reference = storage.ref(path);
    await reference.putFile(file);
  }

  static Future<String?> getData({required String path}) async {
    final Reference reference = storage.ref(path);
    try {
      final String getDownloadURL = await reference.getDownloadURL();
      return getDownloadURL;
    } catch (e) {
      return null;
    } 
  }

  static Future<(List<String>,List<String>)> getAllData({required String path})async{
    List<String> nameList = [];
    List<String> linkList = [];
    final Reference reference = storage.ref(path);
    final ListResult listResult = await reference.listAll();
    for (var e in listResult.items) {
      nameList.add(e.name);
      linkList.add(await e.getDownloadURL());
    }
    return (nameList,linkList);
  }

  static Future<void> deletePath({required String path})async{
    try {
      final Reference reference = storage.ref(path);
      await reference.delete();
    } catch (e) {
      //
    }
  }

  static Future<void> delete({required String url})async{
    try {
      final Reference reference = storage.refFromURL(url);
      await reference.delete();
    } catch (e) {
      //
    }
  }
}