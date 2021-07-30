import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';

class CloudStorageService {
  final log = getLogger('cloudStorageService');
  final _gigService = locator<GigService>();

  Future<List<String>> uploadGigPhotos({
    List<XFile>? imagesToUpload,
    required String title,
    required Client client,
  }) async {
    List<String> cloudStorageResult = [];

    final _loadedGig = _gigService.currentGig;

    if (imagesToUpload != null && _loadedGig != null) {
      for (var imageInList in imagesToUpload) {
        var imageFileName = _loadedGig.gigId ??
            title.replaceAll(" ", "") +
                '_' +
                DateTime.now().millisecondsSinceEpoch.toString();

        final Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('userFiles')
            .child(client.clientId)
            .child('gigPhotos')
            .child(_loadedGig.gigId ?? 'unidentifiedGig')
            .child(imageFileName);

        UploadTask uploadTask =
            firebaseStorageRef.putFile(File(imageInList.path));

        TaskSnapshot storageSnapshot = await uploadTask;

        var downloadUrl = await storageSnapshot.ref.getDownloadURL();

        var url = downloadUrl.toString();

        cloudStorageResult.add(url);
      }
    }

    return cloudStorageResult;
  }

  Future<String> uploadUserAvatar({
    required XFile? imageToUpload,
    required Client client,
  }) async {
    if (imageToUpload != null) {
      var imageFileName = client.clientId +
          '_' +
          DateTime.now().millisecondsSinceEpoch.toString();

      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('userFiles')
          .child(client.clientId)
          .child('userPhotos')
          .child(imageFileName);

      UploadTask uploadTask =
          firebaseStorageRef.putFile(File(imageToUpload.path));

      TaskSnapshot storageSnapshot = await uploadTask;

      var downloadUrl = await storageSnapshot.ref.getDownloadURL();

      var url = downloadUrl.toString();

      return url;
    }

    throw UnimplementedError();
  }
}
