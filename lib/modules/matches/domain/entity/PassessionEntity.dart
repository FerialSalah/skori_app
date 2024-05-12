class PossessionEntity {
  String? name;
  dynamic value;

  PossessionEntity({this.name, this.value});

  // Possession.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   if (this.value != null) {
  //     data['value'] = this.value!.toJson();
  //   }
  //   return data;
  // }
}

class ValuePassessionEntity {
  String? homePossession;
  String? awayPossession;

  ValuePassessionEntity({this.homePossession, this.awayPossession});

  ValuePassessionEntity.fromJson(Map<String, dynamic> json) {
    homePossession = json['home_possession'];
    awayPossession = json['away_possession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home_possession'] = this.homePossession;
    data['away_possession'] = this.awayPossession;
    return data;
  }
}