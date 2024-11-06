import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user/user.dart';
import 'package:hive/hive.dart';

Future<void> addUser({required UserModel user}) async {
  final userdb = await Hive.openBox<UserModel>('user');
  log('useradded ${userdb.name}');
  log('User Added: Name: ${user.name}, Email: ${user.address}, Age: ${user.phone}');
  await userdb.put('userdata', user);
}

Future<UserModel?> fetchuser() async {
  final name = await Hive.openBox<UserModel>('user');
  return name.get('userdata');
}

Future<UserModel?> fetchUserdata() async {
  final userBox = await Hive.openBox<UserModel>('user');
  UserModel? user = userBox.get('userdata');
  if(user?.image!=null){
    log('image is stored and fetched');
  }
  if (user!=null) {
    return user;
  } else {
    return null;
  }
}


Future<Uint8List?> pickSaveImage() async{
  try{
    if(kIsWeb){
      FilePickerResult? result =await FilePicker.platform.pickFiles(
        type:FileType.image,
        allowMultiple: false,
      );
      if(result !=null&& result.files.isNotEmpty){
        return result.files.first.bytes;
      }
    }
    else{
  final ImagePicker _pick=ImagePicker();
  final XFile? imagefile =await _pick.pickImage(source: ImageSource.gallery);
  log('image picked');
 if(imagefile!=null){
   Uint8List imageBytes=await File(imagefile.path).readAsBytes();
   log('image converted into bytes');
   return imageBytes;
 }
}
}catch(e){
  log('error picking image: $e');
}
}

//   }
//  else{
//   log('no image found');
//  }
//  return null;
// }

// Future<void> _pickImage() async {
//     try {
//       if (kIsWeb) {
//         // For Web: Use file_picker to get the image as Uint8List
//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.image,
//           allowMultiple: false,
//         );
//         if (result != null && result.files.isNotEmpty) {
//           setState(() {
//             _imageData = result.files.first.bytes;
//           });
//         }
//       } else {
//         // For Mobile: Use image_picker to get the image as Uint8List
//         final ImagePicker _picker = ImagePicker();
//         final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//         if (pickedFile != null) {
//           final Uint8List imageBytes = await pickedFile.readAsBytes();
//           setState(() {
//             _imageData = imageBytes;
//           });
//         }
//       }
//     } catch (e) {
//       print("Error picking image: $e");
//     }
//   }


