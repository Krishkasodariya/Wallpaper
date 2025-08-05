import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:wallpaper/ModelClass/ImageModel.dart';
import 'package:wallpaper/ModelClass/LiveImageModel.dart';
import 'package:http/http.dart' as http;

class WallpaperController extends GetxController {
  RxList<ImageModel> imagelist = <ImageModel>[].obs;
  RxList<ImageModel> FoundCategoriesList= <ImageModel>[].obs;
  RxList<ImageModel> ResultCategoriesList= <ImageModel>[].obs;

  RxList<LiveImageModel> liveimagelist = <LiveImageModel>[].obs;
  RxList<LiveImageModel> foundimage= <LiveImageModel>[].obs;
  RxList<LiveImageModel> result= <LiveImageModel>[].obs;
  RxList<LiveImageModel> favouritelist = <LiveImageModel>[].obs;
  RxList<LiveImageModel> downloadlist = <LiveImageModel>[].obs;
  RxList<LiveImageModel> videoTypelist = <LiveImageModel>[].obs;
  RxList<LiveImageModel> videolist = <LiveImageModel>[].obs;
  RxList<LiveImageModel> imageTypelist = <LiveImageModel>[].obs;
  late StreamSubscription subscription;
  RxInt likeindex = 0.obs;
  RxInt iindex = 0.obs;
  RxInt tabindex = 1.obs;
  RxInt dindex = 0.obs;
  RxBool chageswitch = false.obs;
  RxBool isdownloading = false.obs;
  RxBool onClick = false.obs;
  RxBool isdeviceconnected = false.obs;
  RxBool isalertset = false.obs;

  Future<List<LiveImageModel>> ApiLiveImageResponce(int id) async {
    final response = await http.get(Uri.parse(
        "https://wallpapers.virmana.com/api/wallpaper/category/0/$id/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/"));
    final datadecode = jsonDecode(response.body);

    for (Map<String, dynamic> data in datadecode) {
      liveimagelist.value.add(LiveImageModel.fromJson(data));
      print("liveimagelist==>${liveimagelist.value.length}");
    }
    return liveimagelist.value;
  }

  Future<List<LiveImageModel>> ApiVideoResponse() async {
    final response = await http.get(Uri.parse(
        "https://wallpapers.virmana.com/api/wallpaper/category/0/1/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/"),);
    final datadecode = jsonDecode(response.body);

    for (Map<String, dynamic> data in datadecode){
      videolist.value.add(LiveImageModel.fromJson(data));
      print("liveimagelist==>${videolist.value.length}");
    }
    return videolist.value;
  }

  Future<List<ImageModel>> ApiThreedResponse() async {
    try {
      var response = await http.get(Uri.parse(
          "https://wallpapers.virmana.com/api/category/all/4F5A9C3D9A86FA54EACEDDD635185/16edd7cf-2525-485e-b11a-3dd35f382457/"));
      var datadecode = jsonDecode(response.body);
      print("object");

      for (Map<String, dynamic> data in datadecode) {
        imagelist.value.add(ImageModel.fromJson(data));
        print("imagelist==>${imagelist.value.length}");
      }
      return imagelist.value;
    } catch (e) {
      print('=========)${e}');
    }
    return imagelist.value;
  }

  Future<void> getdata() async {
    liveimagelist.clear();
    imageTypelist.clear();
    videolist.clear();
    videoTypelist.clear();
    foundimage.clear();
    videolist.value=await ApiVideoResponse();

    liveimagelist.value = await ApiLiveImageResponce(/*FoundCategoriesList.value[tabindex.value].id!*/tabindex.value);
    getimagedata();
    getvideodata();
    FoundCategoriesList.value=imagelist.value;
    foundimage.value=imageTypelist.value;
     update();
    if (imagelist.isEmpty) {
      imagelist.value = await ApiThreedResponse();
      update();
    }
  }
  void getimagedata() {
    for (int i = 0; i < liveimagelist.value.length; i++) {
      if (liveimagelist.value[i].type!.contains("image\/jpeg")) {
        imageTypelist.value.add(liveimagelist.value[i]);
        print("imageTypelist===)${imageTypelist.value.length}");
      }
    }
  }

  void getvideodata(){
    for (int i = 0; i < videolist.value.length; i++) {
      if (videolist.value[i].type!.contains("video\/mp4")) {
        videoTypelist.value.add(videolist.value[i]);
        print("videoTypelist===)${videoTypelist.value.length}");
      }
    }
  }
}
