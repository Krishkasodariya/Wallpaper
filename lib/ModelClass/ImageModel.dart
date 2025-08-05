class ImageModel {
  int? id;
  String? title;
  String? image;
   bool ?Like=false;
  bool ?isCheck = false;
  bool ?onClick = false;
   bool? Download=false;

  ImageModel({this.id, this.title, this.image,   this.Like, this.Download, this.isCheck,this.onClick});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

