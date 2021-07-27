import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<XFile?> selectImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    return await _picker.pickImage(
      source: source,
      imageQuality: 25,
    );
  }
}
