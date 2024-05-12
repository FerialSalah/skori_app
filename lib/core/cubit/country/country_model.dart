class CountriesModel {
  List<Data>? data;

  CountriesModel({this.data});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? key;
  String? text;
  String? image;

  Data({this.id, this.key, this.text, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}
