class MyPackageModel {
  Data? data;

  MyPackageModel({this.data});

  MyPackageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? startDate;
  String? endDate;
  String? isEnabled;
  int? endInDays;
  Plan? plan;
  String? createdAt;

  Data(
      {this.id,
        this.startDate,
        this.endDate,
        this.isEnabled,
        this.endInDays,
        this.plan,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isEnabled = json['is_enabled'];
    endInDays = json['end_in_days'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['is_enabled'] = this.isEnabled;
    data['end_in_days'] = this.endInDays;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Plan {
  int? id;
  String? title;
  String? duration;
  String? price;
  String? image;
  List<Features>? features;

  Plan(
      {this.id,
        this.title,
        this.duration,
        this.price,
        this.image,
        this.features});

  Plan.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['image'] = this.image;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
