import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<XFile?> selectImage() async {
    final ImagePicker _picker = ImagePicker();

    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
