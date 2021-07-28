import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future selectImage({
    ImageSource source = ImageSource.gallery,
    bool multi = false,
  }) async {
    final ImagePicker _picker = ImagePicker();

    if (!multi) {
      return await _picker.pickImage(
        source: source,
        imageQuality: 10,
      );
    } else {
      return await _picker.pickMultiImage(
        imageQuality: 10,
      );
    }
  }
}
