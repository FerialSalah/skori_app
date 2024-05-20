class PlayerLeagueModel {
  List<Data>? data;

  PlayerLeagueModel({this.data});

  PlayerLeagueModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? countryName;
  String? continentName;
  String? season;
  Null? description;
  String? startDate;
  String? endDate;
  Null? organizer;
  AgeGroup? ageGroup;
  String? logo;
  bool? isFavorite;
  bool? isFollow;
  bool? isActive;

  Data(
      {this.id,
        this.title,
        this.countryName,
        this.continentName,
        this.season,
        this.description,
        this.startDate,
        this.endDate,
        this.organizer,
        this.ageGroup,
        this.logo,
        this.isFavorite,
        this.isFollow,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    countryName = json['country_name'];
    continentName = json['continent_name'];
    season = json['season'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    organizer = json['organizer'];
    ageGroup = json['ageGroup'] != null
        ? new AgeGroup.fromJson(json['ageGroup'])
        : null;
    logo = json['logo'];
    isFavorite = json['is_favorite'];
    isFollow = json['is_follow'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['country_name'] = this.countryName;
    data['continent_name'] = this.continentName;
    data['season'] = this.season;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['organizer'] = this.organizer;
    if (this.ageGroup != null) {
      data['ageGroup'] = this.ageGroup!.toJson();
    }
    data['logo'] = this.logo;
    data['is_favorite'] = this.isFavorite;
    data['is_follow'] = this.isFollow;
    data['is_active'] = this.isActive;
    return data;
  }
}

class AgeGroup {
  int? id;
  String? title;
  Null? description;
  String? isActive;
  String? minAge;
  String? maxAge;

  AgeGroup(
      {this.id,
        this.title,
        this.description,
        this.isActive,
        this.minAge,
        this.maxAge});

  AgeGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isActive = json['is_active'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    data['min_age'] = this.minAge;
    data['max_age'] = this.maxAge;
    return data;
  }
}