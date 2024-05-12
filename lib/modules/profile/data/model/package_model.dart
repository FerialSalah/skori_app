class PackagesModel {
  List<PackageModel>? data;

  PackagesModel({this.data});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PackageModel>[];
      json['data'].forEach((v) {
        data!.add(new PackageModel.fromJson(v));
      });
    }
  }

}

class PackageModel {
  int? id;
  String? title;
  String? duration;
  String? price;
  String? image;
  List<Features>? features;

  PackageModel(
      {this.id,
        this.title,
        this.duration,
        this.price,
        this.image,
        this.features});

  PackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    price = json['price'];
    image = json['image'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

}

class Features {
  int? id;
  String? title;
  String? description;

  Features({this.id, this.title, this.description});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

}




