class LiveImageModel {
  int? id;
  String? kind;
  String? title;
  String? description;
  bool? review;
  bool? premium;
  String? color;
  String? size;
  String? resolution;
  bool? comment;
  int? comments;
  int? downloads;
  int? views;
  int? shares;
  int? sets;
  bool? trusted;
  bool? Like=false;
  String? user;
  int? userid;
  String? userimage;
  String? type;
  String? extension;
  String? thumbnail;
  String? image;
  String? original;
  String? created;
  String? tags;

  LiveImageModel(
      {this.id,
        this.kind,
        this.title,
        this.description,
        this.review,
        this.premium,
        this.color,
        this.size,
        this.resolution,
        this.comment,
        this.comments,
        this.downloads,
        this.views,
        this.Like,
        this.shares,
        this.sets,
        this.trusted,
        this.user,
        this.userid,
        this.userimage,
        this.type,
        this.extension,
        this.thumbnail,
        this.image,
        this.original,
        this.created,
        this.tags});

  LiveImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    title = json['title'];
    description = json['description'];
    review = json['review'];
    premium = json['premium'];
    color = json['color'];
    size = json['size'];
    resolution = json['resolution'];
    comment = json['comment'];
    comments = json['comments'];
    downloads = json['downloads'];
    views = json['views'];
    shares = json['shares'];
    sets = json['sets'];
    trusted = json['trusted'];
    user = json['user'];
    userid = json['userid'];
    userimage = json['userimage'];
    type = json['type'];
    extension = json['extension'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    original = json['original'];
    created = json['created'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    data['title'] = this.title;
    data['description'] = this.description;
    data['review'] = this.review;
    data['premium'] = this.premium;
    data['color'] = this.color;
    data['size'] = this.size;
    data['resolution'] = this.resolution;
    data['comment'] = this.comment;
    data['comments'] = this.comments;
    data['downloads'] = this.downloads;
    data['views'] = this.views;
    data['shares'] = this.shares;
    data['sets'] = this.sets;
    data['trusted'] = this.trusted;
    data['user'] = this.user;
    data['userid'] = this.userid;
    data['userimage'] = this.userimage;
    data['type'] = this.type;
    data['extension'] = this.extension;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['original'] = this.original;
    data['created'] = this.created;
    data['tags'] = this.tags;
    return data;
  }
}