import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyz_prototype/models/application_models.dart';

class CloudStorageService {
  Future<List<String>> uploadGigPhotos({
    List<XFile>? imagesToUpload,
    required String title,
    required Client client,
  }) async {
    List<String> cloudStorageResult = [];

    if (imagesToUpload != null) {
      for (var imageInList in imagesToUpload) {
        var counter = 1;

        var imageFileName = title.replaceAll("\\s+", "") +
            '-' +
            counter.toString() +
            '-' +
            DateTime.now().millisecondsSinceEpoch.toString();

        final Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('userFiles')
            .child(client.clientId)
            .child('gigPhotos')
            .child(imageFileName);

        UploadTask uploadTask =
            firebaseStorageRef.putFile(File(imageInList.path));

        TaskSnapshot storageSnapshot = await uploadTask;

        var downloadUrl = await storageSnapshot.ref.getDownloadURL();

        var url = downloadUrl.toString();

        cloudStorageResult.add(url);
        counter++;
      }
    }

    return cloudStorageResult;
  }
}
